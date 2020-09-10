package com.yr.lize.currencyapply.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.mapper.CurrencyApplyMapper;
import com.yr.lize.currencyapply.service.ICurrencyApplyService;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.*;
import com.yr.lize.system.mapper.*;
import org.apache.commons.io.FilenameUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.locks.ReentrantLock;

@Service
public class CurrencyApplyServiceImpl implements ICurrencyApplyService{

	@Autowired
	SystemDepartmentMapper systemDepartmentMaper;

	@Autowired
	SystemStaffMapper systemStaffMapper;
	@Autowired
	SystemApprovalMapper systemApprovalMapper;

	@Autowired
	IDingDingUtilsService dingDingUtilsService;

	@Autowired
	CurrencyApplyMapper currencyApplyMapper;

	@Autowired
	SystemDepartmentMapper systemDepartmentMapper;

	@Autowired
	U8DataMapper u8DataMapper;

	@Autowired
	U8SystemDataMapper  u8SystemDataMapper;//用于解决红冲主键重复问题

	@Autowired
	XZU8DataMapper xzu8DataMapper;
	@Autowired
	SystemCompanyMapper systemCompanMapper;

	@Override
	public Integer launchpurchase(HttpServletRequest request,CurrencyApply currencyApply, SystemStaff staff, List<ApproverRole> roles,
								  List<CurrencyDetails> currencyDetailss,List<PaymentPlan> paymentPlans,List<ProgramDetails> programDetails,MultipartFile[] files)  throws ApiException{
		// 发起通用审批流
		//循环遍历审批组
		Integer approval_id = currencyApply.getCurrency_type();//*
		int count = 0;//*
		ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息//*
		Date date = new Date();//获取当前发起申请的时间
		if (currencyApply.getCurrency_type() != 54) {
			currencyApply.setCurrency_date(date);
		}
		for (ApproverRole approverRole : roles) {//遍历审批组//*
			//循环第一遍进入第一个要发送消息的审批组如果第一个审批组中没有人进行第二次循环
			if (approverRole.getRole_type() == 1) {//判断是否为角色
				ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//查询钉钉角色下的人员
				if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串
					//添加调拨审批请求
					Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);

					List<String> list = new ArrayList<>();
					String[]  strs2=result.getMsg().split(",");
					int index = 0;
					for(int i=0,len=strs2.length;i<len;i++){
						//区域经理角色只针对申请人所在区域的区域经理发送消息
						if ("区域经理".equals(approverRole.getApprover_name())){
							SystemStaff systemStaff = systemStaffMapper.selectStaffByDingdingStaffIdAndDepartmentId(strs2[i],staff.getDepartment_Id());
							if (systemStaff == null){
								continue;
							}else if (systemStaff.getDepartment_Id().equals(staff.getDepartment_Id())){
								index++;
								//发送工作消息
								dingDingUtilsService.sendoOutNotice2(strs2[i],staff,approverManage,currencyApply);
								list.add(strs2[i]);
							}
						}else {
							index++;
							//发送工作消息
							dingDingUtilsService.sendoOutNotice2(strs2[i], staff, approverManage, currencyApply);
							list.add(strs2[i]);
						}
					}

					currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
					if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
						currencyApply.setApprover_state(1);
					}else {//如果当前审批为会签把要审批的人的数量加到审批中
						currencyApply.setApprover_state(index);
					}
					Integer update = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
					if(currencyDetailss != null) {
						//添加当前通用审批的详情
						currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss,currencyApply.getCurrency_id());
					}
					if (paymentPlans != null){
						currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
					}
					if (programDetails != null){
						currencyApplyMapper.addProgramDetails(programDetails,currencyApply.getCurrency_id());
					}
					//合同添加图片
					if (files != null && files.length > 0){
						this.uploadFiles(request,files,currencyApply.getCurrency_id());
					}
					//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
					systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
					//将审批人添加到审批列表中
					systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
					return res;
				}

			}else if (approverRole.getRole_type() == 2) { 
				//判断当前流程是否属于要专门设置主管审批的流程
				Integer index2 = 1;//取第几级主管 默认直接主管
				String[] str = {"10000"};
				if (Arrays.asList(str).contains(String.valueOf(currencyApply.getCurrency_type()))){
					//查询当前申请人身份信息
					OapiUserGetResponse userDetilsRes = dingDingUtilsService.selectDingUserDetils(staff.getDingding_staffid());
					JSONObject userDetailsObj = new JSONObject(userDetilsRes.getIsLeaderInDepts());
					//判断当前发起人是否为主管身份
					if (userDetailsObj.getBoolean(staff.getDepartment_Id())){
						index2 = 2;
					}
				}else {
					//查询是几级主管
					//1直接 2二级 一般都是1
					index2 = Integer.parseInt(approverRole.getApprover_id());
				}
				//查询主管的部门id
				List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(staff.getDepartment_Id());
				//获取道当前部门主管的id集合
				ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
				if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串
					//添加审批请求
					Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);

					List<String> list = new ArrayList<>();
					String[]  strs2=result.getMsg().split(",");
					int index = 0;
					for(int i=0,len=strs2.length;i<len;i++){
						index++;
						//发送工作消息
						dingDingUtilsService.sendoOutNotice2(strs2[i],staff,approverManage,currencyApply);
						list.add(strs2[i]);
					}

					currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
					if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
						currencyApply.setApprover_state(1);
					}else {
						currencyApply.setApprover_state(index);
					}
					//添加审批请求
					Integer update = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
					if (currencyDetailss != null) {
						//添加当前调拨的商品
						currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss, currencyApply.getCurrency_id());
					}
					if (paymentPlans != null){
						currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
					}
					if (programDetails != null){
						currencyApplyMapper.addProgramDetails(programDetails,currencyApply.getCurrency_id());
					}
					//合同添加图片
					if (files != null && files.length > 0){
						this.uploadFiles(request,files,currencyApply.getCurrency_id());
					}
					//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
					systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
					//将审批人添加到审批列表中
					systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
					return res;
				}
			}else if (approverRole.getRole_type() == 3) {

				List<String> list = new ArrayList<>();
				list.add(approverRole.getApprover_id());
				currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
				currencyApply.setApprover_state(1);
				//修改检测过程上一级标识
				if(currencyApply.getCurrency_type() == 44 || currencyApply.getCurrency_type() == 45){
					ReentrantLock lock = new ReentrantLock();
					try {
						lock.lock();
						CurrencyApply currencyApply1 = currencyApplyMapper.selectIsExistApply(currencyApply);
						if (currencyApply1 != null) {
							Integer integer = currencyApplyMapper.updateSignById(currencyApply.getCurrency_id());
							//添加审批请求
							Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
							//添加当前调拨的商品
							if (currencyDetailss != null) {
								currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss, currencyApply.getCurrency_id());
							}
							if (paymentPlans != null){
								currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
							}
							if (programDetails != null){
								currencyApplyMapper.addProgramDetails(programDetails,currencyApply.getCurrency_id());
							}
							//合同添加图片
							if (files != null && files.length > 0){
								this.uploadFiles(request,files,currencyApply.getCurrency_id());
							}
							//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
							systemApprovalMapper.addApproveRroleRecord(roles, currencyApply.getCurrency_id());
							//将审批人添加到审批列表中
							systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(), approval_id);
							dingDingUtilsService.sendoOutNotice2(approverRole.getApprover_id(), staff, approverManage, currencyApply);//发送工作消息
							lock.unlock();
							return res;
						} else {
							lock.unlock();
							return -2;
						}

					}catch (Exception e){
						e.printStackTrace();
					}
				}
				//添加审批请求
				Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
				//添加当前调拨的商品
				if(currencyDetailss!=null) {
					currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss, currencyApply.getCurrency_id());
				}
				if (paymentPlans != null){
					currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
				}
				if (programDetails != null){
					currencyApplyMapper.addProgramDetails(programDetails,currencyApply.getCurrency_id());
				}
				//合同添加图片
				if (files != null && files.length > 0){
					this.uploadFiles(request,files,currencyApply.getCurrency_id());
				}
				//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
				systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
				//将审批人添加到审批列表中
				systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
				dingDingUtilsService.sendoOutNotice2(approverRole.getApprover_id(),staff,approverManage,currencyApply);//发送工作消息
				return res;
			}
			count++;
		}

		return -1;
	}

	@Override
	@Transactional
	public Integer approvalCurrencyApply(CurrencyApply currencyApply, String approvalOpinion,SystemStaff staff) throws ApiException {
		//审批操作
		Integer approval_id = currencyApply.getCurrency_type();
		//库存调拨审批
		//查询当前审批管理信息
		ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息
		//查询当前库存调拨的信息
		CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
		//根据id查询员工
		SystemStaff systemStaff = systemStaffMapper.selectStaffById(currencyApply2.getCurrency_applicant());
		//查询当前登录人员的对应的审批记录信息
		Approver approver = systemApprovalMapper.selectApprover(currencyApply2.getCurrency_id(),currencyApply.getCurrency_string(),approval_id);

		//查询当前审批人的名称信息
		OapiUserGetResponse response = dingDingUtilsService.selectDingUserDetils(currencyApply.getCurrency_string());

		ApprovalOpinion approvalOpinions = new ApprovalOpinion();//创建审批意见实体类
		//传入审批意见参数
		Date date = new Date();
		approvalOpinions.setApprovalOpinion_result(approvalOpinion);//审批意见
		approvalOpinions.setApprover_id(currencyApply.getCurrency_string());//审批人id
		approvalOpinions.setApprover_name(response.getName());//审批人名称
		//approvalOpinions.setApprover_name("测试");//审批人名称
		approvalOpinions.setApprovalOpinion_type(currencyApply2.getCurrency_type());//审批管理主键标识
		approvalOpinions.setApproval_id(currencyApply2.getCurrency_id());

		//审批时间和审批结果(1为通过，-300为未通过)
		approvalOpinions.setApproval_date(date);
		approvalOpinions.setApproval_stat(currencyApply.getApprover_state());

		Integer count = 0;
		ApproverRole approverRole3 = new ApproverRole();//创建一个审批流程类传入筛选条件用于通过或被拒绝后 删除记录的审批流程
		approverRole3.setApply_id(currencyApply2.getCurrency_id());
		approverRole3.setCompany_id(systemStaff.getCompany_Id());
		if (currencyApply.getCurrency_type() == 69){
			approverRole3.setCompany_id(65);
		}
		approverRole3.setApproval_id(approval_id);
		if (currencyApply2.getApprover_state() == 0 && currencyApply2.getApprover_count() == currencyApply2.getCurrent_approvalCount()) {
			return 100;//已经通过了
		}else if (currencyApply2.getApprover_state() == -100) {
			return -100;//撤回了
		}else if (currencyApply2.getApprover_state() == -300) {
			return -200;//被拒绝
		}else if (approver.getApproval_result() != 0) {
			return -300;//当前用户已经审批过了
		}else {

			Approver approver2 = new Approver();

			//
			approver2.setAllocation_id(currencyApply.getCurrency_id());
			//approver2.setDing_staff_id(staff.getDingding_staffid());

			if (currencyApply.getApprover_state() == 1) {//如果当前用户操作为通过

				List<ApproverRole> roles;
				ApproverRole approverRole2 = new ApproverRole();

				approverRole2.setApproval_id(approval_id);//当前审批管理的id
				approverRole2.setApply_id(currencyApply.getCurrency_id());
				approverRole2.setCompany_id(systemStaff.getCompany_Id());
				if (currencyApply.getCurrency_type() == 69){
					approverRole2.setCompany_id(65);
				}
				if (currencyApply2.getCondition_state() != 1) {//判断是否为条件查询
					approverRole2.setApprover_condition(2);
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole2);
				}else {
					roles = systemApprovalMapper.selectApproveRroleRecord(approverRole2);
				}
				Integer res2 = 0;

				CurrencyApply currencyApply3 = new CurrencyApply();
				//获取到发起申请的时间
				currencyApply.setCurrency_date(currencyApply2.getCurrency_date());
				//获取业务员id
				currencyApply.setCurrency_string5(currencyApply2.getCurrency_string5());
				//获取业务员部门id
				currencyApply.setCurrency_string4(currencyApply2.getCurrency_string4());

				//循环遍历审批组
				for (ApproverRole approverRole : roles) {

					if (currencyApply2.getCurrent_approvalCount() == count) {//判断是是否是当前审批组

						if (approverRole.getRole_state() == 1) {//当前审批为或签

							approver2.setApproval_result(1);
							systemApprovalMapper.updateApproverResultMi(approver2);
							res2 = currencyApplyMapper.refuseRequest(currencyApply);
							//20200708 陈书生
							//在审批记录表中添加审批组字段，用来记录审批组
							approvalOpinions.setApproval_state(approverRole.getApprover_name());

							//添加审批意见
							currencyApplyMapper.addApprovalOpinion(approvalOpinions);
							//修改当前审批层级
							currencyApplyMapper.updateApplyCount(currencyApply.getCurrency_id());
							System.err.println("或签修改审批计数");
						}else {
							currencyApplyMapper.refuseRequest(currencyApply);
							//会签
							approver2.setDing_staff_id(currencyApply.getCurrency_string());
							approver2.setApproval_result(1);
							System.err.println("会签审批-1");
							systemApprovalMapper.updateApproverResultMi(approver2);

							CurrencyApply currencyApply4  =  currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());

							if (currencyApply4.getApprover_state() == 0 && currencyApply4.getApprover_count() == currencyApply4.getCurrent_approvalCount()) {
								//修改当前审批层级
								currencyApplyMapper.updateApplyCount(currencyApply4.getCurrency_id());
								System.err.println("会签修改审批计数");
							}else {
								count = -10;
								return 1;
							}
						}

					}
					currencyApply3  =  currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
					//查询业务员u8编码
					Integer staff_idture = currencyApplyMapper.selectStaffU8Code(currencyApply2.getCurrency_applicant());
					String cPersonCode = "";
					if (staff_idture != null) {
						cPersonCode = (staff_idture + 100000 + "").substring(1);
					}
					currencyApply3.setCurrency_name(cPersonCode);
					//查询当前申请的信息
					if (currencyApply3.getApprover_state() == 0 && currencyApply3.getApprover_count() == currencyApply3.getCurrent_approvalCount()) {
						//审批通过 给抄送人  申请人发送消息
						//丽泽内部出库单 药品出库  生成U8材料类出库单
						if (currencyApply2.getCurrency_type() == 14 || currencyApply2.getCurrency_type() == 18 ){
							//查询id最大值
							Integer ID = u8DataMapper.selectMaterialOutID();
							Integer AutoId = 15;
							String CardNumber = "0302";
							//获取流水号
							Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
							number = number + 1;
							int num = 10;
							String result = "";
							result = String.format("%0" + num + "d", number);
							//添加其他出库单主表数据
							currencyApply3.setCurrency_string6(result);
							currencyApply3.setCurrency_int5(ID);
							currencyApply3.setCurrency_string11(staff.getStaff_Name());
							u8DataMapper.addMaterialOut(currencyApply3);
							u8DataMapper.updateSerialNumber(AutoId, CardNumber);
							List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list) {
								Integer AutoID = u8DataMapper.selectMaterialOutIDs();
								Integer MAXID = u8DataMapper.selectMaterialOutMaxIDs();
								String cInvCode =  (String) hashMap.get("details_string4");//存货编码
								String details_int =  (String) hashMap.get("details_string9");//仓库编码
								BigDecimal iQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
								String cPosition   = (String) hashMap.get("");//货位编码
								String cItemCode = (String) hashMap.get("details_string");
								String cName  = (String) hashMap.get("details_string10");

								hashMap.put("cInvCode", cInvCode);
								hashMap.put("details_int", details_int);
								hashMap.put("iQuantity", iQuantity);
								hashMap.put("cPosition", cPosition);
								hashMap.put("ID", currencyApply3.getCurrency_int5());
								hashMap.put("cItemCode", cItemCode);
								hashMap.put("cName", cName);
								String cbsysbarcode = "||st11|"+currencyApply3.getCurrency_string6()+"|1";
								hashMap.put("AutoID", AutoID);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								//添加其他出库单子表
								u8DataMapper.addMaterialOuts(hashMap);
								//添加其他出库单字表关联表
//                                u8DataMapper.addOtheroutletRelation(hashMap);
								Integer type = 2;
								u8DataMapper.updateCurrentStockfStopQuantity(details_int, cInvCode, iQuantity, type);
							}
						}
						//查询抄送人  丽泽材料类出库、信泽材料类出库、丽泽内部出库、药品出库   生产U8其他出库单
						if (currencyApply2.getCurrency_type() == 2) {
							//查询id最大值
							Integer ID = u8SystemDataMapper.querySystemRdRecord09Id();
							/*if (ID == null){
								ID = 1000000001;
							}*/
							String fId = "2";
							for (int i=0;i<9-(ID.toString().length());i++){
								fId+="0";
							}
							fId+=ID;

							Integer AutoId = 15;
							String CardNumber = "0302";
							//获取流水号
							Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
							number = number + 1;
							int num = 10;
							String result = "";
							result = String.format("%0" + num + "d", number);
							//添加其他出库单主表数据
							currencyApply3.setCurrency_string6(result);
							currencyApply3.setCurrency_int5(Integer.parseInt(fId));
							currencyApply3.setCurrency_string11(staff.getStaff_Name());

							u8DataMapper.addOtheR(currencyApply3);
							u8SystemDataMapper.updateSystemRdRecord09Id(ID);//同步更新系统id,解决红冲时主键重复问题
							u8DataMapper.updateSerialNumber(AutoId, CardNumber);
							List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list) {
								Integer AutoID = u8SystemDataMapper.querySystemRdRecord09ChildId();

								String cId = "2";
								for (int i=0;i<9-(AutoID.toString().length());i++){
									cId+="0";
								}
								cId+=AutoID;


								/*if (AutoID == null){
									AutoID = 1000000001;
								}*/
								//Integer MAXID = u8DataMapper.selectOtherMaxIDs();
								String cInvCode =  (String) hashMap.get("details_string4");//存货编码
								String details_int =  (String) hashMap.get("details_string9");//仓库编码
								BigDecimal iQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
								String cPosition   = (String) hashMap.get("details_string10");//货位编码
								String cItemCode = (String) hashMap.get("details_string");
								String cName  = (String) hashMap.get("details_string2");

								hashMap.put("cInvCode", cInvCode);
								hashMap.put("details_int", details_int);
								hashMap.put("iQuantity", iQuantity);
								hashMap.put("cPosition", cPosition);
								hashMap.put("ID", fId);
								hashMap.put("cItemCode", cItemCode);
								hashMap.put("cName", cName);
								String cbsysbarcode = "||st09|"+currencyApply3.getCurrency_string6()+"|1";
								hashMap.put("AutoID", cId);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								hashMap.put("strContractId",currencyApply3.getCurrency_string3());
								//添加其他出库单子表
								u8DataMapper.addOtheroutlets(hashMap);
								u8SystemDataMapper.updateSystemRdRecord09ChildId(AutoID);//同步更新系统子id,解决红冲时主键重复问题
								//添加其他出库单字表关联表
								u8DataMapper.addOtheroutletRelation(hashMap);
								Integer type = 2;
								u8DataMapper.updateCurrentStockfStopQuantity(details_int, cInvCode, iQuantity, type);
							}
						}else if (currencyApply2.getCurrency_type() == 11){
							//查询id最大值
							Integer ID = xzu8DataMapper.selectOtheRID();
							if (ID == null){
								ID = 1000000001;
							}
							Integer AutoId = 22;
							String CardNumber = "0302";
							//获取流水号
							Integer number = xzu8DataMapper.selectSerialNumber(AutoId, CardNumber);
							number = number + 1;
							int num = 10;
							String result = "";
							result = String.format("%0" + num + "d", number);
							//添加其他出库单主表数据
							currencyApply3.setCurrency_string6(result);
							currencyApply3.setCurrency_int5(ID);

							//xzu8DataMapper.addOtheR(currencyApply3);
							//xzu8DataMapper.updateSerialNumber(AutoId, CardNumber);
							List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list) {
								Integer AutoID = xzu8DataMapper.selectOtherIDs();
								if (AutoID == null){
									AutoID = 1000000001;
								}
								//Integer MAXID = u8DataMapper.selectOtherMaxIDs();
								String cInvCode =  (String) hashMap.get("details_string4");//存货编码
								String details_int =  (String) hashMap.get("details_string9");//仓库编码
								BigDecimal iQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
								String cPosition   = (String) hashMap.get("details_string10");//货位编码
								String cItemCode = (String) hashMap.get("details_string");
								String cName  = (String) hashMap.get("details_string2");

								hashMap.put("cInvCode", cInvCode);
								hashMap.put("details_int", details_int);
								hashMap.put("iQuantity", iQuantity);
								hashMap.put("cPosition", cPosition);
								hashMap.put("ID", ID);
								hashMap.put("cItemCode", cItemCode);
								hashMap.put("cName", cName);
								String cbsysbarcode = "||st09|"+currencyApply3.getCurrency_string6()+"|1";
								hashMap.put("AutoID", AutoID);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								hashMap.put("strContractId",currencyApply3.getCurrency_string3());
								//添加其他出库单子表
								//xzu8DataMapper.addOtheroutlets(hashMap);
								//添加其他出库单字表关联表
								//xzu8DataMapper.addOtheroutletRelation(hashMap);
								Integer type = 2;
								//xzu8DataMapper.updateCurrentStockfStopQuantity(details_int, cInvCode, iQuantity, type);
							}
						}/*else if (currencyApply2.getCurrency_type() == 18){
                            //查询id最大值
                            Integer ID = u8DataMapper.selectOtheRID();
                            if (ID == null){
                                ID = 1000000001;
                            }
                            Integer AutoId = 15;
                            String CardNumber = "0302";
                            //获取流水号
                            Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
                            number = number + 1;
                            int num = 10;
                            String result = "";
                            result = String.format("%0" + num + "d", number);
                            //添加其他出库单主表数据
                            currencyApply3.setCurrency_string6(result);
                            currencyApply3.setCurrency_int5(ID);

                            u8DataMapper.addOtheR(currencyApply3);
                            u8DataMapper.updateSerialNumber(AutoId, CardNumber);
                            List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
                            for (HashMap<String, Object> hashMap : list) {
                                Integer AutoID = u8DataMapper.selectOtherIDs();
                                if (AutoID == null){
                                    AutoID = 1000000001;
                                }
                                //Integer MAXID = u8DataMapper.selectOtherMaxIDs();
                                String cInvCode =  (String) hashMap.get("details_string4");//存货编码
                                String details_int =  (String) hashMap.get("details_string9");//仓库编码
                                BigDecimal iQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
                                String cPosition   = (String) hashMap.get("details_string10");//货位编码
                                String cItemCode = (String) hashMap.get("details_string");
                                String cName  = (String) hashMap.get("details_string2");

                                hashMap.put("cInvCode", cInvCode);
                                hashMap.put("details_int", details_int);
                                hashMap.put("iQuantity", iQuantity);
                                hashMap.put("cPosition", cPosition);
                                hashMap.put("ID", ID);
                                hashMap.put("cItemCode", cItemCode);
                                hashMap.put("cName", cName);
                                String cbsysbarcode = "||st09|"+currencyApply3.getCurrency_string6()+"|1";
                                hashMap.put("AutoID", AutoID);
                                hashMap.put("cbsysbarcode", cbsysbarcode);
                                hashMap.put("strContractId",currencyApply3.getCurrency_string3());
                                //添加其他出库单子表
                                u8DataMapper.addOtheroutlets(hashMap);
                                //添加其他出库单字表关联表
                                u8DataMapper.addOtheroutletRelation(hashMap);
                                Integer type = 2;
                                u8DataMapper.updateCurrentStockfStopQuantity(details_int, cInvCode, iQuantity, type);
                            }
                        }*/else if (currencyApply2.getCurrency_type() == 3 || currencyApply2.getCurrency_type() == 4
								|| currencyApply2.getCurrency_type() == 8) {
							//所有请购流程执行此方法
							//查询id最大值
							Integer ID = u8DataMapper.selectSaleBuy();
							if (ID == null) {
								ID = 1000000001;
							}
							Integer AutoId = 30;
							String CardNumber = "27";
							//获取流水号
							Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
							number = number + 1;
							int num = 10;
							String result = "";
							result = String.format("%0" + num + "d", number);

							//添加请购单主表数据
							currencyApply3.setCurrency_string6(result);
							currencyApply3.setCurrency_int5(ID);
							u8DataMapper.addBuy(currencyApply3);
							u8DataMapper.updateSerialNumber(AutoId, CardNumber);
							List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list) {
								Integer AutoID = u8DataMapper.selectSaleBuys();
								if (AutoID == null) {
									AutoID = 1000000001;
								} else {
									AutoID = AutoId + 1;
								}
								String cInvCode = (String) hashMap.get("details_string4");//存货编码
								BigDecimal fQuantity = (BigDecimal) hashMap.get("details_money");//请求数量
								String cbsysbarcode = "||pupr|" + currencyApply3.getCurrency_string6() + "|1";
								BigDecimal fUnitPrice = (BigDecimal) hashMap.get("details_money4");//单价
								BigDecimal iPerTaxRate = (BigDecimal) hashMap.get("details_money5");//税率
								BigDecimal fTaxPrice = (BigDecimal) hashMap.get("details_money6");//含税单价
								BigDecimal fMoney = (BigDecimal) hashMap.get("details_money7");//税后总价
								Date dRequirDate = (Date) hashMap.get("details_date2");//需求日期
								Date dArriveDate = (Date) hashMap.get("details_date3");//建议到货日期


								hashMap.put("dRequirDate", dRequirDate);
								hashMap.put("dArriveDate", dArriveDate);
								hashMap.put("fMoney", fMoney);
								hashMap.put("fTaxPrice", fTaxPrice);
								hashMap.put("iPerTaxRate", iPerTaxRate);
								hashMap.put("fUnitPrice", fUnitPrice);
								hashMap.put("cInvCode", cInvCode);
								hashMap.put("fQuantity", fQuantity);
								hashMap.put("ID", ID);
								hashMap.put("AutoID", AutoID);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								//添加请购单子表

								u8DataMapper.addBuys(hashMap);
							}
						}else if(currencyApply2.getCurrency_type() == 23 || currencyApply2.getCurrency_type() == 28) {
							//23：运营合同发票开具申请；28：设备、配件销售合同发票开具申请--------------------------------------------------------------
							//将合同中的发票申请金额，更新到对应合同中的合同已开票金额中
							BigDecimal money = new BigDecimal(currencyApply3.getCurrency_string13()).//申请开票
									add(new BigDecimal(currencyApply3.getCurrency_string12()));//+已开票
							String strContractID = currencyApply3.getCurrency_string4();//获取合同号
							HashMap<String, Object> map = new HashMap<>();
							map.put("money", money);
							map.put("strContractID", strContractID);
							u8DataMapper.updateCMContractMoney(map);

						}else if(currencyApply2.getCurrency_type() == 29){
							//29：信泽开票流程--------------------------------------------------------------
							//将合同中的发票申请金额，更新到对应合同中的合同已开票金额中
							BigDecimal money =  new BigDecimal(currencyApply3.getCurrency_string13()).//申请开票
									add(new BigDecimal(currencyApply3.getCurrency_string12()));//+已开票
							String strContractID = currencyApply3.getCurrency_string4();//获取合同号
							HashMap<String,Object> map = new HashMap<>();
							map.put("money",money);
							map.put("strContractID",strContractID);
							xzu8DataMapper.updateCMContractMoney(map);

							//34：丽泽销售类合同；35：丽泽运营类合同；36：丽泽技术服务合同
						}else if(currencyApply2.getCurrency_type() == 34 || currencyApply2.getCurrency_type() == 35 || currencyApply2.getCurrency_type() == 36|| currencyApply2.getCurrency_type() == 47){
							if (currencyApply2.getCurrency_type() == 34) {
								String strContractID = u8DataMapper.selectStrContractID9();
								if (strContractID != null) {
									strContractID = strContractID.replaceFirst("1", "0");
									currencyApply2.setCurrency_string6(strContractID);
									currencyApply3.setCurrency_string6(strContractID);
								}else {
									currencyApply2.setCurrency_string6("0000000001");
									currencyApply3.setCurrency_string6("0000000001");
								}
								currencyApply3.setCurrency_string3("01");
								currencyApply3.setCurrency_string4("销售类合同");
								currencyApply3.setCurrency_string9("||cmco|" + currencyApply3.getCurrency_string6());
								currencyApply3.setCurrency_string14(currencyApply3.getCurrency_string5()+"销售合同");
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String time = sdf.format(currencyApply3.getCurrency_date2());//签订时间(到账时间)
								String startTime = sdf.format(currencyApply3.getCurrency_date3());
								String endTime = sdf.format(currencyApply3.getCurrency_date4());
								currencyApply3.setCurrency_string15(time);
								currencyApply3.setCurrency_string16(startTime);
								currencyApply3.setCurrency_string17(endTime);
								u8DataMapper.insertCMContractB(currencyApply3);
							}else if (currencyApply2.getCurrency_type() == 35){
								String strContractID = u8DataMapper.selectStrContractID9();
								if (strContractID != null) {
									strContractID = strContractID.replaceFirst("1", "0");
									currencyApply2.setCurrency_string6(strContractID);
									currencyApply3.setCurrency_string6(strContractID);
								}else {
									currencyApply2.setCurrency_string6("0000000001");
									currencyApply3.setCurrency_string6("0000000001");
								}
								currencyApply3.setCurrency_string3("02");
								currencyApply3.setCurrency_string4("应收类合同");
								currencyApply3.setCurrency_string9("||cmco|" + currencyApply3.getCurrency_string6());
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String time = sdf.format(currencyApply3.getCurrency_date2());//签订时间(到账时间)
								String startTime = sdf.format(currencyApply3.getCurrency_date3());
								String endTime = sdf.format(currencyApply3.getCurrency_date4());
								currencyApply3.setCurrency_string15(time);
								currencyApply3.setCurrency_string16(startTime);
								currencyApply3.setCurrency_string17(endTime);
								u8DataMapper.insertCMContractBAs35(currencyApply3);
								HashMap<String,Object> hashMap = new HashMap<>();
								hashMap.put("strName","配件特殊约定");
								hashMap.put("strMemo",currencyApply2.getCurrency_string());
								hashMap.put("strContractID",currencyApply3.getCurrency_string6());
								hashMap.put("currency_money5",currencyApply2.getCurrency_money5());
								u8DataMapper.insertOtherCMContractCaluseB(hashMap);
								hashMap.put("strName","检测比对约定");
								hashMap.put("strMemo",currencyApply2.getCurrency_string15());
								hashMap.put("strContractID",currencyApply3.getCurrency_string6());
								hashMap.put("currency_money5",new BigDecimal(0));
								u8DataMapper.insertOtherCMContractCaluseB(hashMap);
								if (currencyApply2.getCurrency_string10() != null){
									hashMap.put("strName","其它特殊约定");
									hashMap.put("strMemo",currencyApply2.getCurrency_string10());
									hashMap.put("strContractID",currencyApply3.getCurrency_string6());
									hashMap.put("currency_money5",new BigDecimal(0));
									u8DataMapper.insertOtherCMContractCaluseB(hashMap);
								}
							}else if (currencyApply2.getCurrency_type() == 36){
								String strContractID = u8DataMapper.selectStrContractID9();
								if (strContractID != null) {
									strContractID = strContractID.replaceFirst("1", "0");
									currencyApply2.setCurrency_string6(strContractID);
									currencyApply3.setCurrency_string6(strContractID);
								}else {
									currencyApply2.setCurrency_string6("0000000001");
									currencyApply3.setCurrency_string6("0000000001");
								}
								currencyApply3.setCurrency_string3("03");
								currencyApply3.setCurrency_string4("应收类合同");
								currencyApply3.setCurrency_string9("||cmco|" + currencyApply3.getCurrency_string6());
								currencyApply3.setCurrency_string14(currencyApply3.getCurrency_string5()+"技术服务合同");
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String time = sdf.format(currencyApply3.getCurrency_date2());//签订时间(到账时间)
								String startTime = sdf.format(currencyApply3.getCurrency_date3());
								String endTime = sdf.format(currencyApply3.getCurrency_date4());
								currencyApply3.setCurrency_string15(time);
								currencyApply3.setCurrency_string16(startTime);
								currencyApply3.setCurrency_string17(endTime);
								u8DataMapper.insertCMContractB36(currencyApply3);
							}else {
								String strContractID = xzu8DataMapper.selectStrContractID9();
								if (strContractID != null) {
									strContractID = strContractID.replaceFirst("1", "0");
									currencyApply2.setCurrency_string6(strContractID);
									currencyApply3.setCurrency_string6(strContractID);
								}else {
									currencyApply2.setCurrency_string6("0000000001");
									currencyApply3.setCurrency_string6("0000000001");
								}
								currencyApply3.setCurrency_string3("03");
								currencyApply3.setCurrency_string4("应收类合同");
								currencyApply3.setCurrency_string9("||cmco|" + currencyApply3.getCurrency_string6());
								currencyApply3.setCurrency_string14(currencyApply3.getCurrency_string5()+"信泽检测合同");
								SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								String time = sdf.format(currencyApply3.getCurrency_date2());//签订时间(到账时间)
								String startTime = sdf.format(currencyApply3.getCurrency_date3());
								String endTime = sdf.format(currencyApply3.getCurrency_date4());
								currencyApply3.setCurrency_string15(time);
								currencyApply3.setCurrency_string16(startTime);
								currencyApply3.setCurrency_string17(endTime);

								xzu8DataMapper.insertCMContractB47(currencyApply3);
							}
							int sum = 0;
							//技术服务类合同无商品明细，无需添加子表信息
							if (currencyApply2.getCurrency_type() != 36 && currencyApply2.getCurrency_type() != 47) {
								List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
								for (HashMap<String, Object> hashMap : list) {
									String strCode =  (String) hashMap.get("details_string4");//存货编码
									String strName =  (String) hashMap.get("details_string5");//商品名称
									String strMeasureUnit =  (String) hashMap.get("details_string7");//单位
									BigDecimal dblQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
									String cbsysbarcode = "||cmco|"+currencyApply3.getCurrency_string6()+"|1";
									BigDecimal dblSum =  (BigDecimal) hashMap.get("details_money4");//单价
									BigDecimal sum1 = (BigDecimal)hashMap.get("details_money7");//金额
									BigDecimal sum2 = (sum1 == null ? new BigDecimal("0") :sum1);
									String cInvCCode = u8DataMapper.selectInventory(strCode);
									String strCorrItemID = cInvCCode + strCode;
									String strXMDL = strCorrItemID + "," + strCorrItemID + ",1";

									hashMap.put("strCode", strCode);
									hashMap.put("strName", strName);
									hashMap.put("strMeasureUnit", strMeasureUnit);
									hashMap.put("dblQuantity", dblQuantity);
									hashMap.put("cbsysbarcode", cbsysbarcode);
									hashMap.put("dblSum",dblSum);
									hashMap.put("strContractID",currencyApply3.getCurrency_string6());
									hashMap.put("strXMDL",strXMDL);
									hashMap.put("strCorrItemID",strCorrItemID);
									hashMap.put("cItemCCode",cInvCCode);
									hashMap.put("currency_int7",sum2);
									hashMap.put("dtStartDate",currencyApply3.getCurrency_string16());
									hashMap.put("dtEndDate",currencyApply3.getCurrency_string17());
									hashMap.put("GUID",currencyApply3.getCurrency_string6());
									hashMap.put("cItem_Class","ch");
									hashMap.put("strCorrItemID",strCode);

									if(currencyApply2.getCurrency_type()==34){
										u8DataMapper.insertCMContractItemB(hashMap);
									}else {
										u8DataMapper.insertCMContractItemB35(hashMap);
									}
									sum++;
								}
							}else {
								List<HashMap<String, Object>> list = currencyApplyMapper.selectProgramDetails(currencyApply2);
								for (HashMap<String, Object> hashMap : list){
									//最大项目编码
									String citemcode = "10001";
									String itemcode = "";
									if (currencyApply2.getCurrency_type() == 36) {
										itemcode = u8DataMapper.selectCitemcode();

										if (itemcode != null && itemcode != "" ){
											citemcode = itemcode;
										}

										String program = (String) hashMap.get("program");
										BigDecimal money = (BigDecimal) hashMap.get("money");
										String strCode = "0401"+citemcode;
										int a = sum + 1;
										String strXMDL = "04," + citemcode + ","+a;
										BigDecimal sum1 = (money == null ? new BigDecimal("0") :money);
										String cbsysbarcode = "||cmco|"+currencyApply3.getCurrency_string6()+"|"+a;

										hashMap.put("strCode",strCode);
										hashMap.put("strName", program);
										hashMap.put("strMeasureUnit", "个");
										hashMap.put("cbsysbarcode", cbsysbarcode);
										hashMap.put("dblQuantity", 1);
										hashMap.put("strCorrItemID", citemcode);//对应项目编码
										hashMap.put("cItemCCode","01");
										hashMap.put("dblSum",sum1);
										hashMap.put("strContractID",currencyApply3.getCurrency_string6());
										hashMap.put("strXMDL",strXMDL);
										hashMap.put("currency_int7",sum1);
										hashMap.put("dtStartDate",currencyApply3.getCurrency_string16());
										hashMap.put("dtEndDate",currencyApply3.getCurrency_string17());
										hashMap.put("GUID",currencyApply3.getCurrency_string6());
										hashMap.put("cItem_Class","04");

										u8DataMapper.insertfitemss04(hashMap);
										u8DataMapper.insertCMContractItemB35(hashMap);
									}else {
										itemcode = xzu8DataMapper.selectCitemcode();

										if (itemcode != null && itemcode != "" ){
											citemcode = itemcode;
										}

										String string = (String) hashMap.get("string");//标的编码
										String string2 = (String) hashMap.get("string2");//标的名称

										String program = (String) hashMap.get("program");
										BigDecimal money = (BigDecimal) hashMap.get("money");
										String strCode = "0201"+citemcode;
										int a = sum + 1;
										String strXMDL = "02," + citemcode + ","+a;
										BigDecimal sum1 = (money == null ? new BigDecimal("0") :money);
										String cbsysbarcode = "||cmco|"+currencyApply3.getCurrency_string6()+"|"+a;

										hashMap.put("strCode",string);
										hashMap.put("strName", string2);
										hashMap.put("strMeasureUnit", "个");
										hashMap.put("cbsysbarcode", cbsysbarcode);
										hashMap.put("dblQuantity", 1);
										hashMap.put("strCorrItemID", string);//对应项目编码
										hashMap.put("cItemCCode","01");
										hashMap.put("dblSum",sum1);
										hashMap.put("strContractID",currencyApply3.getCurrency_string6());
										hashMap.put("strXMDL",strXMDL);
										hashMap.put("currency_int7",sum1);
										hashMap.put("dtStartDate",currencyApply3.getCurrency_string16());
										hashMap.put("dtEndDate",currencyApply3.getCurrency_string17());
										hashMap.put("GUID",currencyApply3.getCurrency_string6());
										hashMap.put("cItem_Class","02");
										hashMap.put("program", program);

										//xzu8DataMapper.insertfitemss04(hashMap);
										xzu8DataMapper.insertCMContractItemB35(hashMap);
									}

									sum++;
								}
							}

							//查询收款计划
							List<HashMap<String, Object>> paymentList = currencyApplyMapper.selectPaymentPlan(currencyApply2);
							for (HashMap<String, Object> hashMap : paymentList){
								hashMap.put("GUID",currencyApply3.getCurrency_string6());
								if (currencyApply2.getCurrency_type() != 47) {
									u8DataMapper.insertCMContractPay(hashMap);
								}else {
									xzu8DataMapper.insertCMContractPay(hashMap);
								}
							}

							currencyApply3.setCurrency_int3(sum);
							if (currencyApply2.getCurrency_type() != 47) {
								u8DataMapper.updateCMContract(currencyApply3);
							}else{
								xzu8DataMapper.updateCMContract(currencyApply3);
							}

							currencyApply2.setCurrency_money5(new BigDecimal(0));

							//添加合同条款信息
							if (currencyApply2.getCurrency_type() != 47) {
								u8DataMapper.insertCMContractCaluseB(currencyApply2);
							}else {
								xzu8DataMapper.insertCMContractCaluseB(currencyApply2);

							}
							//添加合同处理记录列表信息
							if (currencyApply2.getCurrency_type() != 47) {
								u8DataMapper.insertCMList(currencyApply3);
							}else {
								xzu8DataMapper.insertCMList(currencyApply3);

							}
							//添加合同设置表信息
							if(currencyApply2.getCurrency_type() != 36 && currencyApply2.getCurrency_type() != 47 && currencyApply2.getCurrency_type() != 35) {
								u8DataMapper.insertCMContractMain(currencyApply3);
							}else {
								if (currencyApply2.getCurrency_type() != 47) {
									u8DataMapper.insertCMContractMain36(currencyApply3);
								}else {
									xzu8DataMapper.insertCMContractMain36(currencyApply3);
								}
							}
							//丽泽销售类出库   生成U8对应发货单
						}else if (currencyApply2.getCurrency_type() == 1000){
                        	//else if (currencyApply2.getCurrency_type() == 13){
							//所有请购流程执行此方法
							//查询id最大值
							String result = u8DataMapper.selectDispatchListDLID();
							String result1 = "0000000001";
							if (result != null) {
								result1 = result.replaceFirst("1", "0");
							}else {
								result = "1000000001";
							}
							String cCusCode = currencyApply.getCurrency_string4();//获取客户编号
							currencyApply3.setCurrency_string10(result);
							currencyApply3.setCurrency_string13(result1);
							currencyApply3.setCurrency_string4(cCusCode);
							currencyApply3.setCurrency_string8("||SA01|" + currencyApply3.getCurrency_string6()+"|1");
							currencyApply3.setCurrency_string9(systemStaff.getStaff_Name());
							currencyApply3.setCurrency_string12(String.valueOf(currencyApply3.getCurrency_applicant()));

							//查询u8销售订单
							String contractID = currencyApply2.getCurrency_string3();
							List<HashMap<String, Object>> soList = u8DataMapper.selectSODetails(contractID);

							String cSOCode = soList.get(0).get("cSOCode")+"";
							currencyApply3.setCurrency_string6(cSOCode);
							u8DataMapper.insertDispatchList(currencyApply3);//添加发货主表
							List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list) {
								Integer AutoID = u8DataMapper.selectSaleBuys();
								if (AutoID == null){
									AutoID = 1000000001;
								}else {
									AutoID = AutoID + 1;
								}
								String cInvCode =  (String) hashMap.get("details_string4");//存货编码
								BigDecimal fQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
								String cbsysbarcode = "||pupr|"+currencyApply3.getCurrency_string6()+"|1";
								BigDecimal fUnitPrice =  (BigDecimal) hashMap.get("details_money4");//单价
								BigDecimal iPerTaxRate =(BigDecimal)hashMap.get("details_money5");//税率
								BigDecimal fTaxPrice =(BigDecimal)hashMap.get("details_money6");//含税单价
								BigDecimal fMoney =(BigDecimal)hashMap.get("details_money7");//无税总价
								BigDecimal iSum =(BigDecimal)hashMap.get("details_money3");//含税总价
								Date dRequirDate =(Date)hashMap.get("details_date2");//需求日期
								Date dArriveDate =(Date)hashMap.get("details_date3");//建议到货日期
								String cInvName = (String)hashMap.get("details_string5");//存货名称
								String cSoCode = currencyApply3.getCurrency_string6();//销售请购单号
								String iDLsID = u8DataMapper.selectDispatchListiDLsID();//最大iDLsID
								hashMap.put("cContractID",contractID);

								String iSOsID = "";
								for (HashMap<String, Object> hashMap1 : soList){
									if (cInvCode.equals(hashMap1.get("cInvCode")+"")){
										iSOsID = hashMap1.get("iSOsID")+"";
									}
								}

								hashMap.put("iSOsID",iSOsID);//销售订单子表标识

								hashMap.put("dRequirDate", dRequirDate);
								hashMap.put("dArriveDate", dArriveDate);
								hashMap.put("fMoney",fMoney);//无税总价
								hashMap.put("iSum",iSum);//含税总价
								hashMap.put("fTaxPrice",fTaxPrice);//含税单价
								hashMap.put("iPerTaxRate",iPerTaxRate);//税率
								hashMap.put("fUnitPrice",fUnitPrice);//单价
								hashMap.put("iTax",iSum.subtract(fMoney));//税额
								hashMap.put("cInvCode", cInvCode);
								hashMap.put("fQuantity", fQuantity);
								hashMap.put("AutoID", AutoID);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								hashMap.put("cInvName",cInvName);
								hashMap.put("DLID", Integer.parseInt(result));
								hashMap.put("cSoCode",cSoCode);
								hashMap.put("cbSysBarCode",currencyApply3.getCurrency_string8());
								hashMap.put("iDLsID",iDLsID);
								//添加请购单子表
								u8DataMapper.insertDispatchLists(hashMap);//添加发货单子表
								for (HashMap<String, Object> hashMap1 : soList){
									if (iSOsID.equals(hashMap1.get("iSOsID")+"")){
										if (hashMap1.containsKey("iFHQuantity ")){
											BigDecimal iFHQuantity = (BigDecimal) hashMap1.get("iFHQuantity");
											iFHQuantity = fQuantity.add(iFHQuantity);
											hashMap.put("iFHQuantity",iFHQuantity);
											hashMap.put("iFHMoney",iFHQuantity.multiply(fTaxPrice));
										}else {
											hashMap.put("iFHQuantity",fQuantity);
											hashMap.put("iFHMoney",fQuantity.multiply(fTaxPrice));
										}
										Integer res = u8DataMapper.updateSODetails(iSOsID,hashMap);
									}
								}
							}
						}//else if(currencyApply2.getCurrency_type() == 9 ||currencyApply2.getCurrency_type() == 10 ||currencyApply2.getCurrency_type() == 8){
							else if(currencyApply2.getCurrency_type() == 10 ||currencyApply2.getCurrency_type() == 8){
							//所有请购流程执行此方法
							//查询id最大值
							Integer ID = u8DataMapper.selectSaleBuy();
							if (ID == null){
								ID = 1000000001;
							}
							Integer AutoId = 30;
							String CardNumber = "27";
							//获取流水号
							Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
							number = number + 1;
							int num = 10;
							String result = "";
							result = String.format("%0" + num + "d", number);
							//添加请购单主表数据
							currencyApply3.setCurrency_string6(result);
							currencyApply3.setCurrency_int5(ID);
							currencyApply3.setCurrency_string12(staff.getStaff_Name());
							u8DataMapper.addBuy(currencyApply3);
							u8DataMapper.updateSerialNumber(AutoId, CardNumber);
							List<HashMap<String, Object>> list1 = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
							for (HashMap<String, Object> hashMap : list1) {
								Integer AutoID = u8DataMapper.selectSaleBuys();
								if (AutoID == null){
									AutoID = 1000000001;
								}else {
									AutoID = AutoID + 1;
								}
								String cInvCode =  (String) hashMap.get("details_string4");//存货编码
								BigDecimal fQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
								String cbsysbarcode = "||pupr|"+currencyApply3.getCurrency_string6()+"|1";
								BigDecimal fUnitPrice =  (BigDecimal) hashMap.get("details_money4");//单价
								BigDecimal iPerTaxRate =(BigDecimal)hashMap.get("details_money5");//税率
								BigDecimal fTaxPrice =(BigDecimal)hashMap.get("details_money6");//含税单价
								BigDecimal fMoney =(BigDecimal)hashMap.get("details_money7");//税后总价
								//Date dRequirDate =(Date)hashMap.get("details_date2");//需求日期
								//Date dArriveDate =(Date)hashMap.get("details_date2");//建议到货日期

								hashMap.put("dRequirDate", hashMap.get("details_date2"));
								hashMap.put("dArriveDate", hashMap.get("details_date2"));
								hashMap.put("fMoney",fMoney);
								hashMap.put("fTaxPrice",fTaxPrice);
								hashMap.put("iPerTaxRate",iPerTaxRate);
								hashMap.put("fUnitPrice",fUnitPrice);
								hashMap.put("cInvCode", cInvCode);
								hashMap.put("fQuantity", fQuantity);
								hashMap.put("ID", ID);
								hashMap.put("AutoID", AutoID);
								hashMap.put("cbsysbarcode", cbsysbarcode);
								//添加请购单子表

								u8DataMapper.addBuys(hashMap);
							}
							//修改当前申请信息，添加总经理已审批唯一标识
							currencyApplyMapper.updateApprovalmark(currencyApply3);
						}else if (currencyApply2.getCurrency_type() == 66){
                        	//66水样检测审批完成后，更新currency_int为2，令检测任务表能获取到此数据。进行领取操作
							//Integer currency_id = Integer.parseInt(currencyApply2.getCurrency_string17());
							currencyApplyMapper.updateFlagById66(currencyApply2.getCurrency_id());
						}
						//---------------------------审批完成后抄送人没有根据天人来进行查询20200617--------------------------
						List<ApproverCopy> aCopies = systemApprovalMapper.selectCopyPerson(approval_id , systemStaff.getCompany_Id());
						systemApprovalMapper.deleteApproveRroleRecord(approverRole3);
						String userlist = "";
						//判断是否有抄送人
						if (aCopies!=null && !aCopies.isEmpty()) {

							for (ApproverCopy approverCopy : aCopies) {
								userlist=approverCopy.getCopy_person();
								dingDingUtilsService.sendmessageCopy(userlist,systemStaff,approverManage);
							}
							userlist =systemStaff.getDingding_staffid();
							System.err.println(userlist);
							//发送给抄送人
							dingDingUtilsService.sendmessageCopy(userlist,systemStaff,approverManage);
							return 1;
						}else {

							userlist += systemStaff.getDingding_staffid();
							System.err.println(userlist);
							dingDingUtilsService.sendmessageCopy(userlist, systemStaff, approverManage);
							return 1;
						}

					}else {
						//审批中
						if (currencyApply3.getCurrent_approvalCount() == count) {//判断是否是下级审批组

							//循环第一遍进入要发送消息的审批组如果第一个审批组中没有人进行第二次循环
							if (approverRole.getRole_type() == 1) {
								ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//获取当前发起人的主管信息
								if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串

									List<String> list = new ArrayList<>();
									String[]  strs2=result.getMsg().split(",");
									int index = 0;
									for(int i=0,len=strs2.length;i<len;i++){
										index++;
										//发送工作消息
										dingDingUtilsService.sendoOutNotice2(strs2[i],systemStaff,approverManage,currencyApply);
										list.add(strs2[i]);
									}

									if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
										currencyApply.setApprover_state(1);
									}else {
										currencyApply.setApprover_state(index);
									}
									//修改审批请求对应的审批人数
									currencyApplyMapper.updateApplyState(currencyApply);
									//将审批人添加到审批列表中
									systemApprovalMapper.addApprovalList(list, currencyApply3.getCurrency_id(),approval_id);
									return 1;//给下一级审批发送审批消息 并跳出循环
								}else {
									System.err.println("2修改审批计数");
									//修改当前审批层级
									currencyApplyMapper.updateApplyCount(currencyApply3.getCurrency_id());
								}

							}else if (approverRole.getRole_type() == 2) {
								//查询主管的部门id
								List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(systemStaff.getDepartment_Id());
								Integer index2 = Integer.parseInt(approverRole.getApprover_id());
								//获取道当前部门主管的id集合
								ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
								if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串

									List<String> list = new ArrayList<>();
									String[]  strs2=result.getMsg().split(",");
									int index = 0;
									for(int i=0,len=strs2.length;i<len;i++){
										index++;
										//发送工作消息
										dingDingUtilsService.sendoOutNotice2(strs2[i],systemStaff,approverManage,currencyApply3);
										list.add(strs2[i]);
									}

									if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
										currencyApply.setApprover_state(1);
									}else {
										currencyApply.setApprover_state(index);
									}
									//修改审批请求对应的审批人数
									currencyApplyMapper.updateApplyState(currencyApply);
									//将审批人添加到审批列表中
									systemApprovalMapper.addApprovalList(list, currencyApply3.getCurrency_id(),3);
									return 1;//给下一级审批发送审批消息 并跳出循环
								}else {
									System.err.println("3修改审批计数");
									//修改当前审批层级
									currencyApplyMapper.updateApplyCount(currencyApply3.getCurrency_id());
								}
							}else if (approverRole.getRole_type() == 3) {

								List<String> list = new ArrayList<>();
								list.add(approverRole.getApprover_id());
								dingDingUtilsService.sendoOutNotice2(approverRole.getApprover_id(),systemStaff,approverManage,currencyApply3);
								currencyApply.setApprover_state(1);
								//修改审批请求对应的审批人数
								currencyApplyMapper.updateApplyState(currencyApply);
								//将审批人添加到审批列表中
								systemApprovalMapper.addApprovalList(list, currencyApply3.getCurrency_id(),approval_id);
/*								if(currencyApply2.getCurrency_type() == 9 && staff.getPosition_Id() == 23){
									//所有请购流程执行此方法
									//查询id最大值
									Integer ID = u8DataMapper.selectSaleBuy();
									Integer AutoId = 29;
									String CardNumber = "27";
									//获取流水号
									Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
									number = number + 1;
									int num = 10;
									String result = "";
									result = String.format("%0" + num + "d", number);
									//添加请购单主表数据
									currencyApply3.setCurrency_string6(result);
									currencyApply3.setCurrency_int5(ID);
									currencyApply3.setCurrency_string12(staff.getStaff_Name());
									u8DataMapper.addBuy(currencyApply3);
									u8DataMapper.updateSerialNumber(AutoId, CardNumber);
									List<HashMap<String, Object>> list1 = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
									for (HashMap<String, Object> hashMap : list1) {
										Integer AutoID = u8DataMapper.selectSaleBuys()+1;
										String cInvCode =  (String) hashMap.get("details_string4");//存货编码
										BigDecimal fQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
										String cbsysbarcode = "||pupr|"+currencyApply3.getCurrency_string6()+"|1";
										BigDecimal fUnitPrice =  (BigDecimal) hashMap.get("details_money4");//单价
										BigDecimal iPerTaxRate =(BigDecimal)hashMap.get("details_money5");//税率
										BigDecimal fTaxPrice =(BigDecimal)hashMap.get("details_money6");//含税单价
										BigDecimal fMoney =(BigDecimal)hashMap.get("details_money7");//税后总价
										Date dRequirDate =(Date)hashMap.get("details_date2");//需求日期
										Date dArriveDate =(Date)hashMap.get("details_date2");//建议到货日期

										hashMap.put("dRequirDate", dRequirDate);
										hashMap.put("dArriveDate", dArriveDate);
										hashMap.put("fMoney",fMoney);
										hashMap.put("fTaxPrice",fTaxPrice);
										hashMap.put("iPerTaxRate",iPerTaxRate);
										hashMap.put("fUnitPrice",fUnitPrice);
										hashMap.put("cInvCode", cInvCode);
										hashMap.put("fQuantity", fQuantity);
										hashMap.put("ID", ID);
										hashMap.put("AutoID", AutoID);
										hashMap.put("cbsysbarcode", cbsysbarcode);
										//添加请购单子表

										u8DataMapper.addBuys(hashMap);
									}
									//修改当前申请信息，添加总经理已审批唯一标识
									currencyApplyMapper.updateApprovalmark(currencyApply3);
								}*/
								return 1;
							}
						}
					}
					count++;
				}
			}else {
				currencyApplyMapper.refuseRequest(currencyApply);
				approver2.setDing_staff_id(systemStaff.getDingding_staffid());
				approver2.setApproval_result(2);
				systemApprovalMapper.updateApproverResultMi(approver2);

				//approvalOpinions.setApproval_state(approverRole.getApprover_name());

				//添加审批意见
				currencyApplyMapper.addApprovalOpinion(approvalOpinions);
				//修改当前审批层级
				currencyApplyMapper.updateApplyCount(currencyApply.getCurrency_id());
				System.err.println("审批拒绝,或签修改审批计数");

				//审批拒绝给抄送人  申请人发送消息
				//查询抄送人
				List<ApproverCopy> aCopies = systemApprovalMapper.selectApproverCopyId(approval_id);
				systemApprovalMapper.deleteApproveRroleRecord(approverRole3);
				String userlist = "";
				if (currencyApply2.getCurrency_type() == 2) {
					List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
					for (HashMap<String, Object> hashMap : list) {
						String details_string4 =  (String) hashMap.get("details_string4");
						String details_int =  (String) hashMap.get("details_string9");
						BigDecimal details_money =  (BigDecimal) hashMap.get("details_money");
						Integer type = 2;
						u8DataMapper.updateCurrentStockfStopQuantity(details_int, details_string4, details_money, type);
					}
				}
				//判断是否有抄送人
				if (aCopies!=null && !aCopies.isEmpty()) {

					for (ApproverCopy approverCopy : aCopies) {
						userlist=approverCopy.getCopy_person();
						dingDingUtilsService.sendmessageCopy2(userlist,systemStaff,approverManage);
					}
					userlist =systemStaff.getDingding_staffid();
					System.err.println(userlist);
					//发送给抄送人
					dingDingUtilsService.sendmessageCopy2(userlist,systemStaff,approverManage);
					return 1;
				}else {
					userlist += systemStaff.getDingding_staffid();
					System.err.println(userlist);
					dingDingUtilsService.sendmessageCopy2(userlist, systemStaff,approverManage);
					return 1;
				}
			}

		}

		return 1;
	}

/*
	@Override
    public Integer carMaintainRequestApproval(CurrencyApply currencyApply, String approvalOpinion)throws Exception{
        //获取审批类型，判断是什么审批流程
        Integer approval_id = currencyApply.getCurrency_type();
        //库存调拨审批
        //查询当前审批管理信息
        ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息
        //查询当前库存调拨的信息
        CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
        //根据id查询员工
        SystemStaff systemStaff = systemStaffMapper.selectStaffById(currencyApply2.getCurrency_applicant());
        //查询当前登录人员的对应的审批记录信息
        Approver approver = systemApprovalMapper.selectApprover(currencyApply2.getCurrency_id(),currencyApply.getCurrency_string(),approval_id);

        //查询当前审批人的名称信息
        OapiUserGetResponse response = dingDingUtilsService.selectDingUserDetils(currencyApply.getCurrency_string());

        ApprovalOpinion approvalOpinions = new ApprovalOpinion();//创建审批意见实体类
        //传入审批意见参数
        approvalOpinions.setApprovalOpinion_result(approvalOpinion);//审批意见
        approvalOpinions.setApprover_id(currencyApply.getCurrency_string());//审批人id
        approvalOpinions.setApprover_name(response.getName());//审批人名称
        approvalOpinions.setApprovalOpinion_type(currencyApply2.getCurrency_type());//审批管理主键标识
        approvalOpinions.setApproval_id(currencyApply2.getCurrency_id());
        Integer count = 0;
        ApproverRole approverRole3 = new ApproverRole();//创建一个审批流程类传入筛选条件用于通过或被拒绝后 删除记录的审批流程
        approverRole3.setApply_id(currencyApply2.getCurrency_id());
        approverRole3.setCompany_id(systemStaff.getCompany_Id());
        approverRole3.setApproval_id(approval_id);
        if (currencyApply2.getApprover_state() == 0 && currencyApply2.getApprover_count().equals(currencyApply2.getCurrent_approvalCount())) {
            return 100;//已经通过了
        }else if (currencyApply2.getApprover_state() == -100) {
            return -100;//撤回了
        }else if (currencyApply2.getApprover_state() == -300) {
            return -200;//被拒绝
        }else if (approver.getApproval_result() != 0) {
            return -300;//当前用户已经审批过了
        }else {

            Approver approver2 = new Approver();

            //
            approver2.setAllocation_id(currencyApply.getCurrency_id());
            //approver2.setDing_staff_id(staff.getDingding_staffid());

            if (currencyApply.getApprover_state() == 1) {//如果当前用户操作为通过

                List<ApproverRole> roles = new ArrayList<>();
                ApproverRole approverRole2 = new ApproverRole();

                approverRole2.setApproval_id(approval_id);//当前审批管理的id
                approverRole2.setApply_id(currencyApply.getCurrency_id());
                approverRole2.setCompany_id(systemStaff.getCompany_Id());
                //判断当前流程为车辆维修申请，并且预估金额字段不为空
                if (currencyApply.getCurrency_type() == 33 &&
                        !"0".equals(currencyApply.getCurrency_string2()) && !"".equals(currencyApply.getCurrency_string2())){
                    //判断预估金额是否大于等于1000
                    if (NumberUtils.createBigDecimal(currencyApply.getCurrency_string2()).compareTo(BigDecimal.valueOf(1000)) >= 0){
                        //预估金额大于1000走条件审批流程
                        approverRole2.setApprover_condition(2);
                        //查询当前审批流的设置信息
                        roles = systemApprovalMapper.selectConditionApproval(approverRole2);
                    }else {
                        //预估金额小于1000走默认审批流程
                        roles = systemApprovalMapper.selectApproveRroleRecord(approverRole2);
                    }
                }
                Integer res2 = 0;

                CurrencyApply currencyApply3 = new CurrencyApply();
                //获取到发起申请的时间
                currencyApply.setCurrency_date(currencyApply2.getCurrency_date());
                //获取业务员id
                currencyApply.setCurrency_string5(currencyApply2.getCurrency_string5());
                //获取业务员部门id
                currencyApply.setCurrency_string4(currencyApply2.getCurrency_string4());
                //循环遍历审批组
                for (ApproverRole approverRole : roles) {

                    if (currencyApply2.getCurrent_approvalCount() == count) {//判断是是否是当前审批组

                        if (approverRole.getRole_state() == 1) {//当前审批为或签

                            approver2.setApproval_result(1);
                            systemApprovalMapper.updateApproverResultMi(approver2);
                            res2 = currencyApplyMapper.refuseRequest(currencyApply);
                            //添加审批意见
                            currencyApplyMapper.addApprovalOpinion(approvalOpinions);
                            //修改当前审批层级
                            currencyApplyMapper.updateApplyCount(currencyApply.getCurrency_id());
                            System.err.println("或签修改审批计数");
                        }else {
                            currencyApplyMapper.refuseRequest(currencyApply);
                            //会签
                            approver2.setDing_staff_id(currencyApply.getCurrency_string());
                            approver2.setApproval_result(1);
                            System.err.println("会签审批-1");
                            systemApprovalMapper.updateApproverResultMi(approver2);

                            CurrencyApply currencyApply4  =  currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());

                            if (currencyApply4.getApprover_state() == 0 && currencyApply4.getApprover_count() == currencyApply4.getCurrent_approvalCount()) {
                                //修改当前审批层级
                                currencyApplyMapper.updateApplyCount(currencyApply4.getCurrency_id());
                                System.err.println("会签修改审批计数");
                            }else {
                                count = -10;
                                return 1;
                            }
                        }
                    }
                    currencyApply3  =  currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
                    //查询当前申请的信息
                    if (currencyApply3.getApprover_state() == 0 && currencyApply3.getApprover_count() == currencyApply3.getCurrent_approvalCount()) {
                        //审批通过 给抄送人  申请人发送消息
                        //查询抄送人
                        if (currencyApply2.getCurrency_type() == 2) {
                            //查询id最大值
                            Integer ID = u8DataMapper.selectOtheRID();
                            Integer AutoId = 15;
                            String CardNumber = "0302";
                            //获取流水号
                            Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
                            number = number + 1;
                            int num = 10;
                            String result = "";
                            result = String.format("%0" + num + "d", number);
                            //添加其他出库单主表数据
                            currencyApply3.setCurrency_string6(result);
                            currencyApply3.setCurrency_int5(ID);
                            u8DataMapper.addOtheR(currencyApply3);
                            u8DataMapper.updateSerialNumber(AutoId, CardNumber);
                            List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
                            for (HashMap<String, Object> hashMap : list) {
                                Integer AutoID = u8DataMapper.selectOtherIDs();
                                String cInvCode =  (String) hashMap.get("details_string4");//存货编码
                                String details_int =  (String) hashMap.get("details_string9");//仓库编码
                                BigDecimal iQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
                                String cPosition   = (String) hashMap.get("details_string10");//货位编码
                                String cItemCode = (String) hashMap.get("details_string");
                                String cName  = (String) hashMap.get("details_string2");

                                hashMap.put("cInvCode", cInvCode);
                                hashMap.put("details_int", details_int);
                                hashMap.put("iQuantity", iQuantity);
                                hashMap.put("cPosition", cPosition);
                                hashMap.put("ID", ID);
                                hashMap.put("cItemCode", cItemCode);
                                hashMap.put("cName", cName);
                                String cbsysbarcode = "||st09|"+currencyApply3.getCurrency_string6()+"|1";
                                hashMap.put("AutoID", AutoID);
                                hashMap.put("cbsysbarcode", cbsysbarcode);
                                //添加其他出库单子表
                                u8DataMapper.addOtheroutlets(hashMap);
                                //添加其他出库单字表关联表
                                u8DataMapper.addOtheroutletRelation(hashMap);
                                Integer type = 2;
                                u8DataMapper.updateCurrentStockfStopQuantity(details_int, cInvCode, iQuantity, type);
                            }
                        }else if (currencyApply2.getCurrency_type() == 3 || currencyApply2.getCurrency_type() == 4
                                || currencyApply2.getCurrency_type() == 8|| currencyApply2.getCurrency_type() == 9) {
                            //所有请购流程执行此方法
                            //查询id最大值
                            Integer ID = u8DataMapper.selectSaleBuy();
                            Integer AutoId = 29;
                            String CardNumber = "27";
                            //获取流水号
                            Integer number = u8DataMapper.selectSerialNumber(AutoId, CardNumber);
                            number = number + 1;
                            int num = 10;
                            String result = "";
                            result = String.format("%0" + num + "d", number);
                            //添加请购单主表数据
                            currencyApply3.setCurrency_string6(result);
                            currencyApply3.setCurrency_int5(ID);
                            u8DataMapper.addBuy(currencyApply3);
                            u8DataMapper.updateSerialNumber(AutoId, CardNumber);
                            List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
                            for (HashMap<String, Object> hashMap : list) {
                                Integer AutoID = u8DataMapper.selectSaleBuys()+1;
                                String cInvCode =  (String) hashMap.get("details_string4");//存货编码
                                BigDecimal fQuantity =  (BigDecimal) hashMap.get("details_money");//请求数量
                                String cbsysbarcode = "||pupr|"+currencyApply3.getCurrency_string6()+"|1";
                                BigDecimal fUnitPrice =  (BigDecimal) hashMap.get("details_money4");//单价
                                BigDecimal iPerTaxRate =(BigDecimal)hashMap.get("details_money5");//税率
                                BigDecimal fTaxPrice =(BigDecimal)hashMap.get("details_money6");//含税单价
                                BigDecimal fMoney =(BigDecimal)hashMap.get("details_money7");//税后总价
                                Date dRequirDate =(Date)hashMap.get("details_date2");//需求日期
                                Date dArriveDate =(Date)hashMap.get("details_date3");//建议到货日期

                                hashMap.put("dRequirDate", dRequirDate);
                                hashMap.put("dArriveDate", dArriveDate);
                                hashMap.put("fMoney",fMoney);
                                hashMap.put("fTaxPrice",fTaxPrice);
                                hashMap.put("iPerTaxRate",iPerTaxRate);
                                hashMap.put("fUnitPrice",fUnitPrice);
                                hashMap.put("cInvCode", cInvCode);
                                hashMap.put("fQuantity", fQuantity);
                                hashMap.put("ID", ID);
                                hashMap.put("AutoID", AutoID);
                                hashMap.put("cbsysbarcode", cbsysbarcode);
                                //添加请购单子表

                                u8DataMapper.addBuys(hashMap);
                            }
                            //
                        }
                        List<ApproverCopy> aCopies = systemApprovalMapper.selectCopyPerson(approval_id , systemStaff.getCompany_Id());
                        systemApprovalMapper.deleteApproveRroleRecord(approverRole3);
                        String userlist = "";
                        //判断是否有抄送人
                        if (aCopies!=null && !aCopies.isEmpty()) {

                            for (ApproverCopy approverCopy : aCopies) {
                                userlist=approverCopy.getCopy_person();
                                dingDingUtilsService.sendmessageCopy(userlist,systemStaff,approverManage);
                            }
                            userlist =systemStaff.getDingding_staffid();
                            System.err.println(userlist);
                            //发送给抄送人
                            dingDingUtilsService.sendmessageCopy(userlist,systemStaff,approverManage);
                            return 1;
                        }else {

                            userlist += systemStaff.getDingding_staffid();
                            System.err.println(userlist);
                            dingDingUtilsService.sendmessageCopy(userlist, systemStaff, approverManage);
                            return 1;
                        }

                    }else {
                        //审批中
                        if (currencyApply3.getCurrent_approvalCount() == count) {//判断是否是下级审批组

                            //循环第一遍进入要发送消息的审批组如果第一个审批组中没有人进行第二次循环
                            if (approverRole.getRole_type() == 1) {
                                ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//获取当前发起人的主管信息
                                if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串

                                    List<String> list = new ArrayList<>();
                                    String[]  strs2=result.getMsg().split(",");
                                    int index = 0;
                                    for(int i=0,len=strs2.length;i<len;i++){
                                        index++;
                                        //发送工作消息
                                        dingDingUtilsService.sendoOutNotice2(strs2[i],systemStaff,approverManage,currencyApply);
                                        list.add(strs2[i]);
                                    }

                                    if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
                                        currencyApply.setApprover_state(1);
                                    }else {
                                        currencyApply.setApprover_state(index);
                                    }
                                    //修改审批请求对应的审批人数
                                    currencyApplyMapper.updateApplyState(currencyApply);
                                    //将审批人添加到审批列表中
                                    return 1;//给下一级审批发送审批消息 并跳出循环
                                }else {
                                    System.err.println("2修改审批计数");
                                    //修改当前审批层级
                                    currencyApplyMapper.updateApplyCount(currencyApply3.getCurrency_id());
                                }

                            }else if (approverRole.getRole_type() == 2) {
                                //查询主管的部门id
                                List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(systemStaff.getDepartment_Id());
                                Integer index2 = Integer.parseInt(approverRole.getApprover_id());
                                //获取道当前部门主管的id集合
                                ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
                                if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串

                                    List<String> list = new ArrayList<>();
                                    String[]  strs2=result.getMsg().split(",");
                                    int index = 0;
                                    for(int i=0,len=strs2.length;i<len;i++){
                                        index++;
                                        //发送工作消息
                                        dingDingUtilsService.sendoOutNotice2(strs2[i],systemStaff,approverManage,currencyApply3);
                                        list.add(strs2[i]);
                                    }

                                    if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
                                        currencyApply.setApprover_state(1);
                                    }else {
                                        currencyApply.setApprover_state(index);
                                    }
                                    //修改审批请求对应的审批人数
                                    currencyApplyMapper.updateApplyState(currencyApply);
                                    //将审批人添加到审批列表中
                                    systemApprovalMapper.addApprovalList(list, currencyApply3.getCurrency_id(),3);
                                    return 1;//给下一级审批发送审批消息 并跳出循环
                                }else {
                                    System.err.println("3修改审批计数");
                                    //修改当前审批层级
                                    currencyApplyMapper.updateApplyCount(currencyApply3.getCurrency_id());
                                }
                            }else if (approverRole.getRole_type() == 3) {

                                List<String> list = new ArrayList<>();
                                list.add(approverRole.getApprover_id());
                                dingDingUtilsService.sendoOutNotice2(approverRole.getApprover_id(),systemStaff,approverManage,currencyApply3);
                                currencyApply.setApprover_state(1);
                                //修改审批请求对应的审批人数
                                currencyApplyMapper.updateApplyState(currencyApply);
                                //将审批人添加到审批列表中
                                systemApprovalMapper.addApprovalList(list, currencyApply3.getCurrency_id(),3);
                                return 1;
                            }
                        }
                    }
                    count++;
                }
            }else {
                currencyApplyMapper.refuseRequest(currencyApply);
                if (currencyApply2.getCurrency_type() == 2) {
                    List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply2);
                    for (HashMap<String, Object> hashMap : list) {
                        String details_string4 =  (String) hashMap.get("details_string4");
                        String details_int =  (String) hashMap.get("details_string9");
                        BigDecimal details_money =  (BigDecimal) hashMap.get("details_money");
                        Integer type = 2;
                        u8DataMapper.updateCurrentStockfStopQuantity(details_int, details_string4, details_money, type);
                    }
                }
                approver2.setDing_staff_id(systemStaff.getDingding_staffid());
                approver2.setApproval_result(2);
                systemApprovalMapper.updateApproverResultMi(approver2);
                //审批拒绝给抄送人  申请人发送消息
                //查询抄送人
                List<ApproverCopy> aCopies = systemApprovalMapper.selectApproverCopyId(approval_id);
                systemApprovalMapper.deleteApproveRroleRecord(approverRole3);
                String userlist = "";
                //判断是否有抄送人
                if (aCopies!=null && !aCopies.isEmpty()) {

                    for (ApproverCopy approverCopy : aCopies) {
                        userlist=approverCopy.getCopy_person();
                        dingDingUtilsService.sendmessageCopy2(userlist,systemStaff,approverManage);
                    }
                    userlist =systemStaff.getDingding_staffid();
                    System.err.println(userlist);
                    //发送给抄送人
                    dingDingUtilsService.sendmessageCopy2(userlist,systemStaff,approverManage);
                    return 1;
                }else {

                    userlist += systemStaff.getDingding_staffid();
                    System.err.println(userlist);
                    dingDingUtilsService.sendmessageCopy2(userlist, systemStaff,approverManage);
                    return 1;
                }
            }

        }
        return 1;
    }
*/

	@Override
	public List<HashMap<String, Object>> selectApplyAllocationCurrency(Page page2, CurrencyApply currencyApply) {
		//发起人查询自己发起的审批流程
		return currencyApplyMapper.selectApplyAllocationCurrency(page2,currencyApply);
	}

	@Override
	public Integer getApplyAllocationCurrencyRows(CurrencyApply currencyApply) {
		//发起人查询自己发起的审批流程数量
		return currencyApplyMapper.getApplyAllocationCurrencyRows(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectCurrencyApprover(Page page2, CurrencyApply currencyApply) {
		//审批人查询自己需要审批的申请
		return currencyApplyMapper.selectCurrencyApprover(page2,currencyApply);
	}

    @Override
    public List<HashMap<String, Object>> selectCurrencyApproverTr(Page page2, CurrencyApply currencyApply) {
        //审批人查询自己需要审批的申请
        return currencyApplyMapper.selectCurrencyApproverTr(page2,currencyApply);
    }

    @Override
	public List<HashMap<String, Object>> selectCurrencyApprover2(CurrencyApply currencyApply) {
		//审批人查询自己需要审批的申请
		return currencyApplyMapper.selectCurrencyApprover2(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectCurrencyApprover1(Page page2, CurrencyApply currencyApply) {
		//审批人查询自己需要审批的申请
		return currencyApplyMapper.selectCurrencyApprover1(page2,currencyApply);
	}

	@Override
	public Integer getCurrencyApproverRows(CurrencyApply currencyApply) {
		//审批人查询自己需要审批的申请条数
		return currencyApplyMapper.getCurrencyApproverRows(currencyApply);
	}

    @Override
    public Integer getCurrencyApproverRowsTr(CurrencyApply currencyApply) {
        return currencyApplyMapper.getCurrencyApproverRowsTr(currencyApply);
    }

    @Override
	public Integer getCurrencyApproverRows1(CurrencyApply currencyApply) {
		//审批人查询自己需要审批的申请条数
		return currencyApplyMapper.getCurrencyApproverRows1(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectCurrencyDetails(CurrencyApply currencyApply) {
		//查看申请详情
		CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
		if (currencyApply2.getCurrency_type() == 2){

		}
		return currencyApplyMapper.selectCurrencyDetails(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalOpinion(ApprovalOpinion approvalOpinions) {
		//查询申请信息
		CurrencyApply currencyApply = currencyApplyMapper.selectCurrencyApplyById(approvalOpinions.getApproval_id());
		SystemStaff staff = systemStaffMapper.selectStaffById(currencyApply.getCurrency_applicant());

		//查询当前审批流的审批条件*固定 传入参数(当前登录用户信息的公司Id,和审批管理主表对应的审批类型的主键)
		Integer money2 = systemCompanMapper.selectApprovalCondition(staff.getCompany_Id(), currencyApply.getCurrency_type());//*

		//审批条件属性
		Integer condition = 2;//2含义就是条件审批//*
		ApproverRole approverRole = new ApproverRole();//*
		approverRole.setApproval_id(currencyApply.getCurrency_type());//申请管理id//*
		approverRole.setCompany_id(staff.getCompany_Id());//公司id//*
		List<ApproverRole> roles;

		//添加不需要条件判定的数组

		String[] str = {"8","11","14","15","16","17","18","19","24","22","23","28","29","32","37","20","61","38","39","40","41","42"
                ,"44","45","46","55","58","59","62","63","66","67","68","69","70","71","74","75"};
		//判断当前流程是否需要条件判定，当前流程是否在不需要判定数组中存在
		if (Arrays.asList(str).contains(String.valueOf(currencyApply.getCurrency_type()))){

            //如果流程为69，天人报备流程，那么审批人为集团审批
            if(currencyApply.getCurrency_type() == 69){
                approverRole.setCompany_id(65);
            }

			currencyApply.setCondition_state(1);//加入条件标识
			//查询当前审批流的设置信息
			roles = systemApprovalMapper.selectConditionApproval(approverRole);
		}else {
			if(currencyApply.getCurrency_type() == 2){//判断是否为普通运营请购
				if(currencyApply.getCurrency_money3().compareTo(BigDecimal.ZERO) == 0){//判断欠款金额为0
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else
			//出发登记申请需要判断是公车还是私车
			if(currencyApply.getCurrency_type()==21 ){
				//私车
				if(currencyApply.getCurrency_int2()==2){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
				//在线运维调休需要判断是不是工程师
			}else if(currencyApply.getCurrency_type() == 10){//判断是否为普通运营请购
				if(currencyApply.getCurrency_int2()==1){//判断是否为BO设备
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 26){
				//不是工程师
				if(staff.getPosition_Id() != 46){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 35 || currencyApply.getCurrency_type() == 36
					|| currencyApply.getCurrency_type() == 34){
				//不是工程师
				if("非制式".equals(currencyApply.getCurrency_string3())){//加赵菲
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 63){
				//不是工程师
				if("非制式".equals(currencyApply.getCurrency_string4())){//加赵菲
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 50){
				//合同状况
				if("未到合同及付款".equals(currencyApply.getCurrency_string10())){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 51){
				//合同状况
				if("现场采样".equals(currencyApply.getCurrency_string2())){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 43 ){
				//1现场采样 2送样
				if(currencyApply.getCurrency_int2()==1){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
					currencyApply.setApprover_count(roles.size());//记录一共有几层审批
				}
			}else if(currencyApply.getCurrency_type() == 54){
				if("单位入库".equals(currencyApply.getCurrency_string())){//
					//单位入库直接仓管审批
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					//直发企业先是申请人审批，后为仓管审批
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 47){
				//合同金额
				if(currencyApply.getCurrency_money().doubleValue() >= money2){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 30) {
				//区域经理
				if (staff.getPosition_Id() == 47) {
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				} else if (staff.getPosition_Id() == 49){
					currencyApply.setCondition_state(1);
					approverRole.setApproval_id(60);
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 9 || currencyApply.getCurrency_type() == 13) {//销售采购、销售出库，合同全付款不走总经理
				if (currencyApply.getCurrency_money().equals(currencyApply.getCurrency_money2())) {//以收取全款
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {//为收取全款走条件审批
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}

			}else if(currencyApply.getCurrency_type() == 72) {//销售采购、销售出库，合同全付款不走总经理
				if ("故障报告".equals(currencyApply.getCurrency_string8())) {//走条件审批
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}else {//走正常审批
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}

			}else {
				//判断是否达到设置的条件金额
				if (currencyApply.getCurrency_money6().doubleValue() >= money2) {//达到条件金额//*

					approverRole.setApprover_condition(condition);

					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				} else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = systemApprovalMapper.selectConditionApproval(approverRole);
				}
			}

		}

		//已审批的审批意见
		List<HashMap<String, Object>> list = currencyApplyMapper.selectApprovalOpinion(approvalOpinions);
		if (currencyApply.getApprover_state() == 0){//如果已经被审核完成，则直接返回list6
			return list;
		}
		List<HashMap<String, Object>> approvallist = new ArrayList<>();
		for (int a = 0;a < roles.size();a++) {
			HashMap<String,Object> hashMap = new HashMap<>();
			ApproverRole approverRole1 = roles.get(a);
			hashMap.put("approval_state", approverRole1.getApprover_name());
			if (approverRole1.getRole_type() == 1) {//判断是否为角色
				ResponseResult result = null;//查询钉钉角色下的人员
				try {
					result = dingDingUtilsService.selectDingRoleStaff(approverRole1.getApprover_id());
				} catch (ApiException e) {
					e.printStackTrace();
				}
				if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串
					String[]  strs2=result.getMsg().split(",");
					List<String> list1 = Arrays.asList(strs2);
					for (int b = 0;b < list.size();b++){
						HashMap<String, Object> hashMap1 = list.get(b);
						if (a == b && list1.contains(hashMap1.get("approver_id"))){
							hashMap.put("approver_name",hashMap1.get("approver_name"));
							hashMap.put("approvalOpinion_result",hashMap1.get("approvalOpinion_result"));
							hashMap.put("approval_date",hashMap1.get("approval_date"));
						}
					}
				}

			}else if (approverRole1.getRole_type() == 2){
				//查询主管的部门id
				List<Long> parentIds = null;
				try {
					parentIds = dingDingUtilsService.getDingDepartmentSup(staff.getDepartment_Id());
				} catch (ApiException e) {
					e.printStackTrace();
				}
				Integer index2 = Integer.parseInt(approverRole1.getApprover_id());
				//获取道当前部门主管的id集合
				ResponseResult result = null;
				try {
					result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
				} catch (ApiException e) {
					e.printStackTrace();
				}
				if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串
					String[] strs2 = result.getMsg().split(",");
					List<String> list1 = Arrays.asList(strs2);
					for (int b = 0; b < list.size(); b++) {
						HashMap<String, Object> hashMap1 = list.get(b);
						if (a == b && list1.contains(hashMap1.get("approver_id"))) {
							hashMap.put("approver_name", hashMap1.get("approver_name"));
							hashMap.put("approvalOpinion_result", hashMap1.get("approvalOpinion_result"));
							hashMap.put("approval_date",hashMap1.get("approval_date"));
						}
					}
				}
			}else {
				for (int b = 0; b < list.size(); b++) {
					HashMap<String, Object> hashMap1 = list.get(b);
					if (a == b ) {
						hashMap.put("approver_name", hashMap1.get("approver_name"));
						hashMap.put("approvalOpinion_result", hashMap1.get("approvalOpinion_result"));
						hashMap.put("approval_date",hashMap1.get("approval_date"));
					}
				}
			}
			approvallist.add(hashMap);
		}
		return approvallist;
	}

	@Override
	public Integer updateCurrencyDetailsByCurrencyId(CurrencyDetails currencyDetails){
		return currencyApplyMapper.updateCurrencyDetailsByCurrencyId(currencyDetails);
	}

	@Override
	public CurrencyApply selectCurrencyApply(CurrencyApply currencyApply) {
		//查询申请表单信息
		return currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
	}

	//撤回主表信息
	@Override
	public Integer deleteCurrencyApply(CurrencyApply currencyApply) {
		return currencyApplyMapper.deleteCurrencyApply(currencyApply);
	}

	//撤回子表信息
	@Override
	public Integer deleteCurrencyDetails(CurrencyApply currencyApply) {
		return currencyApplyMapper.deleteCurrencyDetails(currencyApply);
	}

	//更新申请信息
	@Override
	public Integer updateCurrency(CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss) {
		Integer count = 0 ;
		//更新申请表单信息（currencyApply主表）
		Integer updateApply = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
		//删除原有的商品信息
		currencyApplyMapper.deleteCurrencyDetails(currencyApply);
		//添加修改的商品信息
		currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss,currencyApply.getCurrency_id());
		return updateApply;
	}

	@Override
	public CurrencyApply selectIsExistApply(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectIsExistApply(currencyApply);
	}

	@Override
	public String getCurrencyApproval(CurrencyApply currencyApply){
		String str = "error";
		Integer approval_id = currencyApply.getCurrency_type();
		CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
		Approver approver = systemApprovalMapper.selectApprover(currencyApply2.getCurrency_id(),currencyApply.getCurrency_string(),approval_id);
		if (approver != null && approver.getApproval_result() != 0){
			str = "success";
		}
		return str;
	}

	@Override
	public ApproverManage findApproverManageByTyep(ApproverManage approverManage){
		if (approverManage != null) {
			ApproverManage approverManage1 = systemApprovalMapper.selectManage(approverManage.getApproval_id());
			if (approverManage1 != null) {
				return approverManage1;
			} else {
				approverManage.setApproval_name("未知类别");
				return approverManage;
			}
		}else {
			approverManage.setApproval_name("发生未知错误,请稍后访问或刷新页面");
			return approverManage;
		}
	}

	@Override
	public List<HashMap<String, Object>> selectCurrency(Page page2, CurrencyApply currencyApply) {
		return currencyApplyMapper.selectCurrency(page2,currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectFlowMessage(Page page2,Flow flow) {
		return currencyApplyMapper.selectFlowMessage(page2,flow);
	}

	@Override
	public Integer getFlowRows(Flow flow) {
		return currencyApplyMapper.getFlowRows(flow);
	}

	@Override
	public List<HashMap<String, Object>> selectFlowMessageDetail(Page page2, String barcode) {
		return currencyApplyMapper.selectFlowMessageDetail(page2,barcode);
	}

	@Override
	public Integer getFlowDetailRows(String barcode) {
		return currencyApplyMapper.getFlowDetailRows(barcode);
	}

	@Override
	public List<HashMap<String, Object>> selectApplyAllocationCurrency1(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectApplyAllocationCurrency1(currencyApply);
	}

	@Override
	public Integer insertFlowMessage(Flow flow){
		return currencyApplyMapper.insertFlowMessage(flow);
	}

	@Override
	public List<HashMap<String, Object>> selectProgramDetails(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectProgramDetails(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectPaymentPlan(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectPaymentPlan(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectProgramDetailsByContract(CurrencyApply currencyApply) {
		CurrencyApply currencyApply1 = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
		String strContractID = currencyApply1.getCurrency_string3();//合同编号
		List<HashMap<String, Object>> list = xzu8DataMapper.selectContractItem(strContractID);
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectContractStatement(Page page2, CurrencyApply currencyApply) {
		List<HashMap<String, Object>> list = u8DataMapper.selectContractStatement(page2,currencyApply);
		int number = 1;
		for (HashMap<String, Object> hashMap : list){
			hashMap.put("number",number);
			number++;
			String strContractID = (String) hashMap.get("strContractID");
			if (currencyApply.getCurrency_string6().equals("01")){//销售合同查询出库单号和日期
				List<HashMap<String,Object>> recorde32InfoList = u8DataMapper.selectRdrecord32Info(strContractID);
				StringBuffer outBuffer = new StringBuffer();
				if (recorde32InfoList != null) {
					for (HashMap recorde32InfoMap : recorde32InfoList){
						outBuffer.append((recorde32InfoMap.get("dDate") + "").substring(0, 10))
								.append("(").append(recorde32InfoMap.get("cCode")).append(")")
								.append("、");
					}
				}
				String outInfro = outBuffer.toString();
				if (outInfro == null || "".equals(outInfro)){
					hashMap.put("outInfo",outInfro);
				}else {
					hashMap.put("outInfo", outInfro.substring(0, outInfro.length() - 1));
				}

			}
			//查询合同明细
			/*List<HashMap<String,Object>> itemList = u8DataMapper.selectItem(strContractID);
			StringBuffer stringBuffer = new StringBuffer();
			Double quantity = 0.0;
			for (HashMap<String,Object> hashMap1 : itemList){
				stringBuffer.append(hashMap1.get("strName")).append("、");
				quantity += Double.parseDouble(hashMap1.get("dblQuantity")+"");
			}
			hashMap.put("quantity",quantity);
			String strName = stringBuffer.toString();
			if (strName == null || "".equals(strName)){
				hashMap.put("strName",strName);
			}else {
				hashMap.put("strName", strName.substring(0, strName.length() - 1));
			}*/

			//交金额
			BigDecimal receiveAmount = u8DataMapper.findReceiveAmountByCContractId(strContractID);
			hashMap.put("receiveAmount",receiveAmount);

			//余款
			Double dblTotalCurrency = (Double) hashMap.get("dblTotalCurrency");
			if (dblTotalCurrency == null){
				dblTotalCurrency = 0.0;
			}
			if(receiveAmount == null){
				receiveAmount = new BigDecimal(0);
			}
			BigDecimal spareMaoney = BigDecimal.valueOf(dblTotalCurrency).subtract(receiveAmount);
			hashMap.put("spareMaoney",spareMaoney);

			//查询条款
			List<HashMap<String,Object>> clauseList = u8DataMapper.selectContractAll(strContractID);
			StringBuffer clauseBuffer = new StringBuffer();
			for (HashMap<String,Object> hashMap2 : clauseList){

				String strMemorabiliaID = hashMap2.get("strName")+"";
				if (strMemorabiliaID != null && strMemorabiliaID.contains("付款")){
					hashMap.put("clause",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("配件")){
					hashMap.put("parts",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("检测")){
					hashMap.put("test",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("其它")){
					hashMap.put("other",hashMap2.get("strMemo"));
				}
			}

			/*//查询大事记
			List<HashMap<String,Object>> memoList = u8DataMapper.selectContractMemo(strContractID);
			for (HashMap<String,Object> hashMap4 : memoList){
				String strMemorabiliaID = hashMap4.get("strMemorabiliaID")+"";
				if (strMemorabiliaID != null && strMemorabiliaID.contains("配件")){
					hashMap.put("parts",hashMap4.get("strMemorabilia"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("检测")){
					hashMap.put("test",hashMap4.get("strMemorabilia"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("其它")){
					hashMap.put("other",hashMap4.get("strMemorabilia"));
				}
			}*/



			//查询收款计划
			List<HashMap<String,Object>> paymentList = u8DataMapper.selectReceivables(strContractID);
			StringBuffer payBuffer = new StringBuffer();
			for (HashMap<String,Object> hashMap3 : paymentList){
				payBuffer.append((hashMap3.get("dtPayDate")+"").substring(0,10)).append("(").append(hashMap3.get("dblPayCurrency")).append("元").append(")").append("、");
			}
			String payment = payBuffer.toString();
			if (payment == null || "".equals(payment)){
				hashMap.put("dtPayDate",payment);
			}else {
				hashMap.put("dtPayDate", payment.substring(0, payment.length() - 1));
			}

			//来款时间
			List<HashMap<String, Object>> moneyList = u8DataMapper.selectReceiveByCContractId(strContractID);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			StringBuffer moneyBuff = new StringBuffer();
			for (HashMap<String, Object> hashMap5 : moneyList){
				Date dVouchDate = (Date) hashMap5.get("dVouchDate");
				String time = "";
				if (dVouchDate != null) {
					time = sdf.format(dVouchDate);
				}
				moneyBuff.append(time).append("(").append(hashMap5.get("iAmount")).append("元").append(")").append("、");
			}
			String moneyDate = moneyBuff.toString();
			if (moneyDate == null || "".equals(moneyDate)){
				hashMap.put("moneyDate",moneyDate);
			}else {
				hashMap.put("moneyDate",moneyDate.substring(0,moneyDate.length()-1));
			}

			//开票时间
			Integer currency_type = 0;
			String strContractType = hashMap.get("strContractType")+"";
			if ("01".equals(strContractType)){
				currency_type = 28;
			}else if ("02".equals(strContractType)){
				currency_type = 23;
			}else if ("03".equals(strContractType)){
				currency_type = 29;
			}
			List<HashMap<String, Object>> billingList = currencyApplyMapper.selectBilling(strContractID,currency_type);
			StringBuffer billBuff = new StringBuffer();
			if (billingList != null){
				for (HashMap<String, Object> hashMap6 : billingList){
					Date date = (Date) hashMap6.get("currency_date");
					String format = "";
					if (date != null) {
						format = sdf.format(date);
					}
					String currency_string13 = hashMap6.get("currency_string13") + "";
					billBuff.append(format).append("(").append(currency_string13).append("元)").append("、");
				}
			}
			String billDate= billBuff.toString();
			if (billDate != null && "".equals(billDate)){
				hashMap.put("billDate",billDate);
			}else {
				hashMap.put("billDate",billDate.substring(0,billDate.length()-1));
			}

		}
		return list;
	}

	@Override
	public List<HashMap<String, Object>> selectXZContractStatement(Page page2, CurrencyApply currencyApply) {
		List<HashMap<String, Object>> list = xzu8DataMapper.selectContractStatement(page2,currencyApply);
		int number = 1;
		for (HashMap<String, Object> hashMap : list){
			hashMap.put("number",number);
			number++;
			String strContractID = (String) hashMap.get("strContractID");

			//交金额
			BigDecimal receiveAmount = xzu8DataMapper.findReceiveAmountByCContractId(strContractID);
			hashMap.put("receiveAmount",receiveAmount);

			//余款
			Double dblTotalCurrency = (Double) hashMap.get("dblTotalCurrency");
			if (dblTotalCurrency == null){
				dblTotalCurrency = 0.0;
			}
			if(receiveAmount == null){
				receiveAmount = new BigDecimal(0);
			}
			BigDecimal spareMaoney = BigDecimal.valueOf(dblTotalCurrency).subtract(receiveAmount);
			hashMap.put("spareMaoney",spareMaoney);

			//查询条款
			List<HashMap<String,Object>> clauseList = xzu8DataMapper.selectContractAll(strContractID);
			StringBuffer clauseBuffer = new StringBuffer();
			for (HashMap<String,Object> hashMap2 : clauseList){

				String strMemorabiliaID = hashMap2.get("strName")+"";
				if (strMemorabiliaID != null && strMemorabiliaID.contains("付款")){
					hashMap.put("clause",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("配件")){
					hashMap.put("parts",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("检测")){
					hashMap.put("test",hashMap2.get("strMemo"));
				}
				if (strMemorabiliaID != null && strMemorabiliaID.contains("其它")){
					hashMap.put("other",hashMap2.get("strMemo"));
				}
			}

			//查询收款计划
			List<HashMap<String,Object>> paymentList = xzu8DataMapper.selectReceivables(strContractID);
			StringBuffer payBuffer = new StringBuffer();
			for (HashMap<String,Object> hashMap3 : paymentList){
				payBuffer.append((hashMap3.get("dtPayDate")+"").substring(0,10)).append("(").append(hashMap3.get("dblPayCurrency")).append("元").append(")").append("、");
			}
			String payment = payBuffer.toString();
			if (payment == null || "".equals(payment)){
				hashMap.put("dtPayDate",payment);
			}else {
				hashMap.put("dtPayDate", payment.substring(0, payment.length() - 1));
			}

			//来款时间
			List<HashMap<String, Object>> moneyList = xzu8DataMapper.selectReceiveByCContractId(strContractID);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			StringBuffer moneyBuff = new StringBuffer();
			for (HashMap<String, Object> hashMap5 : moneyList){
				Date dVouchDate = (Date) hashMap5.get("dVouchDate");
				String time = "";
				if (dVouchDate != null) {
					time = sdf.format(dVouchDate);
				}
				moneyBuff.append(time).append("(").append(hashMap5.get("iAmount")).append("元").append(")").append("、");
			}
			String moneyDate = moneyBuff.toString();
			if (moneyDate == null || "".equals(moneyDate)){
				hashMap.put("moneyDate",moneyDate);
			}else {
				hashMap.put("moneyDate",moneyDate.substring(0,moneyDate.length()-1));
			}

			//开票时间
			Integer currency_type = 29;//信泽检测类发票开具申请
			//String strContractType = hashMap.get("strContractType")+"";
            /*if ("01".equals(strContractType)){
                currency_type = 28;
            }else if ("02".equals(strContractType)){
                currency_type = 23;
            }else if ("03".equals(strContractType)){
                currency_type = 29;
            }*/
			List<HashMap<String, Object>> billingList = currencyApplyMapper.selectBilling(strContractID,currency_type);
			StringBuffer billBuff = new StringBuffer();
			if (billingList != null){
				for (HashMap<String, Object> hashMap6 : billingList){
					Date date = (Date) hashMap6.get("currency_date");
					String format = "";
					if (date != null) {
						format = sdf.format(date);
					}
					String currency_string13 = hashMap6.get("currency_string13") + "";
					billBuff.append(format).append("(").append(currency_string13).append("元)").append("、");
				}
			}
			String billDate= billBuff.toString();
			if (billDate != null && "".equals(billDate)){
				hashMap.put("billDate",billDate);
			}else {
				hashMap.put("billDate",billDate.substring(0,billDate.length()-1));
			}

		}
		return list;
	}

	@Override
	public Integer getContractStatementRows(CurrencyApply currencyApply) {
		return u8DataMapper.getContractStatementRows(currencyApply);
	}

	@Override
	public Integer getXZContractStatementRows(CurrencyApply currencyApply) {
		return xzu8DataMapper.getContractStatementRows(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectContractItem(String strContractID) {
		return u8DataMapper.selectItem(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectPayment(String strContractID) {
		return u8DataMapper.selectReceivables(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectReceive(String strContractID) {
		return u8DataMapper.selectReceiveByCContractId(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectContractMemo(String strContractID) {
		return u8DataMapper.selectContractMemo(strContractID);
	}

	@Override
	public SystemStaff selectStaff(Integer currency_applicant) {
		return systemStaffMapper.selectStaffById(currency_applicant);
	}

	@Override
	public CurrencyDetails selectCurrencyDetailsByID(Integer currency_details_id) {
		return currencyApplyMapper.selectCurrencyDetailsByID(currency_details_id);
	}

	@Override
	public Integer uploadFiles(HttpServletRequest request,MultipartFile[] files, Integer currency_id) {
		String filePath = request.getServletContext().getRealPath("/");
		if (files != null && files.length > 0) {
			Integer i = 0;
			for (MultipartFile file : files) {
				// 获取文件的原始名称
				String originalFilename = file.getOriginalFilename();

				// 获取文件后缀
				String suffix = FilenameUtils.getExtension(originalFilename);

				//新名字
				UUID uuid = UUID.randomUUID();
				String newName = uuid.toString().replaceAll("-", "") + "." + suffix;
				File newFile = new File(filePath+"/pics/", newName);
				try {
					file.transferTo(newFile);
				} catch (IOException e) {
					e.printStackTrace();
				}

				ContractPicture contractPicture = new ContractPicture();
				contractPicture.setCurrency_id(currency_id);
				contractPicture.setPicture(newName);
				contractPicture.setCoverpath("/lizexiangmu/pics/" + newName);
				Integer res = currencyApplyMapper.uploadFiles(contractPicture);
				i+=res;
			}
			return i;
		}else {
			return 0;
		}

	}

	@Override
	public List<HashMap<String, Object>> selectContractPicture(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectContractPicture(currencyApply);
	}

	@Override
	public Integer recallCurrencyApply(CurrencyApply currencyApply) {
		return currencyApplyMapper.recallCurrencyApply(currencyApply);
	}

	@Override
	public Integer signCurrencyApply(CurrencyApply currencyApply) {
		return currencyApplyMapper.signCurrencyApply(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectAllCurrency(Page page2, CurrencyApply currencyApply) {
		if (currencyApply.getCurrency_type()!=58){
			return currencyApplyMapper.selectAllCurrency(page2, currencyApply);
		}else {
			List<HashMap<String, Object>> list = currencyApplyMapper.selectAllCurrency(page2, currencyApply);
			List<HashMap<String, Object>> list1 = new ArrayList<>();
			for (HashMap<String, Object> hashMap : list) {
				String details_string4 = (String) hashMap.get("details_string4");
				BigDecimal bigDecimal = (BigDecimal) hashMap.get("details_money2");
				if (details_string4 != null){
					String[] split = details_string4.split(",");
					BigDecimal num = new BigDecimal(split.length);
					for (String s : split){
						HashMap<String,Object> hashMap1 = new HashMap<>();
						hashMap1.putAll(hashMap);
						hashMap1.put("name",s);
						hashMap1.put("money",bigDecimal.divide(num,2,BigDecimal.ROUND_HALF_UP));
						list1.add(hashMap1);
					}
				}else {
					HashMap<String,Object> hashMap1 = new HashMap<>();
					hashMap1.putAll(hashMap);
					hashMap1.put("name",hashMap.get("staff_name"));
					hashMap1.put("money",hashMap.get("details_money2"));
					list1.add(hashMap1);
				}
			}
			return list1;
		}
	}

	@Override
	public Integer getAllCurrencyRows(CurrencyApply currencyApply) {
		return currencyApplyMapper.getAllCurrencyRows(currencyApply);
	}

	@Override
	public Integer findCurrencyDetailsByMap(String barcode){
		return currencyApplyMapper.findCurrencyDetailsByMap(barcode);
	}

	@Override
	public Integer getProductCount(String product_id) {
		return currencyApplyMapper.getProductCount(product_id);
	}

	@Override
	public void addBarcode(SystemStaff staff,CurrencyApply currencyApply,String currencyDetails) {
		List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);//*
		//往条码表中插入条码数据
		for (CurrencyDetails details : currencyDetailss) {
			//如果是配件入库
			//往条码表中插入条码数据
			//一条条码插入一次
			if ("配件入库".equals(currencyApply.getCurrency_string7()) || "入库".equals(currencyApply.getCurrency_string7())){
				currencyApply.setCurrency_string9(details.getDetails_string11());
				currencyApplyMapper.addBarcode(currencyApply);
			}
			//往流水表中插入条码记录流水
			Flow flow = new Flow();
			flow.setBarcode(details.getDetails_string11());//条形码
			flow.setOrderType(currencyApply.getCurrency_string7());//录入类型
			flow.setVendor(currencyApply.getCurrency_string6());//客户/供应商
			flow.setWarehouse(currencyApply.getCurrency_string8());//仓库
			flow.setNum(currencyApply.getCurrency_string12());//数量
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String nowDate = simpleDateFormat.format(new Date());
			flow.setOperator(staff.getStaff_Name());//操作人
			flow.setOpeDate(nowDate);//操作时间

			Integer i = currencyApplyMapper.insertFlowMessage(flow);
		}
	}

	@Override
	public void sendMessage69(CurrencyApply currencyApply) throws ApiException{


        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd");
        //查询流程相关信息
        CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());

	    if ("0".equals(currencyApply.getCurrency_string10())){//合同未签订
			currencyApply2.setCurrency_string6(currencyApply.getCurrency_string6());

        }else if ("1".equals(currencyApply.getCurrency_string10())){//合同已签订
            currencyApply2.setCurrency_date3(sdf.format(currencyApply.getCurrency_date3()));
            currencyApply2.setCurrency_string10("1");
			//更新流程信息 加入被通知人钉钉id和姓名
			currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
        }else if ("2".equals(currencyApply.getCurrency_string10())){//终止报备
            currencyApply2.setCurrency_string10("2");
            //更新流程信息 流程状态为终止
            currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
        }else if ("3".equals(currencyApply.getCurrency_string10())){//合同提醒

        }else{//选择要通知的人
            currencyApply2.setCurrency_string17(currencyApply.getCurrency_string17());
            currencyApply2.setCurrency_string18(currencyApply.getCurrency_string18());

            //记录通知时间
			currencyApply.setCurrency_date5(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //更新流程信息 加入被通知人钉钉id和姓名
            currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
        }
        //发送通知
        dingDingUtilsService.sendMessage69(currencyApply.getCurrency_string10(),currencyApply2);
	}

	@Override
	public List<HashMap<String, Object>> selectCurrencyList(Page page2, CurrencyApply currencyApply) {
		return currencyApplyMapper.selectCurrencyList(page2,currencyApply);
	}

	@Override
	public Integer getCurrencyListRows(CurrencyApply currencyApply) {
		return currencyApplyMapper.getCurrencyListRows(currencyApply);
	}

	@Override
	public List<HashMap<String, Object>> selectAllCurrencyList(CurrencyApply currencyApply) {
		return currencyApplyMapper.selectAllCurrencyList(currencyApply);
	}

	@Override
	public Integer launchpurchase74(HttpServletRequest request
			, CurrencyApply currencyApply, SystemStaff staff, List<ApproverRole> roles, List<CurrencyDetails> currencyDetailss
			, List<PaymentPlan> paymentPlans, MultipartFile[] files1, MultipartFile[] files2) throws ApiException {
		// 发起通用审批流
		//循环遍历审批组
		Integer approval_id = currencyApply.getCurrency_type();//*
		int count = 0;//*
		ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息//*
		Date date = new Date();//获取当前发起申请的时间
		currencyApply.setCurrency_date(date);

		for (ApproverRole approverRole : roles) {//遍历审批组//*
			//循环第一遍进入第一个要发送消息的审批组如果第一个审批组中没有人进行第二次循环
			if (approverRole.getRole_type() == 1) {//判断是否为角色
				ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//查询钉钉角色下的人员
				if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串
					//添加调拨审批请求
					Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);

					List<String> list = new ArrayList<>();
					String[]  strs2=result.getMsg().split(",");
					int index = 0;
					for(int i=0,len=strs2.length;i<len;i++){
						//区域经理角色只针对申请人所在区域的区域经理发送消息
						if ("区域经理".equals(approverRole.getApprover_name())){
							SystemStaff systemStaff = systemStaffMapper.selectStaffByDingdingStaffIdAndDepartmentId(strs2[i],staff.getDepartment_Id());
							if (systemStaff == null){
								continue;
							}else if (systemStaff.getDepartment_Id().equals(staff.getDepartment_Id())){
								index++;
								//发送工作消息
								dingDingUtilsService.sendoOutNotice2(strs2[i],staff,approverManage,currencyApply);
								list.add(strs2[i]);
							}
						}else {
							index++;
							//发送工作消息
							dingDingUtilsService.sendoOutNotice2(strs2[i], staff, approverManage, currencyApply);
							list.add(strs2[i]);
						}
					}

					currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
					if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
						currencyApply.setApprover_state(1);
					}else {//如果当前审批为会签把要审批的人的数量加到审批中
						currencyApply.setApprover_state(index);
					}
					Integer update = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
					if(currencyDetailss != null) {
						//添加当前通用审批的详情
						currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss,currencyApply.getCurrency_id());
					}
					if (paymentPlans != null){
						currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
					}
					//合同添加图片
					if (files1 != null && files1.length > 0){
						this.uploadFiles(request,files1,currencyApply.getCurrency_id(),"1");
					}
					if (files2 != null && files2.length > 0){
						this.uploadFiles(request,files2,currencyApply.getCurrency_id(),"2");
					}
					//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
					systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
					//将审批人添加到审批列表中
					systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
					return res;
				}

			}else if (approverRole.getRole_type() == 2) {
				//判断当前流程是否属于要专门设置主管审批的流程
				Integer index2 = 1;//取第几级主管 默认直接主管
				String[] str = {"10000"};
				if (Arrays.asList(str).contains(String.valueOf(currencyApply.getCurrency_type()))){
					//查询当前申请人身份信息
					OapiUserGetResponse userDetilsRes = dingDingUtilsService.selectDingUserDetils(staff.getDingding_staffid());
					JSONObject userDetailsObj = new JSONObject(userDetilsRes.getIsLeaderInDepts());
					//判断当前发起人是否为主管身份
					if (userDetailsObj.getBoolean(staff.getDepartment_Id())){
						index2 = 2;
					}
				}else {
					//查询是几级主管
					//1直接 2二级 一般都是1
					index2 = Integer.parseInt(approverRole.getApprover_id());
				}
				//查询主管的部门id
				List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(staff.getDepartment_Id());
				//获取道当前部门主管的id集合
				ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
				if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串
					//添加审批请求
					Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);

					List<String> list = new ArrayList<>();
					String[]  strs2=result.getMsg().split(",");
					int index = 0;
					for(int i=0,len=strs2.length;i<len;i++){
						index++;
						//发送工作消息
						dingDingUtilsService.sendoOutNotice2(strs2[i],staff,approverManage,currencyApply);
						list.add(strs2[i]);
					}

					currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
					if (approverRole.getRole_state() == 1) {//添加当前审批组有多少人要进行审批 如果是或签为一
						currencyApply.setApprover_state(1);
					}else {
						currencyApply.setApprover_state(index);
					}
					//添加审批请求
					Integer update = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
					if (currencyDetailss != null) {
						//添加当前调拨的商品
						currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss, currencyApply.getCurrency_id());
					}
					if (paymentPlans != null){
						currencyApplyMapper.addPaymentPlans(paymentPlans,currencyApply.getCurrency_id());
					}
					//合同添加图片
					if (files1 != null && files1.length > 0){
						this.uploadFiles(request,files1,currencyApply.getCurrency_id(),"1");
					}
					if (files2 != null && files2.length > 0){
						this.uploadFiles(request,files2,currencyApply.getCurrency_id(),"2");
					}
					//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
					systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
					//将审批人添加到审批列表中
					systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
					return res;
				}
			}else if (approverRole.getRole_type() == 3) {

				List<String> list = new ArrayList<>();
				list.add(approverRole.getApprover_id());
				currencyApply.setCurrent_approvalCount(count);//记录当前是第几次审批
				currencyApply.setApprover_state(1);
				//添加审批请求
				Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
				//添加当前调拨的商品
				if(currencyDetailss!=null) {
					currencyApplyMapper.addCurrencyApplyDetais(currencyDetailss, currencyApply.getCurrency_id());
				}
				//合同添加图片
				if (files1 != null && files1.length > 0){
					this.uploadFiles(request,files1,currencyApply.getCurrency_id(),"1");
				}
				if (files2 != null && files2.length > 0){
					this.uploadFiles(request,files2,currencyApply.getCurrency_id(),"2");
				}
				//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
				systemApprovalMapper.addApproveRroleRecord(roles,currencyApply.getCurrency_id());
				//将审批人添加到审批列表中
				systemApprovalMapper.addApprovalList(list, currencyApply.getCurrency_id(),approval_id);
				dingDingUtilsService.sendoOutNotice2(approverRole.getApprover_id(),staff,approverManage,currencyApply);//发送工作消息
				return res;
			}
			count++;
		}

		return -1;
	}

	@Override
	public Integer uploadFiles(HttpServletRequest request, MultipartFile[] files, Integer currency_id, String flag) {
		String filePath = request.getServletContext().getRealPath("/");
			Integer i = 0;
			for (MultipartFile file : files) {
				// 获取文件的原始名称
				String originalFilename = file.getOriginalFilename();

				// 获取文件后缀
				String suffix = FilenameUtils.getExtension(originalFilename);

				//新名字
				UUID uuid = UUID.randomUUID();
				String newName = uuid.toString().replaceAll("-", "") + "." + suffix;
				File newFile = new File(filePath+"/pics/", newName);
				try {
					file.transferTo(newFile);
				} catch (IOException e) {
					e.printStackTrace();
				}

				ContractPicture contractPicture = new ContractPicture();
				contractPicture.setCurrency_id(currency_id);
				contractPicture.setPicture(newName);
				contractPicture.setCoverpath("/lizexiangmu/pics/" + newName);
				contractPicture.setString(flag);
				Integer res = currencyApplyMapper.uploadFiles(contractPicture);
				i+=res;
			}
			return i;
	}
}

package com.yr.lize.currencyapply.controller;

import com.alibaba.fastjson.JSONArray;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.service.ICurrencyApplyService;
import com.yr.lize.pojo.*;
import com.yr.lize.storage.service.StorageBarCodeService;
import com.yr.lize.system.mapper.U8DataMapper;
import com.yr.lize.system.mapper.XZU8DataMapper;
import com.yr.lize.system.service.ISystemApprovalService;
import com.yr.lize.system.service.ISystemCompanyService;
import com.yr.lize.system.service.U8DataService;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CurrencyApplyController {

	private static org.apache.log4j.Logger logger = org.apache.log4j.LogManager.getLogger(CurrencyApplyController.class);

	@Autowired
	ISystemCompanyService iSystemCompanyService;

	@Autowired
	ISystemApprovalService iSystemApprovalService;

	@Autowired
	ICurrencyApplyService iCurrencyApplyService;

	@Autowired
	U8DataService u8DataService;

	@Autowired
	StorageBarCodeService storageBarCodeService;

	@Autowired
	U8DataMapper u8DataMapper;
	@Autowired
	XZU8DataMapper xzu8DataMapper;

	//转跳到审批意见页面
	@RequestMapping("/Currency/approvalOpinion.action")
	public String approvalOpinion() {
		return "WEB-INF/views/approvalOpinion";
	}
	//转跳到天人审批意见页面
	@RequestMapping("/Currency/trApprovalOpinion.action")
	public String trApprovalOpinion() {
		return "WEB-INF/views/trApprovalOpinion";
	}
	//跳转到工作流审批意见页面
	@RequestMapping("/Currency/launchWorkFlowApprovalOpinion.action")
	public String launchWorkFlowApprovalOpinion(){
		return "WEB-INF/views/launchWorkFlowApprovalOpinion";
	}
	//转跳到审批详情页面
	@RequestMapping("/Currency/currencyDetails.action")
	public String currencyDetails() {
		return "WEB-INF/views/currencyDetails";
	}
	//转跳到审批进度页面
	@RequestMapping("/Currency/approvalProgress.action")
	public String approvalProgress() {
		return "WEB-INF/views/approvalProgress";
	}

	@RequestMapping("/Currency/contractDetails.action")
	public String contractDetails() {
		return "WEB-INF/views/contract/contractDetails";
	}

	//发起通用审批流
	@RequestMapping("/Currency/launchCurrencyApply.action")
	@ResponseBody
	public ResponseResult launchCurrencyApply(HttpServletRequest request,HttpSession session , String currencyDetails , CurrencyApply currencyApply, String payDetails, String testDetails, @RequestParam(value="pics",required=false) MultipartFile[] files) {

		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");//从session中获取当前登录用户,也就是发起人的信息//*

		//查询当前审批流的审批条件*固定 传入参数(当前登录用户信息的公司Id,和审批管理主表对应的审批类型的主键)
		Integer money2 = iSystemCompanyService.selectApprovalCondition(staff.getCompany_Id(), currencyApply.getCurrency_type());//*

		//审批条件属性
		Integer condition = 2;//2含义就是条件审批//*
		ApproverRole approverRole = new ApproverRole();//*
		approverRole.setApproval_id(currencyApply.getCurrency_type());//申请管理id//*
		approverRole.setCompany_id(staff.getCompany_Id());//公司id//*
		List<ApproverRole> roles;//*

		//将前台传入的数组,转化成list，使用的是alibaba的com.alibaba.fastjson.JSONArray//表单中附带的从表详情信息
		List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);//*

		//收款计划
		List<PaymentPlan> paymentPlans = JSONArray.parseArray(payDetails, PaymentPlan.class);

		//检测内容
		List<ProgramDetails> programDetails = JSONArray.parseArray(testDetails, ProgramDetails.class);

		//添加不需要条件判定的数组

		String[] str = {"8","11","14","15","16","17","18","19","24","23","28","29","32","34","35","36","37","20","61","38","39","40","41","42","43",
				"44","45","46","55","58","59","62","63","66","67","68","69","70","71","72"};
		//判断当前流程是否需要条件判定，当前流程是否在不需要判定数组中存在
		if (Arrays.asList(str).contains(String.valueOf(currencyApply.getCurrency_type()))){

		    //如果流程为69，天人报备流程，那么审批人为集团审批
		    if(currencyApply.getCurrency_type() == 69){
		        approverRole.setCompany_id(65);
            }
//            approverRole.setApprover_condition(condition);

			currencyApply.setCondition_state(1);//加入条件标识
			//查询当前审批流的设置信息
			roles = iSystemApprovalService.selectConditionApproval(approverRole);
		}else {
			//出发登记申请需要判断是公车还是私车
			if(currencyApply.getCurrency_type() == 21 ){
				//私车
				if(currencyApply.getCurrency_int2()==2){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
				//在线运维调休需要判断是不是工程师
			}else if(currencyApply.getCurrency_type() == 10){//判断是否为普通运营请购
				if(currencyApply.getCurrency_int2()==1){//判断是否为BO设备
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 26){
				//不是工程师
				if(staff.getPosition_Id() != 46){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 50){
				//合同状况
				if("未到合同及付款".equals(currencyApply.getCurrency_string10())){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 51){
				//合同状况
				if("现场采样".equals(currencyApply.getCurrency_string2())){
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 47) {
				//合同金额
				if (money2 !=null && currencyApply.getCurrency_money().doubleValue() >= money2) {
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				} else {
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 22) {
				//标液
				if ("标液配制".equals(currencyApply.getCurrency_string10())) {
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				} else {
					//试剂 药品申领
					currencyApply.setCondition_state(1);
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 30) {
				//区域经理
				if (staff.getPosition_Id() == 47) {
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				} else if (staff.getPosition_Id() == 49){
					currencyApply.setCondition_state(1);
					approverRole.setApproval_id(60);
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
					for (ApproverRole approverRole1 : roles){
						approverRole1.setApproval_id(30);
					}
				}else {
					currencyApply.setCondition_state(1);
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}
			}else if(currencyApply.getCurrency_type() == 9 || currencyApply.getCurrency_type() == 13) {//销售采购、销售出库，合同全付款不走总经理
				if (currencyApply.getCurrency_money().equals(currencyApply.getCurrency_money2())) {//以收取全款
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}else {//为收取全款走条件审批
					approverRole.setApprover_condition(condition);
					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}

			} else {
				//判断是否达到设置的条件金额
				if (currencyApply.getCurrency_money6().doubleValue() >= money2) {//达到条件金额//*

					approverRole.setApprover_condition(condition);

					currencyApply.setCondition_state(2);//加入条件标识
					//查询当前审批流的设置信息
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				} else {//
					currencyApply.setCondition_state(1);//加入条件标识
					roles = iSystemApprovalService.selectConditionApproval(approverRole);
				}//*

			}

		}
		//修改编码字段
		iSystemCompanyService.updateCode(currencyApply.getCurrency_type());
		//查询修改后的值
		SystemCode code2 = iSystemCompanyService.selectCode(currencyApply.getCurrency_type());
		Calendar now = Calendar.getInstance();

		Integer code3 = code2.getNumber();
		int num = 10;
		String result = "";

		result = String.format("%0" + num + "d", code3);

		System.err.println(now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result);
		String code4 = now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result;
		//生成编号并保存进数据库

		String currency_number = code2.getCode()+code4;
		currencyApply.setCurrency_string6(result);
		currencyApply.setCurrency_applicant(staff.getStaff_Id());
		currencyApply.setApprover_count(roles.size());//记录一共有几层审批
		currencyApply.setCurrency_applicant(staff.getStaff_Id());//申请人id
		currencyApply.setCurrency_number(currency_number);
		Integer res = null;
		///////////////////2020.05.06/////////////////
		//如果为66水样检测申请
		if(currencyApply.getCurrency_type() == 66 ){
			//为每条明细添加把流程编码当做details_string采样编码
			for (CurrencyDetails c:currencyDetailss){
				c.setDetails_string(currency_number);
			}
			///////////////2020.06.11///////////////////////
		}else if (currencyApply.getCurrency_type() == 69 ){
            //将申请人的钉钉id保存到流程数据中
            currencyApply.setCurrency_string11(staff.getDingding_staffid());
        }

		//发起通用申请并记录
		try {
			ResponseResult responseResult = new ResponseResult();
			/*//如果发起的是运营配件请购申请，并且申请类型为普通请购
			if (currencyApply.getCurrency_type() == 10 && currencyApply.getCurrency_int3() == 1){
				logger.info(staff.getStaff_Name() + "发起配件条码录入，货品流转编码：" + currencyApply.getCurrency_string11());
				//如果发起的是运营配件请购，并且申请类型为维修入库
			}else if (currencyApply.getCurrency_type() == 10 && currencyApply.getCurrency_int3() == 2){
				if (currencyApply.getCurrency_string9() != null && ("").equals(currencyApply.getCurrency_string9())){
					Flow flow = new Flow();
					flow.setBarcode(currencyApply.getCurrency_string9());
					flow.setCreate_user(staff.getStaff_Name());
					flow.setApplyId(currencyApply.getCurrency_id());
					flow.setData(staff.getStaff_Name() + "发起货品维修入库,货品流转编码：" + currencyApply.getCurrency_string9());
					Integer i = iCurrencyApplyService.insertFlowMessage(flow);
					if (i <= 0){
						responseResult.setCode(-1);
						responseResult.setMsg("更新记录货品流转信息发生异常，请稍后再试或联系系统运维人员");
						return responseResult;
					}
				}else {
					responseResult.setCode(-1);
					responseResult.setMsg("请输入货品流转编码！！！");
					return responseResult;
				}
			}*/
			res = iCurrencyApplyService.launchpurchase(request,currencyApply,staff,roles,currencyDetailss,paymentPlans,programDetails,files);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseResult result2 = new ResponseResult();

		if (res > 0) {
			result2.setCode(1);
			result2.setMsg("添加成功");
			if(currencyApply.getCurrency_type() == 2) {
				//冻结商品数量
//				for (CurrencyDetails currencyDetails2 : currencyDetailss) {
//					String cWhCode = currencyDetails2.getDetails_string9();
//					String cInvCode = currencyDetails2.getDetails_string4();
//					BigDecimal fStopQuantity  = currencyDetails2.getDetails_money();
//					Integer type = 1;
//					u8DataService.updateCurrentStockfStopQuantity(cWhCode,cInvCode,fStopQuantity,type);
//				}
			}
		}else if (res == -2){
			result2.setCode(-1);
			result2.setMsg("该条数据已被操作，请刷新表单");
		}else if (res == -3){
			result2.setCode(-1);
			result2.setMsg("添加失败,无对应审批人信息！");
		}else {
			result2.setCode(-1);
			result2.setMsg("添加失败");
		}
		return result2;

	}

	//发起通用审批流
	@RequestMapping("/Currency/launchWork.action")
	@ResponseBody
	public ResponseResult launchWork(HttpServletRequest request,HttpSession session ,String currencyDetails ,CurrencyApply currencyApply,String payDetails,String testDetails, @RequestParam(value="pics",required=false) MultipartFile[] files) {

		CurrencyApply currencyApply1 = iCurrencyApplyService.selectCurrencyApply(currencyApply);
		currencyApply1.setCurrency_type(54);
		currencyApply1.setCurrency_string15(currencyApply.getCurrency_string());
		currencyApply1.setCurrency_string(currencyApply.getCurrency_string());

		SystemStaff staff = iCurrencyApplyService.selectStaff(currencyApply1.getCurrency_applicant());

		//审批条件属性
		Integer condition = 2;//2含义就是条件审批//*
		ApproverRole approverRole = new ApproverRole();//*
		approverRole.setApproval_id(currencyApply1.getCurrency_type());//申请管理id//*
		approverRole.setCompany_id(staff.getCompany_Id());//公司id//*
		List<ApproverRole> roles;//*

		List<CurrencyDetails> currencyDetailss = new ArrayList<>();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyDetails(currencyApply);
		for (HashMap<String, Object> hashMap1 : list){
			Integer currency_details_id = Integer.parseInt(hashMap1.get("currency_details_id")+"");
			CurrencyDetails currencyDetails1 = iCurrencyApplyService.selectCurrencyDetailsByID(currency_details_id);
			currencyDetailss.add(currencyDetails1);
		}
		//收款计划
		List<PaymentPlan> paymentPlans = JSONArray.parseArray(payDetails, PaymentPlan.class);

		//检测内容
		List<ProgramDetails> programDetails = JSONArray.parseArray(testDetails, ProgramDetails.class);

		//请购发货类型
		if("单位入库".equals(currencyApply.getCurrency_string())){
			//iSystemApprovalService.updateApproval2(staff);
			currencyApply1.setCondition_state(1);//加入条件标识
			roles = iSystemApprovalService.selectConditionApproval(approverRole);
		}else {
			iSystemApprovalService.updateApproval1(staff);//更新审批人为当前申请人
			approverRole.setApprover_condition(condition);
			currencyApply1.setCondition_state(2);//加入条件标识
			//查询当前审批流的设置信息
			roles = iSystemApprovalService.selectConditionApproval(approverRole);
		}

		//修改编码字段
		iSystemCompanyService.updateCode(currencyApply1.getCurrency_type());
		//查询修改后的值
		SystemCode code2 = iSystemCompanyService.selectCode(currencyApply1.getCurrency_type());
		Calendar now = Calendar.getInstance();

		Integer code3 = code2.getNumber();
		int num = 10;
		String result = "";

		result = String.format("%0" + num + "d", code3);

		System.err.println(now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result);
		String code4 = now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result;
		//生成编号并保存进数据库

		String currency_number = code2.getCode()+code4;
		currencyApply1.setCurrency_string6(result);
		currencyApply1.setCurrency_applicant(staff.getStaff_Id());
		currencyApply1.setApprover_count(roles.size());//记录一共有几层审批
		currencyApply1.setCurrency_applicant(staff.getStaff_Id());//申请人id
		currencyApply1.setCurrency_number(currency_number);
		Integer res = null;
		//发起通用申请并记录
		try {
			res = iCurrencyApplyService.launchpurchase(request,currencyApply1,staff,roles,currencyDetailss,paymentPlans,programDetails,files);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseResult result2 = new ResponseResult();

		if (res > 0) {
			result2.setCode(1);
			result2.setMsg("添加成功");
		}else if (res == -2){
			result2.setCode(-1);
			result2.setMsg("该条数据已被操作，请刷新表单");
		}else if (res == -3){
			result2.setCode(-1);
			result2.setMsg("添加失败,无对应审批人信息！");
		}else {
			result2.setCode(-1);
			result2.setMsg("添加失败");
		}
		return result2;

	}

	//通用审批
	@RequestMapping("/Currency/approvalCurrencyApply.action")
	@ResponseBody
	public ResponseResult approvalStockAllocation(HttpSession session ,CurrencyApply currencyApply,String approvalOpinion) {
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");

		Integer res = null;
		//审批
		try {
			res = iCurrencyApplyService.approvalCurrencyApply(currencyApply,approvalOpinion,staff);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseResult result = new ResponseResult();

		if (res == 100) {
			result.setMsg("请求已通过");
		}else if (res == -100) {
			result.setMsg("请求已撤回");
		}else if (res == -200) {
			result.setMsg("请求已被拒绝");
		}else if (res == -300) {
			result.setMsg("你已审批过了");
		}else {
			result.setMsg("操作成功");
		}
		return result;
	}

	/**
	 * @Description 工作流发起申请通用方法
	 * @Author Lic
	 * @Date 2019/4/24
	 * @param
	 * @return
	 */
	@RequestMapping("/Currency/launchWorkFlow.action")
	@ResponseBody
	public ResponseResult launchWorkFlow(HttpServletRequest request,HttpSession session ,String currencyDetails ,CurrencyApply currencyApply,String payDetails,String testDetails, @RequestParam(value="pics",required=false) MultipartFile[] files) {

		ResponseResult responseResult = new ResponseResult();

		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");//从session中获取当前登录用户,也就是发起人的信息//*

		//查询当前审批流的审批条件*固定 传入参数(当前登录用户信息的公司Id,和审批管理主表对应的审批类型的主键)
		Integer money2 = iSystemCompanyService.selectApprovalCondition(staff.getCompany_Id(), currencyApply.getCurrency_type());//*

		//审批条件属性
		Integer condition = 2;//2含义就是条件审批//*
		ApproverRole approverRole = new ApproverRole();//*
		approverRole.setApproval_id(currencyApply.getCurrency_type());//申请管理id//*
		approverRole.setCompany_id(staff.getCompany_Id());//公司id//*
		List<ApproverRole> roles;//*

		//将前台传入的数组,转化成list，使用的是alibaba的com.alibaba.fastjson.JSONArray//表单中附带的从表详情信息
		List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);//*
		List<PaymentPlan> paymentPlans = JSONArray.parseArray(payDetails, PaymentPlan.class);
		List<ProgramDetails> programDetails = JSONArray.parseArray(testDetails, ProgramDetails.class);
		//车辆维修申请
		if (currencyApply.getCurrency_type() == 33 && staff.getPosition_Id() != 27 && !"0".equals(currencyApply.getCurrency_string2())){
			responseResult.setMsg("很抱歉，您无权填写：预计金额；请重新填写申请表！");
			return responseResult;
		}

		currencyApply.setCondition_state(1);//加入条件标识
		//查询当前审批流的设置信息
		roles = iSystemApprovalService.selectConditionApproval(approverRole);
		//修改编码字段
		iSystemCompanyService.updateCode(currencyApply.getCurrency_type());
		//查询修改后的值
		SystemCode code2 = iSystemCompanyService.selectCode(currencyApply.getCurrency_type());
		Calendar now = Calendar.getInstance();

		Integer code3 = code2.getNumber();
		int num = 10;
		String result = "";

		result = String.format("%0" + num + "d", code3);

		System.err.println(now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result);
		String code4 = now.get(Calendar.YEAR)+((now.get(Calendar.MONTH) + 1) + "")+now.get(Calendar.DAY_OF_MONTH)+"-"+result;
		//生成编号并保存进数据库

		String currency_number = code2.getCode()+code4;
		currencyApply.setCurrency_string6(result);
		currencyApply.setCurrency_applicant(staff.getStaff_Id());
		currencyApply.setApprover_count(roles.size());//记录一共有几层审批
		currencyApply.setCurrency_applicant(staff.getStaff_Id());//申请人id
		currencyApply.setCurrency_number(currency_number);
		Integer res = null;
		//发起通用申请并记录
		try {
			res = iCurrencyApplyService.launchpurchase(request,currencyApply,staff,roles,currencyDetailss,paymentPlans,programDetails,files);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ResponseResult result2 = new ResponseResult();

		if (res > 0) {
			result2.setCode(1);
			result2.setMsg("添加成功");
			if(currencyApply.getCurrency_type() == 2) {
				//冻结商品数量
				for (CurrencyDetails currencyDetails2 : currencyDetailss) {
					String cWhCode = currencyDetails2.getDetails_string9();
					String cInvCode = currencyDetails2.getDetails_string4();
					BigDecimal fStopQuantity  = currencyDetails2.getDetails_money();
					Integer type = 1;
					u8DataService.updateCurrentStockfStopQuantity(cWhCode,cInvCode,fStopQuantity,type);
				}
			}
		}else {
			result2.setCode(-1);
			result2.setMsg("添加失败");
		}
		return result2;

	}

	/**
	 * @Description 工作流审批流程通用审批方法
	 * @Author Lic
	 * @Date 2019/4/23
	 * @param
	 * @return
	 */
	@RequestMapping("/Currency/conditionsApprovalAll.action")
	@ResponseBody
	public ResponseResult conditionsApprovalAll(CurrencyApply currencyApply,String approvalOpinion,HttpSession session){

		ResponseResult result = new ResponseResult();
		//获取当前登录用户信息
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
		//定义需要进行特殊条件判定的数组
		String[] str = {"26","27"};
		//如果当前登录用户角色为特殊角色
		if (Arrays.asList(str).contains(String.valueOf(staff.getPosition_Id()))) {
			//判定当前特殊角色所指定字段是否为空
			Boolean flag = conditionsApproval(currencyApply);
			if (!flag) {
				//如果当前流程为普通运营请购申请，并且当前登录用户角色为物资部长
				if (currencyApply.getCurrency_type() == 10 && staff.getPosition_Id() == 26) {
					result.setMsg("物资部长审批时请在详情中填写物品报价");
					return result;
					//如果当前流程为车辆维修申请，并且当前登录用户为车辆主管
				} else if (currencyApply.getCurrency_type() == 33 && staff.getPosition_Id() == 27) {
					result.setMsg("车辆主管审批时请在详情中填写预估金额");
					return result;
				}
			}
		}
		//当前登录用户非特殊角色或者字段校验通过
		Integer res = null;
		//审批
		try {
			res = iCurrencyApplyService.approvalCurrencyApply(currencyApply,approvalOpinion,staff);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//对返回字段做状态判断，返回至前台页面
		if (res == 100) {
			result.setMsg("该条申请已被审批通过");
		}else if (res == -100) {
			result.setMsg("该条申请请求已撤回");
		}else if (res == -200) {
			result.setMsg("该条申请已被拒绝");
		}else if (res == -300) {
			result.setMsg("您已审批过此条申请");
		}else {
			result.setMsg("操作成功");
		}
		return result;
	}

	/**
	 * @Description 工作流审批流程通用校验方法
	 * @Author Lic
	 * @Date 2019/4/23
	 * @param
	 * @return
	 */
	private Boolean conditionsApproval(CurrencyApply currencyApply){
		Boolean flag = false;
		ResponseResult responseResult = selectCurrencyDetails(currencyApply);
		List<HashMap<String,Object>> result = (List<HashMap<String,Object>>) responseResult.getData();
		if (result == null){
			return false;
		}
		for (HashMap<String,Object> hashMap : result) {
			if (currencyApply.getCurrency_type() == 10 && hashMap.get("") != null) {
				flag = true;
			}else if (currencyApply.getCurrency_type() == 33 && !"0".equals(hashMap.get("currency_string2")) && !"".equals(hashMap.get("currency_string2"))){
				flag = true;
			}else {
				return false;
			}
		}
		return flag;
	}

	/**
	 * @Description 对商品明细更改通用方法，用作于工作流审批时修改信息
	 * @Author Lic
	 * @Date 2019/4/24
	 * @param
	 * @return
	 */
	@RequestMapping("/Currency/updateCurrencyDetailsByCurrencyId.action")
	@ResponseBody
	public ResponseResult updateCurrencyDetailsByCurrencyId(CurrencyDetails currencyDetails){
		ResponseResult result = new ResponseResult();
		try {
			Integer updateResult = iCurrencyApplyService.updateCurrencyDetailsByCurrencyId(currencyDetails);
			if (updateResult >= 1) {
				result.setMsg("修改成功");
			} else {
				result.setMsg("修改失败");
			}
		}catch (Exception e){
			e.printStackTrace();
			result.setMsg("修改商品信息发生未知异常，请联系技术负责人！" + e);
			return result;
		}
		return result;
	}

	//申请人查询发起的审批请求
	@RequestMapping("/Currency/selectApplicantCurrency.action")
	@ResponseBody
	public ResponseResult selectApplicantCurrency(Integer limit,Integer page,CurrencyApply currencyApply,HttpSession session) {
		ResponseResult result = new ResponseResult();
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		currencyApply.setCurrency_applicant(staff.getStaff_Id());
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectApplyAllocationCurrency(page2,currencyApply);

		Integer count = iCurrencyApplyService.getApplyAllocationCurrencyRows(currencyApply);

		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

	//审批人查询需要自己审批的请求
	@RequestMapping("/Currency/selectCurrencyApprover.action")
	@ResponseBody
	public ResponseResult selectCurrencyApprover(Integer limit,Integer page,CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		currencyApply.setCurrency_string(currencyApply.getCurrency_string());

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyApprover(page2,currencyApply);
		//如果为合同相关的
		String[] strL1 = {"10","2","13"};
		String[] strL2 = {"23","28"};
		String[] strX1 = {"50"};
		String[] strX2 = {"29"};

		if (list != null){
			//判断当前流程是否需要动态获取合同实际已收款
			if (Arrays.asList(strL1).contains(String.valueOf(currencyApply.getCurrency_type()))){//丽泽合同编号为3
				for(HashMap<String,Object> h:list){
					String strContractID = String.valueOf(h.get("currency_string3"));//合同编号
					BigDecimal contractAmount = new BigDecimal(String.valueOf(h.get("currency_money")));//合同总金额
					BigDecimal receiveAmount = u8DataMapper.findReceiveAmountByCContractId(strContractID);//已付款金额
					if (receiveAmount == null){
						receiveAmount = new BigDecimal("0");
					}
					BigDecimal owingAmount = contractAmount.subtract(receiveAmount);//欠款金额
					h.put("currency_money2",receiveAmount);
					h.put("currency_money3",owingAmount);
				}
			}else if (Arrays.asList(strL2).contains(String.valueOf(currencyApply.getCurrency_type()))){//丽泽合同编号为4
				for(HashMap<String,Object> h:list){
					String strContractID = String.valueOf(h.get("currency_string4"));//合同编号
					BigDecimal contractAmount = new BigDecimal(String.valueOf(h.get("currency_money")));//合同总金额
					BigDecimal receiveAmount = u8DataMapper.findReceiveAmountByCContractId(strContractID);//已付款金额
					if (receiveAmount == null){
						receiveAmount = new BigDecimal("0");
					}
					BigDecimal owingAmount = contractAmount.subtract(receiveAmount);//欠款金额
					h.put("currency_money2",receiveAmount);
					h.put("currency_money3",owingAmount);
				}
			}else if (Arrays.asList(strX1).contains(String.valueOf(currencyApply.getCurrency_type()))){//信泽合同编号为3
				for(HashMap<String,Object> h:list){
					String strContractID = String.valueOf(h.get("currency_string3"));//合同编号
					BigDecimal contractAmount = new BigDecimal(String.valueOf(h.get("currency_money")));//合同总金额
					BigDecimal receiveAmount = xzu8DataMapper.findReceiveAmountByCContractId(strContractID);//已付款金额
					if (receiveAmount == null){
						receiveAmount = new BigDecimal("0");
					}
					BigDecimal owingAmount = contractAmount.subtract(receiveAmount);//欠款金额
					h.put("currency_money2",receiveAmount);
					h.put("currency_money3",owingAmount);
				}
			}else if (Arrays.asList(strX2).contains(String.valueOf(currencyApply.getCurrency_type()))){//信泽合同编号为4
				for(HashMap<String,Object> h:list){
					String strContractID = String.valueOf(h.get("currency_string4"));//合同编号
					BigDecimal contractAmount = new BigDecimal(String.valueOf(h.get("currency_money")));//合同总金额
					BigDecimal receiveAmount = xzu8DataMapper.findReceiveAmountByCContractId(strContractID);//已付款金额
					if (receiveAmount == null){
						receiveAmount = new BigDecimal("0");
					}
					BigDecimal owingAmount = contractAmount.subtract(receiveAmount);//欠款金额
					h.put("currency_money2",receiveAmount);
					h.put("currency_money3",owingAmount);
				}
			}
		}

		Integer count = iCurrencyApplyService.getCurrencyApproverRows(currencyApply);

		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

	//销售请购审批人查询需要自己审批的请求
	@RequestMapping("/Currency/selectCurrencyApprover1.action")
	@ResponseBody
	public ResponseResult selectCurrencyApprover1(Integer limit,Integer page,CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		currencyApply.setCurrency_string(currencyApply.getCurrency_string());

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyApprover1(page2,currencyApply);

		for(HashMap<String,Object> h:list){
			String strContractID = String.valueOf(h.get("currency_string3"));//合同编号
			BigDecimal contractAmount = new BigDecimal(String.valueOf(h.get("currency_money")));//合同总金额
			BigDecimal receiveAmount = u8DataMapper.findReceiveAmountByCContractId(strContractID);//已付款金额
			if (receiveAmount == null){
				receiveAmount = new BigDecimal("0");
			}
			BigDecimal owingAmount = contractAmount.subtract(receiveAmount);//欠款金额
			h.put("currency_money2",receiveAmount);
			h.put("currency_money3",owingAmount);
		}

		Integer count = iCurrencyApplyService.getCurrencyApproverRows1(currencyApply);

		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

    //审批人查询需要自己审批的请求
    @RequestMapping("/Currency/selectCurrencyApproverTr.action")
    @ResponseBody
    public ResponseResult selectCurrencyApproverTr(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        currencyApply.setCurrency_string(currencyApply.getCurrency_string());

        List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyApproverTr(page2,currencyApply);

        Integer count = iCurrencyApplyService.getCurrencyApproverRowsTr(currencyApply);

        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }



	//查看申请详情
	@RequestMapping("/Currency/selectCurrencyDetails.action")
	@ResponseBody
	public ResponseResult selectCurrencyDetails(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyDetails(currencyApply);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查询审批意见
	@RequestMapping("/Currency/selectApprovalOpinion.action")
	@ResponseBody
	public ResponseResult selectApprovalOpinion(ApprovalOpinion approvalOpinions) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectApprovalOpinion(approvalOpinions);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查询申请表单详情
	@RequestMapping("/Currency/selectCurrencyApply.action")
	@ResponseBody
	public ResponseResult selectCurrencyApply(CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		CurrencyApply currencyApply1 = iCurrencyApplyService.selectCurrencyApply(currencyApply);
		//判断OA审批流程是否走完
		if(currencyApply1.getApprover_state() == 0 && currencyApply1.getApprover_count() == currencyApply1.getCurrent_approvalCount()){
			result.setMsg("该申请已审核完毕，该系统无法进行修改！！！");
			//判断是否是销售请购，判断总经理是否审批（已审批则生成U8采购请购单）
		}else if(currencyApply1.getCurrency_type()==9 && currencyApply1.getCurrency_int3() != null && currencyApply1.getCurrency_int3() == -1){
			result.setMsg("该申请已生成采购订单，该系统无法修改！！！");
		}
		result.setCode(0);
		result.setData(currencyApply1);
		return result;
	}
	//领取审批导出
	@RequestMapping("/Currency/doCurrencyApproverExcel.action")
	public String doCurrencyApproverExcel(Integer page,Integer limit,CurrencyApply currencyApply,HttpServletResponse response) throws IOException {
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyApprover(page2,currencyApply);

		//2.通过IO写出到客户端。。。。
		//1.内存中组装一个Workbook
		XSSFWorkbook wb = new XSSFWorkbook();
		//2.添加sheet
		XSSFSheet ws = wb.createSheet();
		//3.添加单元格  表头 编号  名字  作者 价格
		XSSFRow wr = ws.createRow(0);
		XSSFCell xc0 = wr.createCell(0);
		xc0.setCellValue("申请编号");
		XSSFCell xc1 = wr.createCell(1);
		xc1.setCellValue("申请人");
		XSSFCell xc2 = wr.createCell(2);
		xc2.setCellValue("申请部门");
		XSSFCell xc3 = wr.createCell(3);
		xc3.setCellValue("申请类型");
		XSSFCell xc4 = wr.createCell(4);
		xc4.setCellValue("申请日期");
		XSSFCell xc5 = wr.createCell(5);
		xc5.setCellValue("需求日期");
		XSSFCell xc6 = wr.createCell(6);
		xc6.setCellValue("试剂/标液名称");
		XSSFCell xc7 = wr.createCell(7);
		xc7.setCellValue("单位");
		XSSFCell xc8 = wr.createCell(8);
		xc8.setCellValue("数量");
		XSSFCell xc9 = wr.createCell(9);
		xc9.setCellValue("区域");
		XSSFCell xc10 = wr.createCell(10);
		xc10.setCellValue("使用企业");
		XSSFCell xc11 = wr.createCell(11);
		xc11.setCellValue("备注");
		XSSFCell xc12 = wr.createCell(12);
		xc12.setCellValue("规格型号");
		SimpleDateFormat s= new SimpleDateFormat("yyyy-MM-dd");
		int k=1;

		for(HashMap<String, Object> map:list){
			currencyApply.setCurrency_id(Integer.parseInt(map.get("currency_id").toString()));
			List<HashMap<String, Object>> hashMap = iCurrencyApplyService.selectCurrencyDetails(currencyApply);
			for(HashMap<String, Object> hashMap1:hashMap) {
				/*if (hashMap.size() <= 1) {*/
				XSSFRow xrs = ws.createRow(k);
				XSSFCell xc0s = xrs.createCell(0);
				xc0s.setCellValue(map.get("currency_number").toString());
				XSSFCell xc1s = xrs.createCell(1);
				xc1s.setCellValue(map.get("staff_name").toString());
				XSSFCell xc2s = xrs.createCell(2);
				xc2s.setCellValue(map.get("department_name").toString());
				XSSFCell xc3s = xrs.createCell(3);
				xc3s.setCellValue(map.get("currency_string10").toString());
				XSSFCell xc4s = xrs.createCell(4);
				xc4s.setCellValue(map.get("currency_date").toString());
				XSSFCell xc1s5 = xrs.createCell(5);
				if (map.get("currency_date2") == null) {
					xc1s5.setCellValue("无");
				} else {
					xc1s5.setCellValue(map.get("currency_date2").toString());
				}
				XSSFCell xc1s6 = xrs.createCell(6);
				xc1s6.setCellValue(hashMap1.get("details_string5").toString());
				XSSFCell xc1s7 = xrs.createCell(7);
				xc1s7.setCellValue(hashMap1.get("details_string7").toString());
				XSSFCell xc1s8 = xrs.createCell(8);
				if (hashMap1.get("details_money") == null){
					xc1s8.setCellValue(0);
				}else {
					xc1s8.setCellValue(hashMap1.get("details_money").toString());
				}
				XSSFCell xc1s9 = xrs.createCell(9);
				xc1s9.setCellValue(hashMap1.get("details_string8").toString());
				XSSFCell xc1s10 = xrs.createCell(10);
				xc1s10.setCellValue(hashMap1.get("details_string9").toString());
				XSSFCell xc1s11 = xrs.createCell(11);
				if (hashMap1.get("details_string11") == null){
					xc1s11.setCellValue("无");
				}else {
					xc1s11.setCellValue(hashMap1.get("details_string11").toString());
				}
				XSSFCell xc1s12 = xrs.createCell(12);
				if (hashMap1.get("details_string6") == null){
					xc1s12.setCellValue("无");
				}else {
					xc1s12.setCellValue(hashMap1.get("details_string6").toString());
				}
				k++;
				/*} else {
					for (int z = 0; z < hashMap.size(); z++) {
						XSSFRow xrs = ws.createRow(k + z);
						XSSFCell xc0s = xrs.createCell(0);
						xc0s.setCellValue(map.get("currency_number").toString());
						XSSFCell xc1s = xrs.createCell(1);
						xc1s.setCellValue(map.get("staff_name").toString());
						XSSFCell xc2s = xrs.createCell(2);
						xc2s.setCellValue(map.get("department_name").toString());
						XSSFCell xc3s = xrs.createCell(3);
						xc3s.setCellValue(map.get("currency_string10").toString());
						XSSFCell xc4s = xrs.createCell(4);
						xc4s.setCellValue(map.get("currency_date").toString());
						XSSFCell xc1s5 = xrs.createCell(5);
						if (map.get("currency_date2") == null) {
							xc1s5.setCellValue("无");
						} else {
							xc1s5.setCellValue(map.get("currency_date2").toString());
						}
						XSSFCell xc1s6 = xrs.createCell(6);
						xc1s6.setCellValue(hashMap1.get("details_string5").toString());
						XSSFCell xc1s7 = xrs.createCell(7);
						xc1s7.setCellValue(hashMap1.get("details_string7").toString());
						XSSFCell xc1s8 = xrs.createCell(8);
						if (hashMap1.get("details_money") == null){
							xc1s8.setCellValue(0);
						}else {
							xc1s8.setCellValue(hashMap1.get("details_money").toString());
						}
						XSSFCell xc1s9 = xrs.createCell(9);
						xc1s9.setCellValue(hashMap1.get("details_string8").toString());
						XSSFCell xc1s10 = xrs.createCell(10);
						xc1s10.setCellValue(hashMap1.get("details_string9").toString());
						XSSFCell xc1s11 = xrs.createCell(11);
						if (hashMap1.get("details_string11") == null){
							xc1s11.setCellValue("无");
						}else {
							xc1s11.setCellValue(hashMap1.get("details_string11").toString());
						}
						XSSFCell xc1s12 = xrs.createCell(12);
						if (hashMap1.get("details_string6") == null){
							xc1s12.setCellValue("无");
						}else {
							xc1s12.setCellValue(hashMap1.get("details_string6").toString());
						}

					}
					k++;
				}*/
			}
		}
		response.setHeader("Content-Disposition","filename=lizeList.xlsx");
		wb.write(response.getOutputStream());
		response.getOutputStream().close();

		return "WEB-INF/views/onlineOperation/reagentGetRequestApproval";
	}
	//撤回一条数据
	@RequestMapping("/Currency/deleteCurrencyApply.action")
	@ResponseBody
	public ResponseResult deleteCurrencyApply(CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		CurrencyApply currencyApply1 = iCurrencyApplyService.selectCurrencyApply(currencyApply);
		//判断OA审批流程是否走完
		if(currencyApply1.getApprover_state() == 0 && currencyApply1.getApprover_count() == currencyApply1.getCurrent_approvalCount()){
			result.setMsg("该申请已审核完毕，该系统无法进行撤回操作！！！");
			//判断是否是销售请购，判断总经理是否审批（已审批则生成U8采购请购单）
		}else if(currencyApply1.getCurrency_type()==9 && currencyApply1.getCurrency_int3() != null && currencyApply1.getCurrency_int3() == -1){
			result.setMsg("该申请已生成采购订单，该系统无法撤回！！！");
		}else {
			result.setCode(0);
			iCurrencyApplyService.deleteCurrencyApply(currencyApply);
			iCurrencyApplyService.deleteCurrencyDetails(currencyApply);
		}
		return result;
	}
	//修改申请信息
	@RequestMapping("/Currency/updateCurrency.action")
	@ResponseBody
	public ResponseResult updateCurrency(HttpSession session ,String currencyDetails ,CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		//将前台传入的数组,转化成list，使用的是alibaba的com.alibaba.fastjson.JSONArray//表单中附带的从表详情信息
		List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);
		try {
			Integer updateResult = iCurrencyApplyService.updateCurrency(currencyApply,currencyDetailss);
			if (updateResult >= 1) {
				result.setMsg("修改成功");
			} else {
				result.setMsg("修改失败");
			}
		}catch (Exception e){
			e.printStackTrace();
			result.setMsg("修改申请信息发生未知异常，请联系技术负责人！" + e);
			return result;
		}
		return result;
	}

	//查询审批详情
	@RequestMapping("/Currency/Approval.action")
	@ResponseBody
	public ResponseResult CurrencyApproval(String currency_string,Integer currency_type,Integer currency_id){

		CurrencyApply currencyApply = new CurrencyApply();
		currencyApply.setCurrency_string(currency_string);
		currencyApply.setCurrency_type(currency_type);
		currencyApply.setCurrency_id(currency_id);
		String str = iCurrencyApplyService.getCurrencyApproval(currencyApply);

		ResponseResult responseResult = new ResponseResult();
		responseResult.setMsg(str);
		return responseResult;
	}

	//查询类别
	@RequestMapping("/Currency/findCurrencyNameByTyep.action")
	@ResponseBody
	public ResponseResult findCurrencyNameByTyep(Integer currency_type){
		ApproverManage approverManage = new ApproverManage();
		approverManage.setApproval_id(currency_type);
		approverManage = iCurrencyApplyService.findApproverManageByTyep(approverManage);

		String str = approverManage.getApproval_name();
		ResponseResult responseResult = new ResponseResult();
		responseResult.setMsg(str);
		return responseResult;
	}

	//查询手机端所需
	@RequestMapping("/Currency/findApproverUrlByTyep.action")
	@ResponseBody
	public ResponseResult findApproverUrlByTyep(Integer currency_type){
		ApproverManage approverManage = new ApproverManage();
		approverManage.setApproval_id(currency_type);
		approverManage = iCurrencyApplyService.findApproverManageByTyep(approverManage);

		String str = approverManage.getApprover_url();
		ResponseResult responseResult = new ResponseResult();
		responseResult.setMsg(str);
		return responseResult;
	}

	//查询手机端所需
	@RequestMapping("/Currency/findApprovalActionByTyep.action")
	@ResponseBody
	public ResponseResult findApprovalActionByTyep(Integer currency_type){
		ApproverManage approverManage = new ApproverManage();
		approverManage.setApproval_id(currency_type);
		approverManage = iCurrencyApplyService.findApproverManageByTyep(approverManage);

		String str = approverManage.getApproval_action();
		ResponseResult responseResult = new ResponseResult();
		responseResult.setMsg(str);
		return responseResult;
	}

	/*试剂标液领取打印*/
	@RequestMapping("Currency/printReagentGet.action")
	public String printReagentGet(){
		return "WEB-INF/views/onlineOperation/reagentGetPrint";
	}
	@RequestMapping("Currency/selectReagentGet.action")
	@ResponseBody
	public ResponseResult selectReagentGet(Integer limit,Integer page,CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrency(page2,currencyApply);

		Integer count = iCurrencyApplyService.getCurrencyApproverRows(currencyApply);

		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}
	/*货品流转信息查询*/
	@RequestMapping("Currency/selectFlowMessage.action")
	@ResponseBody
	public ResponseResult selectFlowMessage(Integer limit,Integer page,Flow flow){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectFlowMessage(page2,flow);
		Integer count = iCurrencyApplyService.getFlowRows(flow);
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

	/*货品流转信息查询*/
	@RequestMapping("Currency/selectFlowMessageDetail.action")
	@ResponseBody
	public ResponseResult selectFlowMessageDetail(Integer limit,Integer page,String barcode){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectFlowMessageDetail(page2,barcode);
		Integer count = iCurrencyApplyService.getFlowDetailRows(barcode);
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}
	//跳转业务招待打印页面
	@RequestMapping("Currency/businessEntertainmentPrint.action")
	public String businessEntertainmentPrint(){
		return "WEB-INF/views/finance/businessEntertainmentPrint";
	}
	@RequestMapping("Currency/selectCurrency.action")
	@ResponseBody
	public ResponseResult selectCurrency(Integer limit,Integer page,CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String,Object>> list = iCurrencyApplyService.selectCurrency(page2,currencyApply);
		result.setData(list);
		return result;
	}

	/*查询条码录入申请详情*/
	@RequestMapping("Currency/selectRepaitWareDetails.action")
	@ResponseBody
	public ResponseResult selectRepaitWareDetails(CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Page page = new Page();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrency(page, currencyApply);
		List<HashMap<String, Object>> list1 = iCurrencyApplyService.selectCurrencyDetails(currencyApply);
		result.setData(list);
		result.setData2(list1);
		return result;
	}
	/*导出试剂标液表*/
	@RequestMapping("Currency/outputExcel.action")
	public String outputExcel(Integer limit, Integer page, CurrencyApply currencyApply, HttpServletResponse response, HttpSession session)throws Exception{

		SystemStaff systemStaff = (SystemStaff)session.getAttribute("systemStaff");
		currencyApply.setCurrency_applicant(systemStaff.getStaff_Id());
		Page page1 = new Page();
		if(limit!=null){
			page1.setPagerows(limit);
			page1.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectApplyAllocationCurrency(page1,currencyApply);
		//创建工作簿
		Workbook workbook = new XSSFWorkbook();
		//创建表
		Sheet sheet = workbook.createSheet();
		//创建表头第一行
		Row row1 = sheet.createRow(0);
		row1.createCell(0).setCellValue("流程编号");
		row1.createCell(1).setCellValue("申请人");
		row1.createCell(2).setCellValue("申请部门");
		row1.createCell(3).setCellValue("申请日期");
		row1.createCell(4).setCellValue("需求时间");
		row1.createCell(5).setCellValue("试剂/标液名称");
		row1.createCell(6).setCellValue("单位");
		row1.createCell(7).setCellValue("数量");
		row1.createCell(8).setCellValue("区域");
		row1.createCell(9).setCellValue("使用企业");
		row1.createCell(10).setCellValue("备注");
		row1.createCell(11).setCellValue("规格型号");
		int x = 1;
		//查询遍历
		for(Map<String,Object> map : list){
			currencyApply.setCurrency_id(Integer.parseInt(map.get("currency_id").toString()));
			List<HashMap<String, Object>> list2 = iCurrencyApplyService.selectCurrencyDetails(currencyApply);
			for(Map<String,Object> map1 :list2){
				Row row2 = sheet.createRow(x);
				row2.createCell(0).setCellValue(map.get("currency_number").toString());
				row2.createCell(1).setCellValue(map.get("staff_name").toString());
				row2.createCell(2).setCellValue(map.get("department_name").toString());
				row2.createCell(3).setCellValue(map.get("currency_date").toString());
				row2.createCell(4).setCellValue(map.get("currency_date2").toString());
				row2.createCell(5).setCellValue(map1.get("details_string5").toString());
				row2.createCell(6).setCellValue(map1.get("details_string7").toString());
				if (map1.get("details_money") == null){
					row2.createCell(7).setCellValue(0);
				}else {
					row2.createCell(7).setCellValue(map1.get("details_money").toString());
				}
				row2.createCell(8).setCellValue(map1.get("details_string8").toString());
				row2.createCell(9).setCellValue(map1.get("details_string9").toString());
				if (map1.get("details_string11") == null){
					row2.createCell(10).setCellValue("无");
				}else {
					row2.createCell(10).setCellValue(map1.get("details_string11").toString());
				}
				if (map1.get("details_string6") == null){
					row2.createCell(11).setCellValue("无");
				}else {
					row2.createCell(11).setCellValue(map1.get("details_string6").toString());
				}
			}
			x++;
		}
		//修改响应方式
		response.setHeader("Content-Disposition","filename=lizeList.xlsx");
		workbook.write(response.getOutputStream());
		response.getOutputStream().close();
		return "WEB-INF/views/onlineOperation/reagentGetRequest";
	}

	//通用打印
	//申请人查询发起的审批请求
	@RequestMapping("/Currency/selectApplicantCurrency1.action")
	@ResponseBody
	public ResponseResult selectApplicantCurrency1(CurrencyApply currencyApply,HttpSession session) {
		ResponseResult result = new ResponseResult();
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
		currencyApply.setCurrency_applicant(staff.getStaff_Id());
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectApplyAllocationCurrency1(currencyApply);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//审批人打印自己审批的请求
	@RequestMapping("/Currency/selectCurrencyApprover2.action")
	@ResponseBody
	public ResponseResult selectCurrencyApprover2(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectCurrencyApprover2(currencyApply);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查看檢測内容
	@RequestMapping("/Currency/selectProgramDetails.action")
	@ResponseBody
	public ResponseResult selectProgramDetails(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectProgramDetails(currencyApply);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查看收款计划
	@RequestMapping("/Currency/selectPaymentPlan.action")
	@ResponseBody
	public ResponseResult selectPaymentPlan(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectPaymentPlan(currencyApply);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查看根据合同编号查检测内容
	@RequestMapping("/Currency/selectProgramDetailsByContract.action")
	@ResponseBody
	public ResponseResult selectProgramDetailsByContract(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectProgramDetailsByContract(currencyApply);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//合同报表
	@RequestMapping("/Currency/selectContractStatement.action")
	@ResponseBody
	public ResponseResult selectContractStatement(Integer limit,Integer page,CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractStatement(page2,currencyApply);
		Integer count = iCurrencyApplyService.getContractStatementRows(currencyApply);
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

	//信泽合同报表
	@RequestMapping("/Currency/selectXZContractStatement.action")
	@ResponseBody
	public ResponseResult selectXZContractStatement(Integer limit,Integer page,CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectXZContractStatement(page2,currencyApply);
		Integer count = iCurrencyApplyService.getXZContractStatementRows(currencyApply);
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		return result;
	}

	//根据合同编号查询u8明细信息
	@RequestMapping("/Currency/selectContractItem.action")
	@ResponseBody
	public ResponseResult selectContractItem(String strContractID){
		ResponseResult result = new ResponseResult();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractItem(strContractID);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//根据合同编号查询u8收款计划
	@RequestMapping("/Currency/selectPayment.action")
	@ResponseBody
	public ResponseResult selectPayment(String strContractID){
		ResponseResult result = new ResponseResult();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectPayment(strContractID);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//根据合同编号查询u8收款
	@RequestMapping("/Currency/selectReceive.action")
	@ResponseBody
	public ResponseResult selectReceive(String strContractID){
		ResponseResult result = new ResponseResult();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectReceive(strContractID);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//根据合同编号查询u8大事记
	@RequestMapping("/Currency/selectContractMemo.action")
	@ResponseBody
	public ResponseResult selectContractMemo(String strContractID){
		ResponseResult result = new ResponseResult();
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractMemo(strContractID);
		result.setCode(0);
		result.setData(list);
		return result;
	}

	//查看合同图片
	@RequestMapping("/Currency/selectContractPicture.action")
	@ResponseBody
	public ResponseResult selectContractPicture(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractPicture(currencyApply);

		result.setCode(0);
		result.setData(list);
		return result;
	}

	//手机端撤回，修改状态
	@RequestMapping("/Currency/recallCurrencyApply.action")
	@ResponseBody
	public ResponseResult recallCurrencyApply(CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Integer res = iCurrencyApplyService.recallCurrencyApply(currencyApply);
		if (res > 0){
			result.setMsg("撤回成功");
		}else {
			result.setMsg("撤回失败");
		}
		return result;
	}

	//采购类标记已完成项
	@RequestMapping("/Currency/signCurrencyApply.action")
	@ResponseBody
	public ResponseResult signCurrencyApply(CurrencyApply currencyApply){
		ResponseResult result = new ResponseResult();
		Integer res = iCurrencyApplyService.signCurrencyApply(currencyApply);
		if (res > 0){
			result.setMsg("标记成功!");
		}else {
			result.setMsg("标记失败!");
		}
		return result;
	}

	//下载附件
	@RequestMapping("/Currency/download.action")
//    @ResponseBody
	public String download(CurrencyApply currencyApply,HttpServletRequest request,HttpServletResponse response) {

		List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractPicture(currencyApply);

		try {
			for (HashMap<String,Object> hashMap : list) {
				String path = String.valueOf(hashMap.get("coverpath"));
				File file = new File(path);
				// 取得文件名。
				String fileName = file.getName();

				String filePath = request.getServletContext().getRealPath("/") + path.substring(13);

				InputStream inputStream = null;
				OutputStream out = null;
				try {
					inputStream = new FileInputStream(filePath);
					byte[] buffer = new byte[1024];
					response.setContentType("multipart/form-data");
					response.setHeader("Content-Disposition", "attachment;fileName="+new String( fileName.getBytes("UTF-8"), "ISO8859-1" ));
					out = response.getOutputStream();
					int len = 0;
					while ((len = inputStream.read(buffer)) != -1){
						out.write(buffer,0,len);
					}
				}catch (Exception e){
					e.printStackTrace();
				}finally {
					try {
						inputStream.close();
						out.close();
						out.flush();
					}catch (Exception e){
						e.printStackTrace();
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "WEB-INF/views/storage/requisitionsOfDrugsApproval";
	}

	//丽泽绩效统计(检测科+现场科)
	@RequestMapping("/Currency/selectAllCurrency.action")
	@ResponseBody
	public ResponseResult selectAllCurrency(Integer limit,Integer page,CurrencyApply currencyApply,HttpSession session) {
		ResponseResult result = new ResponseResult();
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		List<HashMap<String, Object>> list = iCurrencyApplyService.selectAllCurrency(page2,currencyApply);

		Integer count = iCurrencyApplyService.getAllCurrencyRows(currencyApply);

		result.setCode(0);
		result.setCount(list.size());
		result.setData(list);
		return result;
	}

	//丽泽绩效统计(检测科+现场科)
	@RequestMapping("/Currency/getProductCount.action")
	@ResponseBody
	public ResponseResult getProductCount(String product_id) {
		ResponseResult result = new ResponseResult();
		Integer productCount = iCurrencyApplyService.getProductCount(product_id);
		result.setCode(0);
		result.setData(productCount);
		return result;
	}

	//丽泽绩效统计(检测科+现场科)
	@RequestMapping("/Currency/addBarcode.action")
	@ResponseBody
	public ResponseResult addBarcode(HttpSession session ,CurrencyApply currencyApply,String currencyDetails) {
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
		ResponseResult result = new ResponseResult();
		iCurrencyApplyService.addBarcode(staff,currencyApply,currencyDetails);
		result.setCode(0);
		result.setData(1);
		return result;
	}

	//丽泽绩效统计(检测科+现场科)
	@RequestMapping("/Currency/getBarcodeCount.action")
	@ResponseBody
	public ResponseResult getBarcodeCount(String barcode) {
		ResponseResult result = new ResponseResult();
		Integer productCount = iCurrencyApplyService.findCurrencyDetailsByMap(barcode);
		result.setCode(0);
		result.setData(productCount);
		return result;
	}

	//给天人报备流程中选择的通知人发送通知
	@RequestMapping("/Currency/sendMessage69.action")
	@ResponseBody
	public ResponseResult sendMessage69(CurrencyApply currencyApply) {
		ResponseResult result = new ResponseResult();
		logger.info(currencyApply.getCurrency_string10());
		logger.info("-------------------我发送了消息----------------------");
		try {
			iCurrencyApplyService.sendMessage69(currencyApply);
		}catch (ApiException e){
			e.printStackTrace();
		}
		return result;
	}
}

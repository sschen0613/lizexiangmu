package com.yr.lize.xinze.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.mapper.CurrencyApplyMapper;
import com.yr.lize.currencyapply.service.ICurrencyApplyService;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.*;
import com.yr.lize.system.mapper.SystemApprovalMapper;
import com.yr.lize.system.mapper.SystemStaffMapper;
import com.yr.lize.system.mapper.U8DataMapper;
import com.yr.lize.system.mapper.XZU8DataMapper;
import com.yr.lize.xinze.mapper.DetectionMapper;
import com.yr.lize.xinze.service.DetectionService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Lic on 2019/5/10.
 */
@Service
public class DetectionServiceImpl implements DetectionService {
    @Autowired
    DetectionMapper detectionMapper;
    @Autowired
    CurrencyApplyMapper currencyApplyMapper;
    @Autowired
    U8DataMapper u8DataMapper;
    @Autowired
    SystemStaffMapper systemStaffMapper;
    @Autowired
    XZU8DataMapper xzu8DataMapper;
    @Autowired
    SystemApprovalMapper systemApprovalMapper;
    @Autowired
    IDingDingUtilsService dingDingUtilsService;

    @Autowired
    ICurrencyApplyService iCurrencyApplyService;


    @Override
    public Integer launchpurchase(HttpServletRequest request,CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss, SystemStaff staff, List<ApproverRole> roles, MultipartFile[] files) throws Exception {
        if (currencyApply.getCurrency_type() == 45) {
            //添加调拨审批请求
            /*更改上级标识*/
            //Integer integer = currencyApplyMapper.updateSignById(currencyApply.getCurrency_id());
            //获取43检测开始时间记录到45
            CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply.getCurrency_string17()));
            currencyApply.setCurrency_string2(currencyApply43.getCurrency_string4());
            //报告最后限定时间
            currencyApply.setCurrency_date3(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(currencyApply43.getCurrency_date3()));
            Integer res = detectionMapper.addCurrencyApply(currencyApply);
            //StringBuffer sb = new StringBuffer("以下样品已交接,请尽快检测！样品编码:");
            if (currencyDetailss != null) {
                //添加当前通用审批的详情
                for (CurrencyDetails details : currencyDetailss) {
                    //添加流转的商品明细
                    //List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                    details.setCurrency_id(currencyApply.getCurrency_id());
                    String detectionProgram = details.getDetails_string2();//获取所有
                    String[] detectionPrograms = detectionProgram.split("、");
                    for (String d:detectionPrograms){
                        details.setDetails_string2(d);
                        detectionMapper.addCurrencyApplyDetais1(details);
                    }
                }

            }
            /*String content = sb.toString();
            content = content.substring(0,content.length()-1);

            ResponseResult result = dingDingUtilsService.selectDingRoleStaff("449618522");
            if (!"".equals(result.getMsg())) {
                String[]  strs2=result.getMsg().split(",");
                for(int i=0,len=strs2.length;i<len;i++){
                    //发送工作消息
                    dingDingUtilsService.sendrRemind(strs2[i], content);
                }
            }*/

            Integer integer = currencyApplyMapper.updateSignById(Integer.valueOf(currencyApply.getCurrency_string17()));//将43流程的int改为-1

            return res;
        } else if (currencyApply.getCurrency_type() == 49) {
            //获取43的一些信息
            CurrencyApply currencyApply45 = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_int());
            CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply45.getCurrency_string17()));
            currencyApply.setCurrency_string7(currencyApply43.getCurrency_string2());//项目名称
            currencyApply.setCurrency_string8(currencyApply43.getCurrency_string18());//合同编号
            currencyApply.setCurrency_string9(currencyApply43.getCurrency_string7());//报告编码

            //循环遍历审批组
            Integer approval_id = currencyApply.getCurrency_type();//*
            currencyApply.setApprover_count(roles.size());//记录一共有几层审批
            int count = 0;//*
            ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息//*
            for (ApproverRole approverRole : roles) {//遍历审批组//*
                //循环第一遍进入第一个要发送消息的审批组如果第一个审批组中没有人进行第二次循环
                if (approverRole.getRole_type() == 1) {//判断是否为角色
                    ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//查询钉钉角色下的人员
                    if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串
                        //添加调拨审批请求
                        Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                        currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                        detectionMapper.updateString17(currencyApply);

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
                            for (CurrencyDetails details : currencyDetailss) {
                                if (currencyApply.getCurrency_int2()==2){
                                    details.setDetails_money(details.getDetails_money2());
                                }
                                List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                                details.setCurrency_id(currencyApply.getCurrency_id());
                                details.setDetails_string2("项目名称");
                                detectionMapper.addCurrencyApplyDetais(details);
                                //添加多个检测项目
                                detectionMapper.addTestProcess(testProcesses, details);
                            }
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
                    //查询主管的部门id
                    List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(staff.getDepartment_Id());
                    Integer index2 = Integer.parseInt(approverRole.getApprover_id());
                    //获取道当前部门主管的id集合
                    ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
                    if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串
                        //添加审批请求
                        Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                        currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                        detectionMapper.updateString17(currencyApply);

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
                            //添加当前通用审批的详情
                            for (CurrencyDetails details : currencyDetailss) {
                                if (currencyApply.getCurrency_int2()==2){
                                    details.setDetails_money(details.getDetails_money2());
                                }
                                List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                                details.setCurrency_id(currencyApply.getCurrency_id());
                                details.setDetails_string2("项目名称");
                                detectionMapper.addCurrencyApplyDetais(details);
                                //添加多个检测项目
                                detectionMapper.addTestProcess(testProcesses, details);
                            }
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
                    //添加审批请求
                    Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                    currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                    detectionMapper.updateString17(currencyApply);
                    //添加当前调拨的商品
                    if(currencyDetailss!=null) {
                        //添加当前通用审批的详情
                        for (CurrencyDetails details : currencyDetailss) {
                            if (currencyApply.getCurrency_int2() != null && currencyApply.getCurrency_int2()==2){
                                details.setDetails_money(details.getDetails_money2());
                            }
                            //List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                            details.setCurrency_id(currencyApply.getCurrency_id());
                            //details.setDetails_string2("项目名称");
                            detectionMapper.addCurrencyApplyDetais(details);
                            //添加多个检测项目
                            //detectionMapper.addTestProcess(testProcesses, details);
                        }
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


        } else if (currencyApply.getCurrency_type() == 44) {
            /*boolean flag = false;
            //修改已采样数量
            for (CurrencyDetails details : currencyDetailss) {
                Integer number = detectionMapper.updateMoney3(currencyApply, details.getDetails_int2(), details.getDetails_money3());
                Integer number1 = detectionMapper.updateSampleType(currencyApply, details.getDetails_int2(), details.getdetails_string(),details.getDetails_string13());
                if ("1".equals(details.getDetails_string10())) {
                    flag = true;
                    BigDecimal a = new BigDecimal(0);
                    Integer number2 = detectionMapper.updateMoney(currencyApply, details.getDetails_int2(), a);
                } else {
                    Integer number2 = detectionMapper.updateMoney(currencyApply, details.getDetails_int2(), details.getDetails_money().add(details.getDetails_money4()));
                }
            }
            if (!flag) {
                currencyApply.setCurrency_int2(44);
            }*/
            //避免重复登记，登机前先查询是否已经有44 且string17为43的数据
            CurrencyApply currencyApply44Ago = detectionMapper.selectCurrencyApplyByString17ForReport(currencyApply.getCurrency_string17(),44);
            if (currencyApply44Ago != null){
                return -2;//已经被登记
            }
            Integer res = detectionMapper.addCurrencyApply(currencyApply);
            if (currencyApply.getCurrency_string5().equals("水")){//丽泽水不再让样品管理员下发 -1
                currencyApplyMapper.updateSignById(Integer.valueOf(currencyApply.getCurrency_string17()));
            }else {//丽泽气继续让样品管理员下发 1，且把采样人员更新上20200929
                currencyApplyMapper.update43After44(currencyApply);
            }
            for (CurrencyDetails details : currencyDetailss) {
                //添加流转的商品明细
                //List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                details.setCurrency_id(currencyApply.getCurrency_id());
                //details.setDetails_string2("项目名称");
                //if ("2".equals(details.getDetails_string10())) {
                //details.setDetails_int(-1);
                //}
                //details.setDetails_money(details.getDetails_money().add(details.getDetails_money4()));

                detectionMapper.addCurrencyApplyDetais(details);
                //20200929把43明细采样数量更新上
                currencyApplyMapper.updateDetails43After44(details);
                //添加多个检测项目
                //detectionMapper.addTestProcess(testProcesses, details);
            }
            return res;
            //无需审批的条码录入申请
        } else if (currencyApply.getCurrency_type() == 60) {

            Integer res = detectionMapper.addCurrencyApply(currencyApply);
            for (CurrencyDetails details : currencyDetailss) {
                detectionMapper.addCurrencyApplyDetais(details);
            }
            return res;
            //无需审批的条码录入申请
        }else if(currencyApply.getCurrency_type() == 52){
            /*Integer res = detectionMapper.addCurrencyApply(currencyApply);
            if (currencyDetailss != null) {
                //添加当前通用审批的详情
                for (CurrencyDetails details : currencyDetailss) {
                    details.setCurrency_id(currencyApply.getCurrency_id());
                    detectionMapper.addCurrencyApplyDetais(details);


                    if ("配件入库".equals(currencyApply.getCurrency_string7())) {
                        HashMap<String, Object> hashMap = new HashMap<>();
                        hashMap.put("details_string11", details.getDetails_string11());
                        List<CurrencyDetails> currencyDetailsList = iCurrencyApplyService.findCurrencyDetailsByMap(hashMap);
                        if (currencyDetailsList.size() > 0) {
                            ResponseResult result = new ResponseResult();
                            result.setCode(-1);
                            result.setMsg("添加失败,条码：" + details.getDetails_string11() + "已存在，不可重复");
                            //return result;
                        }
                    }
                    //记录日志
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    String nowDate = simpleDateFormat.format(new Date());
                    Flow flow = new Flow();
                    flow.setBarcode(details.getDetails_string11());
                    flow.setCreate_user(staff.getStaff_Name());
                    flow.setApplyId(currencyApply.getCurrency_id());
                    flow.setData(staff.getStaff_Name() + "发起条码录入，货品流转编码：" + details.getDetails_string11() +
                            "，类型："+currencyApply.getCurrency_string7()+"，发起时间：" + nowDate);
                    Integer i = iCurrencyApplyService.insertFlowMessage(flow);
                }
            }
            return res;*/
        }else if (currencyApply.getCurrency_type() == 43){
            // 发起通用审批流
            //如果数据已经存在，先删除再添加；
            if (currencyApply.getCurrency_id() != null){
                currencyApplyMapper.deleteCurrencyApply(currencyApply);
                currencyApplyMapper.deleteCurrencyDetails(currencyApply);
            }
            //循环遍历审批组
            Integer approval_id = currencyApply.getCurrency_type();//*
            currencyApply.setApprover_count(roles.size());//记录一共有几层审批
            int count = 0;//*
            ApproverManage approverManage = systemApprovalMapper.selectManage(approval_id);//查询当前审批的管理信息//*
            for (ApproverRole approverRole : roles) {//遍历审批组//*
                //循环第一遍进入第一个要发送消息的审批组如果第一个审批组中没有人进行第二次循环
                if (approverRole.getRole_type() == 1) {//判断是否为角色
                    ResponseResult result = dingDingUtilsService.selectDingRoleStaff(approverRole.getApprover_id());//查询钉钉角色下的人员
                    if (!"".equals(result.getMsg())) {//如果查询到的角色不为空字符串
                        //添加调拨审批请求
                        Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                        currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                        detectionMapper.updateString17(currencyApply);

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
                            for (CurrencyDetails details : currencyDetailss) {
                                if (currencyApply.getCurrency_int2()==2){
                                    details.setDetails_money(details.getDetails_money2());
                                }
                                List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                                details.setCurrency_id(currencyApply.getCurrency_id());
                                details.setDetails_string2("项目名称");
                                detectionMapper.addCurrencyApplyDetais(details);
                                //添加多个检测项目
                                detectionMapper.addTestProcess(testProcesses, details);
                            }
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
                    //查询主管的部门id
                    List<Long> parentIds = dingDingUtilsService.getDingDepartmentSup(staff.getDepartment_Id());
                    Integer index2 = Integer.parseInt(approverRole.getApprover_id());
                    //获取道当前部门主管的id集合
                    ResponseResult result = dingDingUtilsService.selectDepartmRole(parentIds.get(index2-1).toString());
                    if (!"".equals(result.getMsg())) {//如果查询到的部门主管不为空字符串
                        //添加审批请求
                        Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                        currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                        detectionMapper.updateString17(currencyApply);

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
                            //添加当前通用审批的详情
                            for (CurrencyDetails details : currencyDetailss) {
                                if (currencyApply.getCurrency_int2()==2){
                                    details.setDetails_money(details.getDetails_money2());
                                }
                                List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                                details.setCurrency_id(currencyApply.getCurrency_id());
                                details.setDetails_string2("项目名称");
                                detectionMapper.addCurrencyApplyDetais(details);
                                //添加多个检测项目
                                detectionMapper.addTestProcess(testProcesses, details);
                            }
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
                    //添加审批请求
                    Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
                    currencyApply.setCurrency_string17(currencyApply.getCurrency_id()+"");
                    detectionMapper.updateString17(currencyApply);
                    //添加当前调拨的商品
                    if(currencyDetailss!=null) {
                        //添加当前通用审批的详情
                        for (CurrencyDetails details : currencyDetailss) {
                            if (currencyApply.getCurrency_int2() != null && currencyApply.getCurrency_int2()==2){
                                details.setDetails_money(details.getDetails_money2());
                            }
                            //List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                            details.setCurrency_id(currencyApply.getCurrency_id());
                            //details.setDetails_string2("项目名称");
                            detectionMapper.addCurrencyApplyDetais(details);
                            //添加多个检测项目
                            //detectionMapper.addTestProcess(testProcesses, details);
                        }
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
        //修改标识
        if (currencyApply.getCurrency_type() == 48) {
            Integer integer = currencyApplyMapper.updateSignById(currencyApply.getCurrency_id());
        }
        Integer res = detectionMapper.addCurrencyApply(currencyApply);
        if (currencyDetailss != null) {
            //添加当前通用审批的详情
            for (CurrencyDetails details : currencyDetailss) {
                if (currencyApply.getCurrency_type() == 43 && currencyApply.getCurrency_int2()==2){
                    details.setDetails_money(details.getDetails_money2());
                }
                List<TestProcess> testProcesses = JSONArray.parseArray(details.getDetails_string2(), TestProcess.class);
                details.setCurrency_id(currencyApply.getCurrency_id());
                details.setDetails_string2("项目名称");
                detectionMapper.addCurrencyApplyDetais(details);
                //添加多个检测项目
                detectionMapper.addTestProcess(testProcesses, details);
            }
        }
        return res;
    }

    @Override
    public Integer launchpurchaseTemporary(CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss, SystemStaff staff) throws Exception {
        //如果数据已经存在，先删除再添加；
        if (currencyApply.getCurrency_id() != null){
            currencyApplyMapper.deleteCurrencyApply(currencyApply);
            currencyApplyMapper.deleteCurrencyDetails(currencyApply);
        }

        //添加调拨审批请求
        Integer res = currencyApplyMapper.addCurrencyApply(currencyApply);
        //Integer update = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
        if(currencyDetailss != null) {
            //添加当前通用审批的详情
            for (CurrencyDetails details : currencyDetailss) {
                details.setCurrency_id(currencyApply.getCurrency_id());
                details.setDetails_string2("项目名称");
                detectionMapper.addCurrencyApplyDetais(details);
            }
        }
        return res;
    }


    @Override
    public List<HashMap<String, Object>> selectOneUpApply(Page page2, CurrencyApply currencyApply) {
        //如果是检测任务登记页面的请求，则丽泽信泽都要查
        if (currencyApply.getCurrency_type() == 43 && currencyApply.getCurrency_int() == 0 && currencyApply.getCurrency_int2() == 1){//
            return detectionMapper.selectOneUpApplyForTest(page2, currencyApply);
        }else if(currencyApply.getCurrency_type() == 43 && currencyApply.getCurrency_int() == 1) {
            return  detectionMapper.selectOneUpApplyForManager(page2,currencyApply);
        }else {
            return detectionMapper.selectOneUpApply(page2, currencyApply);

        }
    }

    @Override
    public Integer getApplyCurrencyRows(CurrencyApply currencyApply) {
        //如果是检测任务登记页面的请求，则丽泽信泽都要查
        if (currencyApply.getCurrency_type() == 43
                && currencyApply.getCurrency_int() != null && currencyApply.getCurrency_int() == 0
                && currencyApply.getCurrency_int2() != null && currencyApply.getCurrency_int2() == 1) {//
            return detectionMapper.getApplyCurrencyRowsForTest(currencyApply);
        }else if(currencyApply.getCurrency_type() == 43
                && currencyApply.getCurrency_int() != null && currencyApply.getCurrency_int() == 1) {
            return detectionMapper.getApplyCurrencyRowsForManager(currencyApply);
        }else {
            return detectionMapper.getApplyCurrencyRows(currencyApply);
        }
    }

    @Override
    public CurrencyApply selectCurrencyApply(CurrencyApply currencyApply) {
        return detectionMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
    }

    @Override
    public List<HashMap<String, Object>> selectCurrencyDetailss(CurrencyApply currencyApply) {
        return detectionMapper.selectCurrencyDetails(currencyApply);
    }

    @Override
    public List<HashMap<String, Object>> selectLatest(Page page, CurrencyApply currencyApply) {
        return detectionMapper.selectLatest(page, currencyApply);
    }

    @Override
    public List<HashMap<String, Object>> selectProcessByDetailsId(Page page2, Integer details_id) {
        return detectionMapper.selectProcessByDetailsId(page2, details_id);
    }

    @Override
    public void insertLingQuMsg(String detailsId,CurrencyDetails details) {
        String[] ids = detailsId.split(",");
        for (String id:ids){
            //获取45主流程
            CurrencyApply currencyApply45 = currencyApplyMapper.selectCurrencyApplyById(details.getCurrency_id());
            //获取要求时间
            BigDecimal testDateLimit = currencyApply45.getCurrency_money();
            //获取检测开始时间
            CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply45.getCurrency_string17()));

            Date testDateStart = new Date();
            try {
                testDateStart = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(currencyApply43.getCurrency_string4());
            } catch (ParseException e) {
                e.printStackTrace();
            }
            //判断当前日期减去检测开始日期
            Date nowDate = new Date();//当前日期
            //获取检测开始日期与当前日期相差天数
            BigDecimal days = new BigDecimal((nowDate.getTime() - testDateStart.getTime())/(1000 * 60 * 60 * 24));

            //判断当前时间是否>检测开始时间+期限天数，是则超期 记录到43
            if (days.compareTo(testDateLimit) == 1){
                currencyApply43.setCurrency_money2(new BigDecimal(1));
                details.setDetails_int4(1);//记录到45明细
                currencyApply45.setCurrency_int2(1);//记录到45主表
            }else {
                currencyApply43.setCurrency_money2(new BigDecimal(0));
                details.setDetails_int4(0);//记录到45明细
                currencyApply45.setCurrency_int2(0);//记录到45主表
            }
            //把检测天数限制记录到43
            currencyApply43.setCurrency_money6(testDateLimit);
            //更新43的数据 1.检测是否超期 2.检测限制天数
            currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply43);
            //更新45的数据 1.检测是否超期
            currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply45);

            details.setCurrency_details_id(Integer.valueOf(id));
            Integer res = detectionMapper.updateLingQuDetails(details);

            //查询此45下还有没有未领取的明细
            Integer not = detectionMapper.selectCurrencyDetailsCount45(details.getCurrency_id());
            //若无，则表示已经检测完毕
            if (not.equals(0)){
                //1.把45更新为已完成（是否更新43）
                currencyApply45.setCurrency_int(-1);
                currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply45);
                //2.给检测科科长发消息（检测科科长点击确认后，质控科科长发消息）
                String content = "检测任务"+currencyApply45.getCurrency_string3()+"已经完成，请及时确认";
                ResponseResult result = null;
                try {
                    //给检测科科长发消息
                    result = dingDingUtilsService.selectDingRoleStaff("449618522");
                    if (!"".equals(result.getMsg())) {
                        String[]  strs2=result.getMsg().split(",");
                        for(int i=0,len=strs2.length;i<len;i++){
                            //发送工作消息
                            dingDingUtilsService.sendrRemind(strs2[i], content);
                        }
                    }
                    //给质控科科长发消息
                    result = dingDingUtilsService.selectDingRoleStaff("449576508");
                    if (!"".equals(result.getMsg())) {
                        String[]  strs2=result.getMsg().split(",");
                        for(int i=0,len=strs2.length;i<len;i++){
                            //发送工作消息
                            dingDingUtilsService.sendrRemind(strs2[i], content);
                        }
                    }
                } catch (ApiException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public List<HashMap<String, Object>> selectOneDetails(sampleCode sampleCode) {
        return detectionMapper.selectOneDetails(sampleCode);
    }

    @Override
    public List<HashMap<String, Object>> selectCaiyangOrShangJiApplicantCurrency(Page page2, CurrencyApply currencyApply) {
        return detectionMapper.selectCaiyangOrShangJiApplicantCurrency(page2, currencyApply);
    }

    @Override
    public List<HashMap<String, Object>> selectReadeyLingQuDetails(Page page2, CurrencyDetails details) {
        return detectionMapper.selectReadeyLingQuDetails(page2, details);
    }

    @Override
    public List<HashMap<String, Object>> selectReadeyCurrency(Page page2, CurrencyApply currencyApply) {
        return detectionMapper.selectReadeyCurrency(page2, currencyApply);
    }

    @Override
    public Integer selectErrorJianCeCount(Integer details_id) {
        return detectionMapper.selectErrorJianCeCount(details_id + "");
    }

    @Override
    public Integer updateJianceBiaoshi(Integer currency_details_id) {
        detectionMapper.updateSampleCodeInt2(currency_details_id);//检测状态标识
        return detectionMapper.updateShangjiMsg(currency_details_id);
    }

    @Override
    public List<HashMap<String, Object>> selectCurrencyDetailss1(CurrencyApply currencyApply) {
        return detectionMapper.selectCurrencyDetailss1(currencyApply);
    }

    @Override
    public List<HashMap<String, Object>> selectLatest1(Page page2, CurrencyApply currencyApply) {
        return detectionMapper.selectLatest1(page2, currencyApply);
    }

    @Override
    public Integer updateSampleCode(CurrencyDetails details) {
        return detectionMapper.updateSampleCode(details);
    }

    @Override
    public String selectStandart(CurrencyDetails details) {
        return detectionMapper.selectStandart(details);
    }

    @Override
    public List<HashMap<String, Object>> selectFinanceAccount(Page page2, CurrencyApply currencyApply) {
        List<HashMap<String, Object>> list = detectionMapper.selectLatest(page2, currencyApply);
        for (HashMap<String, Object> hashMap : list) {
            //获取明细表主键，便于查询项目表
            Integer currencyDetailsId = (Integer) hashMap.get("currency_details_id");
            List<HashMap<String,Object>> list45 = detectionMapper.selectTestResult(Integer.valueOf(String.valueOf(hashMap.get("currency_id"))),45);

            //拼接检测项目
            String processName = "";
            for (HashMap<String, Object> hashMap1 : list45) {
                processName = processName + hashMap1.get("details_string2") + ",";
                //methodBasis = methodBasis + hashMap1.get("methodBasis") + ",";
            }
            processName = processName.substring(0, processName.length() - 1);
            //将检测项目和方法依据添加至主list
            hashMap.put("processName", processName);
            //获取合同编号，便于查询合同到账情况
            String contractNumber = (String) hashMap.get("currency_string18");
            //合同金额
            Float dblTotalCurrency = u8DataMapper.selectContractByContractId(contractNumber);
            BigDecimal bigDecimal = new BigDecimal(dblTotalCurrency);
            //已收款金额
            BigDecimal accountPay = u8DataMapper.findReceiveAmountByCContractId(contractNumber);
            if (accountPay == null) {
                accountPay = new BigDecimal(0);
            }
            //未收金额
            BigDecimal uncollectedAmount = bigDecimal.subtract(accountPay);
            //将合同金额,已收金额和未收金额添加至list
            hashMap.put("bigDecimal", bigDecimal);
            hashMap.put("accountPay", accountPay);
            hashMap.put("uncollectedAmount", uncollectedAmount);
        }
        return list;

    }


    @Override
    public List<HashMap<String, Object>> selectJianCeJiXiaoManarge(Page page2,CurrencyApply currencyApply) {

        List<HashMap<String, Object>> listResult = new ArrayList<>();

        List<HashMap<String, Object>> list = detectionMapper.selectJianCeJiXiaoManarge(page2, currencyApply);

        String checked = currencyApply.getCurrency_string();
        for (HashMap<String, Object> hashMap : list){
            String code_string = (String)hashMap.get("details_string4");//多个检测人
            if (code_string != null){
                //StringBuffer sb = new StringBuffer();
                String[] strings = code_string.split(",");
                for (String s : strings){
                    //查询出业务员
                    Integer staffId = Integer.parseInt(s);
                    SystemStaff systemStaff = systemStaffMapper.selectStaffById(staffId);

                    String test_type = String.valueOf(hashMap.get("details_string7"));//检测类型
                    BigDecimal price = new BigDecimal(0);//单价
                    if ("常规检测".equals(test_type)){
                        price = new BigDecimal(2);
                    }else if ("称量检测".equals(test_type)){
                        price = new BigDecimal(2.3);
                    }else if ("有机、元素检测".equals(test_type)){
                        price = new BigDecimal(5);
                    }

                    HashMap<String,Object> hashMapResult = new HashMap<>();
                    //判断是否模糊查询业务员
                    if (checked != null && !"".equals(checked)){
                        if(systemStaff.getStaff_Name().contains(checked)){
                            hashMapResult.put("currency_string3",hashMap.get("currency_string3"));//业务科下发编码
                            hashMapResult.put("details_string",hashMap.get("details_string"));//样品编码
                            hashMapResult.put("details_string2",hashMap.get("details_string2"));//检测项目
                            hashMapResult.put("details_string7",hashMap.get("details_string7"));//检测类型
                            hashMapResult.put("currency_string2",hashMap.get("currency_string2"));//检测开始时间
                            hashMapResult.put("currency_money",hashMap.get("currency_money"));//检测限定天数
                            hashMapResult.put("details_int4",String.valueOf(hashMap.get("details_int4"))=="1"?"是":"否");//是否超时
                            hashMapResult.put("details_int3",hashMap.get("details_int3"));//样品数量

                            //根据添加业务员和绩效金额
                            BigDecimal money = new BigDecimal(String.valueOf(hashMap.get("details_int3"))).multiply(price);
                            String name = systemStaff.getStaff_Name();
                            hashMapResult.put("money",money);//绩效金额
                            hashMapResult.put("details_string12",name);//检测人
                            listResult.add(hashMapResult);
                        }
                    }else {
                        hashMapResult.put("currency_string3",hashMap.get("currency_string3"));//业务科下发编码
                        hashMapResult.put("details_string",hashMap.get("details_string"));//样品编码
                        hashMapResult.put("details_string2",hashMap.get("details_string2"));//检测项目
                        hashMapResult.put("details_string7",hashMap.get("details_string7"));//检测类型
                        hashMapResult.put("currency_string2",hashMap.get("currency_string2"));//检测开始时间
                        hashMapResult.put("currency_money",hashMap.get("currency_money"));//检测限定天数
                        hashMapResult.put("details_int4",String.valueOf(hashMap.get("details_int4"))=="1"?"是":"否");//是否超时
                        hashMapResult.put("details_int3",hashMap.get("details_int3"));//样品数量

                        //根据添加业务员和绩效金额
                        BigDecimal money = new BigDecimal(String.valueOf(hashMap.get("details_int3"))).multiply(price);
                        String name = systemStaff.getStaff_Name();
                        hashMapResult.put("money",money);//绩效金额
                        hashMapResult.put("details_string12",name);//检测人
                        listResult.add(hashMapResult);
                    }
                }
            }

        }
        return listResult;
    }

    @Override
    public CurrencyApply selectReprotOne(CurrencyApply currencyApply) {
        CurrencyApply currencyApply1 = detectionMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
        //查询采样登记的最大日期
        CurrencyApply currencyApply2 =  detectionMapper.selectselectReprotOneMaxDate(44,currencyApply.getCurrency_id());
        //查询采样登记的最小日期
        CurrencyApply currencyApply3 = detectionMapper.selectselectReprotOneMinDate(44,currencyApply.getCurrency_id());
        //查询检测登记的最大日期
        CurrencyApply currencyApply4 =  detectionMapper.selectselectReprotOneMaxDate(49,currencyApply.getCurrency_id());
        //查询检测登记的最小日期
        CurrencyApply currencyApply5 = detectionMapper.selectselectReprotOneMinDate(49,currencyApply.getCurrency_id());
        long l = currencyApply2.getCurrency_date().getTime() - currencyApply3.getCurrency_date().getTime();
        long l1 = currencyApply4.getCurrency_date().getTime() - currencyApply5.getCurrency_date().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(l/(24*60*60*1000)>1){
            currencyApply1.setCurrency_date2(sdf.format(currencyApply2.getCurrency_date()));
            currencyApply2.setCurrency_date3(sdf.format(currencyApply3.getCurrency_date()));
        }else {
            currencyApply1.setCurrency_date2(sdf.format(currencyApply2.getCurrency_date()));
            currencyApply1.setCurrency_date3(sdf.format(currencyApply2.getCurrency_date()));
        }
        if(l1/(24*60*60*1000)>1){
            currencyApply1.setCurrency_date4(sdf.format(currencyApply4.getCurrency_date()));
            currencyApply2.setCurrency_date5(sdf.format(currencyApply5.getCurrency_date()));
        }else {
            currencyApply1.setCurrency_date4(sdf.format(currencyApply4.getCurrency_date()));
            currencyApply1.setCurrency_date5(sdf.format(currencyApply4.getCurrency_date()));
        }
        return currencyApply1;
    }

    @Override
    public List<HashMap<String, Object>> selectReportOneDetails(CurrencyApply currencyApply) {
        List<HashMap<String, Object>> list = currencyApplyMapper.selectCurrencyDetails(currencyApply);
        for (HashMap<String, Object> hashMap : list){
            //Integer currencyDetailsId = (Integer) hashMap.get("currency_details_id");
            //根据details_id查询相关项目
            //Page page2 = new Page();
            //List<HashMap<String, Object>> processByDetailsId = detectionMapper.selectProcessByDetailsId(page2, currencyDetailsId);

            List<HashMap<String,Object>> list45 = detectionMapper.selectTestResult(Integer.valueOf(String.valueOf(hashMap.get("currency_id"))),45);

            //拼接检测项目
            String processName = "";
            for (HashMap<String, Object> hashMap1 : list45) {
                processName = processName + hashMap1.get("details_string2") + ",";
            }
            processName = processName.substring(0, processName.length() - 1);
            //将检测项目和方法依据添加至主list
            hashMap.put("processName", processName);
        }
        return list;
    }

    @Override
    public List<HashMap<String, Object>> selectStaffName() {

        return detectionMapper.selectStaffName();
    }

    @Override
    public List<HashMap<String, Object>> selectBusinessPerformance(Page page2, CurrencyApply currencyApply) {
        List<HashMap<String, Object>> list = xzu8DataMapper.selectXZContract();
        List<HashMap<String, Object>> list1 = new ArrayList<>();
        for(HashMap<String, Object> hashMap : list){
            //合同编号
            String contractNumber = (String) hashMap.get("strContractID");
            //合同日期
            String strContractOrderDate = (String)hashMap.get("strContractOrderDate");
            //合同金额
            Double dblTotalCurrency = (Double)hashMap.get("dblTotalCurrency");
            //合同名称
            String strContractName = (String) hashMap.get("strContractName");

            // 制单人，业务部门内勤，合同到账一次算一次绩效(名字)
            String strSetupPerson = (String) hashMap.get("strSetupPerson");
            //业务人员，业务部门外勤(跑业务的)，合同全部到账算绩效 (编码);
            String cDefine14 = (String) hashMap.get("cDefine14");
            Integer staddId = null;
            Boolean flag;
            try {
                staddId = Integer.parseInt(cDefine14);
                flag = true;//如果是数字，返回True
            } catch (Exception e) {
                flag = false;//如果抛出异常，返回False
            }
            if (flag) {
                SystemStaff systemStaff = systemStaffMapper.selectStaffById(staddId);
                //外勤业务员名称
                String staff_name = systemStaff.getStaff_Name();

                //查询内勤阶段到款
                List<HashMap<String, BigDecimal>> receiveAmount = xzu8DataMapper.findReceiveAmountByCContractId1(contractNumber);
                int i = 0;
                if (receiveAmount.size() != 0) {
                    for (HashMap<String, BigDecimal> hashMap1 : receiveAmount) {
                        i++;
                        //收款金额
                        BigDecimal iAmount = hashMap1.get("iAmount");
                        HashMap<String, Object> hashMap2 = new HashMap<>();
                        hashMap2.put("number", i);
                        hashMap2.put("name", strSetupPerson);
                        hashMap2.put("strContractName", strContractName);
                        hashMap2.put("qing", "内勤");
                        hashMap2.put("strContractOrderDate", strContractOrderDate);
                        hashMap2.put("contractNumber", contractNumber);
                        hashMap2.put("dblTotalCurrency", dblTotalCurrency);
                        hashMap2.put("iAmount", iAmount);
                        hashMap2.put("price", 0.01);
                        BigDecimal a = new BigDecimal(0.01);
                        hashMap2.put("money", iAmount.multiply(a).doubleValue());
                        list1.add(hashMap2);
                    }
                }

                //查询外请已到款总金额
                BigDecimal receiveAmountCount = xzu8DataMapper.findReceiveAmountByCContractId(contractNumber);
                BigDecimal b = new BigDecimal(dblTotalCurrency);
                if(receiveAmountCount != null && receiveAmountCount.compareTo(b) != -1){
                    i++;
                    HashMap<String,Object> hashMap2 = new HashMap<>();
                    hashMap2.put("number",i);
                    hashMap2.put("name",staff_name);
                    hashMap2.put("strContractName",strContractName);
                    hashMap2.put("qing","外勤");
                    hashMap2.put("strContractOrderDate",strContractOrderDate);
                    hashMap2.put("contractNumber",contractNumber);
                    hashMap2.put("dblTotalCurrency",dblTotalCurrency);
                    hashMap2.put("iAmount",receiveAmountCount);
                    hashMap2.put("price",0.01);
                    BigDecimal a = new BigDecimal(0.01);
                    hashMap2.put("money",receiveAmountCount.multiply(a).doubleValue());
                    list1.add(hashMap2);
                }
            }

        }
        return list1;
    }

    @Override
    public Integer getApplyCurrencyRows1(CurrencyApply currencyApply,sampleCode sample) {
        return detectionMapper.getApplyCurrencyRows1(currencyApply,sample);
    }

    @Override
    public List<HashMap<String, Object>> selectJianCeJiXiaoManarge1(Page page2, CurrencyApply currencyApply) {
        List<HashMap<String,Object>> list =  detectionMapper.selectJianCeJiXiaoManarge1(page2,currencyApply);
        List<HashMap<String,Object>> testList = new ArrayList<>();
        int i = 0;
        for(HashMap<String,Object> hashMap : list){

            String code_string = (String)hashMap.get("code_string");
            if (code_string != null){
                String[] strings = code_string.split(",");
                for (String s : strings){
                    i++;
                    Integer staffId = Integer.parseInt(s);
                    SystemStaff systemStaff = systemStaffMapper.selectStaffById(staffId);
                    hashMap.put("details_string12",systemStaff.getStaff_Name());
                    double sum = (int)hashMap.get("details_int3") * 2.5;
                    hashMap.put("price",2.5);
                    hashMap.put("jixiaoStandart","2.5元/个");
                    hashMap.put("number",i);
                    hashMap.put("sum",sum);
                    HashMap<String,Object> hashMap1 = new HashMap<>();
                    hashMap1.putAll(hashMap);
                    testList.add(hashMap1);
                }
            }else {
                i++;
                double sum = (int)hashMap.get("details_int3") * 2.5;
                hashMap.put("price",2.5);
                hashMap.put("jixiaoStandart","2.5元/个");
                hashMap.put("number",i);
                hashMap.put("sum",sum);
                testList.add(hashMap);
            }

        }
        return testList;
    }

    @Override
    public List<HashMap<String, Object>> selectSceneSectionPerformance(Page page2, CurrencyApply currencyApply) {
        List<HashMap<String, Object>> list = detectionMapper.selectPerformance(currencyApply);
        List<HashMap<String, Object>> sampleList = new ArrayList<>();
        int i = 0;
        for(HashMap<String, Object> hashMap : list){
            //获取多个采样人员从明细放到了主表中
            String[] details_string13s = (hashMap.get("currency_string13") + "").split(",");

            String currency_id = (String) hashMap.get("currency_string17");
            CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.parseInt(currency_id));
            hashMap.put("reportNum",currencyApply43.getCurrency_number());
            //如果为合同相关的
            String[] strLevel1 = {"无组织废气","无组织噪声","无组织土壤","采水"};
            String[] strLevel2 = {"烟气常规检测","水的比对检测"};
            String[] strLevel3 = {"在线监测设备比对检测（气）","水质在线设备验收检测","在线监测设备验收检测（非超低）"};
            String[] strLevel4 = {"在线监测设备验收检测（超低）"};
            String[] strLevel5 = {"环评现状检测","竣工验收检测"};

            //检测类型
            String program_type = String.valueOf(hashMap.get("details_string"));
            //一级检测
            if (Arrays.asList(strLevel1).contains(program_type)){
                if ("无组织土壤".equals(program_type) || "采水".equals(program_type)){
                    hashMap.put("绩效标准",program_type);
                    hashMap.put("绩效单价",6);//原90
                    BigDecimal b = new BigDecimal(6/details_string13s.length);//绩效
                    hashMap.put("绩效金额",b.multiply(new BigDecimal(String.valueOf(hashMap.get("details_money5"))))//点位
                                            .multiply(new BigDecimal(String.valueOf(hashMap.get("details_int3")))).doubleValue());//频次
                }else if("无组织废气".equals(program_type) || "无组织噪声".equals(program_type)){
                    hashMap.put("绩效标准",program_type);
                    hashMap.put("绩效单价",6);
                    BigDecimal b = new BigDecimal(6/details_string13s.length);//绩效
                    hashMap.put("绩效金额",b.multiply(new BigDecimal(String.valueOf(hashMap.get("details_money3"))))//检测项目个数
                                            .multiply(new BigDecimal(String.valueOf(hashMap.get("details_money5"))))//点位
                                            .multiply(new BigDecimal(String.valueOf(hashMap.get("details_int3")))).doubleValue());//频次
                }
            }else if(Arrays.asList(strLevel2).contains(program_type)){
                BigDecimal b = new BigDecimal(50/details_string13s.length);//绩效
                hashMap.put("绩效标准",program_type);
                hashMap.put("绩效单价",50);
                hashMap.put("绩效金额",b.multiply((BigDecimal)hashMap.get("details_money5")).doubleValue());//点位个数
            }else if(Arrays.asList(strLevel3).contains(program_type)){
                BigDecimal b = new BigDecimal(70/details_string13s.length);//绩效
                hashMap.put("绩效标准",program_type);
                hashMap.put("绩效单价",70);
                hashMap.put("绩效金额",b.multiply((BigDecimal)hashMap.get("details_money5")).doubleValue());//点位个数
            }else if(Arrays.asList(strLevel4).contains(program_type)){
                BigDecimal b = new BigDecimal(110/details_string13s.length);//绩效
                hashMap.put("绩效标准",program_type);
                hashMap.put("绩效单价",110);
                hashMap.put("绩效金额",b.multiply((BigDecimal)hashMap.get("details_money5")).doubleValue());//点位个数
            }else if(Arrays.asList(strLevel5).contains(program_type)){
                BigDecimal b = new BigDecimal(200/details_string13s.length);//绩效
                hashMap.put("绩效标准",program_type);
                hashMap.put("绩效单价",200);
                hashMap.put("绩效金额",b.multiply((BigDecimal)hashMap.get("details_money5")).doubleValue());//点位个数
            }

            for (String details_string13 : details_string13s){
                i++;
                if (details_string13 != null && !"null".equals(details_string13) && !"".equals(details_string13)){
                    Integer staff_id = Integer.parseInt(details_string13);
                    String staffName = detectionMapper.selectStaffNameById(staff_id);
                    hashMap.put("staff_name",staffName);
                    hashMap.put("number",i);
                    HashMap<String,Object> hashMap1 = new HashMap<>();
                    hashMap1.putAll(hashMap);
                    sampleList.add(hashMap1);
                }else {
                    hashMap.put("staff_name","");
                    hashMap.put("number",0);
                    HashMap<String,Object> hashMap1 = new HashMap<>();
                    hashMap1.putAll(hashMap);
                    sampleList.add(hashMap1);
                }
            }
        }
        return sampleList;
    }

    //业务追踪
    @Override
    public List<HashMap<String, Object>> selectBusinessTracking(Page page2, CurrencyApply currencyApply) {
        //查询通过审批的信泽业务下发
        List<HashMap<String, Object>> taskList = detectionMapper.selectOneUpApply(page2, currencyApply);
        for (HashMap<String, Object> hashMap : taskList) {
            //拿取业务下发主键id，查询采样通知
            Integer taskId = Integer.parseInt(String.valueOf(hashMap.get("currency_id")));
            //CurrencyApply taskApply = detectionMapper.selectCurrencyApplyByString17(taskId,43);
            CurrencyApply currencyApply43 = detectionMapper.selectCurrencyApplyById(taskId);
            //判断采样状态
            //1.是否有采样完成时间
            if (currencyApply43.getCurrency_string3() == null) {//无，说明没有完成
                //判断是否超时
                hashMap.put("register", "进行中");//现场科
                hashMap.put("handover", "未开始");//样品管理员
                hashMap.put("testing", "未开始");//检测科
                hashMap.put("report", "未开始");//质控科
                hashMap.put("finance", "未开始");//报告流转
                continue;
            } else {//表示采样完成
                //判断采样是否逾期
                if (currencyApply43.getCurrency_money().compareTo(BigDecimal.ZERO) == 0) {//未逾期
                    hashMap.put("register", "完成");//现场科
                } else {
                    hashMap.put("register", "超时完成");//现场科
                }
                //是否流转，检测是否开始
                if (currencyApply43.getCurrency_string4() == null) {//无，说明没有流转
                    //判断是否超时
                    hashMap.put("handover", "进行中");//样品流转
                    hashMap.put("testing", "未开始");//检测科
                    hashMap.put("report", "未开始");//质控科
                    hashMap.put("finance", "未开始");//报告流转
                    continue;
                } else {//表示已经流转
                    hashMap.put("handover", "完成");//样品流转
                    //检测是否完成
                    if (currencyApply43.getCurrency_string5() == null) {//检测没有完成
                        hashMap.put("testing", "进行中");//检测科
                        hashMap.put("report", "未开始");//质控科
                        hashMap.put("finance", "未开始");//报告流转
                        continue;
                    } else {
                        if (currencyApply43.getCurrency_money2().compareTo(BigDecimal.ZERO) == 0) {//未逾期
                            hashMap.put("testing", "完成");//现场科
                        } else {
                            hashMap.put("testing", "超时完成");//现场科
                        }
                        //检测是否完成
                        if (currencyApply43.getCurrency_string10() == null) {//报告没有完成
                            hashMap.put("report", "进行中");//质控科
                            hashMap.put("finance", "未开始");//报告流转
                            continue;
                        } else {
                            if (currencyApply43.getCurrency_money3().compareTo(BigDecimal.ZERO) == 0) {//未逾期
                                hashMap.put("report", "完成");//现场科
                            } else {
                                hashMap.put("report", "超时完成");//现场科
                            }
                            //总体是否超期
                            /*if (currencyApply43.getCurrency_money4().compareTo(BigDecimal.ZERO) != 1) {//未逾期
                                hashMap.put("over", "正常");//现场科
                            } else {
                                hashMap.put("over", "超时");//现场科
                            }*/

                        }

                    }

                }
            }

        }

        return taskList;
    }

    @Override
    public List<HashMap<String, Object>> selectAllTesting(Page page2, CurrencyApply currencyApply) {
        //查询登记完成的采样通知43
        List<HashMap<String, Object>> noticeList = detectionMapper.selectOneUpApply(page2, currencyApply);
        for (Iterator<HashMap<String, Object>> car = noticeList.iterator();car.hasNext();){
            HashMap<String, Object> hashMap = car.next();
            //查询此43对应的45的明细个数
            //查询此45明细个数是否都已经有了49
            int a = 0;
            if ((Integer)hashMap.get("currency_int") == -1){//是否已经下发检测任务
                //查询45所有明细
                List<HashMap<String, Object>> handoverList = detectionMapper.selectTestResult(Integer.valueOf(String.valueOf(hashMap.get("currency_id"))), 45);
                for (HashMap<String, Object> hashMap1 : handoverList) {//currency_details_id
                    //判断已交接的个数
                    if (detectionMapper.selectCurrencyApplyByString18(String.valueOf(hashMap1.get("currency_details_id"))) != null) {
                        a++;
                    }
                }
                if (a != handoverList.size()){//45有明细未被检测
                    car.remove();
                }
            }else {
                car.remove();
            }
        }
        return noticeList;
    }

    @Override
    public List<HashMap<String, Object>> selectTestResult(CurrencyApply currencyApply) {
        //如果是采样，查询条件= currency_id=currency_string17
        if (currencyApply.getCurrency_int2()==1){
            List<HashMap<String, Object>> testResult = detectionMapper.selectTestResult(currencyApply.getCurrency_id(),49);
            return testResult;
        }
        //送样，查询条件= currency_string17=currency_string17
        List<HashMap<String, Object>> testResult = detectionMapper.selectTestResult(Integer.parseInt(currencyApply.getCurrency_string17()),49);

        return testResult;
    }

    @Override
    public Integer updateGaiZhang(CurrencyApply currencyApply) {
        return detectionMapper.updateGaiZhang(currencyApply.getCurrency_id());
    }

    @Override
    public Integer taskRecall(CurrencyDetails details) {
        Integer res1 = detectionMapper.recallLingQuDetails(details);
        Integer res2 = detectionMapper.recallSampleCode(details);
        return res1+res2;
    }

    @Override
    public List<HashMap<String, Object>> selectXCStaff(String department_id) {
        return detectionMapper.selectXCStaff(department_id);
    }

    @Override
    public List<HashMap<String, Object>> selectAllNotice(CurrencyApply currencyApply) {
        return detectionMapper.selectAllNotice(currencyApply);
    }

    @Override
    public Integer confirmTest45(CurrencyApply currencyApply) {
        //获取45主流程
        CurrencyApply currencyApply45 = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
        //获取43主流程
        CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply45.getCurrency_string17()));
        //检测完成，报告开始
        Date nowDate = new Date();
        String reportDateStart = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(nowDate);
        //把检测完成记录到43
        currencyApply43.setCurrency_string5(reportDateStart);
        //更新43的数据 检测完成即报告开始时间
        Integer res = currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply43);
        return res;
    }

    @Override
    public Integer testingReportAdd(CurrencyDetails currencyDetails) {
        Integer currency_id = currencyDetails.getCurrency_id();
        Date nowDate = new Date();//当前日期
        //0为从绩效页面新增
        if (!"0".equals(currency_id)){
            CurrencyApply currencyApply45 = currencyApplyMapper.selectCurrencyApplyById(currency_id);
            CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply45.getCurrency_string17()));
            currencyDetails.setDetails_int3(currencyApply43.getCurrency_id());//保存43
            currencyDetails.setDetails_int4(currency_id);//保存45

            //判断当前日期与日期期限大小，大则是超期 记录到43
            if (nowDate.getTime()-currencyApply45.getCurrency_date3().getTime()>0){
                currencyApply43.setCurrency_money3(new BigDecimal(1));
                currencyDetails.setDetails_int2(1);//记录到报告
            }else {
                currencyApply43.setCurrency_money3(new BigDecimal(0));
                currencyDetails.setDetails_int2(0);//记录到报告
            }
            //更新43报告相关信息
            currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply43);
        }
        //报告等级计算绩效
        String report_type = currencyDetails.getDetails_string2();
        if ("一级".equals(report_type)){
            currencyDetails.setDetails_int(18);
        }else if ("二级".equals(report_type)){
            currencyDetails.setDetails_int(25);
        }else if ("三级".equals(report_type)){
            currencyDetails.setDetails_int(150);
        }else if ("四级".equals(report_type)){
            currencyDetails.setDetails_int(180);
        }
        //区分45，将45的id去掉
        currencyDetails.setCurrency_id(0);
        //记录当前报告生成日期
        currencyDetails.setDetails_date(nowDate);
        //添加报告相关信息
        Integer res = detectionMapper.testingReportAdd(currencyDetails);
        return res;
    }

    @Override
    public Integer complieReport(CurrencyApply currencyApply) {
        Integer currency_id = currencyApply.getCurrency_id();
        CurrencyApply currencyApply45 = currencyApplyMapper.selectCurrencyApplyById(currency_id);
        CurrencyApply currencyApply43 = currencyApplyMapper.selectCurrencyApplyById(Integer.valueOf(currencyApply45.getCurrency_string17()));
        Date nowDate = new Date();//当前日期
        //获取报告完成总时间
        String reportDateEnd = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(nowDate);
        //给45完成时间
        currencyApply.setCurrency_date4(reportDateEnd);
        currencyApply.setCurrency_int6(1);
        currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply);
        //给43完成时间
        currencyApply43.setCurrency_string10(reportDateEnd);
        //更新43报告相关信息
        currencyApplyMapper.updateCurrencyApplyByCurrencyId(currencyApply43);
        return 1;
    }

    @Override
    public HashMap<String, String> selectStaff(HashMap<String, Object> map) {
        return null;
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
    public Integer endTest(CurrencyApply currencyApply) {
        return detectionMapper.endTest(currencyApply);
    }

    @Override
    public Integer getSample(CurrencyApply currencyApply) {
        //获取数据43
        CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
        //判断当前日期是否超出43的采样完成日期
        Date nowDate = new Date();//当前日期
        Date limitDate = currencyApply2.getCurrency_date2();//限定日期
        if (nowDate.getTime() > limitDate.getTime()){//超期
            currencyApply.setCurrency_money(new BigDecimal(1));
        }else {
            currencyApply.setCurrency_money(new BigDecimal(0));
        }
        //记录样品管理员获取到样品时间，即采样完成时间
        currencyApply.setCurrency_string3(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(nowDate));
        Integer res = currencyApplyMapper.update43OverDate(currencyApply);//
        return res;
    }

    @Override
    public Integer transSample(CurrencyApply currencyApply) {
        //记录样品管理员流转样品时间，即检测开始时间
        Date nowDate = new Date();//当前日期
        currencyApply.setCurrency_string4(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(nowDate));
        Integer res = currencyApplyMapper.update43OverDate(currencyApply);//
        return res;
    }

    @Override
    public List<HashMap<String, Object>> selectCurrencyDetailsReport(CurrencyDetails currencyDetails) {
        return detectionMapper.selectCurrencyDetailsReport(currencyDetails);
    }
}

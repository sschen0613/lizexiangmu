package com.yr.lize.xinze.controller;

import com.alibaba.fastjson.JSONArray;
import com.st.rbac.util.Page;
import com.yr.lize.currencyapply.service.ICurrencyApplyService;
import com.yr.lize.pojo.*;
import com.yr.lize.system.service.ISystemApprovalService;
import com.yr.lize.system.service.ISystemCompanyService;
import com.yr.lize.xinze.service.DetectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Lic on 2019/5/10.
 */
@Controller
public class DetectionController {

    @Autowired
    DetectionService detectionService;

    @Autowired
    ISystemCompanyService iSystemCompanyService;

    @Autowired
    ISystemApprovalService iSystemApprovalService;

    @Autowired
    ICurrencyApplyService iCurrencyApplyService;

    @RequestMapping("/Xinze/currencyDetails.action")
    public String currencyDetails() {
        return "WEB-INF/views/currencyDetails";
    }

    //查看合同图片
    @RequestMapping("/Xinze/selectContractPicture.action")
    @ResponseBody
    public ResponseResult selectContractPicture(CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();

        List<HashMap<String, Object>> list = iCurrencyApplyService.selectContractPicture(currencyApply);

        result.setCode(0);
        result.setData(list);
        return result;
    }

    //发起通用审批流
    @RequestMapping("/Xinze/launchCurrencyApply.action")
    @ResponseBody
    public ResponseResult launchCurrencyApply(HttpServletRequest request, HttpSession session , String currencyDetails , CurrencyApply currencyApply, @RequestParam(value="pics",required=false) MultipartFile[] files) {
        SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");//从session中获取当前登录用户,也就是发起人的信息//*

        //审批条件属性
        Integer condition = 2;//2含义就是条件审批//*
        ApproverRole approverRole = new ApproverRole();//*
        approverRole.setApproval_id(currencyApply.getCurrency_type());//申请管理id//*
        approverRole.setCompany_id(staff.getCompany_Id());//公司id//*
        List<ApproverRole> roles = null;//*



        //将前台传入的数组,转化成list，使用的是alibaba的com.alibaba.fastjson.JSONArray//表单中附带的从表详情信息
        List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);

        Date date = new Date();//获取当前发起申请的时间
        currencyApply.setCurrency_date(date);
        currencyApply.setCurrency_applicant(staff.getStaff_Id());//申请人id
        /*if (currencyApply.getCurrency_type() == 43){
            currencyApply.setApprover_count(roles.size());//记录一共有几层审批
        }else */if (currencyApply.getCurrency_type() == 52) {//如果是条码录入申请，对流转信息表插入数据
           /* for (CurrencyDetails details : currencyDetailss) {
                if ("配件入库".equals(currencyApply.getCurrency_string7())) {
                    HashMap<String, Object> hashMap = new HashMap<>();
                    hashMap.put("details_string11", details.getDetails_string11());
                    List<CurrencyDetails> currencyDetailsList = iCurrencyApplyService.findCurrencyDetailsByMap(hashMap);
                    if (currencyDetailsList.size() > 0) {
                        ResponseResult result = new ResponseResult();
                        result.setCode(-1);
                        result.setMsg("添加失败,条码：" + details.getDetails_string11() + "已存在，不可重复");
                        return result;
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
            }*/
            //采样任务通知判断是现场采样还是送样
        }else if(currencyApply.getCurrency_type()==43 ){
            //1现场采样 2送样
            if(currencyApply.getCurrency_int2()==1){
                approverRole.setApprover_condition(condition);
                currencyApply.setCondition_state(2);//加入条件标识
                //查询当前审批流的设置信息
                roles = iSystemApprovalService.selectConditionApproval(approverRole);
            }else {
                currencyApply.setCondition_state(1);//加入条件标识
                roles = iSystemApprovalService.selectConditionApproval(approverRole);
            }
        }else if(currencyApply.getCurrency_type()==49 ){
            currencyApply.setCondition_state(1);//加入条件标识
            roles = iSystemApprovalService.selectConditionApproval(approverRole);
        }else {
            currencyApply.setCurrent_approvalCount(0);
            currencyApply.setApprover_count(0);
            currencyApply.setApprover_state(0);
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
        currencyApply.setCurrency_number(currency_number);
        currencyApply.setCurrency_string6(result);

        Integer res = null;
        //发起通用申请并记录
        try {
            res = detectionService.launchpurchase(request,currencyApply,currencyDetailss,staff,roles,files);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        ResponseResult result2 = new ResponseResult();

        if (res > 0) {
            result2.setCode(1);
            result2.setMsg("添加成功");
        }else if(res == -2){
            result2.setMsg("已经登记过不能再登记,提交失败！！");
        }else {
            result2.setCode(-1);
            result2.setMsg("添加失败");
        }
        return result2;

    }


    //发起通用审批流
    @RequestMapping("/Xinze/launchCurrencyApplyTemporary.action")
    @ResponseBody
    public ResponseResult launchCurrencyApplyTemporary(HttpSession session , String currencyDetails , CurrencyApply currencyApply) {
        SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");//从session中获取当前登录用户,也就是发起人的信息//*

        //将前台传入的数组,转化成list，使用的是alibaba的com.alibaba.fastjson.JSONArray//表单中附带的从表详情信息
        List<CurrencyDetails> currencyDetailss = JSONArray.parseArray(currencyDetails, CurrencyDetails.class);

        Date date = new Date();//获取当前发起申请的时间
        currencyApply.setCurrency_date(date);
        currencyApply.setCurrency_applicant(staff.getStaff_Id());//申请人id

        Integer res = null;
        //发起通用申请并记录
        try {
            res = detectionService.launchpurchaseTemporary(currencyApply,currencyDetailss,staff);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        ResponseResult result2 = new ResponseResult();

        if (res > 0) {
            result2.setCode(1);
            result2.setMsg("添加成功");
        }else if(res == -2){
            result2.setMsg("已经检测两次不能再次进行检测,提交失败！！");
        }else {
            result2.setCode(-1);
            result2.setMsg("添加失败");
        }
        return result2;

    }



    //查询上一级申请
    @RequestMapping("/Xinze/selectApplicantCurrency.action")
    @ResponseBody
    public ResponseResult selectOneUpApply(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectOneUpApply(page2,currencyApply);

        Integer count = detectionService.getApplyCurrencyRows(currencyApply);

        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }

    //查询上一级申请表单详情
    @RequestMapping("/Xinze/selectCurrencyApply.action")
    @ResponseBody
    public ResponseResult selectCurrencyApply(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        CurrencyApply currencyApply1 = detectionService.selectCurrencyApply(currencyApply);
        result.setCode(0);
        result.setData(currencyApply1);
        return result;
    }

    //查看上一级申请采样详情
    @RequestMapping("/Xinze/selectCurrencyDetails.action")
    @ResponseBody
    public ResponseResult selectCurrencyDetails(CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        List<HashMap<String, Object>> list = detectionService.selectCurrencyDetailss(currencyApply);
        result.setCode(0);
        result.setData(list);
        return result;
    }

    //查询最新的采样登记进行结果登记
    @RequestMapping("/Xinze/selectLatest.action")
    @ResponseBody
    public ResponseResult selectLatest(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectLatest(page2,currencyApply);
        Integer count = detectionService.getApplyCurrencyRows(currencyApply);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }

    //查询检测项目名称
    @RequestMapping("/Xinze/selectProcessByDetailsId.action")
    @ResponseBody
    public ResponseResult selectProcessByDetailsId(Integer limit,Integer page,Integer details_id) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectProcessByDetailsId(page2,details_id);
        result.setCode(0);
        result.setData(list);
        return result;
    }

    //添加领取信息
    @RequestMapping("/Xinze/insertLingQuMsg.action")
    @ResponseBody
    public ResponseResult insertLingQuMsg(String detailsId,CurrencyDetails details) throws ParseException {
        ResponseResult result = new ResponseResult();
        detectionService.insertLingQuMsg(detailsId,details);//将领取数据更新到对应的45明细中，且将detail_int赋值为-1已领取
        result.setMsg("领取成功！");
        return result;
    }

    //查询唯一一条明细详情
    @RequestMapping("Xinze/selectCurrencyDetailById.action")
    @ResponseBody
    public ResponseResult selectCurrencyDetailById(Integer  currency_details_id){
        ResponseResult result = new ResponseResult();
        CurrencyDetails currencyDetails1 = iCurrencyApplyService.selectCurrencyDetailsByID(currency_details_id);
        result.setCode(0);
        result.setData(currencyDetails1);
        return result;
    }


    //查询唯一一条明细详情
    @RequestMapping("Xinze/selectOneDetails.action")
    @ResponseBody
    public ResponseResult selectOneDetails(sampleCode sampleCode){
        ResponseResult result = new ResponseResult();
        List<HashMap<String,Object>> details1 = detectionService.selectOneDetails(sampleCode);
        result.setCode(0);
        result.setData(details1);
        return result;
    }
    //查询上一级或者送样信息
    @RequestMapping("Xinze/selectCaiyangOrShangJiApplicantCurrency.action")
    @ResponseBody
    public ResponseResult selectCaiyangOrShangJiApplicantCurrency(Integer limit,Integer page,CurrencyApply currencyApply,CurrencyDetails currencyDetails){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String,Object>> list = detectionService.selectCaiyangOrShangJiApplicantCurrency(page2,currencyApply);
        Integer count = detectionService.getApplyCurrencyRows1(currencyApply,currencyDetails);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }
    //查询已领取的明细信息
    @RequestMapping("Xinze/selectReadeyLingQuDetails.action")
    @ResponseBody
    public ResponseResult selectReadeyLingQuDetails(Integer limit,Integer page,CurrencyDetails details){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String,Object>> list = detectionService.selectReadeyLingQuDetails(page2,details);
        result.setCode(0);
        result.setData(list);
        return result;

    }
    //查询已领取的所有信息
    @RequestMapping("Xinze/selectReadeyCurrency.action")
    @ResponseBody
    public ResponseResult selectReadeyCurrency(HttpSession session,Integer limit,Integer page,CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
        currencyApply.setCurrency_string11(staff.getStaff_Name());
        List<HashMap<String,Object>> list = detectionService.selectReadeyCurrency(page2,currencyApply);
        result.setCode(0);
        result.setData(list);
        return result;

    }
    /*查询检测次数*/
    @RequestMapping("Xinze/selectJianCeCount.action")
    @ResponseBody
    public ResponseResult selectJianCeCount(Integer currency_details_id){
        ResponseResult result = new ResponseResult();
        Integer i = detectionService.selectErrorJianCeCount(currency_details_id);
        result.setData(i);
        return result;
    }

    @RequestMapping("Xinze/updateJianceBiaoshi.action")
    @ResponseBody
    public ResponseResult updateJianceBiaoshi(Integer currency_details_id){
        ResponseResult result = new ResponseResult();
        Integer integer = detectionService.updateJianceBiaoshi(currency_details_id);
        result.setData(integer);
        return result;

    }
    //查看交接申请采样详情
    @RequestMapping("/Xinze/selectCurrencyDetails1.action")
    @ResponseBody
    public ResponseResult selectCurrencyDetails1(CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        List<HashMap<String, Object>> list = detectionService.selectCurrencyDetailss1(currencyApply);
        result.setCode(0);
        result.setData(list);
        return result;
    }
    //查看所有交接任务详情
    @RequestMapping("/Xinze/selectLatest1.action")
    @ResponseBody
    public ResponseResult selectLatest1(Integer limit,Integer page,CurrencyApply currencyApply,CurrencyDetails currencyDetails) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectLatest1(page2,currencyApply,currencyDetails);
        Integer count = detectionService.getApplyCurrencyRows1(currencyApply,currencyDetails);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }
    //查检测标准
    @RequestMapping("/Xinze/selectStandart.action")
    @ResponseBody
    public ResponseResult selectStandart(CurrencyDetails details) {
        ResponseResult result = new ResponseResult();
        String res = detectionService.selectStandart(details);
        result.setData(res);
        return result;
    }
    //查询账款进度
    @RequestMapping("/Xinze/selectFinanceAccount.action")
    @ResponseBody
    public ResponseResult selectFinanceAccount(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectFinanceAccount(page2,currencyApply);
        Integer count = detectionService.getApplyCurrencyRows(currencyApply);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }


    //查询检测绩效管理
    @RequestMapping("/Xinze/jianceJiXiaoManarge.action")
    @ResponseBody
    public ResponseResult selectJianCeJiXiaoManarge(Integer limit,Integer page,CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        /*if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }*/
        List<HashMap<String,Object>> list = detectionService.selectJianCeJiXiaoManarge(page2,currencyApply);

        //Integer count = detectionService.getApplyCurrencyRows1(currencyApply,sample);
        Integer count = 0;
        if (list != null && list.size() != 0 && limit != null){
            count = Integer.parseInt(list.size()+"");

            //利用subList模拟分页
            int totalcount=list.size();//总页数
            int pagecount=0;
            int m=totalcount%limit;
            if  (m>0){
                pagecount=totalcount/limit+1;
            }else{
                pagecount=totalcount/limit;
            }

            if (m == 0) {
                list = list.subList((page - 1) * limit, limit * (page));
            } else {
                if (page == pagecount) {
                    list = list.subList((page - 1) * limit, totalcount);
                } else {
                    list = list.subList((page - 1) * limit, limit * (page));
                }


            }

        }

        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }
    //查询使用人员
    @RequestMapping("Xinze/selectStaffName.action")
    @ResponseBody
    public ResponseResult selectStaffName(){
        List<HashMap<String, Object>> StaffName = detectionService.selectStaffName();

        ResponseResult result = new ResponseResult();

        result.setData(StaffName);
        return result;
    }

    //查询业务科申请的信泽合同及对应项目信息
    @RequestMapping("/Xinze/selectBusinessPerformance.action")
    @ResponseBody
    public ResponseResult selectBusinessPerformance(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String, Object>> list = detectionService.selectBusinessPerformance(page2,currencyApply);
        result.setCode(0);
        result.setCount(list.size());
        result.setData(list);
        return result;
    }
    //查询检测绩效统计
    @RequestMapping("/Xinze/jianceJiXiaoManarge1.action")
    @ResponseBody
    public ResponseResult selectJianCeJiXiaoManarge1(Integer limit,Integer page,CurrencyApply currencyApply,CurrencyDetails currencyDetails){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String,Object>> list = detectionService.selectJianCeJiXiaoManarge1(page2,currencyApply);
        Integer count = detectionService.getApplyCurrencyRows1(currencyApply,currencyDetails);
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }
    //查询检测报告登记主表信息
    @RequestMapping("/Xinze/selectReprotOne.action")
    @ResponseBody
    public ResponseResult selectReprotOne(CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        CurrencyApply currencyApply1 = detectionService.selectReprotOne(currencyApply);
        List<HashMap<String, Object>> list = detectionService.selectReportOneDetails(currencyApply);
        result.setCode(0);
        result.setData(currencyApply1);
        result.setData2(list);
        return result;
    }

    //现场绩效
    @RequestMapping("/Xinze/selectSceneSectionPerformance.action")
    @ResponseBody
    public ResponseResult selectSceneSectionPerformance(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        /*if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }*/
        List<HashMap<String, Object>> list = detectionService.selectSceneSectionPerformance(page2,currencyApply);

        Integer count = 0;
        if (list != null && list.size() != 0){
            count = Integer.parseInt(list.size()+"");

            //利用subList模拟分页
            int totalcount=list.size();//总页数
            int pagecount=0;
            int m=totalcount%limit;
            if  (m>0){
                pagecount=totalcount/limit+1;
            }else{
                pagecount=totalcount/limit;
            }

            if (m == 0) {
                list = list.subList((page - 1) * limit, limit * (page));
            } else {
                if (page == pagecount) {
                    list = list.subList((page - 1) * limit, totalcount);
                } else {
                    list = list.subList((page - 1) * limit, limit * (page));
                }


            }

        }
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }

    //业务追踪
    @RequestMapping("/Xinze/selectBusinessTracking.action")
    @ResponseBody
    public ResponseResult selectBusinessTracking(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }

        Integer count = 0;
        //业务追踪查询
        List<HashMap<String, Object>> list = detectionService.selectBusinessTracking(page2, currencyApply);
        if (list != null && list.size() > 0){
            count = detectionService.getApplyCurrencyRows(currencyApply);
        }
        result.setCode(0);
        result.setCount(count);
        result.setData(list);
        return result;
    }

    //查询检测完成后的汇总
    @RequestMapping("/Xinze/selectAllTesting.action")
    @ResponseBody
    public ResponseResult selectAllTesting(Integer limit,Integer page,CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        //业务追踪查询
        List<HashMap<String, Object>> list = detectionService.selectAllTesting(page2,currencyApply);
        result.setCode(0);
        result.setCount(list.size());
        result.setData(list);
        return result;
    }

    //查询检测结果
    @RequestMapping("/Xinze/selectTestResult.action")
    @ResponseBody
    public ResponseResult selectTestResult(CurrencyApply currencyApply) {
        ResponseResult result = new ResponseResult();
        //查询检测结果
        List<HashMap<String, Object>> list = detectionService.selectTestResult(currencyApply);
        result.setCode(0);
        result.setCount(list.size());
        result.setData(list);
        return result;
    }

    //修改盖章标识
    @RequestMapping("/Xinze/updateGaiZhang.action")
    @ResponseBody
    public ResponseResult updateGaiZhang(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.updateGaiZhang(currencyApply);
        if (res > 0){
            result.setMsg("盖章成功");
        }else {
            result.setMsg("盖章失败");
        }
        return result;
    }

    //检测任务领取撤回
    @RequestMapping("/Xinze/taskRecall.action")
    @ResponseBody
    public ResponseResult taskRecall(CurrencyDetails details){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.taskRecall(details);
        if (res > 1){
            result.setMsg("撤回成功");
        }else {
            result.setMsg("撤回失败");
        }
        return result;
    }

    //查询现场科人员
    @RequestMapping("/Xinze/selectXCStaff.action")
    @ResponseBody
    public ResponseResult selectXCStaff(String department_id){
        List<HashMap<String, Object>> xcStafflist = detectionService.selectXCStaff(department_id);

        ResponseResult result = new ResponseResult();

        result.setData(xcStafflist);
        return result;
    }

    //查询现场科人员
    @RequestMapping("/Xinze/selectStaff.action")
    @ResponseBody
    public ResponseResult selectStaff(String department_id,String staff_name){

        HashMap<String,Object> paramMap = new HashMap<>();
        paramMap.put("department_id",department_id);
        paramMap.put("staff_name",staff_name);

        HashMap<String, String> xcStafflist = detectionService.selectStaff(paramMap);
        ResponseResult result = new ResponseResult();
        result.setData(xcStafflist);
        return result;
    }

    //采样任务通知数据回调
    @RequestMapping("/Xinze/selectAllNotice.action")
    @ResponseBody
    public ResponseResult selectAllNotice(CurrencyApply currencyApply){
        List<HashMap<String, Object>> noticeList = detectionService.selectAllNotice(currencyApply);

        ResponseResult result = new ResponseResult();

        result.setData(noticeList);
        return result;
    }

    //质控科科长确认，检测结束，检测报告开始
    @RequestMapping("/Xinze/confirmTest45.action")
    @ResponseBody
    public ResponseResult confirmTest45(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.confirmTest45(currencyApply);
        if (res > 0){
            result.setMsg("操作成功!");
        }else {
            result.setMsg("操作失败!");
        }
        return result;
    }

    //质控科科长确认，检测结束，检测报告开始
    @RequestMapping("/Xinze/testingReportAdd.action")
    @ResponseBody
    public ResponseResult testingReportAdd(CurrencyDetails currencyDetails){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.testingReportAdd(currencyDetails);
        if (res > 0){
            result.setMsg("操作成功!");
        }else {
            result.setMsg("操作失败!");
        }
        return result;
    }

    //查询所有报告详情selectBusinessTracking
    @RequestMapping("/Xinze/selectCurrencyDetailsReport.action")
    @ResponseBody
    public ResponseResult selectCurrencyDetailsReport(Integer limit,Integer page,CurrencyDetails currencyDetails){
        ResponseResult result = new ResponseResult();
        Page page2 = new Page();
        if (limit != null) {
            page2.setPagerows(limit);
            page2.setCurpage(page);
        }
        List<HashMap<String,Object>> list = detectionService.selectCurrencyDetailsReport(page2,currencyDetails);

        result.setCode(0);
        result.setData(list);
        result.setMsg("查询成功");
        return result;
    }

    //检测报告完成
    @RequestMapping("/Xinze/complieReport.action")
    @ResponseBody
    public ResponseResult complieReport(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.complieReport(currencyApply);
        if (res > 0){
            result.setMsg("操作成功!");
        }else {
            result.setMsg("操作失败!");
        }
        return result;
    }

    //结束检测
    @RequestMapping("/Xinze/endTest.action")
    @ResponseBody
    public ResponseResult endTest(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.endTest(currencyApply);
        if (res > 0){
            result.setMsg("操作成功!");
        }else {
            result.setMsg("操作失败!");
        }
        return result;
    }

    //接受样品
    @RequestMapping("/Xinze/getSample.action")
    @ResponseBody
    public ResponseResult getSample(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.getSample(currencyApply);
        if (res > 0){
            result.setMsg("接收成功!");
        }else {
            result.setMsg("接收失败!");
        }
        return result;
    }

    //接受样品
    @RequestMapping("/Xinze/transSample.action")
    @ResponseBody
    public ResponseResult transSample(CurrencyApply currencyApply){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.transSample(currencyApply);
        if (res > 0){
            result.setMsg("流转成功!");
        }else {
            result.setMsg("流转失败!");
        }
        return result;
    }

    //接受样品
    @RequestMapping("/Xinze/confirmReport.action")
    @ResponseBody
    public ResponseResult confirmReport(CurrencyDetails currencyDetails){
        ResponseResult result = new ResponseResult();
        Integer res = detectionService.confirmReport(currencyDetails);
        if (res > 0){
            result.setMsg("流转成功!");
        }else {
            result.setMsg("流转失败!");
        }
        return result;
    }
}


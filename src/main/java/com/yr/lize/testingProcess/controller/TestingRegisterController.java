package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LENOVO on 2019/5/17.
 */
@Controller
public class TestingRegisterController {
    //跳转检测登记页面
    @RequestMapping("testingProcess/testingProcess/testingRegister.action")
    public String setupAllocationApproverView1() {
        return "WEB-INF/views/testingProcess/testingProcess/testingRegister";
    }

    //跳转检测登记申请页面
    @RequestMapping("testingProcess/testingProcess/testingRegisterForm.action")
    public String setupAllocationApproverView2() {
        return "WEB-INF/views/testingProcess/testingProcess/testingRegisterForm";
    }

    //跳转检测登记审批页面
    @RequestMapping("testingProcess/testingProcess/testingRegisterApproval.action")
    public String setupAllocationApproverView3() {
        return "WEB-INF/views/testingProcess/testingProcess/testingRegisterApproval";
    }
}

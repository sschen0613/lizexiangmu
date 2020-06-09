package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LENOVO on 2019/5/17.
 */
@Controller
public class SamplingResultsSummaryController {
    //跳转采样结果登记页面
    @RequestMapping("testingProcess/samplingMessage/samplingResultsSummary.action")
    public String setupAllocationApproverView1() {
        return "WEB-INF/views/testingProcess/samplingMessage/samplingResultsSummary";
    }

    //跳转采样结果登记申请页面
    @RequestMapping("testingProcess/samplingMessage/samplingResultsSummaryForm.action")
    public String setupAllocationApproverView2() {
        return "WEB-INF/views/testingProcess/samplingMessage/samplingResultsSummaryForm";
    }

    //跳转采样结果登记审批页面
    @RequestMapping("testingProcess/samplingMessage/samplingResultsSummaryApproval.action")
    public String setupAllocationApproverView3() {
        return "WEB-INF/views/testingProcess/samplingMessage/samplingResultsSummaryApproval";
    }
    //跳转采样结果登记汇总页面
    @RequestMapping("testingProcess/samplingMessage/samplingResultsSummaryList.action")
    public String setupAllocationApproverView4() {
        return "WEB-INF/views/testingProcess/samplingMessage/samplingResultsSummaryList";
    }
}

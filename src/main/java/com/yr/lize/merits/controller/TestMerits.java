package com.yr.lize.merits.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LENOVO on 2019/7/28.
 */
@Controller
public class TestMerits {

    //检测科绩效申请界面
    @RequestMapping("merits/testMerits.action")
    public String setupAllocationApproverView1() {
        return "WEB-INF/views/merits/testMerits";
    }
    //跳转检测科绩效申请表界面
    @RequestMapping("merits/testMeritsForm.action")
    public String setupAllocationApproverView2() {
        return "WEB-INF/views/merits/testMeritsForm";
    }
    //跳转检测科绩效审批界面
    @RequestMapping("merits/testMeritsApproval.action")
    public String setupAllocationApproverView3() {
        return "WEB-INF/views/merits/testMeritsApproval";
    }

    // 跳转手机端检测科绩效申请界面
    @RequestMapping("merits/mTestMerits.action")
    public String setupAllmOutlibraryOfMaterialClass() {
        return "WEB-INF/views/mobile/merits/mTestMerits";
    }
    // 跳转手机端检测科绩效申请列表界面
    @RequestMapping("merits/mTestMeritsList.action")
    public String setupAllmOutlibraryOfMaterialClassList() {
        return "WEB-INF/views/mobile/merits/mTestMeritsList";
    }
    // 跳转手机端检测科绩效申请列表详情界面
    @RequestMapping("merits/mTestMeritsDetails.action")
    public String setupAllmOutlibraryOfMaterialClassDetails() {
        return "WEB-INF/views/mobile/merits/mTestMeritsDetails";
    }
    // 跳转手机端检测科绩效审批列表界面
    @RequestMapping("merits/mTestMeritsApprovalList.action")
    public String setupAllmOutlibraryOfMaterialClassApprovalList() {
        return "WEB-INF/views/mobile/merits/mTestMeritsApprovalList";
    }
    // 跳转手机端检测科绩效审批界面
    @RequestMapping("merits/mTestMeritsApproval.action")
    public String setupAllmOutlibraryOfMaterialClassApproval() {
        return "WEB-INF/views/mobile/merits/mTestMeritsApproval";
    }

    //检测科绩效统计
    @RequestMapping("merits/testMeritsStatistics.action")
    public String testMeritsStatistics() {
        return "WEB-INF/views/merits/testMeritsStatistics";
    }

}

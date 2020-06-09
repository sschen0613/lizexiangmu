package com.yr.lize.merits.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LENOVO on 2019/7/28.
 */
@Controller
public class SpotMerits {

    //现场科绩效申请界面
    @RequestMapping("merits/spotMerits.action")
    public String setupAllocationApproverView1() {
        return "WEB-INF/views/merits/spotMerits";
    }
    //跳转现场科绩效申请表界面
    @RequestMapping("merits/spotMeritsForm.action")
    public String setupAllocationApproverView2() {
        return "WEB-INF/views/merits/spotMeritsForm";
    }
    //跳转现场科绩效审批界面
    @RequestMapping("merits/spotMeritsApproval.action")
    public String setupAllocationApproverView3() {
        return "WEB-INF/views/merits/spotMeritsApproval";
    }

    // 跳转手机端现场科绩效申请界面
    @RequestMapping("merits/mSpotMerits.action")
    public String setupAllmOutlibraryOfMaterialClass() {
        return "WEB-INF/views/mobile/merits/mSpotMerits";
    }
    // 跳转手机端现场科绩效申请列表界面
    @RequestMapping("merits/mSpotMeritsList.action")
    public String setupAllmOutlibraryOfMaterialClassList() {
        return "WEB-INF/views/mobile/merits/mSpotMeritsList";
    }
    // 跳转手机端现场科绩效申请列表详情界面
    @RequestMapping("merits/mSpotMeritsDetails.action")
    public String setupAllmOutlibraryOfMaterialClassDetails() {
        return "WEB-INF/views/mobile/merits/mSpotMeritsDetails";
    }
    // 跳转手机端现场科绩效审批列表界面
    @RequestMapping("merits/mSpotMeritsApprovalList.action")
    public String setupAllmOutlibraryOfMaterialClassApprovalList() {
        return "WEB-INF/views/mobile/merits/mSpotMeritsApprovalList";
    }
    // 跳转手机端现场科绩效审批界面
    @RequestMapping("merits/mSpotMeritsApproval.action")
    public String setupAllmOutlibraryOfMaterialClassApproval() {
        return "WEB-INF/views/mobile/merits/mSpotMeritsApproval";
    }

    //现场科绩效统计
    @RequestMapping("merits/spotMeritsStatistics.action")
    public String spotMeritsStatistics() {
        return "WEB-INF/views/merits/spotMeritsStatistics";
    }

}

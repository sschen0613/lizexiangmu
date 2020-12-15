package com.yr.lize.reportMoveStamp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ReportMoveStampController {
	//跳转报告流转及盖章申请页面
	@RequestMapping("testingProcess/reportMoveStamp/reportMoveStamp.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/reportMoveStamp/reportMoveStamp";
		//return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampReady";
	}
	//跳转报告流转及盖章表页面
	@RequestMapping("testingProcess/reportMoveStamp/reportMoveStampForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/reportMoveStamp/reportMoveStampForm";
	}
	//跳转报告流转及盖章审批页面
	@RequestMapping("testingProcess/reportMoveStamp/reportMoveStampApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/testingProcess/reportMoveStamp/reportMoveStampApproval";
		//return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampApprovalList";
	}

	//跳转检测合同发票开具审批（信泽）页面
	@RequestMapping("testingProcess/reportMoveStamp/reportMoveStampApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/testingProcess/reportMoveStamp/reportMoveStampApprovalDetail";
	}



	// 跳转手机端报告流转及盖章申请界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStampReady.action")
	public String setupAllmReportMoveStampReady() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampReady";
	}
	// 跳转手机端报告流转及盖章申请界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStamp.action")
	public String setupAllmReportMoveStamp() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStamp";
	}
	// 跳转手机端报告流转及盖章申请列表界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStampList.action")
	public String setupAllmReportMoveStampList() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampList";
	}
	// 跳转手机端报告流转及盖章申请列表详情界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStampDetails.action")
	public String setupAllmReportMoveStampDetails() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampDetails";
	}
	// 跳转手机端报告流转及盖章审批列表界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStampApprovalList.action")
	public String setupAllmReportMoveStampApprovalList() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampApprovalList";
	}
	// 跳转手机端报告流转及盖章审批界面
	@RequestMapping("testingProcess/reportMoveStamp/mReportMoveStampApproval.action")
	public String setupAllmReportMoveStampApproval() {
		return "WEB-INF/views/mobile/testingProcess/reportMoveStamp/mReportMoveStampApproval";
	}
}

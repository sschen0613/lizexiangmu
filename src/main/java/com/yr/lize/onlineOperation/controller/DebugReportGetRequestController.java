package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DebugReportGetRequestController {
	//跳转调试报告领取申请界面
	@RequestMapping("onlineOperation/debugReportGetRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/debugReportGetRequest";
	}
	//跳转调试报告领取申请表界面
	@RequestMapping("onlineOperation/debugReportGetRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/debugReportGetRequestForm";
	}
	//跳转调试报告领取申请界面
	@RequestMapping("onlineOperation/debugReportGetRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/debugReportGetRequestApproval";
	}
	
	// 跳转手机端调试报告领取申请界面
	@RequestMapping("onlineOperation/mDebugReportGetRequest.action")
	public String setupAllmDebugReportGetRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mDebugReportGetRequest";
	}
	// 跳转手机端调试报告领取申请列表界面
	@RequestMapping("onlineOperation/mDebugReportGetRequestList.action")
	public String setupAllmDebugReportGetRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mDebugReportGetRequestList";
	}
	// 跳转手机端调试报告领取申请列表详情界面
	@RequestMapping("onlineOperation/mDebugReportGetRequestDetails.action")
	public String setupAllmDebugReportGetRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mDebugReportGetRequestDetails";
	}
	// 跳转手机端调试报告领取审批列表界面
	@RequestMapping("onlineOperation/mDebugReportGetRequestApprovalList.action")
	public String setupAllmDebugReportGetRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mDebugReportGetRequestApprovalList";
	}
	// 跳转手机端调试报告领取审批界面
	@RequestMapping("onlineOperation/mDebugReportGetRequestApproval.action")
	public String setupAllmDebugReportGetRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mDebugReportGetRequestApproval";
	}
}

package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class InstallationReportRequestController {
	//跳转安装调试申请界面
	@RequestMapping("onlineOperation/installationReportRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/installationReportRequest";
	}
	//跳转安装调试申请表界面
	@RequestMapping("onlineOperation/installationReportRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/installationReportRequestForm";
	}
	//跳转安装调试审批界面
	@RequestMapping("onlineOperation/installationReportRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/installationReportRequestApproval";
	}
	
	// 跳转手机端安装调试申请界面
	@RequestMapping("onlineOperation/mInstallationReportRequest.action")
	public String setupAllmInstallationReportRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mInstallationReportRequest";
	}
	// 跳转手机端安装调试申请列表界面
	@RequestMapping("onlineOperation/mInstallationReportRequestList.action")
	public String setupAllmInstallationReportRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mInstallationReportRequestList";
	}
	// 跳转手机端安装调试申请列表详情界面
	@RequestMapping("onlineOperation/mInstallationReportRequestDetails.action")
	public String setupAllmInstallationReportRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mInstallationReportRequestDetails";
	}
	// 跳转手机端安装调试审批列表界面
	@RequestMapping("onlineOperation/mInstallationReportRequestApprovalList.action")
	public String setupAllmTwoRateAbnormInstallationReportRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mInstallationReportRequestApprovalList";
	}
	// 跳转手机端安装调试审批界面
	@RequestMapping("onlineOperation/mInstallationReportRequestApproval.action")
	public String setupAllmInstallationReportRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mInstallationReportRequestApproval";
	}
}

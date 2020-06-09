package com.yr.lize.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessReportRequestController {
	//跳转员工请假申请界面
		@RequestMapping("report/businessReportRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/report/businessReportRequest";
		//return "WEB-INF/views/mobile/report/mBusinessReportRequest";
	}
	//跳转员工请假申请表界面
	@RequestMapping("report/businessReportRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/report/businessReportRequestForm";
		//return "WEB-INF/views/mobile/report/mBusinessReportRequest";
	}
	//跳转员工请假审批界面
	@RequestMapping("report/businessReportRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/report/businessReportRequestApproval";
	}
	
	// 跳转手机端员工请假申请界面
	@RequestMapping("report/mBusinessReportRequest.action")
	public String setupAllmBusinessReportRequest() {
		return "WEB-INF/views/mobile/report/mBusinessReportRequest";
	}
	// 跳转手机端员工请假申请列表界面
	@RequestMapping("report/mBusinessReportRequestList.action")
	public String setupAllmBusinessReportRequestList() {
		return "WEB-INF/views/mobile/report/mBusinessReportRequestList";
	}
	// 跳转手机端员工请假申请列表详情界面
	@RequestMapping("report/mBusinessReportRequestDetails.action")
	public String setupAllmBusinessReportRequestDetails() {
		return "WEB-INF/views/mobile/report/mBusinessReportRequestDetails";
	}
	// 跳转手机端员工请假审批列表界面
	@RequestMapping("report/mBusinessReportRequestApprovalList.action")
	public String setupAllmBusinessReportRequestApprovalList() {
		return "WEB-INF/views/mobile/report/mBusinessReportRequestApprovalList";
	}
	// 跳转手机端员工请假审批界面
	@RequestMapping("report/mBusinessReportRequestApproval.action")
	public String setupAllmBusinessReportRequestApproval() {
		return "WEB-INF/views/mobile/report/mBusinessReportRequestApproval";
	}
}

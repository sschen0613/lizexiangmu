package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AskForLeaveRequestController {
	//跳转员工请假申请界面
		@RequestMapping("office/askForLeaveRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/askForLeaveRequest";
		//return "WEB-INF/views/mobile/office/mAskForLeaveRequest";
	}
	//跳转员工请假申请表界面
	@RequestMapping("office/askForLeaveRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/askForLeaveRequestForm";
		//return "WEB-INF/views/mobile/office/mAskForLeaveRequest";
	}
	//跳转员工请假审批界面
	@RequestMapping("office/askForLeaveRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/askForLeaveRequestApproval";
		//return "WEB-INF/views/mobile/office/mAskForLeaveRequestApprovalList";
	}
	
	// 跳转手机端员工请假申请界面
	@RequestMapping("office/mAskForLeaveRequest.action")
	public String setupAllmAskForLeaveRequest() {
		return "WEB-INF/views/mobile/office/mAskForLeaveRequest";
	}
	// 跳转手机端员工请假申请列表界面
	@RequestMapping("office/mAskForLeaveRequestList.action")
	public String setupAllmAskForLeaveRequestList() {
		return "WEB-INF/views/mobile/office/mAskForLeaveRequestList";
	}
	// 跳转手机端员工请假申请列表详情界面
	@RequestMapping("office/mAskForLeaveRequestDetails.action")
	public String setupAllmAskForLeaveRequestDetails() {
		return "WEB-INF/views/mobile/office/mAskForLeaveRequestDetails";
	}
	// 跳转手机端员工请假审批列表界面
	@RequestMapping("office/mAskForLeaveRequestApprovalList.action")
	public String setupAllmAskForLeaveRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mAskForLeaveRequestApprovalList";
	}
	// 跳转手机端员工请假审批界面
	@RequestMapping("office/mAskForLeaveRequestApproval.action")
	public String setupAllmAskForLeaveRequestApproval() {
		return "WEB-INF/views/mobile/office/mAskForLeaveRequestApproval";
	}
}

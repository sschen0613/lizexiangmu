package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class OvertimeWorkRequestController {
	//跳转员工加班申请界面
	@RequestMapping("office/overtimeWorkRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/overtimeWorkRequest";
	}
	//跳转员工加班申请表界面
	@RequestMapping("office/overtimeWorkRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/overtimeWorkRequestForm";
	}
	//跳转员工加班审批界面
	@RequestMapping("office/overtimeWorkRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/overtimeWorkRequestApproval";
	}
	
	// 跳转手机端员工加班申请界面
	@RequestMapping("office/mOvertimeWorkRequest.action")
	public String setupAllmOvertimeWorkRequest() {
		return "WEB-INF/views/mobile/office/mOvertimeWorkRequest";
	}
	// 跳转手机端员工加班申请列表界面
	@RequestMapping("office/mOvertimeWorkRequestList.action")
	public String setupAllmOvertimeWorkRequestList() {
		return "WEB-INF/views/mobile/office/mOvertimeWorkRequestList";
	}
	// 跳转手机端员工加班申请列表详情界面
	@RequestMapping("office/mOvertimeWorkRequestDetails.action")
	public String setupAllmOvertimeWorkRequestDetails() {
		return "WEB-INF/views/mobile/office/mOvertimeWorkRequestDetails";
	}
	// 跳转手机端员工加班审批列表界面
	@RequestMapping("office/mOvertimeWorkRequestApprovalList.action")
	public String setupAllmOvertimeWorkRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mOvertimeWorkRequestApprovalList";
	}
	// 跳转手机端员工加班审批界面
	@RequestMapping("office/mOvertimeWorkRequestApproval.action")
	public String setupAllmOvertimeWorkRequestApproval() {
		return "WEB-INF/views/mobile/office/mOvertimeWorkRequestApproval";
	}
}

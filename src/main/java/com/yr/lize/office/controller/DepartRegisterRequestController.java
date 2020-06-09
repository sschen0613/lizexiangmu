package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DepartRegisterRequestController {
	//跳转出发登记申请界面
	@RequestMapping("office/departRegisterRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/departRegisterRequest";
	}
	//跳转出发登记申请表界面
	@RequestMapping("office/departRegisterRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/departRegisterRequestForm";
	}
	//跳转出发登记审批界面
	@RequestMapping("office/departRegisterRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/departRegisterRequestApproval";
	}
	
	// 跳转手机端出发登记申请界面
	@RequestMapping("office/mDepartRegisterRequest.action")
	public String setupAllmDepartRegisterRequest() {
		return "WEB-INF/views/mobile/office/mDepartRegisterRequest";
	}
	// 跳转手机端出发登记申请列表界面
	@RequestMapping("office/mDepartRegisterRequestList.action")
	public String setupAllmDepartRegisterRequestList() {
		return "WEB-INF/views/mobile/office/mDepartRegisterRequestList";
	}
	// 跳转手机端出发登记申请列表详情界面
	@RequestMapping("office/mDepartRegisterRequestDetails.action")
	public String setupAllmDepartRegisterRequestDetails() {
		return "WEB-INF/views/mobile/office/mDepartRegisterRequestDetails";
	}
	// 跳转手机端出发登记审批列表界面
	@RequestMapping("office/mDepartRegisterRequestApprovalList.action")
	public String setupAllmDepartRegisterRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mDepartRegisterRequestApprovalList";
	}
	// 跳转手机端出发登记审批界面
	@RequestMapping("office/mDepartRegisterRequestApproval.action")
	public String setupAllmDepartRegisterRequestApproval() {
		return "WEB-INF/views/mobile/office/mDepartRegisterRequestApproval";
	}
}

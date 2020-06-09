package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class PartsMaintainRequestController {
	//跳转配件内部维修申请界面
	@RequestMapping("onlineOperation/partsMaintainRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/partsMaintainRequest";
	}
	//跳转配件内部维修申请表界面
	@RequestMapping("onlineOperation/partsMaintainRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/partsMaintainRequestForm";
	}
	//跳转配件内部维修审批界面
	@RequestMapping("onlineOperation/partsMaintainRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/partsMaintainRequestApproval";
	}
	
	// 跳转手机端配件内部维修申请界面
	@RequestMapping("onlineOperation/mPartsMaintainRequest.action")
	public String setupAllmPartsMaintainRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mPartsMaintainRequest";
	}
	// 跳转手机端配件内部维修申请列表界面
	@RequestMapping("onlineOperation/mPartsMaintainRequestList.action")
	public String setupAllmPartsMaintainRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mPartsMaintainRequestList";
	}
	// 跳转手机端配件内部维修申请列表详情界面
	@RequestMapping("onlineOperation/mPartsMaintainRequestDetails.action")
	public String setupAllmPartsMaintainRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mPartsMaintainRequestDetails";
	}
	// 跳转手机端配件内部维修审批列表界面
	@RequestMapping("onlineOperation/mPartsMaintainRequestApprovalList.action")
	public String setupAllmPartsMaintainRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mPartsMaintainRequestApprovalList";
	}
	// 跳转手机端配件内部维修审批界面
	@RequestMapping("onlineOperation/mPartsMaintainRequestApproval.action")
	public String setupAllmPartsMaintainRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mPartsMaintainRequestApproval";
	}

	//2019/08/29
	//跳转外部维修及售后申请
	@RequestMapping("onlineOperation/outPartsMaintainRequest.action")
	public String setupAllocationApproverView11() {
		return "WEB-INF/views/onlineOperation/outPartsMaintainRequest";
	}
	//跳转外部维修及售后申请表单界面
	@RequestMapping("onlineOperation/outPartsMaintainRequestForm.action")
	public String setupAllocationApproverView12() {
		return "WEB-INF/views/onlineOperation/outPartsMaintainRequestForm";
	}
	//跳转外部维修及售后审批
	@RequestMapping("onlineOperation/outPartsMaintainRequestApproval.action")
	public String setupAllocationApproverView13() {
		return "WEB-INF/views/onlineOperation/outPartsMaintainRequestApproval";
	}

	// 跳转手机端配件内部维修申请界面
	@RequestMapping("onlineOperation/mOutPartsMaintainRequest.action")
	public String setupAllmPartsMaintainRequest10() {
		return "WEB-INF/views/mobile/onlineOperation/mOutPartsMaintainRequest";
	}
	// 跳转手机端配件内部维修申请列表界面
	@RequestMapping("onlineOperation/mOutPartsMaintainRequestList.action")
	public String setupAllmPartsMaintainRequestList10() {
		return "WEB-INF/views/mobile/onlineOperation/mOutPartsMaintainRequestList";
	}
	// 跳转手机端配件内部维修申请列表详情界面
	@RequestMapping("onlineOperation/mOutPartsMaintainRequestDetails.action")
	public String setupAllmPartsMaintainRequestDetails10() {
		return "WEB-INF/views/mobile/onlineOperation/mOutPartsMaintainRequestDetails";
	}
	// 跳转手机端配件内部维修审批列表界面
	@RequestMapping("onlineOperation/mOutPartsMaintainRequestApprovalList.action")
	public String setupAllmPartsMaintainRequestApprovalList10() {
		return "WEB-INF/views/mobile/onlineOperation/mOutPartsMaintainRequestApprovalList";
	}
	// 跳转手机端配件内部维修审批界面
	@RequestMapping("onlineOperation/mOutPartsMaintainRequestApproval.action")
	public String setupAllmPartsMaintainRequestApproval10() {
		return "WEB-INF/views/mobile/onlineOperation/mOutPartsMaintainRequestApproval";
	}





}

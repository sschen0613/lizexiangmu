package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReagentGetRequestController {

	// 跳转试剂标液配置领取申请界面
	@RequestMapping("onlineOperation/reagentGetRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/reagentGetRequest";
	}
	// 跳转试剂标液配置领取申请表界面
	@RequestMapping("onlineOperation/reagentGetRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/reagentGetRequestForm";
	}
	// 跳转试剂标液配置领取审批界面
	@RequestMapping("onlineOperation/reagentGetRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/reagentGetRequestApproval";
	}
	
	// 跳转手机端试剂标液配置领取申请界面
	@RequestMapping("onlineOperation/mReagentGetRequest.action")
	public String setupAllmReagentGetRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mReagentGetRequest";
	}
	// 跳转手机端试剂标液配置领取申请列表界面
	@RequestMapping("onlineOperation/mReagentGetRequestList.action")
	public String setupAllmReagentGetRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mReagentGetRequestList";
	}
	// 跳转手机端试剂标液配置领取申请列表详情界面
	@RequestMapping("onlineOperation/mReagentGetRequestDetails.action")
	public String setupAllmReagentGetRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mReagentGetRequestDetails";
	}
	// 跳转手机端试剂标液配置领取审批列表界面
	@RequestMapping("onlineOperation/mReagentGetRequestApprovalList.action")
	public String setupAllmReagentGetRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mReagentGetRequestApprovalList";
	}
	// 跳转手机端试剂标液配置领取审批界面
	@RequestMapping("onlineOperation/mReagentGetRequestApproval.action")
	public String setupAllmReagentGetRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mReagentGetRequestApproval";
	}

}

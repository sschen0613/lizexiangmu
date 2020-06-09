package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StandardGasRequestController {

	// 跳转标气申购申请界面
	@RequestMapping("onlineOperation/standardGasRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/standardGasRequest";
	}
	// 跳转标气申购申请表界面
	@RequestMapping("onlineOperation/standardGasRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/standardGasRequestForm";
	}
	// 跳转标气申购审批界面
	@RequestMapping("onlineOperation/standardGasRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/standardGasRequestApproval";
	}
	
	// 跳转手机端标气申购申请界面
	@RequestMapping("onlineOperation/mStandardGasRequest.action")
	public String setupAllmReagentGetRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mStandardGasRequest";
	}
	// 跳转手机端标气申购申请列表界面
	@RequestMapping("onlineOperation/mStandardGasRequestList.action")
	public String setupAllmReagentGetRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mStandardGasRequestList";
	}
	// 跳转手机端标气申购申请列表详情界面
	@RequestMapping("onlineOperation/mStandardGasRequestDetails.action")
	public String setupAllmReagentGetRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mStandardGasRequestDetails";
	}
	// 跳转手机端标气申购审批列表界面
	@RequestMapping("onlineOperation/mStandardGasRequestApprovalList.action")
	public String setupAllmReagentGetRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mStandardGasRequestApprovalList";
	}
	// 跳转手机端标气申购审批界面
	@RequestMapping("onlineOperation/mStandardGasRequestApproval.action")
	public String setupAllmReagentGetRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mStandardGasRequestApproval";
	}

}

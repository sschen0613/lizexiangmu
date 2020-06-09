package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StandbyBuyRequestController {
	//跳转备机使用申请界面
	@RequestMapping("onlineOperation/standbyBuyRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/standbyBuyRequest";
	}
	//跳转备机使用申请表界面
	@RequestMapping("onlineOperation/standbyBuyRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/standbyBuyRequestForm";
	}
	//跳转备机使用审批界面
	@RequestMapping("onlineOperation/standbyBuyRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/standbyBuyRequestApproval";
	}
	
	// 跳转手机端备机使用申请界面
	@RequestMapping("onlineOperation/mStandbyBuyRequest.action")
	public String setupAllmStandbyBuyRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mStandbyBuyRequest";
	}
	// 跳转手机端备机使用申请列表界面
	@RequestMapping("onlineOperation/mStandbyBuyRequestList.action")
	public String setupAllmStandbyBuyRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mStandbyBuyRequestList";
	}
	// 跳转手机端备机使用申请列表详情界面
	@RequestMapping("onlineOperation/mStandbyBuyRequestDetails.action")
	public String setupAllmStandbyBuyRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mStandbyBuyRequestDetails";
	}
	// 跳转手机端备机使用审批列表界面
	@RequestMapping("onlineOperation/mStandbyBuyRequestApprovalList.action")
	public String setupAllmStandbyBuyRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mStandbyBuyRequestApprovalList";
	}
	// 跳转手机端备机使用审批界面
	@RequestMapping("onlineOperation/mStandbyBuyRequestApproval.action")
	public String setupAllmStandbyBuyRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mStandbyBuyRequestApproval";
	}
}

package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TechnicalSupportRequestController {
	//跳转技术支持申请界面
	@RequestMapping("onlineOperation/technicalSupportRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/technicalSupportRequest";
	}
	//跳转技术支持申请表界面
	@RequestMapping("onlineOperation/technicalSupportRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/technicalSupportRequestForm";
	}
	//跳转技术支持审批界面
	@RequestMapping("onlineOperation/technicalSupportRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/technicalSupportRequestApproval";
	}
	
	// 跳转手机端技术支持申请界面
	@RequestMapping("onlineOperation/mTechnicalSupportRequest.action")
	public String setupAllmTechnicalSupportRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportRequest";
	}
	// 跳转手机端技术支持申请列表界面
	@RequestMapping("onlineOperation/mTechnicalSupportRequestList.action")
	public String setupAllmTechnicalSupportRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportRequestList";
	}
	// 跳转手机端技术支持申请列表详情界面
	@RequestMapping("onlineOperation/mTechnicalSupportRequestDetails.action")
	public String setupAllmTechnicalSupportRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportRequestDetails";
	}
	// 跳转手机端技术支持审批列表界面
	@RequestMapping("onlineOperation/mTechnicalSupportRequestApprovalList.action")
	public String setupAllmTwoRateAbnormTechnicalSupportRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportRequestApprovalList";
	}
	// 跳转手机端技术支持审批界面
	@RequestMapping("onlineOperation/mTechnicalSupportRequestApproval.action")
	public String setupAllmTechnicalSupportRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportRequestApproval";
	}
}

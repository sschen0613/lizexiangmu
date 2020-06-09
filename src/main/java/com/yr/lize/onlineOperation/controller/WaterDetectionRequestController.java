package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WaterDetectionRequestController {
	//跳转技术支持申请界面
	@RequestMapping("onlineOperation/waterDetectionRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/waterDetectionRequest";
	}
	//跳转技术支持申请表界面
	@RequestMapping("onlineOperation/waterDetectionRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/waterDetectionRequestForm";
	}
	//跳转技术支持审批界面
	@RequestMapping("onlineOperation/waterDetectionRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/waterDetectionRequestApproval";
	}
	
	// 跳转手机端技术支持申请界面
	@RequestMapping("onlineOperation/mWaterDetectionRequest.action")
	public String setupAllmWaterDetectionRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mWaterDetectionRequest";
	}
	// 跳转手机端技术支持申请列表界面
	@RequestMapping("onlineOperation/mWaterDetectionRequestList.action")
	public String setupAllmWaterDetectionRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mWaterDetectionRequestList";
	}
	// 跳转手机端技术支持申请列表详情界面
	@RequestMapping("onlineOperation/mWaterDetectionRequestDetails.action")
	public String setupAllmWaterDetectionRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mWaterDetectionRequestDetails";
	}
	// 跳转手机端技术支持审批列表界面
	@RequestMapping("onlineOperation/mWaterDetectionRequestApprovalList.action")
	public String setupAllmTwoRateAbnormWaterDetectionRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mWaterDetectionRequestApprovalList";
	}
	// 跳转手机端技术支持审批界面
	@RequestMapping("onlineOperation/mWaterDetectionRequestApproval.action")
	public String setupAllmWaterDetectionRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mWaterDetectionRequestApproval";
	}
}

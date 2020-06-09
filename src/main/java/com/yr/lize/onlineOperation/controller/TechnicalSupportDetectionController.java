package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TechnicalSupportDetectionController {
	//跳转运维检测任务申请界面
	@RequestMapping("onlineOperation/technicalSupportDetection.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/technicalSupportDetection";
	}
	//跳转运维检测任务申请表界面
	@RequestMapping("onlineOperation/technicalSupportDetectionForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/technicalSupportDetectionForm";
	}
	//跳转运维检测任务审批界面
	@RequestMapping("onlineOperation/technicalSupportDetectionApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/technicalSupportDetectionApproval";
	}
	
	// 跳转手机端运维检测任务申请界面
	@RequestMapping("onlineOperation/mTechnicalSupportDetection.action")
	public String setupAllmTechnicalSupportDetection() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportDetection";
	}
	// 跳转手机端运维检测任务申请列表界面
	@RequestMapping("onlineOperation/mTechnicalSupportDetectionList.action")
	public String setupAllmTechnicalSupportDetectionList() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportDetectionList";
	}
	// 跳转手机端运维检测任务申请列表详情界面
	@RequestMapping("onlineOperation/mTechnicalSupportDetectionDetails.action")
	public String setupAllmTechnicalSupportDetectionDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportDetectionDetails";
	}
	// 跳转手机端运维检测任务审批列表界面
	@RequestMapping("onlineOperation/mTechnicalSupportDetectionApprovalList.action")
	public String setupAllmTwoRateAbnormTechnicalSupportDetectionApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportDetectionApprovalList";
	}
	// 跳转手机端运维检测任务审批界面
	@RequestMapping("onlineOperation/mTechnicalSupportDetectionApproval.action")
	public String setupAllmTechnicalSupportDetectionApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mTechnicalSupportDetectionApproval";
	}
}

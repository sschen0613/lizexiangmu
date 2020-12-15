package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaultDetectController {
	//跳转故障检测申请界面
	@RequestMapping("onlineOperation/faultDetect.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/faultDetect";
	}
	//跳转故障检测申请表界面
	@RequestMapping("onlineOperation/faultDetectForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/faultDetectForm";
	}
	//跳转故障检测审批界面
	@RequestMapping("onlineOperation/faultDetectApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/faultDetectApproval";
	}
	
	// 跳转手机端故障检测申请界面
	@RequestMapping("onlineOperation/mFaultDetect.action")
	public String setupAllmFaultDetect() {
		return "WEB-INF/views/mobile/onlineOperation/mFaultDetect";
	}
	// 跳转手机端故障检测申请列表界面
	@RequestMapping("onlineOperation/mFaultDetectList.action")
	public String setupAllmFaultDetectList() {
		return "WEB-INF/views/mobile/onlineOperation/mFaultDetectList";
	}
	// 跳转手机端故障检测申请列表详情界面
	@RequestMapping("onlineOperation/mFaultDetectDetails.action")
	public String setupAllmFaultDetectDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mFaultDetectDetails";
	}
	// 跳转手机端故障检测审批列表界面
	@RequestMapping("onlineOperation/mFaultDetectApprovalList.action")
	public String setupAllmTwoRateAbnormFaultDetectApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mFaultDetectApprovalList";
	}
	// 跳转手机端故障检测审批界面
	@RequestMapping("onlineOperation/mFaultDetectApproval.action")
	public String setupAllmFaultDetectApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mFaultDetectApproval";
	}
}

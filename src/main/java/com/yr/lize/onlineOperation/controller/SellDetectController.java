package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellDetectController {
	//跳转故障检测申请界面
	@RequestMapping("onlineOperation/sellDetect.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/sellDetect";
	}
	//跳转故障检测申请表界面
	@RequestMapping("onlineOperation/sellDetectForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/sellDetectForm";
	}
	//跳转故障检测审批界面
	@RequestMapping("onlineOperation/sellDetectApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/sellDetectApproval";
	}
	
	// 跳转手机端故障检测申请界面
	@RequestMapping("onlineOperation/mSellDetect.action")
	public String setupAllmSellDetect() {
		return "WEB-INF/views/mobile/onlineOperation/mSellDetect";
	}
	// 跳转手机端故障检测申请列表界面
	@RequestMapping("onlineOperation/mSellDetectList.action")
	public String setupAllmSellDetectList() {
		return "WEB-INF/views/mobile/onlineOperation/mSellDetectList";
	}
	// 跳转手机端故障检测申请列表详情界面
	@RequestMapping("onlineOperation/mSellDetectDetails.action")
	public String setupAllmSellDetectDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mSellDetectDetails";
	}
	// 跳转手机端故障检测审批列表界面
	@RequestMapping("onlineOperation/mSellDetectApprovalList.action")
	public String setupAllmTwoRateAbnormSellDetectApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mSellDetectApprovalList";
	}
	// 跳转手机端故障检测审批界面
	@RequestMapping("onlineOperation/mSellDetectApproval.action")
	public String setupAllmSellDetectApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mSellDetectApproval";
	}
}

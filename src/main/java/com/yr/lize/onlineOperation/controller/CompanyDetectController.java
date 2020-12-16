package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyDetectController {
	//跳转故障检测申请界面
	@RequestMapping("onlineOperation/companyDetect.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/companyDetect";
	}
	//跳转故障检测申请表界面
	@RequestMapping("onlineOperation/companyDetectForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/companyDetectForm";
	}
	//跳转故障检测审批界面
	@RequestMapping("onlineOperation/companyDetectApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/companyDetectApproval";
	}
	
	// 跳转手机端故障检测申请界面
	@RequestMapping("onlineOperation/mCompanyDetect.action")
	public String setupAllmCompanyDetect() {
		return "WEB-INF/views/mobile/onlineOperation/mCompanyDetect";
	}
	// 跳转手机端故障检测申请列表界面
	@RequestMapping("onlineOperation/mCompanyDetectList.action")
	public String setupAllmCompanyDetectList() {
		return "WEB-INF/views/mobile/onlineOperation/mCompanyDetectList";
	}
	// 跳转手机端故障检测申请列表详情界面
	@RequestMapping("onlineOperation/mCompanyDetectDetails.action")
	public String setupAllmCompanyDetectDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mCompanyDetectDetails";
	}
	// 跳转手机端故障检测审批列表界面
	@RequestMapping("onlineOperation/mCompanyDetectApprovalList.action")
	public String setupAllmTwoRateAbnormCompanyDetectApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mCompanyDetectApprovalList";
	}
	// 跳转手机端故障检测审批界面
	@RequestMapping("onlineOperation/mCompanyDetectApproval.action")
	public String setupAllmCompanyDetectApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mCompanyDetectApproval";
	}
}

package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SiteChangeRequestController {
	//跳转丽泽运营站点变更交接申请界面
	@RequestMapping("onlineOperation/siteChangeRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/siteChangeRequest";
	}
	//跳转丽泽运营站点变更交接申请表界面
	@RequestMapping("onlineOperation/siteChangeRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/siteChangeRequestForm";
	}
	//跳转丽泽运营站点变更交接审批界面
	@RequestMapping("onlineOperation/siteChangeRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/siteChangeRequestApproval";
	}
	
	// 跳转手机端丽泽运营站点变更交接申请界面
	@RequestMapping("onlineOperation/mSiteChangeRequest.action")
	public String setupAllmSiteChangeRequest() {
		return "WEB-INF/views/mobile/onlineOperation/mSiteChangeRequest";
	}
	// 跳转手机端丽泽运营站点变更交接申请列表界面
	@RequestMapping("onlineOperation/mSiteChangeRequestList.action")
	public String setupAllmSiteChangeRequestList() {
		return "WEB-INF/views/mobile/onlineOperation/mSiteChangeRequestList";
	}
	// 跳转手机端丽泽运营站点变更交接申请列表详情界面
	@RequestMapping("onlineOperation/mSiteChangeRequestDetails.action")
	public String setupAllmSiteChangeRequestDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mSiteChangeRequestDetails";
	}
	// 跳转手机端丽泽运营站点变更交接审批列表界面
	@RequestMapping("onlineOperation/mSiteChangeRequestApprovalList.action")
	public String setupAllmTwoRateAbnormSiteChangeRequestApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mSiteChangeRequestApprovalList";
	}
	// 跳转手机端丽泽运营站点变更交接审批界面
	@RequestMapping("onlineOperation/mSiteChangeRequestApproval.action")
	public String setupAllmSiteChangeRequestApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mSiteChangeRequestApproval";
	}
}

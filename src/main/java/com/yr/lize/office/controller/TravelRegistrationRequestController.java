package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelRegistrationRequestController {
	//跳转出差登记申请界面
		@RequestMapping("office/travelRegistrationRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/travelRegistrationRequest";
		//return "WEB-INF/views/mobile/office/mTravelRegistrationRequestList";
	}
	//跳转出差登记申请表界面
	@RequestMapping("office/travelRegistrationRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/travelRegistrationRequestForm";
		//return "WEB-INF/views/mobile/office/mTravelRegistrationRequest";
	}
	//跳转出差登记审批界面
	@RequestMapping("office/travelRegistrationApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/travelRegistrationApproval";
		//return "WEB-INF/views/mobile/office/mTravelRegistrationApprovalList";
	}
	
	// 跳转手机端出差登记申请界面
	@RequestMapping("office/mTravelRegistrationRequest.action")
	public String setupAllmTravelRegistrationRequest() {
		return "WEB-INF/views/mobile/office/mTravelRegistrationRequest";
	}
	// 跳转手机端出差登记申请列表界面
	@RequestMapping("office/mTravelRegistrationRequestList.action")
	public String setupAllmTravelRegistrationRequestList() {
		return "WEB-INF/views/mobile/office/mTravelRegistrationRequestList";
	}
	// 跳转手机端出差登记申请列表详情界面
	@RequestMapping("office/mTravelRegistrationRequestDetails.action")
	public String setupAllmTravelRegistrationRequestDetails() {
		return "WEB-INF/views/mobile/office/mTravelRegistrationRequestDetails";
	}
	// 跳转手机端出差登记审批列表界面
	@RequestMapping("office/mTravelRegistrationApprovalList.action")
	public String setupAllmTravelRegistrationApprovalList() {
		return "WEB-INF/views/mobile/office/mTravelRegistrationApprovalList";
	}
	// 跳转手机端出差登记审批界面
	@RequestMapping("office/mTravelRegistrationApproval.action")
	public String setupAllmTravelRegistrationApproval() {
		return "WEB-INF/views/mobile/office/mTravelRegistrationApproval";
	}
}

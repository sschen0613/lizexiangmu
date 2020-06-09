package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CarMaintainRequestController {
	//跳转车辆维修申请界面
	@RequestMapping("office/carMaintainRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/carMaintainRequest";
	}
	//跳转车辆维修申请表界面
	@RequestMapping("office/carMaintainRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/carMaintainRequestForm";
	}
	//跳转车辆维修审批界面
	@RequestMapping("office/carMaintainRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/carMaintainRequestApproval";
	}
	
	// 跳转手机端车辆维修申请界面
	@RequestMapping("office/mCarMaintainRequest.action")
	public String setupAllmCarMaintainRequest() {
		return "WEB-INF/views/mobile/office/mCarMaintainRequest";
	}
	// 跳转手机端车辆维修申请列表界面
	@RequestMapping("office/mCarMaintainRequestList.action")
	public String setupAllmCarMaintainRequestList() {
		return "WEB-INF/views/mobile/office/mCarMaintainRequestList";
	}
	// 跳转手机端车辆维修申请列表详情界面
	@RequestMapping("office/mCarMaintainRequestDetails.action")
	public String setupAllmCarMaintainRequestDetails() {
		return "WEB-INF/views/mobile/office/mCarMaintainRequestDetails";
	}
	// 跳转手机端车辆维修审批列表界面
	@RequestMapping("office/mCarMaintainRequestApprovalList.action")
	public String setupAllmCarMaintainRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mCarMaintainRequestApprovalList";
	}
	// 跳转手机端车辆维修审批界面
	@RequestMapping("office/mCarMaintainRequestApproval.action")
	public String setupAllmCarMaintainRequestApproval() {
		return "WEB-INF/views/mobile/office/mCarMaintainRequestApproval";
	}
}

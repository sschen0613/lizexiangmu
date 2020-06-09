package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class OnlineOperationAndMaintenanceRequestController {
	//跳转在线运维部调休申请界面
	@RequestMapping("office/onlineOperationAndMaintenanceRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/onlineOperationAndMaintenanceRequest";
	}
	//跳转在线运维部调休申请表界面
	@RequestMapping("office/onlineOperationAndMaintenanceRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/onlineOperationAndMaintenanceRequestForm";
	}
	//跳转在线运维部调休审批界面
	@RequestMapping("office/onlineOperationAndMaintenanceRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/onlineOperationAndMaintenanceRequestApproval";
	}
	
	// 跳转手机端在线运维部调休申请界面
	@RequestMapping("office/mOnlineOperationAndMaintenanceRequest.action")
	public String setupAllmOnlineOperationAndMaintenanceRequest() {
		return "WEB-INF/views/mobile/office/mOnlineOperationAndMaintenanceRequest";
	}
	// 跳转手机端在线运维部调休申请列表界面
	@RequestMapping("office/mOnlineOperationAndMaintenanceRequestList.action")
	public String setupAllmOnlineOperationAndMaintenanceRequestList() {
		return "WEB-INF/views/mobile/office/mOnlineOperationAndMaintenanceRequestList";
	}
	// 跳转手机端在线运维部调休申请列表详情界面
	@RequestMapping("office/mOnlineOperationAndMaintenanceRequestDetails.action")
	public String setupAllmOnlineOperationAndMaintenanceRequestDetails() {
		return "WEB-INF/views/mobile/office/mOnlineOperationAndMaintenanceRequestDetails";
	}
	// 跳转手机端在线运维部调休审批列表界面
	@RequestMapping("office/mOnlineOperationAndMaintenanceRequestApprovalList.action")
	public String setupAllmOnlineOperationAndMaintenanceRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mOnlineOperationAndMaintenanceRequestApprovalList";
	}
	// 跳转手机端在线运维部调休审批界面
	@RequestMapping("office/mOnlineOperationAndMaintenanceRequestApproval.action")
	public String setupAllmOnlineOperationAndMaintenanceRequestApproval() {
		return "WEB-INF/views/mobile/office/mOnlineOperationAndMaintenanceRequestApproval";
	}
}

package com.yr.lize.xzTesting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class EquipmentMaintainRequestController {
	//跳转信泽设备维修申请界面
	@RequestMapping("xzTesting/equipmentMaintainRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/xzTesting/equipmentMaintainRequest";
	}
	//跳转信泽设备维修申请表界面
	@RequestMapping("xzTesting/equipmentMaintainRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/xzTesting/equipmentMaintainRequestForm";
	}
	//跳转信泽设备维修审批界面
	@RequestMapping("xzTesting/equipmentMaintainRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/xzTesting/equipmentMaintainRequestApproval";
	}
	
	// 跳转手机端信泽设备维修申请界面
	@RequestMapping("xzTesting/mEquipmentMaintainRequest.action")
	public String setupAllmEquipmentMaintainRequest() {
		return "WEB-INF/views/mobile/xzTesting/mEquipmentMaintainRequest";
	}
	// 跳转手机端信泽设备维修申请列表界面
	@RequestMapping("xzTesting/mEquipmentMaintainRequestList.action")
	public String setupAllmEquipmentMaintainRequestList() {
		return "WEB-INF/views/mobile/xzTesting/mEquipmentMaintainRequestList";
	}
	// 跳转手机端信泽设备维修申请列表详情界面
	@RequestMapping("xzTesting/mEquipmentMaintainRequestDetails.action")
	public String setupAllmEquipmentMaintainRequestDetails() {
		return "WEB-INF/views/mobile/xzTesting/mEquipmentMaintainRequestDetails";
	}
	// 跳转手机端信泽设备维修审批列表界面
	@RequestMapping("xzTesting/mEquipmentMaintainRequestApprovalList.action")
	public String setupAllmEquipmentMaintainRequestApprovalList() {
		return "WEB-INF/views/mobile/xzTesting/mEquipmentMaintainRequestApprovalList";
	}
	// 跳转手机端信泽设备维修审批界面
	@RequestMapping("xzTesting/mEquipmentMaintainRequestApproval.action")
	public String setupAllmEquipmentMaintainRequestApproval() {
		return "WEB-INF/views/mobile/xzTesting/mEquipmentMaintainRequestApproval";
	}
}

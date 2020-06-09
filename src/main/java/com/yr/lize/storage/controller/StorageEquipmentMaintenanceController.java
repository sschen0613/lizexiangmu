package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StorageEquipmentMaintenanceController {
	//跳转货品流转信息表页面
	@RequestMapping("storage/storageFlowMassage.action")
	public String storageFlowMassage(){
		return "WEB-INF/views/storage/storageFlowMassage";
	}
	//跳转信泽设备维修申请界面
	@RequestMapping("storage/equipmentMaintenance.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/equipmentMaintenance";
	}
	//跳转信泽设备维修申请表界面
	@RequestMapping("storage/equipmentMaintenanceForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/equipmentMaintenanceForm";
	}	
	//跳转信泽设备维修审批界面
	@RequestMapping("storage/equipmentMaintenanceSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/equipmentMaintenanceApproval";
	}
	//跳转信泽设备维修审批打印界面
	@RequestMapping("storage/equipmentMaintenanceSuppliesApprovalPrint.action")
	public String setupAllocationApproverPrint() {
		return "WEB-INF/views/storage/equipmentMaintenanceApprovalPrint";
	}
	
	// 跳转手机端信泽设备维修申请界面
	@RequestMapping("storage/mEquipmentMaintenance.action")
	public String setupAllmOutlibraryOfMaterialClass() {
		return "WEB-INF/views/mobile/storage/mEquipmentMaintenance";
	}
	// 跳转手机端信泽设备维修申请列表界面
	@RequestMapping("storage/mEquipmentMaintenanceList.action")
	public String setupAllmOutlibraryOfMaterialClassList() {
		return "WEB-INF/views/mobile/storage/mEquipmentMaintenanceList";
	}
	// 跳转手机端信泽设备维修申请列表详情界面
	@RequestMapping("storage/mEquipmentMaintenanceDetails.action")
	public String setupAllmOutlibraryOfMaterialClassDetails() {
		return "WEB-INF/views/mobile/storage/mEquipmentMaintenanceDetails";
	}
	// 跳转手机端信泽设备维修审批列表界面
	@RequestMapping("storage/mEquipmentMaintenanceApprovalList.action")
	public String setupAllmOutlibraryOfMaterialClassApprovalList() {
		return "WEB-INF/views/mobile/storage/mEquipmentMaintenanceApprovalList";
	}
	// 跳转手机端信泽设备维修审批界面
	@RequestMapping("storage/mEquipmentMaintenanceApproval.action")
	public String setupAllmOutlibraryOfMaterialClassApproval() {
		return "WEB-INF/views/mobile/storage/mEquipmentMaintenanceApproval";
	}
}

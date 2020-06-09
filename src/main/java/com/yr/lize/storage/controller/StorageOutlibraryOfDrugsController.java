package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StorageOutlibraryOfDrugsController {
	//跳转药品出库申请界面
	@RequestMapping("storage/outlibraryOfDrugs.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/outlibraryOfDrugs";
	}
	//跳转药品出库申请表界面
	@RequestMapping("storage/outlibraryOfDrugsForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/outlibraryOfDrugsForm";
	}
	//跳转药品出库申请表编辑界面
	@RequestMapping("storage/outlibraryOfDrugsFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/outlibraryOfDrugsFormRevise";
	}
	//跳转药品出库审批界面
	@RequestMapping("storage/outlibraryOfDrugsSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/outlibraryOfDrugsApproval";
	}

	//跳转药品出库审批详情界面
	@RequestMapping("storage/outlibraryOfDrugsSuppliesApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/storage/outlibraryOfDrugsApprovalDetail";
	}
	
	// 跳转手机端丽泽内部出库申请界面
	@RequestMapping("storage/mOutlibraryOfDrugs.action")
	public String setupAllmOutlibraryOfDrugs() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfDrugs";
	}
	// 跳转手机端丽泽内部出库申请列表界面
	@RequestMapping("storage/mOutlibraryOfDrugsList.action")
	public String setupAllmOutlibraryOfDrugsList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfDrugsList";
	}
	// 跳转手机端丽泽内部出库申请列表详情界面
	@RequestMapping("storage/mOutlibraryOfDrugsDetails.action")
	public String setupAllmOutlibraryOfDrugsDetails() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfDrugsDetails";
	}
	// 跳转手机端丽泽内部出库审批列表界面
	@RequestMapping("storage/mOutlibraryOfDrugsApprovalList.action")
	public String setupAllmOutlibraryOfDrugsApprovalList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfDrugsApprovalList";
	}
	// 跳转手机端丽泽内部出库审批界面
	@RequestMapping("storage/mOutlibraryOfDrugsApproval.action")
	public String setupAllmOutlibraryOfDrugsApproval() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfDrugsApproval";
	}
}

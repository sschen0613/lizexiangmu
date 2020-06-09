package com.yr.lize.storage.controller;

import com.yr.lize.storage.service.IStorageOutlibraryOfAllocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StorageOutlibraryOfAllocationController {
	@Autowired
	IStorageOutlibraryOfAllocationService iStorageOutlibraryOfAllocationService;

	//跳转丽泽内部出库申请界面
	@RequestMapping("storage/outlibraryOfAllocation.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/outlibraryOfAllocation";
	}
	//跳转丽泽内部出库申请表界面
	@RequestMapping("storage/outlibraryOfAllocationForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/outlibraryOfAllocationForm";
	}
	//跳转丽泽内部出库申请表编辑界面
	@RequestMapping("storage/outlibraryOfAllocationFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/outlibraryOfAllocationFormRevise";
	}
	//跳转丽泽内部出库审批界面
	@RequestMapping("storage/outlibraryOfAllocationSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/outlibraryOfAllocationApproval";
	}

	//跳转丽泽内部出库审批详情界面
	@RequestMapping("storage/outlibraryOfAllocationSuppliesApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/storage/outlibraryOfAllocationApprovalDetail";
	}
	
	// 跳转手机端丽泽内部出库申请界面
	@RequestMapping("storage/mOutlibraryOfAllocation.action")
	public String setupAllmOutlibraryOfMaterialClass() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfAllocation";
	}
	// 跳转手机端丽泽内部出库申请列表界面
	@RequestMapping("storage/mOutlibraryOfAllocationList.action")
	public String setupAllmOutlibraryOfMaterialClassList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfAllocationList";
	}
	// 跳转手机端丽泽内部出库申请列表详情界面
	@RequestMapping("storage/mOutlibraryOfAllocationDetails.action")
	public String setupAllmOutlibraryOfMaterialClassDetails() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfAllocationDetails";
	}
	// 跳转手机端丽泽内部出库审批列表界面
	@RequestMapping("storage/mOutlibraryOfAllocationApprovalList.action")
	public String setupAllmOutlibraryOfMaterialClassApprovalList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfAllocationApprovalList";
	}
	// 跳转手机端丽泽内部出库审批界面
	@RequestMapping("storage/mOutlibraryOfAllocationApproval.action")
	public String setupAllmOutlibraryOfMaterialClassApproval() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfAllocationApproval";
	}


}

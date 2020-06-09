package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StorageOutlibraryOfMaterialController {
	//跳转信泽材料出库申请界面
	@RequestMapping("storage/outlibraryOfMaterial.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/outlibraryOfxzMaterial";
	}
	//跳转信泽材料出库申请表界面
	@RequestMapping("storage/outlibraryOfMaterialForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/outlibraryOfxzMaterialForm";
	}
	//跳转信泽材料出库申请表编辑界面
	@RequestMapping("storage/outlibraryOfMaterialFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/outlibraryOfxzMaterialFormRevise";
	}
	//跳转信泽材料出库审批界面
	@RequestMapping("storage/outlibraryOfMaterialSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/outlibraryOfxzMaterialApproval";
	}
	
	// 跳转手机端信泽材料出库申请界面
	@RequestMapping("storage/mOutlibraryOfMaterial.action")
	public String setupAllmOutlibraryOfMaterial() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfxzMaterial";
	}
	// 跳转手机端信泽材料出库申请列表界面
	@RequestMapping("storage/mOutlibraryOfMaterialList.action")
	public String setupAllmOutlibraryOfMaterialList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfxzMaterialList";
	}
	// 跳转手机端信泽材料出库申请列表详情界面
	@RequestMapping("storage/mOutlibraryOfMaterialDetails.action")
	public String setupAllmOutlibraryOfMaterialDetails() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfxzMaterialDetails";
	}
	// 跳转手机端信泽材料出库审批列表界面
	@RequestMapping("storage/mOutlibraryOfMaterialApprovalList.action")
	public String setupAllmOutlibraryOfMaterialClassApprovalList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfxzMaterialApprovalList";
	}
	// 跳转手机端信泽材料出库审批界面
	@RequestMapping("storage/mOutlibraryOfMaterialApproval.action")
	public String setupAllmOutlibraryOfMaterialClassApproval() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfxzMaterialApproval";
	}
}

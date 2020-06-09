package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StoragePurchaseOfEquipmentAndAssetController {
	//跳转信泽实验室设备及资产采购申请界面
	@RequestMapping("storage/purchaseOfEquipmentAndAsset.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/purchaseOfEquipmentAndAsset";
	}
	//跳转信泽实验室设备及资产采购申请表界面
	@RequestMapping("storage/purchaseOfEquipmentAndAssetForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/purchaseOfEquipmentAndAssetForm";
	}
	//跳转信泽实验室设备及资产采购申请表编辑界面
	@RequestMapping("storage/purchaseOfEquipmentAndAssetFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/purchaseOfEquipmentAndAssetFormRevise";
	}
	//跳转信泽实验室设备及资产采购审批界面
	@RequestMapping("storage/purchaseOfEquipmentAndAssetSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/purchaseOfEquipmentAndAssetApproval";
	}
	
	//跳转信泽实验室设备及资产采购打印界面
	@RequestMapping("storage/purchaseOfEquipmentAndAssetApprovalPrint.action")
	public String purchaseOfEquipmentAndAssetApprovalPrint() {
		return "WEB-INF/views/storage/purchaseOfEquipmentAndAssetApprovalPrint";
	}

	//跳转手机端信泽实验室设备及资产采购申请界面
	@RequestMapping("storage/mPurchaseOfEquipmentAndAsset.action")
	public String setupAllmPurchaseOfEquipmentAndAsset() {
		return "WEB-INF/views/mobile/storage/mPurchaseOfEquipmentAndAsset";
	}
	//跳转手机端信泽实验室设备及资产采购申请列表界面
	@RequestMapping("storage/mPurchaseOfEquipmentAndAssetList.action")
	public String setupAllmPurchaseOfEquipmentAndAssetList() {
		return "WEB-INF/views/mobile/storage/mPurchaseOfEquipmentAndAssetList";
	}
	//跳转手机端信泽实验室设备及资产采购申请列表详情界面
	@RequestMapping("storage/mPurchaseOfEquipmentAndAssetDetails.action")
	public String setupAllmPurchaseOfEquipmentAndAssetDetails() {
		return "WEB-INF/views/mobile/storage/mPurchaseOfEquipmentAndAssetDetails";
	}
	//跳转手机端信泽实验室设备及资产采购审批列表界面
	@RequestMapping("storage/mPurchaseOfEquipmentAndAssetApprovalList.action")
	public String setupAllmPurchaseOfEquipmentAndAssetSuppliesApprovalList() {
		return "WEB-INF/views/mobile/storage/mPurchaseOfEquipmentAndAssetApprovalList";
	}
	//跳转手机端信泽实验室设备及资产采购审批界面
	@RequestMapping("storage/purchaseOfEquipmentAndAssetApproval.action")
	public String setupAllmPurchaseOfEquipmentAndAssetSuppliesApproval() {
		return "WEB-INF/views/mobile/storage/mPurchaseOfEquipmentAndAssetApproval";
	}
	
	
}

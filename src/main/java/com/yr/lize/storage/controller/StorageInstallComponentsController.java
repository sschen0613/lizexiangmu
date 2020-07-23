package com.yr.lize.storage.controller;

import com.yr.lize.storage.service.IStorageRequisitionsOfStockupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StorageInstallComponentsController {
	@Autowired
	IStorageRequisitionsOfStockupService IStorageRequisitionsOfStockupService;

	// 跳转安装组配件采购申请界面
	@RequestMapping("storage/installComponentsRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/installComponents";
	}

	// 跳转安装组配件采购申请表界面
	@RequestMapping("storage/installComponentsForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/installComponentsForm";
	}
	
	// 跳转安装组配件采购申请表编辑界面
	@RequestMapping("storage/installComponentsFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/installComponentsFormRevise";
	}

	// 跳转安装组配件采购申请审批页面
	@RequestMapping("storage/installComponentsApproval.action")
	public String setupAllocationApproverViewApproval() {
		return "WEB-INF/views/storage/installComponentsApproval";
	}
	
	// 跳转手机端安装组配件采购申请界面
	@RequestMapping("storage/mInstallComponents.action")
	public String setupAllmInstallComponents() {
		return "WEB-INF/views/mobile/storage/mInstallComponents";
	}
	// 跳转手机端安装组配件采购申请列表界面
	@RequestMapping("storage/mInstallComponentsList.action")
	public String setupAllmInstallComponentsList() {
		return "WEB-INF/views/mobile/storage/mInstallComponentsList";
	}
	// 跳转手机端安装组配件采购申请列表详情界面
	@RequestMapping("storage/mInstallComponentsDetails.action")
	public String setupAllmInstallComponentsDetails() {
		return "WEB-INF/views/mobile/storage/mInstallComponentsDetails";
	}
	// 跳转手机端安装组配件采购申请审批列表页面
	@RequestMapping("storage/mInstallComponentsApprovalList.action")
	public String setupAllmInstallComponentsApprovalList() {
		return "WEB-INF/views/mobile/storage/mInstallComponentsApprovalList";
	}
	// 跳转手机端安装组配件采购申请审批页面
	@RequestMapping("storage/mInstallComponentsApproval.action")
	public String setupAllmInstallComponentsApproval() {
		return "WEB-INF/views/mobile/storage/mInstallComponentsApproval";
	}
}

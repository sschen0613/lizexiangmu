package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StorageTechnicalComponentsController {

	// 跳转技术保障部配件采购申请界面
	@RequestMapping("storage/technicalComponentsRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/technicalComponents";
	}

	// 跳转技术保障部配件采购申请表界面
	@RequestMapping("storage/technicalComponentsForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/technicalComponentsForm";
	}

	// 跳转技术保障部配件采购申请审批页面
	@RequestMapping("storage/technicalComponentsApproval.action")
	public String setupAllocationApproverViewApproval() {
		return "WEB-INF/views/storage/technicalComponentsApproval";
	}
	
	// 跳转手机端技术保障部配件采购申请界面
	@RequestMapping("storage/mTechnicalComponents.action")
	public String setupAllmTechnicalComponents() {
		return "WEB-INF/views/mobile/storage/mTechnicalComponents";
	}
	// 跳转手机端技术保障部配件采购申请列表界面
	@RequestMapping("storage/mTechnicalComponentsList.action")
	public String setupAllmTechnicalComponentsList() {
		return "WEB-INF/views/mobile/storage/mTechnicalComponentsList";
	}
	// 跳转手机端技术保障部配件采购申请列表详情界面
	@RequestMapping("storage/mTechnicalComponentsDetails.action")
	public String setupAllmTechnicalComponentsDetails() {
		return "WEB-INF/views/mobile/storage/mTechnicalComponentsDetails";
	}
	// 跳转手机端技术保障部配件采购申请审批列表页面
	@RequestMapping("storage/mTechnicalComponentsApprovalList.action")
	public String setupAllmTechnicalComponentsApprovalList() {
		return "WEB-INF/views/mobile/storage/mTechnicalComponentsApprovalList";
	}
	// 跳转手机端技术保障部配件采购申请审批页面
	@RequestMapping("storage/mTechnicalComponentsApproval.action")
	public String setupAllmTechnicalComponentsApproval() {
		return "WEB-INF/views/mobile/storage/mTechnicalComponentsApproval";
	}
}

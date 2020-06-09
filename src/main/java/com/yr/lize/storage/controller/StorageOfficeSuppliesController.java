package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StorageOfficeSuppliesController {
	//跳转办公用品申请界面
	@RequestMapping("storage/officeSupplies.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/officeSupplies";
	}
	//跳转办公用品申请表界面
	@RequestMapping("storage/officeSuppliesForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/officeSuppliesForm";
	}
	//跳转办公用品审批表界面
	@RequestMapping("storage/officeSuppliesApproval.action")
	public String setupAllofficeSuppliesApproval() {
		return "WEB-INF/views/storage/officeSuppliesApproval";
	}

	// 跳转手机端办公用品申请界面
	@RequestMapping("storage/mOfficeSupplies.action")
	public String setupAllmOfficeSupplies() {
		return "WEB-INF/views/mobile/storage/mOfficeSupplies";
	}
	// 跳转手机端办公用品申请列表界面
	@RequestMapping("storage/mOfficeSuppliesList.action")
	public String setupAllmOfficeSuppliesList() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesList";
	}
	// 跳转手机端办公用品申请界面
	@RequestMapping("storage/mOfficeSuppliesDetails.action")
	public String setupAllmOfficeSuppliesDetails() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesDetails";
	}
	// 跳转手机端办公用品审批列表界面
	@RequestMapping("storage/mOfficeSuppliesApprovalList.action")
	public String setupAllmOfficeSuppliesApprovalList() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesApprovalList";
	}
	// 跳转手机端办公用品审批界面
	@RequestMapping("storage/mOfficeSuppliesApproval.action")
	public String setupAllmOfficeSuppliesApproval() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesApproval";
	}


	//跳转办公用品申请界面
	@RequestMapping("storage/officeSupplies1.action")
	public String setupAllocationApproverView11() {
		return "WEB-INF/views/storage/officeSupplies1";
	}
	//跳转办公用品申请表界面
	@RequestMapping("storage/officeSuppliesForm1.action")
	public String setupAllocationApproverView21() {
		return "WEB-INF/views/storage/officeSuppliesForm1";
	}
	//跳转办公用品审批表界面
	@RequestMapping("storage/officeSuppliesApproval1.action")
	public String setupAllofficeSuppliesApproval1() {
		return "WEB-INF/views/storage/officeSuppliesApproval1";
	}

	// 跳转手机端办公用品申请界面
	@RequestMapping("storage/mOfficeSupplies1.action")
	public String setupAllmOfficeSupplies1() {
		return "WEB-INF/views/mobile/storage/mOfficeSupplies1";
	}
	// 跳转手机端办公用品申请列表界面
	@RequestMapping("storage/mOfficeSuppliesList1.action")
	public String setupAllmOfficeSuppliesList1() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesList1";
	}
	// 跳转手机端办公用品申请界面
	@RequestMapping("storage/mOfficeSuppliesDetails1.action")
	public String setupAllmOfficeSuppliesDetails1() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesDetails1";
	}
	// 跳转手机端办公用品审批列表界面
	@RequestMapping("storage/mOfficeSuppliesApprovalList1.action")
	public String setupAllmOfficeSuppliesApprovalList1() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesApprovalList1";
	}
	// 跳转手机端办公用品审批界面
	@RequestMapping("storage/mOfficeSuppliesApproval1.action")
	public String setupAllmOfficeSuppliesApproval1() {
		return "WEB-INF/views/mobile/storage/mOfficeSuppliesApproval1";
	}
}

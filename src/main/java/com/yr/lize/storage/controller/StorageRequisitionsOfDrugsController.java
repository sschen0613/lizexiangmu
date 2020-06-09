package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StorageRequisitionsOfDrugsController {
	//跳转信泽药品请购申请界面
	@RequestMapping("storage/requisitionsOfDrugs.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/requisitionsOfDrugs";
	}
	//跳转信泽药品请购申请表界面
	@RequestMapping("storage/requisitionsOfDrugsForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/requisitionsOfDrugsForm";
	}
	//跳转信泽药品请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfDrugsFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/requisitionsOfDrugsFormRevise";
	}
	//跳转信泽药品请购审批界面
	@RequestMapping("storage/requisitionsOfDrugsSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/requisitionsOfDrugsApproval";
	}

	//跳转信泽药品请购审批详情界面
	@RequestMapping("storage/requisitionsOfDrugsSuppliesApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/storage/requisitionsOfDrugsApprovalDetail";
	}

	//跳转信泽药品请购审批打印界面
	@RequestMapping("storage/requisitionsOfDrugsSuppliesApprovalPrint.action")
	public String setupAllocationApproverPrint() {
		return "WEB-INF/views/storage/requisitionsOfDrugsApprovalPrint";
	}
	
	//跳转手机端信泽药品请购申请界面
	@RequestMapping("storage/mRequisitionsOfDrugs.action")
	public String setupAllmRequisitionsOfDrugs() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfDrugs";
	}
	//跳转手机端信泽药品请购申请列表界面
	@RequestMapping("storage/mRequisitionsOfDrugsList.action")
	public String setupAllmRequisitionsOfDrugsList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfDrugsList";
	}
	//跳转手机端信泽药品请购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfDrugsDetails.action")
	public String setupAllmRequisitionsOfDrugsDetails() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfDrugsDetails";
	}
	//跳转手机端信泽药品请购审批列表界面
	@RequestMapping("storage/mRequisitionsOfDrugsApprovalList.action")
	public String setupAllmRequisitionsOfDrugsApprovalList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfDrugsApprovalList";
	}
	//跳转手机端信泽药品请购审批界面
	@RequestMapping("storage/mRequisitionsOfDrugsApproval.action")
	public String setupAllmRequisitionsOfDrugsApproval() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfDrugsApproval";
	}
}

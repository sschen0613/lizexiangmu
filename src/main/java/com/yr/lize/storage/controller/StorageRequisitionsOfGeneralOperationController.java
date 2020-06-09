package com.yr.lize.storage.controller;

import com.yr.lize.storage.service.IStorageRequisitionsOfGeneralOperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StorageRequisitionsOfGeneralOperationController {

	@Autowired
	IStorageRequisitionsOfGeneralOperationService iStorageRequisitionsOfGeneralOperationService;

	//跳转普通运营请购申请界面
	@RequestMapping("storage/requisitionsOfGeneralOperation.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/requisitionsOfGeneralOperation";
		//return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationList";//手機端，測試用。
	}
	//跳转普通运营请购申请表界面
	@RequestMapping("storage/requisitionsOfGeneralOperationForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/requisitionsOfGeneralOperationForm";
	}
	//跳转普通运营请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfGeneralOperationFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/requisitionsOfGeneralOperationFormRevise";
	}
	//跳转普通运营请购审批界面
	@RequestMapping("storage/requisitionsOfGeneralOperationSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/requisitionsOfGeneralOperationApproval";
		//return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationApprovalList";
	}

	//跳转普通运营请购详情界面
	@RequestMapping("storage/setupAllocationApproverDetail.action")
	public String setupAllocationApproverDetail() {
		return "WEB-INF/views/storage/setupAllocationApproverDetail";
	}

	//跳转普通运营请购打印界面
	@RequestMapping("storage/setupAllocationApproverPrint.action")
	public String setupAllocationApproverPrint() {
		return "WEB-INF/views/storage/setupAllocationApproverPrint";
	}
	//跳转手机端普通运营请购申请界面
	@RequestMapping("storage/mRequisitionsOfGeneralOperation.action")
	public String setupAllmRequisitionsOfGeneralOperation() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperation";
	}
	//跳转手机端普通运营请购申请列表界面
	@RequestMapping("storage/mRequisitionsOfGeneralOperationList.action")
	public String setupAllmRequisitionsOfGeneralOperationList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationList";
	}
	//跳转手机端普通运营请购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfGeneralOperationDetails.action")
	public String setupAllmRequisitionsOfGeneralOperationDetails() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationDetails";
	}
	//跳转手机端普通运营请购审批列表界面
	@RequestMapping("storage/mRequisitionsOfGeneralOperationSuppliesApprovalList.action")
	public String setupAllmRequisitionsOfGeneralOperationApprovalList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationApprovalList";
	}
	//跳转手机端普通运营请购审批界面
	@RequestMapping("storage/mRequisitionsOfGeneralOperationSuppliesApproval.action")
	public String setupAllmRequisitionsOfGeneralOperationApproval() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfGeneralOperationApproval";
	}
}

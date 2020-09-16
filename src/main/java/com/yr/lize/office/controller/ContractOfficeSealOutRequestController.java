package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ContractOfficeSealOutRequestController {

	//跳转办公用品申请界面
	@RequestMapping("office/contractOfficeSealOut.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/contractOfficeSealOut";
		//return "WEB-INF/views/mobile/office/mContractOfficeSealOut";
		//return "WEB-INF/views/mobile/office/mOfficeSealOutList";
	}
	//跳转办公用品申请表界面
	@RequestMapping("office/contractOfficeSealOutForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/contractOfficeSealOutForm";
	}
	//跳转办公用品审批表界面
	@RequestMapping("office/contractOfficeSealOutApproval.action")
	public String setupAllcontractOfficeSealOutApproval() {
		return "WEB-INF/views/office/contractOfficeSealOutApproval";
	}

	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mContractOfficeSealOut.action")
	public String setupAllmContractOfficeSealOut() {
		return "WEB-INF/views/mobile/office/mContractOfficeSealOut";
	}
	// 跳转手机端办公用品申请列表界面
	@RequestMapping("office/mContractOfficeSealOutList.action")
	public String setupAllmContractOfficeSealOutList() {
		return "WEB-INF/views/mobile/office/mContractOfficeSealOutList";
	}
	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mContractOfficeSealOutDetails.action")
	public String setupAllmContractOfficeSealOutDetails() {
		return "WEB-INF/views/mobile/office/mContractOfficeSealOutDetails";
	}
	// 跳转手机端办公用品审批列表界面
	@RequestMapping("office/mContractOfficeSealOutApprovalList.action")
	public String setupAllmContractOfficeSealOutApprovalList() {
		return "WEB-INF/views/mobile/office/mContractOfficeSealOutApprovalList";
	}
	// 跳转手机端办公用品审批界面
	@RequestMapping("office/mContractOfficeSealOutApproval.action")
	public String setupAllmContractOfficeSealOutApproval() {
		return "WEB-INF/views/mobile/office/mContractOfficeSealOutApproval";
	}
}

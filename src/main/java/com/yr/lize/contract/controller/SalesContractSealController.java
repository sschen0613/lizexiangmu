package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SalesContractSealController {
	//跳转销售合同盖章申请（丽泽）界面
	@RequestMapping("contract/salesContractSeal.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/salesContractSeal";
	}
	//跳转销售合同盖章申请（丽泽）表界面
	@RequestMapping("contract/salesContractSealForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/salesContractSealForm";
	}
	//跳转销售合同盖章审批（丽泽）界面
	@RequestMapping("contract/salesContractSealApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/salesContractSealApproval";
	}
	
	// 跳转手机端销售合同盖章申请（丽泽）界面
	@RequestMapping("contract/mSalesContractSeal.action")
	public String setupAllmSalesContractSeal() {
		return "WEB-INF/views/mobile/contract/mSalesContractSeal";
	}
	// 跳转手机端销售合同盖章申请（丽泽）列表界面
	@RequestMapping("contract/mSalesContractSealList.action")
	public String setupAllmSalesContractSealList() {
		return "WEB-INF/views/mobile/contract/mSalesContractSealList";
	}
	// 跳转手机端销售合同盖章申请（丽泽）列表详情界面
	@RequestMapping("contract/mSalesContractSealDetails.action")
	public String setupAllmSalesContractSealDetails() {
		return "WEB-INF/views/mobile/contract/mSalesContractSealDetails";
	}
	// 跳转手机端销售合同盖章审批（丽泽）列表界面
	@RequestMapping("contract/mSalesContractSealApprovalList.action")
	public String setupAllmSalesContractSealApprovalList() {
		return "WEB-INF/views/mobile/contract/mSalesContractSealApprovalList";
	}
	// 跳转手机端销售合同盖章审批（丽泽）界面
	@RequestMapping("contract/mSalesContractSealApproval.action")
	public String setupAllmSalesContractSealApproval() {
		return "WEB-INF/views/mobile/contract/mSalesContractSealApproval";
	}
}

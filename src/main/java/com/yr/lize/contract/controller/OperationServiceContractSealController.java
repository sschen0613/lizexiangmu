package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class OperationServiceContractSealController {
	//跳转运营服务合同盖章申请（丽泽）界面
	@RequestMapping("contract/operationServiceContractSeal.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/operationServiceContractSeal";
	}
	//跳转运营服务合同盖章申请（丽泽）表界面
	@RequestMapping("contract/operationServiceContractSealForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/operationServiceContractSealForm";
		//return "WEB-INF/views/mobile/contract/mOperationServiceContractSeal";
	}
	//跳转运营服务合同盖章审批（丽泽）界面
	@RequestMapping("contract/operationServiceContractSealApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/operationServiceContractSealApproval";
	}
	
	// 跳转手机端运营服务合同盖章申请（丽泽）界面
	@RequestMapping("contract/mOperationServiceContractSeal.action")
	public String setupAllmOperationServiceContractSeal() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractSeal";
	}
	// 跳转手机端运营服务合同盖章申请（丽泽）列表界面
	@RequestMapping("contract/mOperationServiceContractSealList.action")
	public String setupAllmOperationServiceContractSealList() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractSealList";
	}
	// 跳转手机端运营服务合同盖章申请（丽泽）列表详情界面
	@RequestMapping("contract/mOperationServiceContractSealDetails.action")
	public String setupAllmOperationServiceContractSealDetails() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractSealDetails";
	}
	// 跳转手机端运营服务合同盖章审批（丽泽）列表界面
	@RequestMapping("contract/mOperationServiceContractSealApprovalList.action")
	public String setupAllmOperationServiceContractSealApprovalList() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractSealApprovalList";
	}
	// 跳转手机端运营服务合同盖章审批（丽泽）界面
	@RequestMapping("contract/mOperationServiceContractSealApproval.action")
	public String setupAllmOperationServiceContractSealApproval() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractSealApproval";
	}
}

package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TechnicalServiceContractSealController {
    //跳转信泽技术服务合同盖章申请（丽泽）页面
	@RequestMapping("contract/technicalServiceContractSeal.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/technicalServiceContractSeal";
	}
    //跳转信泽技术服务合同盖章申请（丽泽）表页面
	@RequestMapping("contract/technicalServiceContractSealForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/technicalServiceContractSealForm";
		//return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSeal";
	}
    //跳转信泽技术服务合同盖章审批（丽泽）页面
	@RequestMapping("contract/technicalServiceContractSealApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/technicalServiceContractSealApproval";
	}
	
	// 跳转手机端信泽技术服务合同盖章申请（丽泽）界面
	@RequestMapping("contract/mTechnicalServiceContractSeal.action")
	public String setupAllmTechnicalServiceContractSeal() {
		return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSeal";
	}
	// 跳转手机端信泽技术服务合同盖章申请（丽泽）列表界面
	@RequestMapping("contract/mTechnicalServiceContractSealList.action")
	public String setupAllmTechnicalServiceContractSealList() {
		return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSealList";
	}
	// 跳转手机端信泽技术服务合同盖章申请（丽泽）列表详情界面
	@RequestMapping("contract/mTechnicalServiceContractSealDetails.action")
	public String setupAllmTechnicalServiceContractSealDetails() {
		return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSealDetails";
	}
	// 跳转手机端信泽技术服务合同盖章审批（丽泽）列表界面
	@RequestMapping("contract/mTechnicalServiceContractSealApprovalList.action")
	public String setupAllmTechnicalServiceContractSealApprovalList() {
		return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSealApprovalList";
	}
	// 跳转手机端信泽技术服务合同盖章审批（丽泽）界面
	@RequestMapping("contract/mTechnicalServiceContractSealApproval.action")
	public String setupAllmTechnicalServiceContractSealApproval() {
		return "WEB-INF/views/mobile/contract/mTechnicalServiceContractSealApproval";
	}
}

package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class LzTechnicalServiceContractSealController {
    //跳转丽泽技术服务合同盖章申请（丽泽）页面
	@RequestMapping("contract/lzTechnicalServiceContractSeal.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/lzTechnicalServiceContractSeal";
	}
    //跳转丽泽技术服务合同盖章申请（丽泽）表页面
	@RequestMapping("contract/lzTechnicalServiceContractSealForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/lzTechnicalServiceContractSealForm";
	}
    //跳转丽泽技术服务合同盖章审批（丽泽）页面
	@RequestMapping("contract/lzTechnicalServiceContractSealApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/lzTechnicalServiceContractSealApproval";
	}
	
	// 跳转手机端丽泽技术服务合同盖章申请（丽泽）界面
	@RequestMapping("contract/mLzTechnicalServiceContractSeal.action")
	public String setupAllmLzTechnicalServiceContractSeal() {
		return "WEB-INF/views/mobile/contract/mLzTechnicalServiceContractSeal";
	}
	// 跳转手机端丽泽技术服务合同盖章申请（丽泽）列表界面
	@RequestMapping("contract/mLzTechnicalServiceContractSealList.action")
	public String setupAllmLzTechnicalServiceContractSealList() {
		return "WEB-INF/views/mobile/contract/mLzTechnicalServiceContractSealList";
	}
	// 跳转手机端丽泽技术服务合同盖章申请（丽泽）列表详情界面
	@RequestMapping("contract/mLzTechnicalServiceContractSealDetails.action")
	public String setupAllmLzTechnicalServiceContractSealDetails() {
		return "WEB-INF/views/mobile/contract/mLzTechnicalServiceContractSealDetails";
	}
	// 跳转手机端丽泽技术服务合同盖章审批（丽泽）列表界面
	@RequestMapping("contract/mLzTechnicalServiceContractSealApprovalList.action")
	public String setupAllmLzTechnicalServiceContractSealApprovalList() {
		return "WEB-INF/views/mobile/contract/mLzTechnicalServiceContractSealApprovalList";
	}
	// 跳转手机端丽泽技术服务合同盖章审批（丽泽）界面
	@RequestMapping("contract/mLzTechnicalServiceContractSealApproval.action")
	public String setupAllmLzTechnicalServiceContractSealApproval() {
		return "WEB-INF/views/mobile/contract/mLzTechnicalServiceContractSealApproval";
	}
}

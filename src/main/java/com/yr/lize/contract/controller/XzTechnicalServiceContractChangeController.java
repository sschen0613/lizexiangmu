package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class XzTechnicalServiceContractChangeController {
    //跳转信泽技术服务合变更章申请变更页面
	@RequestMapping("contract/xzTechnicalServiceContractChange.action")
	public String setupAllocationApproverView1() {
		//return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChange";
		//return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeList";
		return "WEB-INF/views/contract/xzTechnicalServiceContractChange";
	}
    //跳转信泽技术服务合变更章申请变更表页面
	@RequestMapping("contract/xzTechnicalServiceContractChangeForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/xzTechnicalServiceContractChangeForm";
	}
    //跳转信泽技术服务合变更章审批变更页面
	@RequestMapping("contract/xzTechnicalServiceContractChangeApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/xzTechnicalServiceContractChangeApproval";
		//return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeApprovalList";
	}

	//山东丽泽销售请购审批详情界面
	@RequestMapping("contract/xzTechnicalServiceContractChangeApprovalDetail.action")
	public String setupAllocationApproverDetail() {
		return "WEB-INF/views/mobile/contract/xzTechnicalServiceContractChangeDetail";
	}
	
	// 跳转手机端信泽技术服务合变更章申请变更界面
	@RequestMapping("contract/mXzTechnicalServiceContractChange.action")
	public String setupAllmXzTechnicalServiceContractChange() {
		return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChange";
	}
	// 跳转手机端信泽技术服务合变更章申请变更列表界面
	@RequestMapping("contract/mXzTechnicalServiceContractChangeList.action")
	public String setupAllmXzTechnicalServiceContractChangeList() {
		return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeList";
	}
	// 跳转手机端信泽技术服务合变更章申请变更列表详情界面
	@RequestMapping("contract/mXzTechnicalServiceContractChangeDetails.action")
	public String setupAllmXzTechnicalServiceContractChangeDetails() {
		return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeDetails";
	}
	// 跳转手机端信泽技术服务合变更章审批变更列表界面
	@RequestMapping("contract/mXzTechnicalServiceContractChangeApprovalList.action")
	public String setupAllmXzTechnicalServiceContractChangeApprovalList() {
		return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeApprovalList";
	}
	// 跳转手机端信泽技术服务合变更章审批变更界面
	@RequestMapping("contract/mXzTechnicalServiceContractChangeApproval.action")
	public String setupAllmXzTechnicalServiceContractChangeApproval() {
		return "WEB-INF/views/mobile/contract/mXzTechnicalServiceContractChangeApproval";
	}
}

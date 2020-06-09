package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class OperationServiceContractChangeController {
    //跳转丽泽运营服务合同变更申请（丽泽）页面
	@RequestMapping("contract/operationServiceContractChange.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/operationServiceContractChange";
	}
    //跳转丽泽运营服务合同变更申请（丽泽）表页面
	@RequestMapping("contract/operationServiceContractChangeForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/operationServiceContractChangeForm";
	}
    //跳转丽泽运营服务合同变更审批（丽泽）页面
	@RequestMapping("contract/operationServiceContractChangeApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/operationServiceContractChangeApproval";
	}
	
	// 跳转手机丽泽运营服务合同变更申请（丽泽）界面
	@RequestMapping("contract/mOperationServiceContractChange.action")
	public String setupAllmOperationServiceContractChange() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractChange";
	}
	// 跳转手机丽泽运营服务合同变更申请（丽泽）列表界面
	@RequestMapping("contract/mOperationServiceContractChangeList.action")
	public String setupAllmOperationServiceContractChangeList() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractChangeList";
	}
	// 跳转手机端丽泽运营服务合同变更申请（丽泽）列表详情界面
	@RequestMapping("contract/mOperationServiceContractChangeDetails.action")
	public String setupAllmOperationServiceContractChangeDetails() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractChangeDetails";
	}
	// 跳转手机端丽泽运营服务合同变更审批（丽泽）列表界面
	@RequestMapping("contract/mOperationServiceContractChangeApprovalList.action")
	public String setupAllmOperationServiceContractChangeApprovalList() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractChangeApprovalList";
	}
	// 跳转手机端丽泽运营服务合同变更审批（丽泽）界面
	@RequestMapping("contract/mOperationServiceContractChangeApproval.action")
	public String setupAllmOperationServiceContractChangeApproval() {
		return "WEB-INF/views/mobile/contract/mOperationServiceContractChangeApproval";
	}
}

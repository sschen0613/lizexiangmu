package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OtherContractSealController {
    //跳转其他合同盖章申请页面
	@RequestMapping("contract/otherContractSeal.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/otherContractSeal";
		//return "WEB-INF/views/mobile/contract/mOtherContractSealList";
		//return "WEB-INF/views/mobile/contract/mOtherContractSeal";
	}
    //跳转其他合同盖章申请表页面
	@RequestMapping("contract/otherContractSealForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/otherContractSealForm";
	}
    //跳转其他合同盖章审批页面
	@RequestMapping("contract/otherContractSealApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/otherContractSealApproval";
		//return "WEB-INF/views/mobile/contract/mOtherContractSealApprovalList";
	}
	
	// 跳转手机其他合同盖章申请界面
	@RequestMapping("contract/mOtherContractSeal.action")
	public String setupAllmotherContractSeal() {
		return "WEB-INF/views/mobile/contract/mOtherContractSeal";
	}
	// 跳转手机其他合同盖章申请列表界面
	@RequestMapping("contract/mOtherContractSealList.action")
	public String setupAllmotherContractSealList() {
		return "WEB-INF/views/mobile/contract/mOtherContractSealList";
	}
	// 跳转手机端其他合同盖章申请列表详情界面
	@RequestMapping("contract/mOtherContractSealDetails.action")
	public String setupAllmotherContractSealDetails() {
		return "WEB-INF/views/mobile/contract/mOtherContractSealDetails";
	}
	// 跳转手机端其他合同盖章审批列表界面
	@RequestMapping("contract/mOtherContractSealApprovalList.action")
	public String setupAllmotherContractSealApprovalList() {
		return "WEB-INF/views/mobile/contract/mOtherContractSealApprovalList";
	}
	// 跳转手机端其他合同盖章审批界面
	@RequestMapping("contract/mOtherContractSealApproval.action")
	public String setupAllmotherContractSealApproval() {
		return "WEB-INF/views/mobile/contract/mOtherContractSealApproval";
	}
}

package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OfficeSealOutRequestController {

	//跳转办公用品申请界面
	@RequestMapping("office/officeSealOut.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/officeSealOut";
		//return "WEB-INF/views/mobile/office/mOfficeSealOutList";
	}
	//跳转办公用品申请表界面
	@RequestMapping("office/officeSealOutForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/officeSealOutForm";
	}
	//跳转办公用品审批表界面
	@RequestMapping("office/officeSealOutApproval.action")
	public String setupAllofficeSealOutApproval() {
		return "WEB-INF/views/office/officeSealOutApproval";
	}

	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mOfficeSealOut.action")
	public String setupAllmOfficeSealOut() {
		return "WEB-INF/views/mobile/office/mOfficeSealOut";
	}
	// 跳转手机端办公用品申请列表界面
	@RequestMapping("office/mOfficeSealOutList.action")
	public String setupAllmOfficeSealOutList() {
		return "WEB-INF/views/mobile/office/mOfficeSealOutList";
	}
	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mOfficeSealOutDetails.action")
	public String setupAllmOfficeSealOutDetails() {
		return "WEB-INF/views/mobile/office/mOfficeSealOutDetails";
	}
	// 跳转手机端办公用品审批列表界面
	@RequestMapping("office/mOfficeSealOutApprovalList.action")
	public String setupAllmOfficeSealOutApprovalList() {
		return "WEB-INF/views/mobile/office/mOfficeSealOutApprovalList";
	}
	// 跳转手机端办公用品审批界面
	@RequestMapping("office/mOfficeSealOutApproval.action")
	public String setupAllmOfficeSealOutApproval() {
		return "WEB-INF/views/mobile/office/mOfficeSealOutApproval";
	}
}

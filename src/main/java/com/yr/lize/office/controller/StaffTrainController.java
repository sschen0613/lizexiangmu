package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StaffTrainController {

	//跳转员工补卡申请界面
	@RequestMapping("office/staffTrain.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/staffTrain";
		//return "WEB-INF/views/mobile/office/mStaffTrainList";
	}
	//跳转员工补卡申请表界面
	@RequestMapping("office/staffTrainForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/staffTrainForm";
	}
	//跳转员工补卡审批表界面
	@RequestMapping("office/staffTrainApproval.action")
	public String setupAllStaffTrainApproval() {
		return "WEB-INF/views/office/staffTrainApproval";
	}

	// 跳转手机端员工补卡申请界面
	/*@RequestMapping("office/mCardReplacement.action")
	public String setupAllmCardReplacement() {
		return "WEB-INF/views/mobile/office/mCardReplacement";
	}
	// 跳转手机端员工补卡申请列表界面
	@RequestMapping("office/mCardReplacementList.action")
	public String setupAllmCardReplacementList() {
		return "WEB-INF/views/mobile/office/mCardReplacementList";
	}
	// 跳转手机端员工补卡申请界面
	@RequestMapping("office/mCardReplacementDetails.action")
	public String setupAllmCardReplacementDetails() {
		return "WEB-INF/views/mobile/office/mCardReplacementDetails";
	}*/
	// 跳转手机端员工补卡审批列表界面
	@RequestMapping("office/mStaffTrainApprovalApprovalList.action")
	public String setupAllmCardReplacementApprovalList() {
		return "WEB-INF/views/mobile/office/mStaffTrainApprovalList";
	}
	// 跳转手机端员工补卡审批界面
	@RequestMapping("office/mStaffTrainApproval.action")
	public String setupAllmCardReplacementApproval() {
		return "WEB-INF/views/mobile/office/mStaffTrainApproval";
	}
}

package com.yr.lize.office.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class OutPrintRequestController {
	//跳转外出打印申请界面
	@RequestMapping("office/outPrintRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/outPrintRequest";
	}
	//跳转外出打印申请表界面
	@RequestMapping("office/outPrintRequestForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/outPrintRequestForm";
	}
	//跳转外出打印审批界面
	@RequestMapping("office/outPrintRequestApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/office/outPrintRequestApproval";
	}
	
	// 跳转手机端外出打印申请界面
	@RequestMapping("office/mOutPrintRequest.action")
	public String setupAllmOutPrintRequest() {
		return "WEB-INF/views/mobile/office/mOutPrintRequest";
	}
	// 跳转手机端外出打印申请列表界面
	@RequestMapping("office/mOutPrintRequestList.action")
	public String setupAllmOutPrintRequestList() {
		return "WEB-INF/views/mobile/office/mOutPrintRequestList";
	}
	// 跳转手机端外出打印申请列表详情界面
	@RequestMapping("office/mOutPrintRequestDetails.action")
	public String setupAllmOutPrintRequestDetails() {
		return "WEB-INF/views/mobile/office/mOutPrintRequestDetails";
	}
	// 跳转手机端外出打印审批列表界面
	@RequestMapping("office/mOutPrintRequestApprovalList.action")
	public String setupAllmOutPrintRequestApprovalList() {
		return "WEB-INF/views/mobile/office/mOutPrintRequestApprovalList";
	}
	// 跳转手机端外出打印审批界面
	@RequestMapping("office/mOutPrintRequestApproval.action")
	public String setupAllmOutPrintRequestApproval() {
		return "WEB-INF/views/mobile/office/mOutPrintRequestApproval";
	}
}

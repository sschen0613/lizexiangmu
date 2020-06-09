package com.yr.lize.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class InvoiceOfInspectionContractController {
	//跳转检测合同发票开具申请（信泽）页面
	@RequestMapping("finance/invoiceOfInspectionContract.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/finance/invoiceOfInspectionContract";
		//return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContract";
	}
	//跳转检测合同发票开具申请（信泽）表页面
	@RequestMapping("finance/invoiceOfInspectionContractForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/finance/invoiceOfInspectionContractForm";
	}
	//跳转检测合同发票开具审批（信泽）页面
	@RequestMapping("finance/invoiceOfInspectionContractApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/finance/invoiceOfInspectionContractApproval";
	}

	//跳转检测合同发票开具审批（信泽）页面
	@RequestMapping("finance/invoiceOfInspectionContractApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/finance/invoiceOfInspectionContractApprovalDetail";
	}
	
	// 跳转手机端检测合同发票开具申请（信泽）界面
	@RequestMapping("finance/mInvoiceOfInspectionContract.action")
	public String setupAllmInvoiceOfInspectionContract() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContract";
	}
	// 跳转手机端检测合同发票开具申请（信泽）列表界面
	@RequestMapping("finance/mInvoiceOfInspectionContractList.action")
	public String setupAllmInvoiceOfInspectionContractList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContractList";
	}
	// 跳转手机端检测合同发票开具申请（信泽）列表详情界面
	@RequestMapping("finance/mInvoiceOfInspectionContractDetails.action")
	public String setupAllmInvoiceOfInspectionContractDetails() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContractDetails";
	}
	// 跳转手机端检测合同发票开具审批（信泽）列表界面
	@RequestMapping("finance/mInvoiceOfInspectionContractApprovalList.action")
	public String setupAllmInvoiceOfInspectionContractApprovalList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContractApprovalList";
	}
	// 跳转手机端检测合同发票开具审批（信泽）界面
	@RequestMapping("finance/mInvoiceOfInspectionContractApproval.action")
	public String setupAllmInvoiceOfInspectionContractApproval() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfInspectionContractApproval";
	}
}

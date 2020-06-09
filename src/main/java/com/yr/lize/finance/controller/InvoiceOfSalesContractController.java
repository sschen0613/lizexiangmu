package com.yr.lize.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class InvoiceOfSalesContractController {
    //跳转销售合同发票开具申请（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContract.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/finance/invoiceOfSalesContract";
		//return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContract";
	}
    //跳转销售合同发票开具申请（丽泽）表页面
	@RequestMapping("finance/invoiceOfSalesContractForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/finance/invoiceOfSalesContractForm";
	}
    //跳转销售合同发票开具审批（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContractApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/finance/invoiceOfSalesContractApproval";
	}

	//跳转销售合同发票开具审批（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContractApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/finance/invoiceOfSalesContractApprovalDetail";
	}
	
	// 跳转手机端销售合同发票开具申请（丽泽）界面
	@RequestMapping("finance/mInvoiceOfSalesContract.action")
	public String setupAllmInvoiceOfSalesContract() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContract";
	}
	// 跳转手机端销售合同发票开具申请（丽泽）列表界面
	@RequestMapping("finance/mInvoiceOfSalesContractList.action")
	public String setupAllmInvoiceOfSalesContractList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractList";
	}
	// 跳转手机端销售合同发票开具申请（丽泽）列表详情界面
	@RequestMapping("finance/mInvoiceOfSalesContractDetails.action")
	public String setupAllmInvoiceOfSalesContractDetails() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractDetails";
	}
	// 跳转手机端销售合同发票开具审批（丽泽）列表界面
	@RequestMapping("finance/mInvoiceOfSalesContractApprovalList.action")
	public String setupAllmInvoiceOfSalesContractApprovalList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractApprovalList";
	}
	// 跳转手机端销售合同发票开具审批（丽泽）界面
	@RequestMapping("finance/mInvoiceOfSalesContractApproval.action")
	public String setupAllmInvoiceOfSalesContractApproval() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractApproval";
	}
}

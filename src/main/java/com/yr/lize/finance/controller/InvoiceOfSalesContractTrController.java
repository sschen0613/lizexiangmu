package com.yr.lize.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InvoiceOfSalesContractTrController {
    //跳转销售合同发票开具申请（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContractTr.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/finance/invoiceOfSalesContractTr";
		//return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTr";
		//return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrList";
	}
    //跳转销售合同发票开具申请（丽泽）表页面
	@RequestMapping("finance/invoiceOfSalesContractTrForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/finance/invoiceOfSalesContractTrForm";
	}
    //跳转销售合同发票开具审批（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContractTrApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/finance/invoiceOfSalesContractTrApproval";
		//return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrApprovalList";
	}

	//跳转销售合同发票开具审批（丽泽）页面
	@RequestMapping("finance/invoiceOfSalesContractTrApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/finance/invoiceOfSalesContractTrApprovalDetail";
	}
	
	// 跳转手机端销售合同发票开具申请（丽泽）界面
	@RequestMapping("finance/mInvoiceOfSalesContractTr.action")
	public String setupAllmInvoiceOfSalesContractTr() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTr";
	}
	// 跳转手机端销售合同发票开具申请（丽泽）列表界面
	@RequestMapping("finance/mInvoiceOfSalesContractTrList.action")
	public String setupAllmInvoiceOfSalesContractTrList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrList";
	}
	// 跳转手机端销售合同发票开具申请（丽泽）列表详情界面
	@RequestMapping("finance/mInvoiceOfSalesContractTrDetails.action")
	public String setupAllmInvoiceOfSalesContractTrDetails() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrDetails";
	}
	// 跳转手机端销售合同发票开具审批（丽泽）列表界面
	@RequestMapping("finance/mInvoiceOfSalesContractTrApprovalList.action")
	public String setupAllmInvoiceOfSalesContractTrApprovalList() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrApprovalList";
	}
	// 跳转手机端销售合同发票开具审批（丽泽）界面
	@RequestMapping("finance/mInvoiceOfSalesContractTrApproval.action")
	public String setupAllmInvoiceOfSalesContractTrApproval() {
		return "WEB-INF/views/mobile/finance/mInvoiceOfSalesContractTrApproval";
	}
}

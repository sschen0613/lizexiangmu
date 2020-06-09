package com.yr.lize.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class InvoiceOfOperationContractController {
	    //跳转运营合同发票开具申请（丽泽）页面
		@RequestMapping("finance/invoiceOfOperationContract.action")
		public String setupAllocationApproverView1() {
			return "WEB-INF/views/finance/invoiceOfOperationContract";
		}
	    //跳转运营合同发票开具申请（丽泽）表页面
		@RequestMapping("finance/invoiceOfOperationContractForm.action")
		public String setupAllocationApproverView2() {
			return "WEB-INF/views/finance/invoiceOfOperationContractForm";
			//return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContract";
		}
	    //跳转运营合同发票开具审批（丽泽）页面
		@RequestMapping("finance/invoiceOfOperationContractApproval.action")
		public String setupAllocationApproverView3() {
			return "WEB-INF/views/finance/invoiceOfOperationContractApproval";
		}

		//跳转运营合同发票开具审批（丽泽）详情界面
		@RequestMapping("finance/invoiceOfOperationContractApprovalDetail.action")
		public String setupAllocationApproverDetail() {
			return "WEB-INF/views/finance/invoiceOfOperationContractApprovalDetail";
		}
		
		// 跳转手机端运营合同发票开具（丽泽）申请界面
		@RequestMapping("finance/mInvoiceOfOperationContract.action")
		public String setupAllmInvoiceOfOperationContract() {
			return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContract";
		}
		// 跳转手机端运营合同发票开具（丽泽）申请列表界面
		@RequestMapping("finance/mInvoiceOfOperationContractList.action")
		public String setupAllmInvoiceOfOperationContractList() {
			return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContractList";
		}
		// 跳转手机端运营合同发票开具（丽泽）申请列表详情界面
		@RequestMapping("finance/mInvoiceOfOperationContractDetails.action")
		public String setupAllmInvoiceOfOperationContractDetails() {
			return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContractDetails";
		}
		// 跳转手机端运营合同发票开具（丽泽）审批列表界面
		@RequestMapping("finance/mInvoiceOfOperationContractApprovalList.action")
		public String setupAllmInvoiceOfOperationContractApprovalList() {
			return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContractApprovalList";
		}
		// 跳转手机端运营合同发票开具（丽泽）审批界面
		@RequestMapping("finance/mInvoiceOfOperationContractApproval.action")
		public String setupAllmInvoiceOfOperationContractApproval() {
			return "WEB-INF/views/mobile/finance/mInvoiceOfOperationContractApproval";
		}
}

package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ContractReceiptAndPaymentController {
	//跳转合同收付款界面
	@RequestMapping("contract/contractReceiptAndPayment1.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/contract/contractReceiptAndPayment1";
	}

	//跳转合同收付款界面
	@RequestMapping("contract/contractReceiptAndPayment2.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/contract/contractReceiptAndPayment2";
	}

	//跳转合同收付款界面
	@RequestMapping("contract/contractReceiptAndPayment3.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/contract/contractReceiptAndPayment3";
	}

	//跳转信泽检测合同报表
	@RequestMapping("contract/contractReceiptAndPayment4.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/contract/contractReceiptAndPayment4";
	}
}

package com.yr.lize.contract.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class ContractStatusChangeController {
	//跳转合同状态变更界面
	@RequestMapping("contract/contractStatusChange.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/contract/contractStatusChange";
	}
}

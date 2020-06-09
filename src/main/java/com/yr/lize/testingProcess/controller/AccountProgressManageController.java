package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class AccountProgressManageController {
	//跳转账款进度管理页面
	@RequestMapping("testingProcess/testingFinance/accountProgressManage.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/testingFinance/accountProgressManage";
	}
}

package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestingResultSummaryController {
	//跳转检测结果汇总页面
	@RequestMapping("testingProcess/testingProcess/testingResultSummary.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/testingProcess/testingResultSummary";
	}
}

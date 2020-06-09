package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestingReportManageController {
	//跳转检测报告管理页面
	@RequestMapping("testingProcess/testingReport/testingReportManage.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportManage";
	}
	//跳转检测报告管理明细信息页面
	@RequestMapping("testingProcess/testingReport/testingReportManageDetails.action")
	public String setupAllocationApproverView0() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportManageDetails";
	}
}

package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestingSectionPerformanceManageController {
	//跳转现场科绩效管理页面
	@RequestMapping("testingProcess/performance/testingSectionPerformanceManage.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/performance/testingSectionPerformanceManage";
	}
	//跳转现场科绩效管理表页面
	@RequestMapping("testingProcess/performance/testingSectionPerformanceManageForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/performance/testingSectionPerformanceManageForm";
	}
}

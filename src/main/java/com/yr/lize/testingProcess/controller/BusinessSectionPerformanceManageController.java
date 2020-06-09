package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class BusinessSectionPerformanceManageController {
	//跳转业务科绩效管理页面
	@RequestMapping("testingProcess/performance/businessSectionPerformanceManage.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/performance/businessSectionPerformanceManage";
	}
	//跳转业务科绩效管理表页面
	@RequestMapping("testingProcess/performance/businessSectionPerformanceManageForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/performance/businessSectionPerformanceManageForm";
	}
}

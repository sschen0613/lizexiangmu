package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SceneSectionPerformanceManageController {
	//跳转现场科绩效管理页面
	@RequestMapping("testingProcess/performance/sceneSectionPerformanceManage.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/performance/sceneSectionPerformanceManage";
	}
	//跳转现场科绩效管理表页面
	@RequestMapping("testingProcess/performance/sceneSectionPerformanceManageForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/performance/sceneSectionPerformanceManageForm";
	}
}

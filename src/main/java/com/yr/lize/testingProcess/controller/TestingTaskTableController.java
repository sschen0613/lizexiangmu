package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestingTaskTableController {
	//跳转检测任务表页面
	@RequestMapping("testingProcess/testingProcess/testingTaskTable.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/testingProcess/testingTaskTable";
	}
	//跳转检测任务表领取页面
	@RequestMapping("testingProcess/testingProcess/testingTaskTableForm.action")
	public String setupAllocationApproverView0() {
		return "WEB-INF/views/testingProcess/testingProcess/testingTaskTableForm";
	}
}

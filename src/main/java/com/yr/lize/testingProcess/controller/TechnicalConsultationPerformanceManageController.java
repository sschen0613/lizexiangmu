package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TechnicalConsultationPerformanceManageController {
	//跳转技术咨询绩效管理页面
	@RequestMapping("testingProcess/performance/technicalConsultationPerformanceManage.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/performance/technicalConsultationPerformanceManage";
	}
}

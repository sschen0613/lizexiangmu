package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class StatisticalReportFormsController {
	//跳转统计报表页面
	@RequestMapping("testingProcess/statisticalReport/statisticalReportForms.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/testingProcess/statisticalReport/statisticalReportForms";
		//return "WEB-INF/views/mobile/testingProcess/statisticalReport/mStatisticalReportForms";
	}

	//跳转手机端统计报表页面
	@RequestMapping("testingProcess/statisticalReport/mStatisticalReportForms.action")
	public String mSetupAllocationApproverView() {
		return "WEB-INF/views/mobile/testingProcess/statisticalReport/mStatisticalReportForms";
	}

	//跳转手机端统计报表详情页面
	@RequestMapping("testingProcess/statisticalReport/mStatisticalReportDetails.action")
	public String mSetupAllocationApproverDetails() {
		return "WEB-INF/views/mobile/testingProcess/statisticalReport/mStatisticalReportDetails";
	}
}

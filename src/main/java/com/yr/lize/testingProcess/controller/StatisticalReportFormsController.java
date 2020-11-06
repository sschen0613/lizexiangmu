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

	//跳转检测报告登记申请页面
	@RequestMapping("testingProcess/samplingMessage/overDueDeal.action")
	public String overDueDeal() {
		return "WEB-INF/views/testingProcess/samplingMessage/overDueDeal";
	}
	//跳转检测报告登记表页面
	@RequestMapping("testingProcess/samplingMessage/overDueDealForm.action")
	public String overDueDealForm() {
		return "WEB-INF/views/testingProcess/samplingMessage/overDueDealForm";
	}
	//跳转检测报告登记审批页面
	@RequestMapping("testingProcess/samplingMessage/overDueDealApproval.action")
	public String overDueDealApproval() {
		return "WEB-INF/views/testingProcess/samplingMessage/overDueDealApproval";
	}

	//跳转质控科绩效页面
	@RequestMapping("testingProcess/performance/qualityControlPerformanceManage.action")
	public String qualityControlPerformanceManage() {
		return "WEB-INF/views/testingProcess/performance/qualityControlPerformanceManage";
	}
}

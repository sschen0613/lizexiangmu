package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TestingReportRegisterController {
	//跳转检测报告登记申请页面
	@RequestMapping("testingProcess/testingReport/testingReportRegister.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportRegister";
	}
	//跳转检测报告登记表页面
	@RequestMapping("testingProcess/testingReport/testingReportRegisterForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportRegisterForm";
	}
	//跳转检测报告登记审批页面
	@RequestMapping("testingProcess/testingReport/testingReportRegisterApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportRegisterApproval";
	}

	//跳转检测报告新增页面
	@RequestMapping("testingProcess/testingReport/testingReportAdd.action")
	public String testingReportAdd() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportAdd";
	}

	//跳转检测报告登记明细页面
	@RequestMapping("testingProcess/testingReport/testingReportDetails.action")
	public String testingReportDetails() {
		return "WEB-INF/views/testingProcess/testingReport/testingReportDetails";
	}

	//跳转业务下发合同列表界面
	@RequestMapping("xzTesting/reportTransList.action")
	public String taskContractList() {
		return "WEB-INF/views/xzTesting/reportTransList";
		//return "WEB-INF/views/mobile/xzTesting/mDetectionTaskApprovalList";
	}

	// 跳转手机端检测报告登记申请界面
	@RequestMapping("testingProcess/testingReport/mTestingReportRegister.action")
	public String setupAllmTestingReportRegister() {
		return "WEB-INF/views/mobile/testingProcess/testingReport/mTestingReportRegister";
	}
	// 跳转手机端检测报告登记申请列表界面
	@RequestMapping("testingProcess/testingReport/mTestingReportRegisterList.action")
	public String setupAllmTestingReportRegisterList() {
		return "WEB-INF/views/mobile/testingProcess/testingReport/mTestingReportRegisterList";
	}
	// 跳转手机端检测报告登记申请列表详情界面
	@RequestMapping("testingProcess/testingReport/mTestingReportRegisterDetails.action")
	public String setupAllmTestingReportRegisterDetails() {
		return "WEB-INF/views/mobile/testingProcess/testingReport/mTestingReportRegisterDetails";
	}
	// 跳转手机端检测报告登记审批列表界面
	@RequestMapping("testingProcess/testingReport/mTestingReportRegisterApprovalList.action")
	public String setupAllmTestingReportRegisterApprovalList() {
		return "WEB-INF/views/mobile/testingProcess/testingReport/mTestingReportRegisterApprovalList";
	}
	// 跳转手机端检测报告登记审批界面
	@RequestMapping("testingProcess/testingReport/mTestingReportRegisterApproval.action")
	public String setupAllmTestingReportRegisterApproval() {
		return "WEB-INF/views/mobile/testingProcess/testingReport/mTestingReportRegisterApproval";
	}
}

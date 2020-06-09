package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SamplingHandoverController {
	//跳转采样交接申请页面
	@RequestMapping("testingProcess/samplingMessage/samplingHandover.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingHandover";
	}
	//跳转采样交接单页面
	@RequestMapping("testingProcess/samplingMessage/samplingHandoverForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingHandoverForm";
	}
	//交接任务表
	@RequestMapping("testingProcess/samplingMessage/samplTaskTable.action")
	public String setupAllocationApproverView6() {
		return "WEB-INF/views/testingProcess/samplingMessage/sampleTaskTable";
	}
	//跳转样品编码表
	@RequestMapping("testingProcess/samplingMessage/sampleCodingForm.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/testingProcess/samplingMessage/sampleCodingForm";
	}
	//跳转样品流转单
	@RequestMapping("testingProcess/samplingMessage/sampleCirculationForm.action")
	public String setupAllocationApproverView5() {
		return "WEB-INF/views/testingProcess/samplingMessage/sampleCirculationForm";
	}
	//跳转采样交接审批页面
	@RequestMapping("testingProcess/samplingMessage/samplingHandoverApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingHandoverApproval";
	}
	
	// 跳转手机端采样交接申请界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingHandover.action")
	public String setupAllmSamplingHandover() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingHandover";
	}
	// 跳转手机端采样交接申请列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingHandoverList.action")
	public String setupAllmSamplingHandoverList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingHandoverList";
	}
	// 跳转手机端采样交接申请列表详情界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingHandoverDetails.action")
	public String setupAllmSamplingHandoverDetails() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingHandoverDetails";
	}
	// 跳转手机端采样交接审批列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingHandoverApprovalList.action")
	public String setupAllmSamplingHandoverApprovalList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingHandoverApprovalList";
	}
	// 跳转手机端采样交接审批界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingHandoverApproval.action")
	public String setupAllmSamplingHandoverApproval() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingHandoverApproval";
	}
}

package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SamplingTaskRegisterController {
	//跳转采样任务登记申请页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskRegister.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskRegister";
		//return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegisterList";
	}
	//跳转采样任务登记单页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskRegisterForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskRegisterForm";
	}
	//跳转采样任务登记审批页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskRegisterApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskRegisterApproval";
	}

	// 跳转手机端采样任务登记申请界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskRegister.action")
	public String setupAllmSamplingTaskRegister() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegister";
	}
	// 跳转手机端采样任务登记申请列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskRegisterList.action")
	public String setupAllmSamplingTaskRegisterList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegisterList";
	}
	// 跳转手机端采样任务登记申请列表详情界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskRegisterDetails.action")
	public String setupAllmSamplingTaskRegisterDetails() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegisterDetails";
	}
	// 跳转手机端采样任务登记审批列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskRegisterApprovalList.action")
	public String setupAllmSamplingTaskRegisterApprovalList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegisterApprovalList";
	}
	// 跳转手机端采样任务登记审批界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskRegisterApproval.action")
	public String setupAllmSamplingTaskRegisterApproval() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskRegisterApproval";
	}
}

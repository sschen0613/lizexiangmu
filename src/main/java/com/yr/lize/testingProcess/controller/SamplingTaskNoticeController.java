package com.yr.lize.testingProcess.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class SamplingTaskNoticeController {
	//跳转采样任务通知页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskNotice.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskNotice";
	}
	//跳转采样任务通知单页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskNoticeForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskNoticeForm";
	}
	//跳转打印采样任务通知单页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskNoticePrint.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskNoticePrint";
	}
	//跳转采样任务审批页面
	@RequestMapping("testingProcess/samplingMessage/samplingTaskNoticeApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskNoticeApproval";
	}
	//跳转采样任务通知单页面
	@RequestMapping("testingProcess/samplingMessage/samplPrint.action")
	public String setupAllocationApproverView5() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingPrint";
	}

	// 跳转手机端采样任务通知申请界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskNotice.action")
	public String setupAllmSamplingTaskNotice() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskNotice";
	}
	// 跳转手机端采样任务通知申请列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskNoticeList.action")
	public String setupAllmSamplingTaskNoticeList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskNoticeList";
	}
	// 跳转手机端采样任务通知申请列表详情界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskNoticeDetails.action")
	public String setupAllmSamplingTaskNoticeDetails() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskNoticeDetails";
	}
	// 跳转手机端采样任务通知审批列表界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskNoticeApprovalList.action")
	public String setupAllmSamplingTaskNoticeApprovalList() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskNoticeApprovalList";
	}
	// 跳转手机端采样任务通知审批界面
	@RequestMapping("testingProcess/samplingMessage/mSamplingTaskNoticeApproval.action")
	public String setupAllmSamplingTaskNoticeApproval() {
		return "WEB-INF/views/mobile/testingProcess/samplingMessage/mSamplingTaskNoticeApproval";
	}
	// 跳转采样任务通知列表页
	@RequestMapping("testingProcess/samplingMessage/samplingTaskNoticeList.action")
	public String samplingTaskNoticeList() {
		return "WEB-INF/views/testingProcess/samplingMessage/samplingTaskNoticeList";
	}

	//跳转样品管理员检测业务下发申请界面
	@RequestMapping("testingProcess/samplingMessage/sampleManager.action")
	public String sampleManager() {
		return "WEB-INF/views/testingProcess/samplingMessage/sampleManager";
	}
	//跳转检样品管理员测业务下发表界面
	@RequestMapping("testingProcess/samplingMessage/sampleManagerForm.action")
	public String sampleManagerForm() {
		return "WEB-INF/views/testingProcess/samplingMessage/sampleManagerForm";
	}
}
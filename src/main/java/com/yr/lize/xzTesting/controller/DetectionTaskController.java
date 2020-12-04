package com.yr.lize.xzTesting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class DetectionTaskController {
	//跳转检测业务下发申请界面
	@RequestMapping("xzTesting/detectionTask.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/xzTesting/detectionTask";
	}
	//跳转检测业务下发表界面
	@RequestMapping("xzTesting/detectionTaskForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/xzTesting/detectionTaskForm";
	}
	//跳转检测业务下发审批界面
	@RequestMapping("xzTesting/detectionTaskApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/xzTesting/detectionTaskApproval";
		//return "WEB-INF/views/mobile/xzTesting/mDetectionTaskApprovalList";
	}

	//跳转业务下发合同列表界面
	@RequestMapping("xzTesting/taskContractList.action")
	public String taskContractList() {
		return "WEB-INF/views/xzTesting/taskContractList";
		//return "WEB-INF/views/mobile/xzTesting/mDetectionTaskApprovalList";
	}
	
	// 跳转手机端检测业务下发申请界面
	@RequestMapping("xzTesting/mDetectionTask.action")
	public String setupAllmDetectionTask() {
		return "WEB-INF/views/mobile/xzTesting/mDetectionTask";
	}
	// 跳转手机端检测业务下发申请列表界面
	@RequestMapping("xzTesting/mDetectionTaskList.action")
	public String setupAllmDetectionTaskList() {
		return "WEB-INF/views/mobile/xzTesting/mDetectionTaskList";
	}
	// 跳转手机端检测业务下发申请列表详情界面
	@RequestMapping("xzTesting/mDetectionTaskDetails.action")
	public String setupAllmDetectionTaskDetails() {
		return "WEB-INF/views/mobile/xzTesting/mDetectionTaskDetails";
	}
	// 跳转手机端检测业务下发审批列表界面
	@RequestMapping("xzTesting/mDetectionTaskApprovalList.action")
	public String setupAllmDetectionTaskApprovalList() {
		return "WEB-INF/views/mobile/xzTesting/mDetectionTaskApprovalList";
	}
	// 跳转手机端检测业务下发审批界面
	@RequestMapping("xzTesting/mDetectionTaskApproval.action")
	public String setupAllmDetectionTaskApproval() {
		return "WEB-INF/views/mobile/xzTesting/mDetectionTaskApproval";
	}
}

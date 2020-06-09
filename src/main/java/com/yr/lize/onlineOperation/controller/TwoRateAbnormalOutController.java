package com.yr.lize.onlineOperation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class TwoRateAbnormalOutController {
	//跳转两率异常剔除申请界面
	@RequestMapping("onlineOperation/twoRateAbnormalOut.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/onlineOperation/twoRateAbnormalOut";
	}
	//跳转两率异常剔除申请表界面
	@RequestMapping("onlineOperation/twoRateAbnormalOutForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/onlineOperation/twoRateAbnormalOutForm";
	}
	//跳转两率异常剔除审批界面
	@RequestMapping("onlineOperation/twoRateAbnormalOutApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/onlineOperation/twoRateAbnormalOutApproval";
	}
	
	// 跳转手机端两率异常剔除申请界面
	@RequestMapping("onlineOperation/mTwoRateAbnormalOut.action")
	public String setupAllmTwoRateAbnormalOut() {
		return "WEB-INF/views/mobile/onlineOperation/mTwoRateAbnormalOut";
	}
	// 跳转手机端两率异常剔除申请列表界面
	@RequestMapping("onlineOperation/mTwoRateAbnormalOutList.action")
	public String setupAllmTwoRateAbnormalOutList() {
		return "WEB-INF/views/mobile/onlineOperation/mTwoRateAbnormalOutList";
	}
	// 跳转手机端两率异常剔除申请列表详情界面
	@RequestMapping("onlineOperation/mTwoRateAbnormalOutDetails.action")
	public String setupAllmTwoRateAbnormalOutDetails() {
		return "WEB-INF/views/mobile/onlineOperation/mTwoRateAbnormalOutDetails";
	}
	// 跳转手机端两率异常剔除审批列表界面
	@RequestMapping("onlineOperation/mTwoRateAbnormalOutApprovalList.action")
	public String setupAllmTwoRateAbnormalOutApprovalList() {
		return "WEB-INF/views/mobile/onlineOperation/mTwoRateAbnormalOutApprovalList";
	}
	// 跳转手机端两率异常剔除审批界面
	@RequestMapping("onlineOperation/mTwoRateAbnormalOutApproval.action")
	public String setupAllmTwoRateAbnormalOutApproval() {
		return "WEB-INF/views/mobile/onlineOperation/mTwoRateAbnormalOutApproval";
	}
}

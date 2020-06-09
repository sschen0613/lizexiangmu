package com.yr.lize.finance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessEntertainmentController {
	//跳转业务招待申请页面
	@RequestMapping("finance/businessEntertainment.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/finance/businessEntertainment";
	}
	//跳转业务招待申请表页面
	@RequestMapping("finance/businessEntertainmentForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/finance/businessEntertainmentForm";
	}
	//跳转业务招待审批页面
	@RequestMapping("finance/businessEntertainmentApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/finance/businessEntertainmentApproval";
	}
	
	// 跳转手机端业务招待申请界面
	@RequestMapping("finance/mBusinessEntertainment.action")
	public String setupAllmBusinessEntertainment() {
		return "WEB-INF/views/mobile/finance/mBusinessEntertainment";
	}
	// 跳转手机端业务招待申请列表界面
	@RequestMapping("finance/mBusinessEntertainmentList.action")
	public String setupAllmBusinessEntertainmentList() {
		return "WEB-INF/views/mobile/finance/mBusinessEntertainmentList";
	}
	// 跳转手机端业务招待申请列表详情界面
	@RequestMapping("finance/mBusinessEntertainmentDetails.action")
	public String setupAllmBusinessEntertainmentDetails() {
		return "WEB-INF/views/mobile/finance/mBusinessEntertainmentDetails";
	}
	// 跳转手机端业务招待审批列表界面
	@RequestMapping("finance/mBusinessEntertainmentApprovalList.action")
	public String setupAllmBusinessEntertainmentApprovalList() {
		return "WEB-INF/views/mobile/finance/mBusinessEntertainmentApprovalList";
	}
	// 跳转手机端业务招待审批界面
	@RequestMapping("finance/mBusinessEntertainmentApproval.action")
	public String setupAllmBusinessEntertainmentApproval() {
		return "WEB-INF/views/mobile/finance/mBusinessEntertainmentApproval";
	}
}

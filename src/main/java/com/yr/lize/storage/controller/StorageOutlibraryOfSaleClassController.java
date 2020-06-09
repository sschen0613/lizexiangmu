package com.yr.lize.storage.controller;

import com.yr.lize.storage.service.IStorageOutlibraryOfSaleClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class StorageOutlibraryOfSaleClassController {

	//注入丽泽销售类出库service
	@Autowired
	IStorageOutlibraryOfSaleClassService iStorageOutlibraryOfSaleClassService;
	//跳转丽泽销售类出库申请界面
	@RequestMapping("storage/outlibraryOfSaleClass.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/outlibraryOfSaleClass";
	}
	//跳转丽泽销售类出库申请表界面
	@RequestMapping("storage/outlibraryOfSaleClassForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/outlibraryOfSaleClassForm";
		//return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClass";
	}
	//跳转丽泽销售类出库申请表编辑界面
	@RequestMapping("storage/outlibraryOfSaleClassFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/outlibraryOfSaleClassFormRevise";
	}
	//跳转丽泽销售类出库审批界面
	@RequestMapping("storage/outlibraryOfSaleClassSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/outlibraryOfSaleClassApproval";
		//return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClassApprovalList";
	}

	//跳转丽泽销售类出库审批详情界面
	@RequestMapping("storage/outlibraryOfSaleClassSuppliesApprovalDetail.action")
	public String setupAllocationApproverView3Detail() {
		return "WEB-INF/views/storage/outlibraryOfSaleClassApprovalDetail";
	}
	
	//跳转手机端丽泽销售类出库申请表界面
	@RequestMapping("storage/mOutlibraryOfSaleClass.action")
	public String setupAllmOutlibraryOfSaleClass() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClass";
	}
	//跳转手机端丽泽销售类出库申请列表界面
	@RequestMapping("storage/mOutlibraryOfSaleClassList.action")
	public String setupAllmOutlibraryOfSaleClassList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClassList";
	}
	//跳转手机端丽泽销售类出库申请列表详情界面
	@RequestMapping("storage/mOutlibraryOfSaleClassDetails.action")
	public String setupAllmOutlibraryOfSaleClassDetails() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClassDetails";
	}
	//跳转手机端信丽泽销售类出库审批列表界面
	@RequestMapping("storage/mOutlibraryOfSaleClassApprovalList.action")
	public String setupAllmOutlibraryOfSaleClassapprovalList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClassApprovalList";
	}	
	//跳转手机端信丽泽销售类出库审批界面
	@RequestMapping("storage/mOutlibraryOfSaleClassApproval.action")
	public String setupAllmOutlibraryOfSaleClassapproval() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfSaleClassApproval";
	}
	

}

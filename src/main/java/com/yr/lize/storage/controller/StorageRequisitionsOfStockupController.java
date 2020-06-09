package com.yr.lize.storage.controller;

import com.yr.lize.pojo.InventoryStockupbuy;
import com.yr.lize.pojo.InventoryStockupbuytable;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.storage.service.IStorageRequisitionsOfStockupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class StorageRequisitionsOfStockupController {
	@Autowired
	IStorageRequisitionsOfStockupService IStorageRequisitionsOfStockupService;

	// 跳转备货请购申请界面
	@RequestMapping("storage/requisitionsOfStockup.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/requisitionsOfStockup";
	}

	// 跳转备货请购申请表界面
	@RequestMapping("storage/requisitionsOfStockupForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/requisitionsOfStockupForm";
	}
	
	// 跳转备货请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfStockupFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/requisitionsOfStockupFormRevise";
	}

	// 跳转备货请购申请审批页面
	@RequestMapping("storage/requisitionsOfStockupSuppliesApproval.action")
	public String setupAllocationApproverViewApproval() {
		return "WEB-INF/views/storage/requisitionsOfStockupApproval";
	}

	// 跳转备货请购申请审批详情页面
	@RequestMapping("storage/requisitionsOfStockupSuppliesApprovalDetail.action")
	public String setupAllocationApproverViewApprovalDetail() {
		return "WEB-INF/views/storage/requisitionsOfStockupApprovalDetail";
	}
	
	// 跳转手机端备货请购申请界面
	@RequestMapping("storage/mRequisitionsOfStockup.action")
	public String setupAllmRequisitionsOfStockup() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockup";
	}
	// 跳转手机端备货请购申请列表界面
	@RequestMapping("storage/mRequisitionsOfStockupList.action")
	public String setupAllmRequisitionsOfStockupList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupList";
	}
	// 跳转手机端备货请购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfStockupDetails.action")
	public String setupAllmRequisitionsOfStockupDetails() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupDetails";
	}
	// 跳转手机端备货请购申请审批列表页面
	@RequestMapping("storage/mRequisitionsOfStockupApprovalList.action")
	public String setupAllmRequisitionsOfStockupApprovalList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApprovalList";
	}
	// 跳转手机端备货请购申请审批页面
	@RequestMapping("storage/mRequisitionsOfStockupApproval.action")
	public String setupAllmRequisitionsOfStockupApproval() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApproval";
	}
	
	
	
	// 提交表单数据

		@RequestMapping("Storage/insertStockup.action")
		@ResponseBody
		public Integer insert( InventoryStockupbuy InventoryStockupbuy ,InventoryStockupbuytable InventoryStockupbuytable,HttpSession session) {			
		 
			IStorageRequisitionsOfStockupService.inserttable(InventoryStockupbuytable);
						
			IStorageRequisitionsOfStockupService.insert(InventoryStockupbuy);    
		   
			return 1;
	
		}


	@RequestMapping("storage/requisitionsOfStockupProductName.action")
	@ResponseBody
	public ResponseResult selectInventoryName(){
		ResponseResult result = new ResponseResult();
		List<HashMap<String,Object>> list = IStorageRequisitionsOfStockupService.selectInventoryName();
		result.setCode(0);
		result.setData(list);
		return result;
	}


	// 跳转安装组请购申请界面
	@RequestMapping("storage/requisitionsOfStockup1.action")
	public String setupAllocationApproverView11() {
		return "WEB-INF/views/storage/requisitionsOfStockup1";
	}

	// 跳转安装组请购申请表界面
	@RequestMapping("storage/requisitionsOfStockupForm1.action")
	public String setupAllocationApproverView21() {
		return "WEB-INF/views/storage/requisitionsOfStockupForm1";
	}

	// 跳转安装组请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfStockupFormRevise1.action")
	public String setupAllocationApproverView41() {
		return "WEB-INF/views/storage/requisitionsOfStockupFormRevise1";
	}

	// 跳转安装组请购申请审批页面
	@RequestMapping("storage/requisitionsOfStockupSuppliesApproval1.action")
	public String setupAllocationApproverViewApproval1() {
		return "WEB-INF/views/storage/requisitionsOfStockupApproval1";
	}

	// 跳转安装组请购申请审批详情页面
	@RequestMapping("storage/requisitionsOfStockupSuppliesApprovalDetail1.action")
	public String setupAllocationApproverViewApprovalDetail1() {
		return "WEB-INF/views/storage/requisitionsOfStockupApprovalDetail1";
	}

	// 跳转手机端安装组请购申请界面
	@RequestMapping("storage/mRequisitionsOfStockup1.action")
	public String setupAllmRequisitionsOfStockup1() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockup1";
	}
	// 跳转手机端安装组请购申请列表界面
	@RequestMapping("storage/mRequisitionsOfStockupList1.action")
	public String setupAllmRequisitionsOfStockupList1() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupList1";
	}
	// 跳转手机端安装组请购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfStockupDetails1.action")
	public String setupAllmRequisitionsOfStockupDetails1() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupDetails1";
	}
	// 跳转手机端安装组请购申请审批列表页面
	@RequestMapping("storage/mRequisitionsOfStockupApprovalList1.action")
	public String setupAllmRequisitionsOfStockupApprovalList1() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApprovalList1";
	}
	// 跳转手机端安装组请购申请审批页面
	@RequestMapping("storage/mRequisitionsOfStockupApproval1.action")
	public String setupAllmRequisitionsOfStockupApproval1() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApproval1";
	}


		
}

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
public class StorageInstallComponentsController {
	@Autowired
	IStorageRequisitionsOfStockupService IStorageRequisitionsOfStockupService;

	// 跳转安装组配件采购申请界面
	@RequestMapping("storage/installComponentsRequest.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/installComponents";
	}

	// 跳转安装组配件采购申请表界面
	@RequestMapping("storage/installComponentsForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/installComponentsForm";
	}
	
	// 跳转安装组配件采购申请表编辑界面
	@RequestMapping("storage/installComponentsFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/installComponentsFormRevise";
	}

	// 跳转安装组配件采购申请审批页面
	@RequestMapping("storage/installComponentsApproval.action")
	public String setupAllocationApproverViewApproval() {
		return "WEB-INF/views/storage/installComponentsApproval";
	}
	
	/*// 跳转手机端安装组配件采购申请界面
	@RequestMapping("storage/mRequisitionsOfStockup.action")
	public String setupAllmRequisitionsOfStockup() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockup";
	}
	// 跳转手机端安装组配件采购申请列表界面
	@RequestMapping("storage/mRequisitionsOfStockupList.action")
	public String setupAllmRequisitionsOfStockupList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupList";
	}
	// 跳转手机端安装组配件采购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfStockupDetails.action")
	public String setupAllmRequisitionsOfStockupDetails() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupDetails";
	}
	// 跳转手机端安装组配件采购申请审批列表页面
	@RequestMapping("storage/mRequisitionsOfStockupApprovalList.action")
	public String setupAllmRequisitionsOfStockupApprovalList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApprovalList";
	}
	// 跳转手机端安装组配件采购申请审批页面
	@RequestMapping("storage/mRequisitionsOfStockupApproval.action")
	public String setupAllmRequisitionsOfStockupApproval() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfStockupApproval";
	}*/
	
	
	
	// 提交表单数据

		/*@RequestMapping("Storage/insertStockup.action")
		@ResponseBody
		public Integer insert( InventoryStockupbuy InventoryStockupbuy ,InventoryStockupbuytable InventoryStockupbuytable,HttpSession session) {			
		 
			IStorageRequisitionsOfStockupService.inserttable(InventoryStockupbuytable);
						
			IStorageRequisitionsOfStockupService.insert(InventoryStockupbuy);    
		   
			return 1;
	
		}*/


	/*@RequestMapping("storage/requisitionsOfStockupProductName.action")
	@ResponseBody
	public ResponseResult selectInventoryName(){
		ResponseResult result = new ResponseResult();
		List<HashMap<String,Object>> list = IStorageRequisitionsOfStockupService.selectInventoryName();
		result.setCode(0);
		result.setData(list);
		return result;
	}*/


		
}

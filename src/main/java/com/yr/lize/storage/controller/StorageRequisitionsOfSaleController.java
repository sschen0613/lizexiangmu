package com.yr.lize.storage.controller;

import com.yr.lize.pojo.InventoryEquipmentbuy;
import com.yr.lize.pojo.InventoryEquipmentbuytable;
import com.yr.lize.storage.service.IStorageRequisitionsOfSaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
@Controller
public class StorageRequisitionsOfSaleController {
	@Autowired
	IStorageRequisitionsOfSaleService IStorageRequisitionsOfSaleService;
//山东丽泽
	//跳转山东丽泽销售请购申请界面
	@RequestMapping("storage/requisitionsOfSale.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/requisitionsOfSale";
		//return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleList";
	}
	//跳转山东丽泽销售请购申请表界面
	@RequestMapping("storage/requisitionsOfSaleForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/requisitionsOfSaleForm";
	}
	//跳转山东丽泽销售请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfSaleFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/requisitionsOfSaleFormRevise";
	}
	//跳转山东丽泽销售请购审批界面
	@RequestMapping("storage/requisitionsOfSaleSuppliesApproval.action")
	public String setupAllocationApproverView3() {
		return "WEB-INF/views/storage/requisitionsOfSaleApproval";
		//return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleApprovalList";
	}

	//山东丽泽销售请购审批详情界面
	@RequestMapping("storage/requisitionsOfSaleSuppliesApprovalDetail.action")
	public String setupAllocationApproverDetail() {
		return "WEB-INF/views/storage/requisitionsOfSaleApprovalDetail";
	}

	//山东丽泽销售请购审批打印界面
	@RequestMapping("storage/requisitionsOfSaleSuppliesApprovalPrint.action")
	public String setupAllocationApproverPrint() {
		return "WEB-INF/views/storage/requisitionsOfSaleApprovalPrint";
	}
	
	// 跳转手机端山东丽泽销售请购申请表界面
	@RequestMapping("storage/mRequisitionsOfSale.action")
	public String setupAllmRequisitionsOfSale() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSale";
	}
	// 跳转手机端山东丽泽销售请购申请列表界面
	@RequestMapping("storage/mRequisitionsOfSaleList.action")
	public String setupAllmRequisitionsOfSaleList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleList";
	}
	// 跳转手机端山东丽泽销售请购申请列表详情界面
	@RequestMapping("storage/mRequisitionsOfSaleDetails.action")
	public String setupAllmRequisitionsOfSaleDetails() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleDetails";
	}
	// 跳转手机端山东丽泽销售请购审批列表界面
	@RequestMapping("storage/mRequisitionsOfSaleSuppliesApprovalList.action")
	public String setupAllmRequisitionsOfSaleApprovalList() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleApprovalList";
	}
	// 跳转手机端山东丽泽销售请购审批界面
	@RequestMapping("storage/mRequisitionsOfSaleSuppliesApproval.action")
	public String setupAllmRequisitionsOfSaleApproval() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSaleApproval";
	}
	
//菏泽丽泽	
	//跳转菏泽丽泽销售请购申请界面
	@RequestMapping("storage/requisitionsOfSale_HZ.action")
	public String setupAllocationApprover_HZView1() {
		return "WEB-INF/views/storage/requisitionsOfSale_HZ";
	}
	//跳转菏泽丽泽销售请购申请表界面
	@RequestMapping("storage/requisitionsOfSaleForm_HZ.action")
	public String setupAllocationApprover_HZView2() {
		return "WEB-INF/views/storage/requisitionsOfSaleForm_HZ";
	}
	//跳转菏泽丽泽销售请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfSaleFormRevise_HZ.action")
	public String setupAllocationApprover_HZView4() {
		return "WEB-INF/views/storage/requisitionsOfSaleFormRevise_HZ";
	}
	//跳转菏泽丽泽销售请购审批界面
	@RequestMapping("storage/requisitionsOfSaleSuppliesApproval_HZ.action")
	public String setupAllocationApprove_HZView3() {
		return "WEB-INF/views/storage/requisitionsOfSaleApproval_HZ";
	}
	
	// 跳转手机端菏泽丽泽销售请购申请表界面
	@RequestMapping("storage/mRequisitionsOfSale_HZ.action")
	public String setupAllmRequisitionsOfSale_HZ() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSale_HZ";
	}
	
//滨州丽泽	
	//跳转滨州丽泽销售请购申请界面
	@RequestMapping("storage/requisitionsOfSale_BZ.action")
	public String setupAllocationApprover_BZView1() {
		return "WEB-INF/views/storage/requisitionsOfSale_BZ";
	}
	//跳转滨州丽泽销售请购申请表界面
	@RequestMapping("storage/requisitionsOfSaleForm_BZ.action")
	public String setupAllocationApprover_BZView2() {
		return "WEB-INF/views/storage/requisitionsOfSaleForm_BZ";
	}
	//跳转滨州丽泽销售请购申请表编辑界面
	@RequestMapping("storage/requisitionsOfSaleFormRevise_BZ.action")
	public String setupAllocationApprover_BZView4() {
		return "WEB-INF/views/storage/requisitionsOfSaleFormRevise_BZ";
	}
	//跳转滨州丽泽销售请购审批界面
	@RequestMapping("storage/requisitionsOfSaleSuppliesApproval_BZ.action")
	public String setupAllocationApprove_BZView3() {
		return "WEB-INF/views/storage/requisitionsOfSaleApproval_BZ";
	}
	
	// 跳转手机端滨州丽泽销售请购申请表界面
	@RequestMapping("storage/mRequisitionsOfSale_BZ.action")
	public String setupAllmRequisitionsOfSale_BZ() {
		return "WEB-INF/views/mobile/storage/mRequisitionsOfSale_BZ";
	}
	
	//提交表单数据
	
	@RequestMapping("Storage/insertEquipmentbuy.action")
	@ResponseBody
	public Integer insert( InventoryEquipmentbuytable InventoryEquipmentbuytable ,InventoryEquipmentbuy InventoryEquipmentbuy,HttpSession session) {			
		IStorageRequisitionsOfSaleService.inserttable(InventoryEquipmentbuytable);
		IStorageRequisitionsOfSaleService.insert(InventoryEquipmentbuy);    
	    return 1;
	}

}

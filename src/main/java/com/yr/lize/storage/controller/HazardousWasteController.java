package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HazardousWasteController {
	/*@Autowired
	IStorageOutlibraryOfMaterialClassService StorageOutlibraryOfMaterialClassService;*/


	// 跳转废液列表
	@RequestMapping("storage/mDevilLiquorProduct.action")
	public String devilLiquorProduct() {
		return "WEB-INF/views/mobile/storage/mDevilLiquorProduct";
	}

	// 跳转废液列表
	@RequestMapping("storage/mDevilLiquorMove.action")
	public String devilLiquorMove() {
		return "WEB-INF/views/mobile/storage/mDevilLiquorMove";
	}


	// 跳转废液列表
	@RequestMapping("storage/devilLiquor.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/storage/devilLiquor";
	}

	/*// 跳转丽泽材料类出库申请表界面
	@RequestMapping("storage/outlibraryOfMaterialClassForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/storage/outlibraryOfMaterialClassForm";
	}
	
	// 跳转丽泽材料类出库申请表编辑界面
	@RequestMapping("storage/outlibraryOfMaterialClassFormRevise.action")
	public String setupAllocationApproverView4() {
		return "WEB-INF/views/storage/outlibraryOfMaterialClassFormRevise";
	}

	// 跳转丽泽材料类审批页面
	@RequestMapping("storage/outlibraryOfMaterialClassApproval.action")
	public String setupAlloutlibraryOfMaterialClassApproval() {
		return "WEB-INF/views/storage/outlibraryOfMaterialClassApproval";
		//return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClassApprovalList";
	}

	// 跳转丽泽材料类审批详情页面
	@RequestMapping("storage/outlibraryOfMaterialClassApprovalDetail.action")
	public String setupAlloutlibraryOfMaterialClassApprovalDetail() {
		return "WEB-INF/views/storage/outlibraryOfMaterialClassApprovalDetail";
	}

	// 跳转手机端丽泽材料类出库申请界面
	@RequestMapping("storage/mOutlibraryOfMaterialClass.action")
	public String setupAllmOutlibraryOfMaterialClass() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClass";
	}
	// 跳转手机端丽泽材料类出库申请列表界面
	@RequestMapping("storage/mOutlibraryOfMaterialClassList.action")
	public String setupAllmOutlibraryOfMaterialClassList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClassList";
	}
	// 跳转手机端丽泽材料类出库申请列表详情界面
	@RequestMapping("storage/mOutlibraryOfMaterialClassDetails.action")
	public String setupAllmOutlibraryOfMaterialClassDetails() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClassDetails";
	}
	// 跳转手机端丽泽材料类审批列表页面
	@RequestMapping("storage/mOutlibraryOfMaterialClassApprovalList.action")
	public String setupAllmOutlibraryOfMaterialClassApprovalList() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClassApprovalList";
	}
	// 跳转手机端丽泽材料类审批页面
	@RequestMapping("storage/mOutlibraryOfMaterialClassApproval.action")
	public String setupAllmOutlibraryOfMaterialClassApproval() {
		return "WEB-INF/views/mobile/storage/mOutlibraryOfMaterialClassApproval";
	}

	//提交表单数据
	
	@RequestMapping("Storage/insert.action")
	@ResponseBody
	public Integer insert( InventoryLizematerialsout InventoryLizematerialsout ,InventoryLizematerialsouttable InventoryLizematerialsouttable,HttpSession session) {
		//提交附表信息
		StorageOutlibraryOfMaterialClassService.inserttable(InventoryLizematerialsouttable);
		//提交主表信息
	    StorageOutlibraryOfMaterialClassService.insert(InventoryLizematerialsout);    
	    return 1;
	}
	//查询记录
	@RequestMapping("Storage/select.action")
	@ResponseBody
	public Integer select() {
	
		return 1;
	}*/
	
}

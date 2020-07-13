package com.yr.lize.office.controller;

import com.github.pagehelper.PageInfo;
import com.yr.lize.office.service.IOfficeSuppliesRequestService;
import com.yr.lize.pojo.OfficeSupplies;
import com.yr.lize.pojo.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OfficeSuppliesRequestController {

	@Autowired
	private IOfficeSuppliesRequestService iOfficeSuppliesRequestService;

	//跳转办公用品申请界面
	@RequestMapping("office/officeSupplies.action")
	public String setupAllocationApproverView1() {
		return "WEB-INF/views/office/officeSupplies";
		//return "WEB-INF/views/mobile/office/mOfficeSupplies";
	}
	//跳转办公用品申请表界面
	@RequestMapping("office/officeSuppliesForm.action")
	public String setupAllocationApproverView2() {
		return "WEB-INF/views/office/officeSuppliesForm";
	}
	//跳转办公用品审批表界面
	@RequestMapping("office/officeSuppliesApproval.action")
	public String setupAllofficeSuppliesApproval() {
		return "WEB-INF/views/office/officeSuppliesApproval";
	}

	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mOfficeSupplies.action")
	public String setupAllmOfficeSupplies() {
		return "WEB-INF/views/mobile/office/mOfficeSupplies";
	}
	// 跳转手机端办公用品申请列表界面
	@RequestMapping("office/mOfficeSuppliesList.action")
	public String setupAllmOfficeSuppliesList() {
		return "WEB-INF/views/mobile/office/mOfficeSuppliesList";
	}
	// 跳转手机端办公用品申请界面
	@RequestMapping("office/mOfficeSuppliesDetails.action")
	public String setupAllmOfficeSuppliesDetails() {
		return "WEB-INF/views/mobile/office/mOfficeSuppliesDetails";
	}
	// 跳转手机端办公用品审批列表界面
	@RequestMapping("office/mOfficeSuppliesApprovalList.action")
	public String setupAllmOfficeSuppliesApprovalList() {
		return "WEB-INF/views/mobile/office/mOfficeSuppliesApprovalList";
	}
	// 跳转手机端办公用品审批界面
	@RequestMapping("office/mOfficeSuppliesApproval.action")
	public String setupAllmOfficeSuppliesApproval() {
		return "WEB-INF/views/mobile/office/mOfficeSuppliesApproval";
	}


	//跳转办公用品管理界面
	@RequestMapping("office/officeSuppliesManagement.action")
	public String setupOfficeSuppliesManagement() {
		return "WEB-INF/views/office/officeSuppliesManagement";
	}

	//跳转办公用品新增和修改界面
	@RequestMapping("office/reviseOfficeSupplies.action")
	public String reviseOfficeSupplies() {
		return "WEB-INF/views/office/reviseOfficeSupplies";
	}

	//跳转办公用品统计界面
	@RequestMapping("office/officeSuppliesStatistics.action")
	public String officeSuppliesStatistics() {
		return "WEB-INF/views/office/officeSuppliesStatistics";
	}

	//获取办公用品列表
	@RequestMapping("office/selectOfficeSuppliesList.action")
	@ResponseBody
	public ResponseResult selectOfficeSuppliesList(Integer limit, Integer page, OfficeSupplies officeSupplies) {
		ResponseResult responseResult = new ResponseResult();
		PageInfo<OfficeSupplies> pageInfo = iOfficeSuppliesRequestService.selectOfficeSuppliesList(limit,page,officeSupplies);
		responseResult.setCode(0);
		responseResult.setCount(new Integer((int)pageInfo.getTotal()));
		responseResult.setData(pageInfo.getList());
		return responseResult;
	}
	//新增或修改办公用品
	@RequestMapping("office/addOfficeSupplies")
	@ResponseBody
	public ResponseResult addOfficeSupplies(OfficeSupplies officeSupplies){
		ResponseResult responseResult = new ResponseResult();
		Integer ins = iOfficeSuppliesRequestService.addOfficeSupplies(officeSupplies);
		responseResult.setCode(0);
		responseResult.setMsg("操作成功");
		return responseResult;
	}

	//删除办公用品
	@RequestMapping("office/deleteOfficeSupplies")
	@ResponseBody
	public ResponseResult deleteOfficeSupplies(OfficeSupplies officeSupplies){
		ResponseResult responseResult = new ResponseResult();
		Integer ins = iOfficeSuppliesRequestService.deleteOfficeSupplies(officeSupplies);
		responseResult.setCode(0);
		responseResult.setMsg("操作成功");
		return responseResult;
	}
}

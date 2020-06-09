package com.yr.lize.system.controller;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.*;
import com.yr.lize.system.service.ISystemCompanyService;
import com.yr.lize.system.service.ISystemDepartmentService;
import com.yr.lize.system.service.ISystemPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

//集团公司管理
@Controller
public class SystemCompanyController {

	@Autowired
	ISystemCompanyService iSystemCompanyService;
	@Autowired
	ISystemPositionService iSystemPositionService;
	@Autowired
	ISystemDepartmentService iSystemDepartmentService;
	//公司列表
	@RequestMapping("system/companyManager.action")
	public String companyManager() {
		return "WEB-INF/views/system/companyList";
	}
	//修改公司信息页面
	@RequestMapping("system/reviseCompany.action")
	public String reviseCompany() {
		return "WEB-INF/views/system/reviseCompany";
	}
	//转跳到添加公司页面
	@RequestMapping("/system/addCompanyList.action")
	public String addCompanyLiar() {
		return "WEB-INF/views/system/addCompanyList";
	}
	
	//修改审批条件金额
	@RequestMapping("/system/updateApprovalMoney.action")
	@ResponseBody
	public ResponseResult updateApprovalMoney(Integer id, Integer money,Integer approval_id) {
		Integer approvalCondition = iSystemCompanyService.selectApprovalCondition(id,approval_id);
		Integer res = 0;
		if (approvalCondition != null) {
			res = iSystemCompanyService.updateApprovalMoney(id, money, approval_id);
		}else {
			res = iSystemCompanyService.addCondition(id,money,approval_id);
		}
		
		ResponseResult result = new ResponseResult();
		if (res > 0) {
			result.setMsg("成功");
		}else {
			result.setMsg("失败");
		}
		return result;
	}
	//查询审批条件
	@RequestMapping("/Company/selectApprovalCondition.action")
	@ResponseBody
	public ResponseResult selectApprovalCondition(Integer company_id, Integer approval_id) {
		
		Integer money = iSystemCompanyService.selectApprovalCondition(company_id,approval_id); 
		ResponseResult result = new ResponseResult();
		result.setData(money);
		return result;
	}
	//查询所有公司信息
	@RequestMapping("/Company/getCompany.action")
	@ResponseBody 
	public ResponseResult getCompany(Integer limit,Integer page, SystemCompany company) {
		
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		
		List<HashMap<String, Object>> list = iSystemCompanyService.getCompany(page2, company);
		
		Integer count = iSystemCompanyService.getRows(company);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		
		return result;
	}
	//删除分公司
	@RequestMapping("/Company/deleteCompany.action")
	@ResponseBody
	public ResponseResult deleteCompany(Integer company_Id) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemCompanyService.deleteCompany(company_Id);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		
		return result;
	}
	//修改删除标识
	@RequestMapping("/Company/updateDelete.action")
	@ResponseBody
	public ResponseResult updateDelete(Integer company_Id) {
		Integer res = iSystemCompanyService.updateDelete(company_Id);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("删除失败!请先删除此公司下的所有部门");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		return result;
	}
	//添加分公司
	@RequestMapping("/Company/addCompany.action")
	@ResponseBody
	public ResponseResult addCompany(SystemCompany company) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemCompanyService.addCompany(company);
		if (res >0) {
			result.setCode(1);
			result.setMsg("添加成功");
		}else {
			result.setCode(-100);
			result.setMsg("添加失败");
		}
		
		return result;
	}
	//修改分公司
	@RequestMapping("/Company/updateCompany.action")
	@ResponseBody
	public ResponseResult updateCompany(SystemCompany company) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemCompanyService.updateCompany(company);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("修改成功");
		}else {
			result.setCode(-100);
			result.setMsg("修改失败");
		}
		return result;
	}
	//查询当前登录用户权限根据权限查询公司
	@RequestMapping("/Company/selectRoleCompany.action")
	@ResponseBody
	public ResponseResult selectRoleCompany(HttpSession session) {
		SystemStaff staff = (SystemStaff) session.getAttribute("systemStaff");
		
		
		SystemCompany company2 = new SystemCompany();
		Page page = new Page();
		ResponseResult result = new ResponseResult();
		SystemPosition position = iSystemPositionService.selectPositionById(staff.getPosition_Id());
		List<HashMap<String, Object>> list = new ArrayList<>();
		if (position.getPosition_details() == 1) {
			list = iSystemCompanyService.getCompany(page, company2);
			result.setData(list);
		}else if (position.getPosition_details() == 2) {
			SystemCompany company = iSystemCompanyService.selectCompanyById(staff.getCompany_Id());
			result.setData(company);
		}else {
		}
		
		result.setCode(position.getPosition_details());
		return result;
	}
	
}

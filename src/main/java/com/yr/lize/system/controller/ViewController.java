package com.yr.lize.system.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.mapper.TextMapper;
import com.yr.lize.system.service.ISystemStaffService;


@Controller
public class ViewController {

@Autowired
TextMapper textMapper;
	
@Autowired
private ISystemStaffService iSystemStaffService;
	
	//转跳到首页
	@RequestMapping("/view/index.action")
	public String index() {
		return "WEB-INF/views/index";
	}
	//转跳到首页
	@RequestMapping("/mobile/view/Mindex.action")
	public String Mindex() {
		return "WEB-INF/views/mIndex";
	}
	//转跳到手机审批tap
	@RequestMapping("/mobile/view/approvalView.action")
	public String approvalView() {
		return "WEB-INF/views/mobile/approvalView";
	}
	//转跳到手机申请tap
	@RequestMapping("/mobile/view/applyApplyView.action")
	public String applyApplyView() {
		return "WEB-INF/views/mobile/applyView";
	}
	//根据登录用户生成菜单
	@RequestMapping("/view/getmenu.action")
	@ResponseBody
	public List<PowerMenu> getmenu(HttpSession session,SystemStaff systemStaff){
		//取当前用户信息
		SystemStaff systemStaff2 = (SystemStaff) session.getAttribute("systemStaff");
		systemStaff.setStaff_Id(systemStaff2.getStaff_Id());
		List<PowerMenu>list = iSystemStaffService.getMenu(systemStaff);
		
		return list;
	}
	@RequestMapping("system/approvalManageView.action")
	public String approvalManageView() {
		return "WEB-INF/views/system/approvalManageView";
	}
	//根据登录用户生成菜单
	@RequestMapping("/view/selectText.action")
	@ResponseBody
	public List<HashMap<String, Object>> selectText(){
		//取当前用户信息
		List<HashMap<String, Object>>list = textMapper.selectTest();
		
		return list;
	}
}

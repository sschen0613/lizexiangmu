package com.yr.lize.power.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.power.service.IPowerMenuService;

@Controller
public class PowerMenuController {
	
	@Autowired
	IPowerMenuService iPowerMenuService;
	
	//转跳到已拥有菜单列表页面
	@RequestMapping("/PowerMenu/yesMenuAdminList.action")
	public String yesMenuAdminList() {
		return "WEB-INF/views/system/yesMenuAdminList";
	}
	//转跳到未拥有菜单列表页面
	@RequestMapping("/PowerMenu/noMenuAdminList.action")
	public String noMenuAdminList() {
		return "WEB-INF/views/system/noMenuAdminList";
	}
	//查询未拥有的菜单列表
	@RequestMapping("/PowerMenu/selectNoMenu.action")
	@ResponseBody
	public ResponseResult selectNoMenu(Integer limit,Integer page,PowerMenu powerMenu) {
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		
		List<HashMap<String, Object>> menus = iPowerMenuService.selectNoMenu(page2, powerMenu);
		
		Integer count = iPowerMenuService.getNoRows(powerMenu);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setCount(0);
		result.setData(menus);
		return result;
	}
	//查询拥有的菜单列表
	@RequestMapping("/PowerMenu/selectYesMenu.action")
	@ResponseBody
	public ResponseResult selectYesMenu(Integer limit,Integer page,PowerMenu powerMenu) {
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		
		List<HashMap<String, Object>> menus = iPowerMenuService.selectYesMenu(page2, powerMenu);
		
		Integer count = iPowerMenuService.getYesRows(powerMenu);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setCount(0);
		result.setData(menus);
		return result;
	}
	
}

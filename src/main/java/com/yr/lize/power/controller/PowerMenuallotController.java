package com.yr.lize.power.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yr.lize.pojo.PowerMenuallot;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.power.service.IPowerMenuallotService;

@Controller
public class PowerMenuallotController {

	@Autowired
	IPowerMenuallotService iPowerMenuallotService;
	
	// 删除拥有菜单
	@RequestMapping("/PowerMenuallot/deleteMenuallot.action")
	@ResponseBody
	public ResponseResult deleteMenuallot(Integer id) {
		Integer res = iPowerMenuallotService.deleteMenuallot(id);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("移除成功!");
		}else {
			result.setCode(-1);
			result.setMsg("移除失败!");
		}
		return result;
	}
	//添加未拥有菜单
	@RequestMapping("/ProwMenuallot/addMenuallot.action")
	@ResponseBody
	public ResponseResult addMenuallot(PowerMenuallot menuallot) {
		Integer res = iPowerMenuallotService.addMenuallot(menuallot);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功!");
		}else {
			result.setCode(-1);
			result.setMsg("添加失败!");
		}
		return result;
	}
	//批量添加未拥有菜单
	@RequestMapping("/ProwMenuallot/addMenuallots.action")
	@ResponseBody
	public ResponseResult addMenuallots(Integer[] menu_ids, Integer position_id) {
		Integer res = iPowerMenuallotService.addMenuallots(menu_ids,position_id);
		
		ResponseResult result = new ResponseResult();
		System.err.println(res);
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功!");
		}else {
			result.setCode(-1);
			result.setMsg("添加失败!");
		}
		
		return result;
	}
	//批量删除未拥有菜单
	@RequestMapping("/ProwMenuallot/deleteMenuallots.action")
	@ResponseBody
	public ResponseResult deleteMenuallots(Integer[] ids) {
		Integer res = iPowerMenuallotService.deleteMenuallots(ids);
		
		ResponseResult result = new ResponseResult();
		System.err.println(res);
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功!");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败!");
		}
		
		return result;
	}
	
}

package com.yr.lize.system.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.system.service.*;
@Controller
public class SystemAreaController {
	
	@Autowired
	ISystemAreaService ISystemAreaService;
	
	//转跳到区域管理页面
		@RequestMapping("/system/areaManagement.action")
		public String positionManager() {
			return "WEB-INF/views/system/areaManagement";
		}
		//转跳到已管理区域页面
		@RequestMapping("/system/AreaManagementForm.action")
		public String areaManagementForm() {
			return "WEB-INF/views/system/areaManagementForm";
		}
		//转跳到未管理区域管理页面
		@RequestMapping("/system/noAreaManagementForm.action")
		public String noAreaManagementForm() {
			return "WEB-INF/views/system/noAreaManagementForm";
		}
		//查询已管理区域
		@RequestMapping("/System/getAlready.action")
		@ResponseBody
		public ResponseResult getAlready(Integer staff_id){
			 List<HashMap<String, Object>> region = ISystemAreaService.getAlready(staff_id);
				
				ResponseResult result = new ResponseResult();
				result.setCode(0);
				result.setData(region);
				return result;
		}
		//查询未管理区域
		@RequestMapping("/System/getNotyet.action")
		@ResponseBody
		public ResponseResult getNotyet(Integer staff_id){
			 List<HashMap<String, Object>> region = ISystemAreaService.getNotyet(staff_id);
				
				ResponseResult result = new ResponseResult();
				
				result.setCode(0);
				result.setData(region);
				return result;
		}
		//模糊查询区域
		@RequestMapping("/System/selectArea.action")
		@ResponseBody
		public ResponseResult selectArea(String cDCName){
			 List<HashMap<String, Object>> region = ISystemAreaService.selectArea(cDCName);
				
				ResponseResult result = new ResponseResult();
				
				result.setData(region);
				return result;
		}
		
		
		//添加未管理区域
		@RequestMapping("/System/insertNoArea.action")
		@ResponseBody
		public Integer insertNoArea(Integer cDCCode,Integer staff_id){
			Integer region = ISystemAreaService.insertNoArea(cDCCode,staff_id);
				return region;
		}
		
		//删除已管理区域
		@RequestMapping("/System/daleteArea.action")
		@ResponseBody
		public Integer daleteArea(Integer id){
			Integer region = ISystemAreaService.daleteArea(id);
				
				return region;
		}
		
}

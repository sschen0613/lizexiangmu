package com.yr.lize.system.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemPosition;
import com.yr.lize.system.service.ISystemPositionService;

@Controller
public class SystemPositionController {
	
	@Autowired
	ISystemPositionService iSystemPositionService;
	
	//转跳到职位管理页面
	@RequestMapping("/system/positionManager.action")
	public String positionManager() {
		return "WEB-INF/views/system/positionList";
	}
	//转跳到修改职位页面
	@RequestMapping("/Position/updatePositionList.action")
	public String updatePositionList() {
		return "WEB-INF/views/system/revisePositionList";
	}
	//转跳到添加职位页面
	@RequestMapping("/Position/addPositionList.action")
	public String addPositionList() {
		return "WEB-INF/views/system/addPositionList";
	}
	//转跳到菜单分配页面
	@RequestMapping("/Position/selectYesMenu.action")
	public String selectMenu() {
		return "WEB-INF/views/system/yesMenuAdminList";
	}
	//获取所有职位信息
	@RequestMapping("/Position/getPosition.action")
	@ResponseBody
	public List<SystemPosition> getPosition() {
		
		List<SystemPosition> list = iSystemPositionService.getPosition();
		
		return list;
	}
	//查询所有职位信息
	@RequestMapping("/Position/seletePosition.action")
	@ResponseBody
	public ResponseResult seletePosition(Integer limit,Integer page,SystemPosition position) {
		
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		
		List<HashMap<String, Object>> list = iSystemPositionService.seletePosition(page2,position);
		Integer count = iSystemPositionService.getRows(position);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setData(list);
		result.setCount(count);
		
		
		return result;
	}
	//修改职位名称
	@RequestMapping("/Position/updatePosition.action")
	@ResponseBody
	public ResponseResult updatePosition(SystemPosition position) {
		Integer res = iSystemPositionService.updatePosition(position);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("修改成功!");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("职位名称已存在!");
		}else {
			result.setCode(-1);
			result.setMsg("修改失败!");
		}
		return result;
	}
	//添加职位
	@RequestMapping("/Position/addPosition.action")
	@ResponseBody
	public ResponseResult addPosition(SystemPosition position) {
		Integer res = iSystemPositionService.addPosition(position);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功!");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("职位名称已存在!");
		}else {
			result.setCode(-1);
			result.setMsg("添加失败!");
		}
		return result;
	}
	//删除职位
	@RequestMapping("Position/deletePosition.action")
	@ResponseBody
	public ResponseResult deletePosition(Integer positionId) {
		
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemPositionService.deletePosition(positionId);
		
		if (res > 0 ) {
			result.setCode(1);
			result.setMsg("删除成功");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		
		return result;
	}
	//修改删除标识
	@RequestMapping("/Position/deletePosition2.action")
	@ResponseBody
	public ResponseResult deletePosition2(Integer id) {
		Integer res = iSystemPositionService.deletePosition2(id);
		
		ResponseResult result = new ResponseResult();
		
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

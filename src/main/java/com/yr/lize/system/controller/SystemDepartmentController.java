package com.yr.lize.system.controller;

import com.st.rbac.util.Page;
import com.st.rbac.util.TestExcel;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemDepartment;
import com.yr.lize.system.service.ISystemDepartmentService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
public class SystemDepartmentController {

	@Autowired
	ISystemDepartmentService iSystemDepartmentService;
	//转跳到部门列表
	@RequestMapping("/system/departmentManager.action")
	public String departmentManager() {
		return "WEB-INF/views/system/departmentList";
	}
	//转跳到修改部门弹出层
	@RequestMapping("/system/reviseDepartment.action")
	public String reviseDepartment() {
		return "WEB-INF/views/system/reviseDepartment";
	}
	//转跳到添加部门弹出层
	@RequestMapping("/system/addDepartmentList.action")
	public String addDepartmentList() {
		return "WEB-INF/views/system/addDepartment";
	}
	
	//查询所有部门信息
	@RequestMapping("/Department/getDepartment.action")
	@ResponseBody
	public ResponseResult getDepartment(Integer limit,Integer page,SystemDepartment department) {
		
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		
		List<HashMap<String, Object>> list = iSystemDepartmentService.getdepartment(page2,department);
		Integer count = iSystemDepartmentService.getRows(department);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setData(list);
		result.setCount(count);
		
		
		return result;
	}
	//删除部门
	@RequestMapping("/Department/deleteDepartment.action")
	@ResponseBody
	public ResponseResult deleteDepartment(Integer department_Id) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemDepartmentService.deleteDepartment(department_Id);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("部门下拥有员工无法删除!");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		
		return result;
	}
	//修改部门
	@RequestMapping("/Department/updateDepartment.action")
	@ResponseBody
	public ResponseResult updateDepartment(SystemDepartment department) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemDepartmentService.updateDepartment(department);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("修改成功");
		}else {
			result.setCode(-1);
			result.setMsg("修改失败");
		}
		
		return result;
	}
	//添加部门
	@RequestMapping("/Department/addDepartment.action")
	@ResponseBody
	public ResponseResult addDepartment(SystemDepartment department) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemDepartmentService.addDepartment(department);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功");
		}else {
			result.setCode(-100);
			result.setMsg("添加失败");
		}
		return result;
	}
	//修改信息删除标识
	@RequestMapping("/Department/updateDelete.action")
	@ResponseBody
	public ResponseResult updateDelete(Integer department_id) {
		ResponseResult result = new ResponseResult();
		
		Integer res = iSystemDepartmentService.updateDelete(department_id);
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("部门下拥有员工无法删除!");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		return result;
	}
	
	//返回上传文件参数
	@RequestMapping("/Department/uploadExcel.action")
	@ResponseBody
	public ResponseResult uploadExcel(MultipartFile file,HttpServletRequest request) {
		
		
		//文件保存到哪里？
		//保存路径
		String savePath = request.getSession().getServletContext().getRealPath("/Excel");
		//保存文件名
		//获取上传的文件名
		String fileName = file.getOriginalFilename();
		//截取文件名的最后一个.点 的名字后缀
		String subfix = fileName.substring(fileName.lastIndexOf("."));
		//根据UUID 加上后缀 创建一个新的文件名
		String saveFile = UUID.randomUUID() + subfix;
		
		//文件如何保存？
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			inputStream = file.getInputStream();
			
			outputStream = new FileOutputStream(savePath +"/"  + saveFile);
			
			IOUtils.copy(inputStream, outputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (outputStream != null) {
				try {
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
/*		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		String url = (savePath +"\\"+ saveFile);
		//利用getExcl方法获取到Excel中的数据
		List<SystemDepartment> departments = TestExcel.getExcl(url);
		//把从Excel获取的数据导入数据库
		Integer res = iSystemDepartmentService.insertExcelDpmt(departments);
		
		//Productpic pic = new Productpic();
		//pic.setPrdpic("upload/"+saveFile);
		
		File file2 = new File(url);
		file2.delete();
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("导入成功!");
		}else {
			result.setCode(-1);
			result.setMsg("导入失败");
		}
		
		return result;
	}
	//同步钉钉部门
	@RequestMapping("/Department/updateDingDepartment.action")
	@ResponseBody
	public ResponseResult updateDingDepartment() {
		Integer res = null;
		ResponseResult result = new ResponseResult();
		try {
			res = iSystemDepartmentService.updateDingDepartment();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			res = -200;
			e.printStackTrace();
		}
		
		if (res > 0) {
			result.setMsg("同步成功");
			result.setCode(1);
		}else if (res == -200) {
			result.setCode(-100);
			result.setMsg("同步出现异常!");
		}else {
			result.setCode(-100);
			result.setMsg("同步可能出现问题了!");
		}
		return result;
	}
	//根据id查询部门
	@RequestMapping("/Department/selectDingDepartmentId.action")
	@ResponseBody
	public ResponseResult selectDingDepartmentId(String id) {
		ResponseResult result = new ResponseResult();
		
		SystemDepartment department = iSystemDepartmentService.selectDingDepartmentId(id);
		
		result.setData(department);
		
		return result;
	}

	//查询所有部门
	@RequestMapping("/Department/selectDingAllDepartment.action")
	@ResponseBody
	public ResponseResult selectDingAllDepartment() {
		ResponseResult result = new ResponseResult();

		List<SystemDepartment> list = iSystemDepartmentService.selectDingAllDepartment();

		result.setData(list);

		return result;
	}
}

package com.yr.lize.system.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.SystemDepartment;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.mapper.SystemDepartmentMapper;
import com.yr.lize.system.mapper.SystemStaffMapper;
import com.yr.lize.system.service.ISystemDepartmentService;

@Service
public class SystemDepartmentServiceImpl implements ISystemDepartmentService {
	
	@Autowired
	SystemDepartmentMapper systemDepartmentMaper;
	
	@Autowired
	SystemStaffMapper systemStaffMapper;
	
	@Autowired
	IDingDingUtilsService DingDingUtilsService;
	
	@Override
	public Integer updateDingDepartment() throws ApiException {
		//同步钉钉部门
		List<Department> departments = DingDingUtilsService.getDepartment();
		Integer res2 = null;
			for (Department department : departments) {
				//查询部门是否已存在
				SystemDepartment department2 = systemDepartmentMaper.selectDingDepartmentId(department.getId().toString());
				SystemDepartment department3 = new SystemDepartment();
				
				department3.setDing_depmid(department.getId().toString());
				department3.setDepartment_Name(department.getName());
				department3.setSuperior_Id(department.getParentid().intValue());
				
				if (department2 != null) {
					//如果部门存在更新
					department3.setDepartment_Id(department2.getDepartment_Id());
					Integer res = systemDepartmentMaper.updateDepartment(department3);
					if (res > 0 ) {
						System.err.println("数据更新成功");
						res2 = 100;
					}else {
						System.err.println("数据更新失败");
						res2 = -100;
					}
					res2 = 100;
				}else {
					//如果部门不存在添加
					Integer res = systemDepartmentMaper.addDepartment(department3);
					if (res > 0 ) {
						System.err.println("数据添加成功");
						res2 = 100;
					}else {
						System.err.println("数据添加失败");
						res2 = -100;
					}
				}
			}
		return res2;
	}
	//查询所有部门
	@Override
	public List<HashMap<String, Object>> getdepartment(Page page2, SystemDepartment department) {
		// TODO Auto-generated method stub
		return systemDepartmentMaper.getdepartment(page2,department);
	}
	//查询所有部门数量
	@Override
	public Integer getRows(SystemDepartment department) {
		// TODO Auto-generated method stub
		return systemDepartmentMaper.getRows(department);
	}
	@Override
	public Integer deleteDepartment(Integer department_Id) {
		// 删除部门
		List<SystemStaff> staffs = systemStaffMapper.selectDepartmentId(department_Id);
		System.out.println(staffs);
		if (staffs != null && !staffs.isEmpty()) {
			return -100;
		}else {
			return systemDepartmentMaper.deleteDepartment(department_Id);
		}
		
	}
	@Override
	public Integer updateDepartment(SystemDepartment department) {
		// 修改部门
		return systemDepartmentMaper.updateDepartment(department);
	}
	@Override
	public Integer addDepartment(SystemDepartment department) {
		// 添加部门
		return systemDepartmentMaper.addDepartment(department);
	}
	@Override
	public Integer insertExcelDpmt(List<SystemDepartment> departments) {
		// 导入Excel数据
		return systemDepartmentMaper.insertExcelDpmt(departments);
	}
	@Override
	public Integer updateDelete(Integer department) {
		// 修改删除标识
		List<SystemStaff> staffs = systemStaffMapper.selectDepartmentId(department);
		if (staffs != null && !staffs.isEmpty()) {
			return -100;
		}else {
			return systemDepartmentMaper.updateDelete(department);
		}
	}
	@Override
	public SystemDepartment selectDingDepartmentId(String intValue) {
		// TODO Auto-generated method stub
		return systemDepartmentMaper.selectDingDepartmentId(intValue);
	}

	@Override
	public List<SystemDepartment> selectDingAllDepartment() {
		return systemDepartmentMaper.selectDingAllDepartment();
	}
}

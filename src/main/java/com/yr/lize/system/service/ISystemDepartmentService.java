package com.yr.lize.system.service;

import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.SystemDepartment;

import java.util.HashMap;
import java.util.List;

public interface ISystemDepartmentService {
	
	//查询所有部门
	List<HashMap<String, Object>> getdepartment(Page page2, SystemDepartment department);
	//查询部门数量
	Integer getRows(SystemDepartment department);
	//删除部门
	Integer deleteDepartment(Integer department_Id);
	//修改部门
	Integer updateDepartment(SystemDepartment department);
	//添加部门
	Integer addDepartment(SystemDepartment department);
	//导入Excel数据
	Integer insertExcelDpmt(List<SystemDepartment> departments);
	//修改删除标识
	Integer updateDelete(Integer department);
	//同步钉钉部门
	Integer updateDingDepartment() throws ApiException;
	//查询部门是否已存在
	SystemDepartment selectDingDepartmentId(String intValue);

    List<SystemDepartment> selectDingAllDepartment();
}

package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemCompany;
import com.yr.lize.pojo.SystemDepartment;

import java.util.HashMap;
import java.util.List;
@DataSource(value = "1")
public interface SystemDepartmentMapper {
	//查询所有部门
	List<HashMap<String, Object>> getdepartment(Page page2, SystemDepartment department);
	//查询部门总数量
	Integer getRows(SystemDepartment department);
	//删除部门
	Integer deleteDepartment(Integer department_Id);
	//修改部门
	Integer updateDepartment(SystemDepartment department);
	//查询分公司下的所有部门(删除分公司时判断是否还有部门)
	List<SystemCompany> selectCompanyId(Integer company_Id);
	//添加部门
	Integer addDepartment(SystemDepartment department);
	//导入Excel数据
	Integer insertExcelDpmt(List<SystemDepartment> departments);
	//修改删除标识
	Integer updateDelete(Integer department);
	//查询部门是否已存在
	SystemDepartment selectDingDepartmentId(String intValue);

	//查询所有部门信息
    List<SystemDepartment> selectDingAllDepartment();
}
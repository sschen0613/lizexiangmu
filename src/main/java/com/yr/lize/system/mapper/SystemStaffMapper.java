package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.pojo.StaffState;
import com.yr.lize.pojo.SystemStaff;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@DataSource(value = "1")
public interface SystemStaffMapper {
  
    
    //用户登录
	SystemStaff login(SystemStaff systemStaff);
	//获取当前登录用户菜单
	List<PowerMenu> getMenu(SystemStaff systemStaff);
	//根据用户权限查询员工
	List<HashMap<String, Object>> selectStaff(Page page2, SystemStaff staff);
	//根据当前用户权限查询员工数量
	Integer getRows(SystemStaff staff);
	//添加员工
	Integer addStaff(SystemStaff staff);
	//查询账号是否存在
	SystemStaff selectById(SystemStaff staff);
	//修改员工信息
	Integer updateStaff(SystemStaff staff);
	//修改密码
	Integer updatePassword(SystemStaff staff);
	//查询所有入职状态
	List<StaffState> getStaffState(StaffState state);
	//删除员工
	Integer deleteStaff(Integer staff_Id);
	//查询部门下员工(删除部门时判断此部门下是否还有员工
	List<SystemStaff> selectDepartmentId(Integer department_Id);
	//修改员工删除标识
	Integer updateDelete(Integer staff_Id);
	//批量修改员工删除标识
	Integer updateDeletes(@Param("staffids") Integer[] staffids);
	//查询有档案调阅审批权限的人
	List<HashMap<String, Object>> selectArchivesStaff();
	//查询有档案销毁审批权限的人
	List<HashMap<String, Object>> selectArchivesDestructionStaff();
	//查询是否存在相同数据
	List<SystemStaff> selectDingStaffIdAndDepartmentId(String userid);
	//根据id查询员工
	SystemStaff selectStaffById(Integer applicant_id);
	//根据钉钉id标识查询员工信息
	SystemStaff selectStaffByDingdingStaffId(String dingding_staffid);
	//根据钉钉id标识查询员工信息
	SystemStaff selectStaffByDingdingStaffIdAndDepartmentId(@Param("dingding_staffid") String dingding_staffid,@Param("department_id") String department_id);

	SystemStaff selectStaffByDingdingId(String userId);

	SystemStaff selectStaffByIdTure(String staff_idture);
}
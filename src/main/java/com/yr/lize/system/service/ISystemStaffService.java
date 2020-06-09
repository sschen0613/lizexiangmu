package com.yr.lize.system.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.pojo.StaffState;
import com.yr.lize.pojo.SystemStaff;

public interface ISystemStaffService {
	//登录操作
	Integer login(SystemStaff systemStaff, HttpSession session);
	//获取当前登录用户菜单
	List<PowerMenu> getMenu(SystemStaff systemStaff);
	
	//根据当前登陆用户权限查询员工
	List<HashMap<String, Object>> selectStaff(Page page2, SystemStaff staff);
	//根据当前登陆用户权限查询员工数量
	Integer getRows(SystemStaff staff);
	//添加员工
	Integer addStaff(SystemStaff staff);
	//修改员工信息
	Integer updateStaff(SystemStaff staff);
	//修改密码
	Integer updatePasswore(SystemStaff staff);
	//查询所有入职状态
	List<StaffState> getStaffState(StaffState state);
	//删除员工
	Integer deleteStaff(Integer staff_Id);
	//修改员工删除标识
	Integer updateDelete(Integer staff_Id);
	//批量修改员工删除标识
	Integer updateDeletes(Integer[] staffids);
	//查询有档案调阅审批权限的人
	List<HashMap<String, Object>> selectArchivesStaff();
	//查询有档案销毁审批权限的人
	List<HashMap<String, Object>> selectArchivesDestructionStaff();
	//同步钉钉员工
	Integer updateDingStaff() throws ApiException;
	//根据钉钉id标识查询员工信息
	SystemStaff selectStaffByDingdingStaffId(String dingding_staffid);
	
}

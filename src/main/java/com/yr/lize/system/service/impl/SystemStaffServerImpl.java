package com.yr.lize.system.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.pojo.StaffState;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.mapper.SystemStaffMapper;
import com.yr.lize.system.service.ISystemStaffService;

@Service
public class SystemStaffServerImpl implements ISystemStaffService {
	
	@Autowired
	SystemStaffMapper systemStaffMapper;
	@Autowired
	IDingDingUtilsService DingDingUtilsService;
	//员工登录
	@Override
	public Integer login(SystemStaff Staff,HttpSession session) {
		
		if (!"".equals(Staff.getStaff_Number()) && !"".equals(Staff.getStaff_Password())) {
			SystemStaff systemStaff = systemStaffMapper.login(Staff);
			
			if (systemStaff != null) {
				//登录成功  保存用户信息到session
				session.setAttribute("systemStaff", systemStaff);
				return 1;
			}else {
				//未搜索到数据  账号或密码错误
				return -100;
			}
		}else {
			//账号或密码不能为空
			return -200;
		}
	}


	//获取当前登录用户菜单
	@Override
	public List<PowerMenu> getMenu(SystemStaff systemStaff) {
		
		return systemStaffMapper.getMenu(systemStaff);
	}

	//根据当前用户查询员工
	@Override
	public List<HashMap<String, Object>> selectStaff(Page page2, SystemStaff staff) {
		return systemStaffMapper.selectStaff(page2, staff);
	}

	@Override
	public List<HashMap<String, Object>> selectStaffTr() {
		return systemStaffMapper.selectStaffTr();
	}

	//根据当前用户查询员工数量
	@Override
	public Integer getRows(SystemStaff staff) {
		// TODO Auto-generated method stub
		return systemStaffMapper.getRows(staff);
	}

	//添加员工
	@Override
	public Integer addStaff(SystemStaff staff) {
		//查询账号是否存在
		SystemStaff staff2 = systemStaffMapper.selectById(staff);
		
		if (staff2 != null) {
			
			return -100;
		}else {
			//判断账号密码是否为空
			if (staff.getStaff_Number() != null && staff.getStaff_Password() != null) {
				
				return systemStaffMapper.addStaff(staff);
			}else {
				return -300;
			}
		}
	}

	//修改员工信息
	@Override
	public Integer updateStaff(SystemStaff staff) {
		// 		//查询账号是否存在
		SystemStaff staff2 = null;
		if (!"".equals(staff.getStaff_Number())) {
			staff2 = systemStaffMapper.selectById(staff);
			
		}
		if (staff2 != null) {
			
			return -100;
		}else {
				return systemStaffMapper.updateStaff(staff);
		}
	}
	//修改密码
	@Override
	public Integer updatePasswore(SystemStaff staff) {
		//判断账号密码是否为空
		if (staff.getStaff_Password() != null) {
			
			return systemStaffMapper.updatePassword(staff);
		}else {
			return -100;
		}
	}


	@Override
	public List<StaffState> getStaffState(StaffState state) {
		// 查询所有入职状态
		return systemStaffMapper.getStaffState(state);
	}


	@Override
	public Integer deleteStaff(Integer staff_Id) {
		// 删除员工
		return systemStaffMapper.deleteStaff(staff_Id);
	}


	@Override
	public Integer updateDelete(Integer staff_Id) {
		//修改员工删除标识
		return systemStaffMapper.updateDelete(staff_Id);
	}


	@Override
	public Integer updateDeletes(Integer[] staffids) {
		//批量修改员工删除标识
		return systemStaffMapper.updateDeletes(staffids);
	}


	@Override
	public List<HashMap<String, Object>> selectArchivesStaff() {
		//查询有档案调阅审批权限的人
		return systemStaffMapper.selectArchivesStaff();
	}


	@Override
	public List<HashMap<String, Object>> selectArchivesDestructionStaff() {
		//查询有档案销毁审批权限的人
		return systemStaffMapper.selectArchivesDestructionStaff();
	}


	@Override
	public Integer updateDingStaff() throws ApiException {
		//同步钉钉员工
		List<Department> departments = DingDingUtilsService.getDepartment();
		Department department2 = new Department();
		department2.setId(1L);
		departments.add(1, department2);
		Integer res = 0;
		for (Department department : departments) {
			//获取钉钉所有部门下的员工
			List<Userlist> userlists = DingDingUtilsService.getUserlist(department.getId());
			for (Userlist userlist : userlists) {
				//开始添加同步钉钉员工表
				res = DingDingUtilsService.updateDingStaff(userlist.getUserid());
			}
		}
		return res;
	}

	/**
	 * @Description 根据钉钉id标识查询员工信息
	 * @Author Lic
	 * @Date 2019/5/14
	 * @param 
	 * @return 
	 */
	@Override
    public SystemStaff selectStaffByDingdingStaffId(String dingding_staffid){
	    return systemStaffMapper.selectStaffByDingdingStaffId(dingding_staffid);
    }

}

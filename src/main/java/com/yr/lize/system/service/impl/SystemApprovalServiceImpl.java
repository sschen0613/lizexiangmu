package com.yr.lize.system.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.yr.lize.pojo.SystemStaff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiRoleListRequest;
import com.dingtalk.api.response.OapiRoleListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiRoleListResponse.OpenRoleGroup;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.taobao.api.ApiException;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.ApproverCopy;
import com.yr.lize.pojo.ApproverManage;
import com.yr.lize.pojo.ApproverRole;
import com.yr.lize.system.mapper.SystemApprovalMapper;
import com.yr.lize.system.service.ISystemApprovalService;
@Service
public class SystemApprovalServiceImpl implements ISystemApprovalService {
	
	@Autowired
	SystemApprovalMapper systemApprovalMapper;
	
	@Autowired
	IDingDingUtilsService dingDingUtilsService;
	
	@Override
	public List<HashMap<String, Object>> getApprovalList() {
		//获取审批管理列表
		return systemApprovalMapper.getApprovalList();
	}

	@Override
	public List<HashMap<String, Object>> selectApprovalRole(Integer id) {
		//查询当前审批角色
		return systemApprovalMapper.selectApprovalRole(id);
	}

	@Override
	public List<OpenRoleGroup> selectDingRole() throws ApiException {
		// 查询钉钉所有角色
		String accessToken = dingDingUtilsService.getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/list");
		OapiRoleListRequest request = new OapiRoleListRequest();
		request.setOffset(0L);
		request.setSize(10L);
		OapiRoleListResponse response = client.execute(request, accessToken);
		System.out.println(response.getBody());
		List<OpenRoleGroup> result = response.getResult().getList();
		return result;
	}
	@Override
	public Integer addDingRole(ApproverRole approverRole) {
		//添加审批角色
		ApproverRole approverRole2 = systemApprovalMapper.getApprovalRole(approverRole);
		
		
		//添加审批流当前对应的人审批角色人数
		
		if (approverRole2 != null) {
			return -100;
		}else {
			Integer res = systemApprovalMapper.addDingRole(approverRole);
			
			if (res > 0) {
				List<HashMap<String, Object>> list = systemApprovalMapper.selectApprovalRole(approverRole.getApproval_id());
				systemApprovalMapper.updateApprovalManagerCount(list.size(),approverRole.getApproval_id());
			}
			return res;
		}
	}

	@Override
	public Integer deleteDingRole(ApproverRole approverRole) {
		//删除审批角色
		Integer res = systemApprovalMapper.deleteDingRole(approverRole);
		List<HashMap<String, Object>> list = systemApprovalMapper.selectApprovalRole(approverRole.getApproval_id());
		systemApprovalMapper.updateApprovalManagerCount(list.size(),approverRole.getApproval_id());
		return res;
		//添加审批流当前对应的人审批角色人数
	}

	@Override
	public Integer updateApprovalStaff(ApproverRole approverRole) {
		//设置审批流程
		return systemApprovalMapper.updateApprovalStaff(approverRole);
	}

	@Override
	public List<Userlist> selectDingStaff() throws ApiException {
		//同步钉钉员工
		List<Department> departments = dingDingUtilsService.getDepartment();
		Department department2 = new Department();
		department2.setId(1L);
		departments.add(1, department2);
		List<Userlist> staffs = new ArrayList<>();
		for (Department department : departments) {
			//获取钉钉所有部门下的员工
			List<Userlist> userlists = dingDingUtilsService.getUserlist(department.getId());
			for (Userlist userlist : userlists) {
				//开始添加同步钉钉员工表
				Userlist user = new Userlist();
				user.setName(userlist.getName());
				user.setUserid(userlist.getUserid());
				staffs.add(user);
			}
		}
		
		return staffs;
	}

	@Override
	public Integer addCopyPerson(ApproverCopy approverCopy) {
		//添加抄送人
		ApproverCopy approverCopy2 = systemApprovalMapper.selectCopyPersonId(approverCopy.getApproval_id(),approverCopy.getCopy_person(),approverCopy.getCompany_id());
		if (approverCopy2 != null) {
			return -100;
		}else {
			return systemApprovalMapper.addCopyPerson(approverCopy);
		}
	}

	@Override
	public List<ApproverCopy> selectCopyPerson(Integer id, int company_id) {
		//查询审批流对应抄送人
		return systemApprovalMapper.selectCopyPerson(id,company_id);
	}

	@Override
	public Integer deleteCopyPerson(Integer id) {
		//删除审批流对应抄送人
		return systemApprovalMapper.deleteCopyPerson(id);
	}

	@Override
	public Integer addDingAdmin(ApproverRole approverRole) {
		// 添加审批主管
		ApproverRole approverRole2 = systemApprovalMapper.getApprovalAdmin(approverRole.getRole_type());
		
		
		//添加审批流当前对应的人审批角色人数
		
		if (approverRole2 != null) {
			return -100;
		}else {
			Integer res = systemApprovalMapper.addApprovalAdmin(approverRole);
			
			if (res > 0) {
				List<HashMap<String, Object>> list = systemApprovalMapper.selectApprovalRole(approverRole.getApproval_id());
				systemApprovalMapper.updateApprovalManagerCount(list.size()+1,approverRole.getApproval_id());
			}
			return res;
		}
	}
	//修改审批排序
	@Override
	public Integer updatePriority(ApproverRole approverRole) {
		
		ApproverRole approverRole2 = systemApprovalMapper.selectRolePriority(approverRole);
		
		if (approverRole2 != null) {
			return -100;
		}else {
			return systemApprovalMapper.updatePriority(approverRole);
		}
		
	}

	@Override
	public ApproverManage selectManager(Integer id) {
		//查询当前审批流的设置信息
		ApproverManage approverManage = systemApprovalMapper.selectManage(id);
		return approverManage;
	}

	@Override
	public Integer addFacilitiesApproval(ApproverRole approverRole) {
		//添加审批人

		//需求要求可重复设置审批人，如：1：张三；2：李四；3：张三
		//查询审批人是否已存在
//		ApproverRole approverRole2 = systemApprovalMapper.selectFacilitiesApproval(approverRole);
		
//		if (approverRole2 == null) {
			//添加审批人
			return systemApprovalMapper.addFacilitiesApproval(approverRole);
//		}else {updateApproval
//			return -100;
//		}
	}

	@Override
	public List<ApproverRole> selectAllocationApproval(Integer id, Integer company_Id) {
		//查询当前审批流有多少审批
		return systemApprovalMapper.selectAllocationApproval(id,company_Id);
	}

	@Override
	public List<ApproverRole> selectConditionApproval(ApproverRole approverRole) {
		//查询对应公司的和条件的审批人
		return systemApprovalMapper.selectConditionApproval(approverRole);
	}

	@Override
	public ApproverManage selectManage(Integer approval_id) {
		//根据id查询当前审批管理信息
		return systemApprovalMapper.selectManage(approval_id);
	}

	@Override
	public List<HashMap<String, Object>> findCurrencyNameByTyep1() {
		return systemApprovalMapper.findCurrencyNameByTyep1();
	}

	@Override
	public Integer updateApproval1(SystemStaff staff) {
		return systemApprovalMapper.updateApproval1(staff);
	}

	@Override
	public Integer updateApproval2(SystemStaff staff) {
		return systemApprovalMapper.updateApproval2(staff);
	}
}

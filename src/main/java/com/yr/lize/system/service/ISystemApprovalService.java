package com.yr.lize.system.service;

import com.dingtalk.api.response.OapiRoleListResponse.OpenRoleGroup;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.ApproverCopy;
import com.yr.lize.pojo.ApproverManage;
import com.yr.lize.pojo.ApproverRole;
import com.yr.lize.pojo.SystemStaff;

import java.util.HashMap;
import java.util.List;

public interface ISystemApprovalService {
	//获取审批管理列表
	List<HashMap<String, Object>> getApprovalList();
	//查询当前审批角色
	List<HashMap<String, Object>> selectApprovalRole(Integer id);
	//查询钉钉所有角色
	List<OpenRoleGroup> selectDingRole() throws ApiException;
	//添加审批角色
	Integer addDingRole(ApproverRole approverRole);
	//删除审批角色
	Integer deleteDingRole(ApproverRole approverRole);
	//设置审批流程
	Integer updateApprovalStaff(ApproverRole approverRole);
	//获取钉钉所有的员工
	List<Userlist> selectDingStaff() throws ApiException;
	//添加抄送人
	Integer addCopyPerson(ApproverCopy approverCopy);
	//查询审批流对应抄送人
	List<ApproverCopy> selectCopyPerson(Integer id, int company_id);
	//删除审批流对应抄送人
	Integer deleteCopyPerson(Integer id);
	//添加审批主管
	Integer addDingAdmin(ApproverRole approverRole);
	//修改审批排序
	Integer updatePriority(ApproverRole approverRole);
	//查询当前审批流的设置信息
	ApproverManage selectManager(Integer id);
	//添加办公设施调拨审批人
	Integer addFacilitiesApproval(ApproverRole approverRole);
	//查询当前审批流有多少审批
	List<ApproverRole> selectAllocationApproval(Integer id, Integer company_Id);
	//查询对应公司的和条件的审批人
	List<ApproverRole> selectConditionApproval(ApproverRole approverRole);
	//根据id查询
	ApproverManage selectManage(Integer approval_id);

	//查询所有approver类别
    List<HashMap<String,Object>> findCurrencyNameByTyep1();

	Integer updateApproval1(SystemStaff staff);

	Integer updateApproval2(SystemStaff staff);
}

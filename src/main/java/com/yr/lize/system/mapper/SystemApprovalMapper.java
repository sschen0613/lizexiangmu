package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.yr.lize.pojo.*;

import java.util.HashMap;
import java.util.List;
@DataSource(value = "1")
public interface SystemApprovalMapper {
	//获取审批管理列表
	List<HashMap<String, Object>> getApprovalList();
	//查询当前审批角色
	List<HashMap<String, Object>> selectApprovalRole(Integer id);
	//添加审批角色
	Integer addDingRole(ApproverRole approverRole);
	//删除审批角色
	Integer deleteDingRole(ApproverRole approverRole);
	//设置审批流程
	Integer updateApprovalStaff(ApproverRole approverRole);
	//查询角色组是否已存在
	ApproverRole getApprovalRole(ApproverRole approverRole);
	//添加抄送人
	Integer addCopyPerson(ApproverCopy approverCopy);
	//查询审批流对应抄送人
	List<ApproverCopy> selectCopyPerson(Integer id, int company_id);
	//删除审批流对应抄送人
	Integer deleteCopyPerson(Integer id);
	//查询抄送人是否已存在
	ApproverCopy selectCopyPersonId(Integer approval_id, String copy_person, Integer company_Id);
	//查询审主管是否已存在
	ApproverRole getApprovalAdmin(Integer integer);
	//添加审批主管
	Integer addApprovalAdmin(ApproverRole approverRole);
	//添加审批流当前对应的人审批角色人数
	Integer updateApprovalManagerCount(Integer size, Integer integer);
	//查询排序是否重复
	ApproverRole selectRolePriority(ApproverRole approverRole);
	//修改排序
	Integer updatePriority(ApproverRole approverRole);
	//根据id查询审批流程
	ApproverManage selectManage(Integer id);
	//查询第一个要通知的审批组或主管
	ApproverRole selectApprovalRoleMin(Integer approval_id);
	//查询所有要通知的审批组或主管
	List<ApproverRole> selectApprovalRoles(Integer approval_id);
	//将审批流对应的审批人加入审批列表
	void addApprovalList(List<String> list, Integer allocation_Id, int i);
	//查询当前登录人员的对应的审批记录信息
	Approver selectApprover(Integer allocation_Id, String dingding_staffid, int i);
	//把当前所有审批人的审批值设置为已审批
	void updateApproverResult(Integer allocation_Id);
	//查询抄送人
	List<ApproverCopy> selectApproverCopyId(Integer approvalId);
	//把当前审批人审批值设置为已审批
	void updateApproverResultMi(Approver approver2);
	//添加
	Integer addapprover(String string, Integer allocation_Id);
	//查询审批人是否已存在
	ApproverRole selectFacilitiesApproval(ApproverRole approverRole);
	//添加审批人
	Integer addFacilitiesApproval(ApproverRole approverRole);
	//查询当前审批流有多少审批
	List<ApproverRole> selectAllocationApproval(Integer id, Integer company_Id);
	//查询对应公司的和条件的审批人
	List<ApproverRole> selectConditionApproval(ApproverRole approverRole);
	//记录这条审批发起时的申请流程,确保这条审批流程没有审批完成时,审批流程被修改,不会影响到当前发起的这条申请流程无法继续
	void addApproveRroleRecord(List<ApproverRole> roles, Integer currency_id);
	//查询对应公司的审批人或条件审批人
	List<ApproverRole> selectApproveRroleRecord(ApproverRole approverRole);
	//审批通过后删除记录的审批流程
	void deleteApproveRroleRecord(ApproverRole approverRole);

	//查询approver种类
	List<HashMap<String,Object>> findCurrencyNameByTyep1();

    Integer updateApproval1(SystemStaff staff);

	Integer updateApproval2(SystemStaff staff);

	List<HashMap<String,Object>> selectApprovalByAlId(Integer approval_id, Integer approvalOpinion_type);
}

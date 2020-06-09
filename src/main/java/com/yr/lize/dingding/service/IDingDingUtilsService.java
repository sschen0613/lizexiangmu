package com.yr.lize.dingding.service;

import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiUserGetResponse;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.ApproverManage;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemStaff;

import java.util.List;
public interface IDingDingUtilsService {
	//获取审批状态审批结果
	void approvalResult() throws ApiException;
	/*//创建钉钉用户
	String addDingStaff(SystemStaff staff) throws ApiException;*/
	//删除钉钉用户
	String deleteDingStaff(SystemStaff staff) throws ApiException;
	//获取钉钉部门列表
	List<Department> getDepartment() throws ApiException;
	//获取钉钉所有部门下的员工
	List<Userlist> getUserlist(Long department_id) throws ApiException;
	//同步钉钉人员
	Integer updateDingStaff(String userid) throws ApiException;
	//查询当前部门的主管列表
	ResponseResult selectDepartmRole(String integer) throws ApiException;
	//发送办公设施调拨工作消息
	void sendmessage(String userlist, SystemStaff staff) throws ApiException;
	//查询当前角色组下的人员id
	ResponseResult selectDingRoleStaff(String approver_id) throws ApiException;
	//发送给抄送人和发起人成功
	void sendmessageCopy(String userlist, SystemStaff systemStaff, ApproverManage approverManage) throws ApiException;
	//发送给抄送人和发起人失败
	void sendmessageCopy2(String userlist, SystemStaff systemStaff, ApproverManage approverManage) throws ApiException;
	String getAccessToken();
	//发送工作消息通知
	void sendoOutNotice(String string, SystemStaff staff) throws ApiException;
	//发送工作消息通知通用
	void sendmessageCopy3(String userlist, SystemStaff systemStaff) throws ApiException;
	
	//发送工作消息通知通用
	void sendoOutNotice2(String dingStaffid, SystemStaff staff, ApproverManage approverManage, CurrencyApply currencyApply) throws ApiException;
	
	//查询当前部门的上级部门路径
	List<Long> getDingDepartmentSup(String department_id) throws ApiException;
	
	//根据钉钉id查询当前审批人的名称
	OapiUserGetResponse selectDingUserDetils(String currency_string) throws ApiException;

    SystemStaff getUserId(String code);

	//发送提醒给各科室科长
	void sendrRemind(String userlist,String content) throws ApiException;
}

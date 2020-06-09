package com.yr.lize.system.controller;

import com.dingtalk.api.response.OapiRoleListResponse.OpenRoleGroup;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.ApproverCopy;
import com.yr.lize.pojo.ApproverManage;
import com.yr.lize.pojo.ApproverRole;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.system.service.ISystemApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class SystemApprovalController {

	@Autowired
	ISystemApprovalService iSystemApprovalService;
	//转跳到设置办公设施调拨审批人页面
	@RequestMapping("/Approval/setupAllocationApproverView.action")
	public String setupAllocationApproverView() {
		return "WEB-INF/views/system/setupAllocationApprover";
	}
	//转跳到设置审批人页面
	@RequestMapping("/Approval/setuppApproverView.action")
	public String setupApproverView() {
		return "WEB-INF/views/system/setupApprover";
	}
	//转跳到设置审批状态页面
	@RequestMapping("/Approval/setApprovalStaffView.action")
	public String setApprovalStaffView() {
		return "WEB-INF/views/system/setApprovalStateView";
	}
	//转跳到设置抄送人页面
	@RequestMapping("/Approval/setCopyPerson.action")
	public String setCopyPerson() {
		return "WEB-INF/views/system/setCopyPerson";
	}
	//转跳到设置条件办公设施审批页面
	@RequestMapping("/Approval/setupConditionAllocationApprover.action")
	public String setupConditionAllocationApprover() {
		return "WEB-INF/views/system/setupConditionAllocationApprover";
	}
	//转跳到设置条件办公设施审批页面
	@RequestMapping("/Approval/approvalCompanyList.action")
	public String approvalCompanyList() {
		return "WEB-INF/views/system/approvalCompanyList";
	}
	//查询对应公司的和条件的审批人
	@RequestMapping("/Approval/selectConditionApproval.action")
	@ResponseBody
	public ResponseResult selectConditionApproval(ApproverRole approverRole) {
		List<ApproverRole> list = iSystemApprovalService.selectConditionApproval(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setData(list);
		
		return result;
	}
	//添加审批人
	@RequestMapping("/Approval/addFacilitiesApproval.action")
	@ResponseBody
	public ResponseResult addFacilitiesApproval(ApproverRole approverRole) {
		Integer res = iSystemApprovalService.addFacilitiesApproval(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setMsg("添加成功");
		}else if (res == -100) {
			result.setMsg("审批人已存在");
		}else {
			result.setMsg("添加失败");
		}
		return result;
	}
	//添加抄送人
	@RequestMapping("/Approval/addCopyPerson.action")
	@ResponseBody
	public ResponseResult addCopyPerson(ApproverCopy approverCopy) {
		
		Integer res = iSystemApprovalService.addCopyPerson(approverCopy);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(0);
			result.setMsg("添加成功!");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("抄送人已存在");
		}else {
			result.setCode(0);
			result.setMsg("添加失败!");
		}
		
		return result;
	}
	//查询审批流对应抄送人
	@RequestMapping("/Approval/selectCopyPerson.action")
	@ResponseBody
	public ResponseResult selectCopyPerson(Integer id, int company_id){
		List<ApproverCopy> approverCopies = iSystemApprovalService.selectCopyPerson(id,company_id);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setData(approverCopies);
		
		return result;
	}
	//删除审批流对应抄送人
	@RequestMapping("/Approval/deleteCopyPerson.action")
	@ResponseBody
	public ResponseResult deleteCopyPerson(Integer id) {
		Integer res = iSystemApprovalService.deleteCopyPerson(id);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(0);
			result.setMsg("移除成功");
		}else {
			result.setCode(-1);
			result.setMsg("移除失败");
		}
		return result;
	}
	//获取审批管理列表
	@RequestMapping("/Approval/getApprovalList.action")
	@ResponseBody
	public ResponseResult getApprovalList() {
		List<HashMap<String, Object>> list = iSystemApprovalService.getApprovalList();
		ResponseResult result = new ResponseResult();
		
		result.setCount(6);
		result.setCode(0);
		result.setData(list);
		return result;
	}
	//查询当前审批角色
	@RequestMapping("/Approval/selectApprovalRole.action")
	@ResponseBody
	public ResponseResult selectApprovalRole(Integer id) {
		List<HashMap<String, Object>> list = iSystemApprovalService.selectApprovalRole(id);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		
		result.setData(list);
		return result;
	}
	//查询钉钉中的所有角色
	@RequestMapping("/Approval/selectDingRole.action")
	@ResponseBody
	public List<OpenRoleGroup> selectDingRole(){
		List<OpenRoleGroup> list = null;
		
			try {
				list = iSystemApprovalService.selectDingRole();
			} catch (ApiException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		return list;
	}
	//添加审批角色
	@RequestMapping("/Approval/addDingRole.action")
	@ResponseBody
	public ResponseResult addDingRole(ApproverRole approverRole) {
		Integer res = iSystemApprovalService.addDingRole(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("角色组已存在");
		}else {
			result.setCode(-100);
			result.setMsg("添加失败");
		}
		return result;
	}
	//添加审批主管
	@RequestMapping("/Approval/addDingAdmin.action")
	@ResponseBody
	public ResponseResult addDingAdmin(ApproverRole approverRole) {
		Integer res = iSystemApprovalService.addDingAdmin(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("添加成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("主管已存在");
		}else {
			result.setCode(-100);
			result.setMsg("添加失败");
		}
		return result;
	}
	//删除审批角色
	@RequestMapping("/Approval/deleteDingRole.action")
	@ResponseBody
	public ResponseResult deleteDingRole(ApproverRole approverRole) {
		Integer res = iSystemApprovalService.deleteDingRole(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if (res > 0) {
			result.setCode(1);
			result.setMsg("删除成功!");
		}else {
			result.setCode(-1);
			result.setMsg("删除失败");
		}
		return result;		
	}
	//修改审批状态
	@RequestMapping("/Approval/updateApprovalStaff.action")
	@ResponseBody
	public ResponseResult updateApprovalStaff(ApproverRole approverRole){
		Integer res = iSystemApprovalService.updateApprovalStaff(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if ( res > 0 ) {
			result.setCode(1);
			result.setMsg("修改成功");
		}else {
			result.setCode(-1);
			result.setMsg("修改失败");
		}
		return result;
	}
	//查询钉钉所有员工
	@RequestMapping("/Staff/selectDingStaff.action")
	@ResponseBody
	public List<Userlist> selectDingStaff() {
		List<Userlist> staffs = null;
		try {
			staffs = iSystemApprovalService.selectDingStaff();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return staffs;
	}
	//修改审批排序
	@RequestMapping("/Approval/updatePriority.action")
	@ResponseBody
	public ResponseResult updatePriority(ApproverRole approverRole) {
		Integer res = iSystemApprovalService.updatePriority(approverRole);
		
		ResponseResult result = new ResponseResult();
		
		if (res >0) {
			result.setCode(1);
			result.setMsg("修改成功!");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("顺序不能重复!");
		}else {
			result.setCode(-1);
			result.setMsg("修改失败");
		}
		return result;
	}
	//根据id查询审批管理信息
	@RequestMapping("/Approval/selectManage.action")
	@ResponseBody
	public ResponseResult selectManage(Integer approval_id) {
		ApproverManage approverManage = iSystemApprovalService.selectManage(approval_id);
		
		ResponseResult result = new ResponseResult();
		result.setData(approverManage);
		return result;
	}

	//查询审批详情
//    @RequestMapping("/Approval/ApproverProgress")
//    @ResponseBody
//    public ResponseResult ApproverProgress(HttpServletRequest request){
//
//        Integer approval_id = currencyApply.getCurrency_type();
//        CurrencyApply currencyApply2  = currencyApplyMapper.selectCurrencyApplyById(currencyApply.getCurrency_id());
//        Approver approver = systemApprovalMapper.selectApprover(currencyApply2.getCurrency_id(),currencyApply.getCurrency_string(),approval_id);
//
//	    ResponseResult responseResult = new ResponseResult();
//        if (approver.getApproval_result() != 0) {
//            responseResult.setMsg("success");
//        }else {
//            responseResult.setMsg("error");
//        }
//	    return responseResult;
//    }
	@RequestMapping("Currency/findCurrencyNameByTyep1.action")
	@ResponseBody
	public ResponseResult findCurrencyNameByTyep1(){
		ResponseResult result = new ResponseResult();
		List<HashMap<String,Object>> list = iSystemApprovalService.findCurrencyNameByTyep1();
		result.setData(list);
		return result;
	}
}

   package com.yr.lize.system.controller;

import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.StaffState;
import com.yr.lize.pojo.SystemPosition;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.service.ISystemPositionService;
import com.yr.lize.system.service.ISystemStaffService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class SystemStaffController {
	
	@Autowired
	ISystemStaffService iSystemStaffService;
	
	@Autowired
	ISystemPositionService iSystemPositionService;
	//转跳到员工列表
	@RequestMapping("/system/staffManager.action")
	public String staffMapper() {
		
		return "WEB-INF/views/system/staffList";
	}
	//转到修改员
	@RequestMapping("/system/reviseStaff.action")
	public String reviseStaff() {
		
		return "WEB-INF/views/system/reviseStaff";
	}
	//转到添加员工页面
	@RequestMapping("/system/addStaffList.action")
	public String addStaffList() {
		return "WEB-INF/views/system/addStaffList";
	}
	//转跳到修改密码页面
	@RequestMapping("/Staff/message.action")
	public String message() {
		return "WEB-INF/views/message";
	}

	//转跳到手机修改密码页面
	@RequestMapping("/Staff/mMessage.action")
	public String mMessage() {
		return "WEB-INF/views/mobile/mMessage";
	}

	//转跳到我的申请页面
	@RequestMapping("/Staff/myApply.action")
	public String myApply() {
		return "WEB-INF/views/myApplyList";
		//return "WEB-INF/views/mobile/mMyApplyList";
	}

	//转跳到手机端我的申请页面
	@RequestMapping("/Staff/mMyApply.action")
	public String mMyApply() {
		return "WEB-INF/views/mobile/mMyApplyList";
	}

	//转跳到我的审批页面
	@RequestMapping("/Staff/myApproval.action")
	public String myApproval() {
		return "WEB-INF/views/myApprovalList";
		//return "WEB-INF/views/mobile/mMyApprovalList";
	}

    //转跳到手机端我的审批页面
    @RequestMapping("/Staff/mMyApproval.action")
    public String mMyApproval() {
        return "WEB-INF/views/mobile/mMyApprovalList";
    }


    //员工登录
	@RequestMapping("/Staff/login.action")
	public ModelAndView login(SystemStaff systemStaff, HttpSession session) {
		
		Integer res = iSystemStaffService.login(systemStaff,session);
		
		ModelAndView mView = new ModelAndView();
		
		if (res == 1) {
			//转跳到登录页面
			mView.setViewName("redirect:../view/index.action");	
			
		}else if(res == -100){
			//登录失败
			mView.addObject("error", "登录失败,账号或密码错误!");
			mView.setViewName("login");
		}else if (res == -200) {
			//账号或密码为空
			mView.addObject("error", "登录失败,账号或密码不能为空!");
			mView.setViewName("login");
		}
		
		return mView;
	}
	//员工登录
	@RequestMapping("/Staff/Mlogin.action")
	public ModelAndView Mlogin(SystemStaff systemStaff, HttpSession session) {
		
		Integer res = iSystemStaffService.login(systemStaff,session);
		
		ModelAndView mView = new ModelAndView();
		
		if (res == 1) {
			//转跳到首页面
			mView.setViewName("redirect:../mobile/view/Mindex.action");	
			
		}else if(res == -100){
			//登录失败
			mView.addObject("error", "登录失败,账号或密码错误!");
			mView.setViewName("mLogin");
		}else if (res == -200) {
			//账号或密码为空
			mView.addObject("error", "登录失败,账号或密码不能为空!");
			mView.setViewName("mLogin");
		}
		
		return mView;
	}
	//用户退出
	@RequestMapping("/Staff/logout.action")
	public String logout(HttpSession session) {
		//清楚session中的数据
		session.removeAttribute("systemStaff");
		
		return "redirect:../login.jsp";
	}
	
	//根据权限获取员工列表
	@RequestMapping("/Staff/selectStaff.action")
	@ResponseBody
	public ResponseResult selectStaff(Integer limit,Integer page, SystemStaff staff, HttpSession session) {
		
		Page page2 = new Page();
		if (limit != null) {
			page2.setPagerows(limit);
			page2.setCurpage(page);
		}
		SystemStaff staff2 = (SystemStaff) session.getAttribute("systemStaff");
		
		SystemPosition position = iSystemPositionService.selectPositionById(staff2.getPosition_Id());
		
		List<HashMap<String, Object>> list = null;
		
		Integer count = null;
		
		ResponseResult result = new ResponseResult();
		
		if (position.getPosition_Power() == 2) {//检索当前登录用户部门员工
			staff.setStaff_Role(position.getPosition_Power());
			staff.setDepartment_Id(staff2.getDepartment_Id());
			System.err.println(position.getPosition_Power());
			list = iSystemStaffService.selectStaff(page2 ,staff);
			
			count = iSystemStaffService.getRows(staff);
		}else if (position.getPosition_Power() == 1){//查看所有员工
			
			staff.setStaff_Role(position.getPosition_Power());
			list = iSystemStaffService.selectStaff(page2 ,staff);
			
			count = iSystemStaffService.getRows(staff);
		}else if (position.getPosition_Power() == 4) {//检索当前登录用户公司员工
			staff.setStaff_Role(position.getPosition_Power());
			staff.setCompany_Id(staff2.getCompany_Id());
			list = iSystemStaffService.selectStaff(page2 ,staff);
		}else {
			
			result.setMsg("无权访问");;
			result.setCode(-1);
		}
		
		result.setCode(0);
		result.setCount(count);
		result.setData(list);
		
		return result;

	}

	//查询角色是业务经理和区域经理的人
	@RequestMapping("/Staff/selectStaffTr.action")
	@ResponseBody
	public ResponseResult selectStaffTr() {

		ResponseResult result = new ResponseResult();

		List<HashMap<String, Object>> list = iSystemStaffService.selectStaffTr();

		result.setCode(0);
		result.setData(list);

		return result;

	}
	
	//添加员工
	@RequestMapping("/system/addStaff.action")
	@ResponseBody
	public ResponseResult addStaff(SystemStaff staff) {
		
		Integer res = iSystemStaffService.addStaff(staff);

		ResponseResult result = new ResponseResult();
		if (res > 0) {
			//添加成功
			result.setCode(1);
			result.setMsg("添加成功");
		}else if (res == -100) {
			//账号已存在
			result.setCode(-100);
			result.setMsg("账号已存在");
		}else if (res == -300) {
			result.setCode(-300);
			result.setMsg("账号或密码不能为空"); 
		}else {
			//添加失败
			result.setCode(-200);
			result.setMsg("添加失败");
		}
		return result;
	}
	//修改员工信息
	@RequestMapping("/system/updateStaff.action")
	@ResponseBody
	public ResponseResult updateStaff(SystemStaff staff, String join_Date) {
		System.out.println(staff.getStaff_Name());
		staff.setJoin_Data(join_Date);
		Integer res = iSystemStaffService.updateStaff(staff);
		
		ResponseResult result = new ResponseResult();
		if (res > 0) {
			result.setCode(1);
			result.setMsg("修改成功");
		}else {
			result.setCode(-100);
			result.setMsg("修改失败");
		}
		
		return result;
	}
	
	//修改密码
	@RequestMapping("/system/updatePassword.action")
	@ResponseBody
	public ResponseResult updatePassword(SystemStaff staff) {
		
		Integer res = iSystemStaffService.updatePasswore(staff);
		ResponseResult result = new ResponseResult();
		if (res > 0) {
			result.setCode(1);
			result.setMsg("修改成功");
		}else if (res == -100) {
			result.setCode(-100);
			result.setMsg("密码不能为空");
		}
		
		return result;
	}
	//查询入职状态
	@RequestMapping("/Staff/getStaffState.action")
	@ResponseBody
	public ResponseResult getStaffState(StaffState state) {
		
		List<StaffState> list = iSystemStaffService.getStaffState(state);
		
		ResponseResult result = new ResponseResult();
		
		result.setCode(0);
		result.setData(list);
		
		return result;
		
	}
	//修改员工删除标识
	@RequestMapping("/Staff/updateDelete.action")
	@ResponseBody
	public Integer updateDelete(Integer staff_Id) {
		
		Integer res = iSystemStaffService.updateDelete(staff_Id);
		
		return res;
	}
	//删除员工
	@RequestMapping("/Staff/deleteStaff.action")
	@ResponseBody
	public Integer deleteStaff(Integer staff_Id) {
		
		Integer res = iSystemStaffService.deleteStaff(staff_Id);
		
		return res;
	}

	//修改员工删除标识
	@RequestMapping("/Staff/updateDeletes.action")
	@ResponseBody
	public ResponseResult updateDeletes(Integer[] staffids) {
		for (Integer integer : staffids) {
			System.err.println(integer);
		}
		iSystemStaffService.updateDeletes(staffids);
		
		ResponseResult result = new ResponseResult();
			result.setCode(1);
			result.setMsg("删除成功!");
		
		return result;
	}
	//查询拥有档案调阅审批权限的人
	@RequestMapping("/Staff/selectArchivesStaff.action")
	@ResponseBody
	public ResponseResult selectArchivesStaff() {
		List<HashMap<String, Object>> staffs = iSystemStaffService.selectArchivesStaff();
		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(staffs);
		return result;
	}
	//获取钉钉当前免登用户
	@RequestMapping("/Staff/dinglogin.action")
	@ResponseBody
	public ModelAndView dinglogin(JSONObject canshu) {
		//JSONObject cJsonObject = new JSONObject(canshu);
/*		System.out.println(canshu.get("originatorUserId"));
		JSONArray result = (JSONArray) canshu.get("textForms");
		
		for (Object object : result) {
			System.out.println(object);
		}
		*/
		System.out.println(canshu);
		return null;
	}
	//查询拥有档案销毁审批权限的人
	@RequestMapping("/Staff/selectArchivesDestructionStaff.action")
	@ResponseBody
	public ResponseResult selectArchivesDestructionStaff() {
		List<HashMap<String, Object>> staffs = iSystemStaffService.selectArchivesDestructionStaff();
		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(staffs);
		return result;
	}
	//同步钉钉员工
	@RequestMapping("/Staff/updateDingStaff.action")
	@ResponseBody
	public ResponseResult updateDingStaff() {
		Integer res = null;
		ResponseResult result = new ResponseResult();
		try {
			res = iSystemStaffService.updateDingStaff();
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			res = -200;
			e.printStackTrace();
		}
		
		if (res > 0) {
			result.setMsg("同步成功");
			result.setCode(1);
		}else if (res == -200) {
			result.setCode(-100);
			result.setMsg("同步异常!");
		}else {
			result.setCode(-100);
			result.setMsg("同步异常!");
		}
		return result;
	}
	
}

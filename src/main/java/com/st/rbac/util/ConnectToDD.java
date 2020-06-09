package com.st.rbac.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.OapiCallBackRegisterCallBackRequest;
import com.dingtalk.api.request.OapiDepartmentGetRequest;
import com.dingtalk.api.request.OapiDepartmentListIdsRequest;
import com.dingtalk.api.request.OapiDepartmentListRequest;
import com.dingtalk.api.request.OapiGettokenRequest;
import com.dingtalk.api.request.OapiMessageCorpconversationAsyncsendV2Request;
import com.dingtalk.api.request.OapiProcessinstanceCreateRequest;
import com.dingtalk.api.request.OapiProcessinstanceGetRequest;
import com.dingtalk.api.request.OapiProcessinstanceListidsRequest;
import com.dingtalk.api.request.OapiRoleSimplelistRequest;
import com.dingtalk.api.request.OapiUserGetDeptMemberRequest;
import com.dingtalk.api.response.OapiCallBackRegisterCallBackResponse;
import com.dingtalk.api.response.OapiDepartmentGetResponse;
import com.dingtalk.api.response.OapiDepartmentListIdsResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse;
import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiGettokenResponse;
import com.dingtalk.api.response.OapiMessageCorpconversationAsyncsendV2Response;
import com.dingtalk.api.response.OapiProcessinstanceCreateResponse;
import com.dingtalk.api.response.OapiProcessinstanceGetResponse;
import com.dingtalk.api.response.OapiProcessinstanceGetResponse.ProcessInstanceTopVo;
import com.dingtalk.api.response.OapiProcessinstanceListidsResponse;
import com.dingtalk.api.response.OapiRoleSimplelistResponse;
import com.dingtalk.api.response.OapiRoleSimplelistResponse.OpenEmpSimple;
import com.dingtalk.api.response.OapiUserGetDeptMemberResponse;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.SystemStaff;

//连接钉钉的测试类
public class ConnectToDD {
	//合盛的
	//private final static String corpId = "ding8a5ba3b38ea511da35c2f4657eb6378f";
	//private final static String corpSecret = "J6mZ2XowniPrjJ0AGqA-fOsUXE3eWYvxhALiRvhdIB0405GYTQ8z2vExzZIOV25Z";
	//衍瑞的
	private final static String corpId = "ding6cfcd096b2a6319335c2f4657eb6378f";
	private final static String corpSecret = "t41RQbwQGKiS0Xo7zkVmOZCgENsEpZ4JXvcyt-rzvraXwXcCBhL7e7XyOR6lsWr5";
	
	//获取accessToken
	public String getAccessToken() throws ApiException {
		DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
		OapiGettokenRequest request = new OapiGettokenRequest();
		request.setCorpid(corpId);
		request.setCorpsecret(corpSecret);
		request.setHttpMethod("GET");
		OapiGettokenResponse response = client.execute(request);
		System.out.println("accessToken:"+response.getAccessToken());
		return response.getAccessToken();
	}
	
	//获取角色下的员工
	public List<OpenEmpSimple> selectStaffInRole(Long roleId) throws ApiException{
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/simplelist");
		OapiRoleSimplelistRequest request = new OapiRoleSimplelistRequest();
		request.setRoleId(roleId);
		
		OapiRoleSimplelistResponse response = client.execute(request, accessToken);
		
		List<OpenEmpSimple> list =response.getResult().getList();
		System.out.println(response.getResult().getList());
		return list;
	}
	
	//获取部门
	public List<Department> getdepartment() throws ApiException{
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
		OapiDepartmentListRequest request = new OapiDepartmentListRequest();
		request.setHttpMethod("GET");
		OapiDepartmentListResponse response = client.execute(request, accessToken);
		return response.getDepartment();
	}
	
	//获取用户部门的子部门
	public List<Long> getsubdepartment(String deptid) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list_ids");
		OapiDepartmentListIdsRequest request = new OapiDepartmentListIdsRequest();
		request.setId(deptid);
		request.setHttpMethod("GET");
		OapiDepartmentListIdsResponse response = client.execute(request, accessToken);
		return response.getSubDeptIdList();
	}
	
	//获取部门用户userid
	public List<String> getdepartmentuserid(String deptid) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/getDeptMember");
		OapiUserGetDeptMemberRequest req = new OapiUserGetDeptMemberRequest();
		req.setDeptId(deptid);
		req.setHttpMethod("GET");
		OapiUserGetDeptMemberResponse rsp = client.execute(req, accessToken);
		System.out.println(rsp.getUserIds());
		return rsp.getUserIds();
	}
	
	//获取部门名称
	public String getdepartmentName(String id) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
		OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
		request.setId(id);
		request.setHttpMethod("GET");
		OapiDepartmentGetResponse response = client.execute(request, accessToken);
		return response.getName();
	}
	
	//获取上级部门id
		public Long getdepartmentParentId(String id) throws ApiException {
			String accessToken = getAccessToken();
			DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
			OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
			request.setId(id);
			request.setHttpMethod("GET");
			OapiDepartmentGetResponse response = client.execute(request, accessToken);
			return response.getParentid();
		}
	
	//获取部门主管列表
	public String getdeptManagerUseridList(String id) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
		OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
		request.setId(id);
		request.setHttpMethod("GET");
		OapiDepartmentGetResponse response = client.execute(request, accessToken);
		System.out.println("---------------------------------------------"+response.getDeptManagerUseridList());
		//String string = response.getDeptManagerUseridList();
		return response.getDeptManagerUseridList();
	}
	
	//向角色下多个人发送消息通知
	/**
	 * @param
	 * strings   消息发送给谁的id
	 * strings1    消息内容
	 * strings2    发起人的id
	 * 
	 * **/
	public void sendMessage(String strings,String strings1,String string2) throws ApiException {
		String accessToken = getAccessToken();
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
        OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
        
		request.setUseridList(strings);
        request.setAgentId(210224725L);
		
        Date date = new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time =format.format(date); 
        
        OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
        msg.setMsgtype("text");
        msg.setText(new OapiMessageCorpconversationAsyncsendV2Request.Text());
        msg.getText().setContent(string2+strings1+time);
        request.setMsg(msg);
        
        OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
        System.out.println("---------------"+response.getBody());
        System.out.println("---------------"+response.getErrmsg());
        
	}
	
	/**
	 * @param
	 * 
	 * dingStaffid  ddid
	 * path  跳转页面
	 * name  申请人
	 * title  标题
	 * 
	 * */
	//审批免登
	public void sendoOutNotice(String string, String path,String name,String title) throws ApiException {
		//发送工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		//发送办公设施调拨工作消息
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");

        OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
        request.setUseridList(string); //接收者的用户userid列表，最大列表长度：20
        request.setAgentId(210224725L);
        request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209
        
        OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
        msg.setActionCard(new OapiMessageCorpconversationAsyncsendV2Request.ActionCard());
        msg.getActionCard().setTitle(title); //首页显示内容
        msg.getActionCard().setMarkdown(name+"发起的"+title+":发起时间:"+date2); //进入工作通知后的标题内容
        msg.getActionCard().setSingleTitle("点击进入审批"); //进入工作通知后标题下面的内容部分
        msg.getActionCard().setSingleUrl(path/*"https://hs.yanruismart.com/mobile/facilities/facilitiesApprovalPhone.action?dingStaffid="*/+Integer.parseInt(string)); //点击内容跳转链接
        msg.setMsgtype("action_card");

        request.setMsg(msg);
        OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}
	
	//审批通过
	public void sendmessageCopy(String strings,String strings1,String string2) throws ApiException {
		// 发送给抄送人和发起人
		//发送办公设施调拨工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		request.setUseridList(strings);
		request.setAgentId(210224725L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(strings1+"发起的"+string2+"已经通过");
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}

	//审批拒绝
	public void sendmessageCopy2(String strings,String strings1,String string2) throws ApiException {
		// 发送给抄送人和发起人
		//发送办公设施调拨工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		request.setUseridList(strings);
		request.setAgentId(210224725L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(strings1+"发起的"+string2+"未通过");
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		
	}
	
	
	//接口参数准备
	public String submitForm(HashMap<String, String> map,String processCode,SystemStaff staff) throws ApiException {
		String accessTpken = getAccessToken();
		System.out.println(processCode);
		DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/processinstance/create");
		OapiProcessinstanceCreateRequest request = new OapiProcessinstanceCreateRequest();
		//request.setAgentId(41605932L);
		request.setProcessCode(processCode);
		List<OapiProcessinstanceCreateRequest.FormComponentValueVo> formComponentValues = new ArrayList<OapiProcessinstanceCreateRequest.FormComponentValueVo>();
		for(String key : map.keySet()) {
			OapiProcessinstanceCreateRequest.FormComponentValueVo vo = new OapiProcessinstanceCreateRequest.FormComponentValueVo();
			
			vo.setName(key);
			vo.setValue(map.get(key));
			
			formComponentValues.add(vo);
			System.out.println(key);
			System.out.println(map.get(key));
		}
		
		request.setFormComponentValues(formComponentValues);
		request.setApprovers("223109111526134264");
		request.setOriginatorUserId("223109111526134264");
		request.setDeptId(-1L);
		OapiProcessinstanceCreateResponse response = client.execute(request,accessTpken);
		System.out.println(response.getProcessInstanceId());
		return response.getProcessInstanceId();
	}
	
	//获取单个审批实例

	public ProcessInstanceTopVo getProcessInstance(String ProcessInstanceId) throws ApiException {
		String accessTpken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/processinstance/get");
		OapiProcessinstanceGetRequest request = new OapiProcessinstanceGetRequest();
		request.setProcessInstanceId(ProcessInstanceId);
		OapiProcessinstanceGetResponse response = client.execute(request,accessTpken);
		System.out.println(response.getProcessInstance().getResult());
		
		ProcessInstanceTopVo json = response.getProcessInstance();
		
		
		return json;
	}
	
	//获取所有实例id
	public void getProcessInstanceId(String accessToken) throws ApiException {
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/processinstance/listids");
		OapiProcessinstanceListidsRequest req = new OapiProcessinstanceListidsRequest();
		req.setProcessCode("PROC-FF6YR2IQO2-NP3LJ1J0SO4182NKX26K3-3N23J-PB");
		req.setStartTime(1496678400000L);
		req.setEndTime(1496678400000L);
		req.setSize(10L);
		req.setCursor(0L);
		req.setUseridList("manager1,manager2");
		OapiProcessinstanceListidsResponse response = client.execute(req, accessToken);
	}
	
	//注册业务事件回调接口
	public String getInterface() throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/call_back/register_call_back");
		OapiCallBackRegisterCallBackRequest request = new OapiCallBackRegisterCallBackRequest();
		request.setUrl("http://127.0.0.1/heshengxiangmu/DD/purchasePro.action");
		request.setAesKey("1234567890123456789012345678901234567890123");
		request.setToken("123456");
		request.setCallBackTag(Arrays.asList("bpms_task_change", "bpms_instance_change"));
		OapiCallBackRegisterCallBackResponse response = client.execute(request,accessToken);
		return response.getErrmsg();
	}
	
}

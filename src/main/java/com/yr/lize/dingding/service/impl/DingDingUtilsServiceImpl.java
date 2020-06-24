package com.yr.lize.dingding.service.impl;

import com.alibaba.fastjson.JSON;
import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.*;
import com.dingtalk.api.response.*;
import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiRoleSimplelistResponse.OpenEmpSimple;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.mapper.CurrencyApplyMapper;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.ApproverManage;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.mapper.SystemStaffMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class DingDingUtilsServiceImpl implements IDingDingUtilsService{
	
	@Autowired
	SystemStaffMapper systemStaffMapper;

	@Autowired
	CurrencyApplyMapper currencyApplyMapper;
	
	//同步钉钉人员
	@Override
	public Integer updateDingStaff(String userid) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
		OapiUserGetRequest request = new OapiUserGetRequest();
		request.setUserid(userid);
		request.setHttpMethod("GET");
		OapiUserGetResponse response = client.execute(request, accessToken);
		List<Long> departmentIds = response.getDepartment();
		Integer res = null;
		for (Long dptmId : departmentIds) {
			//查询是否有这条员工数据
			List<SystemStaff> systemStaffs = systemStaffMapper.selectDingStaffIdAndDepartmentId(response.getUserid());

			SystemStaff staff2 = new SystemStaff();
			staff2.setDingding_staffid(response.getUserid());
			staff2.setDepartment_Id(dptmId.toString());
			staff2.setStaff_Name(response.getName());
			if (systemStaffs != null && systemStaffs.size() != 0) {
				//staff2.setStaff_Id(staff.getStaff_Id());
				//如果有就更新数据
				//res = systemStaffMapper.updateStaff(staff2);
				/*res = 100;
				if (res > 0) {
					res = 100;
				}else {
					res = -100;
				}*/
				//不做任何操作
				res = 100;
			}else {
				staff2.setStaff_Password("123");
				staff2.setStaff_Age(0);
				//如果没有就添加一个
				res = systemStaffMapper.addStaff(staff2);
				if (res > 0) {
					res = 100;
				}else {
					res = -100;
				}
			}
		}
		
		return res;
	}
	
	//获取钉钉所有部门下的员工
	@Override
	public List<Userlist> getUserlist(Long department_id) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/simplelist");
		OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
		request.setDepartmentId(department_id);
		request.setHttpMethod("GET");

		OapiUserSimplelistResponse response = client.execute(request, accessToken);
		List<Userlist> users = response.getUserlist();
		return users;
	}
	
	//获取钉钉部门列表
	@Override
	public List<Department> getDepartment() throws ApiException {
    	//1.获取token
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
		OapiDepartmentListRequest request = new OapiDepartmentListRequest();
		request.setId("1");
		request.setFetchChild(true);
		request.setHttpMethod("GET");
		OapiDepartmentListResponse response = client.execute(request, accessToken);
		System.err.println(response.getBody());
		List<Department> departments = response.getDepartment();

		return departments;
	}
	
	
    //获取审批状态审批结果
    public void approvalResult() throws ApiException {
    	//1.获取token
    	String accessToken = getAccessToken();
    	DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/processinstance/get");
    	OapiProcessinstanceGetRequest request = new OapiProcessinstanceGetRequest();
    	//获取此条审批的id
    	request.setProcessInstanceId("a56b1d8d-2d40-4f3d-bdef-686a4f936183");
    	OapiProcessinstanceGetResponse response = client.execute(request,accessToken);
    	System.err.println(response.getBody());
		JSONObject process_instance = new JSONObject(response.getProcessInstance());
		System.err.println(response.getProcessInstance());
			//获取审批结果
			String result = process_instance.get("result").toString();
			
			//获取审批是否被操作
			String status = process_instance.get("status").toString();
			//获取审批人
			List<String> approver_userids = response.getProcessInstance().getApproverUserids();
			for (String string : approver_userids) {
				System.err.println(string);
			}
    }
	
    /*//创建钉钉用户
    public String addDingStaff(SystemStaff staff) throws ApiException {
    	String staffId = staff.getStaff_Idture().toString();
    	//1.获取token
    	String accessToken = getAccessToken();
    	DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/create");
    	OapiUserCreateRequest request = new OapiUserCreateRequest();
    	request.setUserid(staffId);
    	request.setMobile(staff.getStaff_Phone());
    	request.setName(staff.getStaff_Name());

    	// 需要用字符串， "[59869009,60345027]" 这种格式
    	List<Long> departments = new ArrayList<Long>();
    	departments.add(1L);
    	request.setDepartment(JSON.toJSONString(departments));

    	OapiUserCreateResponse response = client.execute(request, accessToken);
    	System.err.println(response.getBody());
    	return response.getBody();
    }*/
    //删除钉钉用户
    public String deleteDingStaff(SystemStaff staff) throws ApiException {
    	//1.获取token
    	String accessToken = getAccessToken();
    	DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/delete");
    	OapiUserDeleteRequest request = new OapiUserDeleteRequest();
    	request.setUserid(staff.getStaff_Id().toString());
    	request.setHttpMethod("GET");

    	OapiUserDeleteResponse response = client.execute(request, accessToken);
    	return response.getBody();
    }
	
	
	//获取tokenJson
    @Override
	public String getAccessToken() {
		//自己测试的
    	//String corpid = "ding6cfcd096b2a6319335c2f4657eb6378f";
   	    //String corpSecret = "t41RQbwQGKiS0Xo7zkVmOZCgENsEpZ4JXvcyt-rzvraXwXcCBhL7e7XyOR6lsWr5";
    	//丽泽的
		String corpid = "dingntw5yrco6w7hgz1w";
		String corpSecret = "2un8Ecm_5h5AqTJy1OcPo7gE4u5T7_UIWesYSdxilVWOtCVaNkitQQ2aIyWfK9j0";
		//获取tokenJson
		DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
		OapiGettokenRequest request = new OapiGettokenRequest();
		request.setCorpid(corpid);
		request.setCorpsecret(corpSecret);
		request.setHttpMethod("GET");
		
		OapiGettokenResponse response = null;
		try {
			//获取返回的参数
			response = client.execute(request);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(response.getAccessToken());
		//返回AccessToken
        return response.getAccessToken();
	}

	public static void main(String argn[]) throws ApiException {

		String corpid = "dingntw5yrco6w7hgz1w";
		String corpSecret = "2un8Ecm_5h5AqTJy1OcPo7gE4u5T7_UIWesYSdxilVWOtCVaNkitQQ2aIyWfK9j0";
		//获取tokenJson
		DefaultDingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/gettoken");
		OapiGettokenRequest request = new OapiGettokenRequest();
		request.setCorpid(corpid);
		request.setCorpsecret(corpSecret);
		request.setHttpMethod("GET");

		OapiGettokenResponse response = null;
		try {
			//获取返回的参数
			response = client.execute(request);
			// 查询钉钉角色组人员
			String accessToken = response.getAccessToken();


            /*DingTalkClient client1 = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
            OapiUserGetRequest request1 = new OapiUserGetRequest();
            request1.setUserid("18306515071");
            request.setHttpMethod("GET");
            OapiUserGetResponse response1 = client1.execute(request1, accessToken);*/

			/*DingTalkClient client1 = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/getDeptMember");
			OapiUserGetDeptMemberRequest req = new OapiUserGetDeptMemberRequest();
			req.setDeptId("107773833");
			req.setHttpMethod("GET");
			OapiUserGetDeptMemberResponse rsp = client1.execute(req, accessToken);
			System.out.println(rsp.getBody());*/

			DingTalkClient client1 = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/listbypage");
			OapiUserListbypageRequest request1 = new OapiUserListbypageRequest();
			request1.setDepartmentId(107655743L);
			request1.setOffset(0L);
			request1.setSize(100L);
			request1.setOrder("entry_desc");
			request1.setHttpMethod("GET");
			OapiUserListbypageResponse execute = client1.execute(request1,accessToken);

			/*DingTalkClient client1 = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
			OapiDepartmentListRequest request1 = new OapiDepartmentListRequest();
			request1.setId("1");
			request1.setFetchChild(true);
			request1.setHttpMethod("GET");
			OapiDepartmentListResponse response1 = client1.execute(request1, accessToken);
			System.err.println(response1.getBody());
			List<Department> departments = response1.getDepartment();*/

			/*DingTalkClient client1 = new DefaultDingTalkClient("https://oapi.dingtalk.com/attendance/listRecord");
			OapiAttendanceListRecordRequest request1 = new OapiAttendanceListRecordRequest();
			request1.setCheckDateFrom("2019-11-07 00:00:00");
			request1.setCheckDateTo("2019-11-14 00:00:00");
			request1.setUserIds(Arrays.asList("19310151521252271"));
			OapiAttendanceListRecordResponse res = client1.execute(request1,accessToken);*/

			System.out.println(111);
		} catch (ApiException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(response.getAccessToken());


	}

	@Override
	public ResponseResult selectDepartmRole(String id) throws ApiException {
    	//1.获取token
    	String accessToken = getAccessToken();
		// 根据部门id查询当前部门下的主管
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
		OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
		request.setId(id);
		request.setHttpMethod("GET");
		OapiDepartmentGetResponse response = client.execute(request, accessToken);
		System.out.println(response.getDeptManagerUseridList());
		String str = response.getDeptManagerUseridList();
		String[]  strs;
		String userid = "";
		Integer index = 0;
		if (str != null) {
			strs=str.split("|");
			
			index = 0;
			for(int i=0,len=strs.length;i<len;i++){
				
				if (strs[i].equals("|")) {
					userid += ",";
					index++;
				}else { 
					userid += strs[i];
				}
			}
		}
		System.err.println(userid);
		ResponseResult result = new ResponseResult();
		result.setCount(index+1);
		result.setMsg(userid);
		return result;
	}

	@Override
	public void sendmessage(String userlist,SystemStaff staff) throws ApiException {
		//发送办公设施调拨工作消息
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间
    	//1.获取token
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		request.setUseridList(userlist);
		request.setAgentId(210224725L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(staff.getStaff_Name()+"发起了办公设施调拨审批：申请时间为："+date2+"，请尽快进行审批");
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		
	}

	@Override
	public ResponseResult selectDingRoleStaff(String approver_id) throws ApiException {
		// 查询钉钉角色组人员
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/role/simplelist");
		OapiRoleSimplelistRequest request = new OapiRoleSimplelistRequest();
		Long roleid = Long.parseLong(approver_id);
		request.setRoleId(roleid);

		OapiRoleSimplelistResponse response = client.execute(request, accessToken);
		List<OpenEmpSimple> list = response.getResult().getList();
		String userlist ="";
		int index = 0;
		for (OpenEmpSimple openEmpSimple : list) {
			index++;
			if (list.size() == index) {
				userlist+=openEmpSimple.getUserid();
			}else {
				userlist+=openEmpSimple.getUserid()+",";
			}
		}
		ResponseResult result = new ResponseResult();
		
		result.setCount(index);
		result.setMsg(userlist);
		return result;
	}

	@Override
	public void sendmessageCopy(String userlist, SystemStaff systemStaff,ApproverManage approverManage) throws ApiException {
		// 发送给抄送人和发起人
		//发送办公设施调拨工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		System.err.println(userlist+"发送抄送消息"+approverManage.getApproval_name());
		request.setUseridList(userlist);
		request.setAgentId(251250837L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		//msg.getOa().getBody().setTitle(approverManage.getApproval_name());
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(systemStaff.getStaff_Name()+"发起的"+approverManage.getApproval_name()+"审批已经通过。通过时间："+date2);
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}

	@Override
	public void sendmessageCopy2(String userlist, SystemStaff systemStaff,ApproverManage approverManage) throws ApiException {
		// 发送给抄送人和发起人
		//发送办公设施调拨工作消息
    	//1.获取token
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		request.setUseridList(userlist);
		request.setAgentId(251250837L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(systemStaff.getStaff_Name()+"发起的"+approverManage.getApproval_name()+"审批未通过!。驳回时间"+date2);
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		
	}

	@Override
	public void sendoOutNotice(String dingStaffid, SystemStaff staff) throws ApiException {
		//发送工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		//发送办公设施调拨工作消息
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");

        OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
        request.setUseridList(dingStaffid); //接收者的用户userid列表，最大列表长度：20
        request.setAgentId(210224725L);
        request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209
        
        OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
        msg.setActionCard(new OapiMessageCorpconversationAsyncsendV2Request.ActionCard());
        msg.getActionCard().setTitle("办公设施调拨审批"); //首页显示内容
        msg.getActionCard().setMarkdown(staff.getStaff_Name()+"发起的办公设施调拨审批:发起时间:"+date2); //进入工作通知后的标题内容
        msg.getActionCard().setSingleTitle("点击进入审批"); //进入工作通知后标题下面的内容部分
        msg.getActionCard().setSingleUrl("https://hs.yanruismart.com/mobile/facilities/facilitiesApprovalPhone.action?dingStaffid="+dingStaffid); //点击内容跳转链接
        msg.setMsgtype("action_card");

        request.setMsg(msg);
        OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}

	@Override
	public void sendmessageCopy3(String userlist, SystemStaff systemStaff) throws ApiException {
		// 发送给抄送人和发起人
		//发送办公设施调拨工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		request.setUseridList(userlist);
		request.setAgentId(251250837L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("审批");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setContent(systemStaff.getStaff_Name()+"发起的办公设施调拨审批未通过!");
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		
	}

	private static final Map<Integer,String> MAP = new HashMap<>();
	static {
	    //当前标识为0，需给质检科全科发送消息，保存质检科id
	    MAP.put(0,"");
	    //当前标识为1，需给质检科全科发送消息，保存质检科id
	    MAP.put(1,"");
	    //当前标识为2，需给质检科全科发送消息，保存质检科id
	    MAP.put(2,"");
	    //当前标识为3，需给质检科全科发送消息，保存质检科id
	    MAP.put(3,"");
    }

    public void sendDetectionNotice(String dingStaffid, SystemStaff staff,ApproverManage approverManage,CurrencyApply currencyApply) throws Exception{
        //发送工作消息
        //1.获取token
        String accessToken = getAccessToken();
        //发送办公设施调拨工作消息
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date2 = df.format(currencyApply.getCurrency_date());
        String date3 = df.format(date);
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
        OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
        request.setUseridList(dingStaffid); //接收者的用户userid列表，最大列表长度：20
        request.setAgentId(210224725L);
        request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209

        OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
        msg.setActionCard(new OapiMessageCorpconversationAsyncsendV2Request.ActionCard());
        msg.getActionCard().setTitle(approverManage.getApproval_name()); //首页显示内容
        msg.getActionCard().setMarkdown(staff.getStaff_Name()+"发起的"+approverManage.getApproval_name()+":发起时间:"+date2+"通知时间"+date3); //进入工作通知后的标题内容
        msg.getActionCard().setSingleTitle("点击进入审批"); //进入工作通知后标题下面的内容部分
        msg.getActionCard().setSingleUrl("http://60.213.41.162:6819/lizexiangmu/"+approverManage.getApproval_action()+"?currency_id="+currencyApply.getCurrency_id()+"&dingStaffid="+dingStaffid); //点击内容跳转链接
        msg.setMsgtype("action_card");

        request.setMsg(msg);
        OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
        System.err.println(response.getBody());
    }

	@Override
	public void sendoOutNotice2(String dingStaffid, SystemStaff staff,ApproverManage approverManage,CurrencyApply currencyApply) throws ApiException {
		//发送工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
		//发送办公设施调拨工作消息
    	Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(currencyApply.getCurrency_date());
		String date3 = df.format(date);
        DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
        OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
        request.setUseridList(dingStaffid); //接收者的用户userid列表，最大列表长度：20
		//自己测试使用
//        request.setAgentId(210224725L);
        //丽泽正式使用
        request.setAgentId(251250837L);
        request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209
        
        OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
        msg.setActionCard(new OapiMessageCorpconversationAsyncsendV2Request.ActionCard());
        msg.getActionCard().setTitle(approverManage.getApproval_name()); //首页显示内容
        msg.getActionCard().setMarkdown(staff.getStaff_Name()+"发起的"+approverManage.getApproval_name()+":发起时间:"+date2+"通知时间"+date3); //进入工作通知后的标题内容
        msg.getActionCard().setSingleTitle("点击进入审批"); //进入工作通知后标题下面的内容部分
		msg.getActionCard().setSingleUrl("http://60.213.41.162:6819/lizexiangmu/"+approverManage.getApproval_action()+"?currency_id="+currencyApply.getCurrency_id()+"&dingStaffid="+dingStaffid); //点击内容跳转链接
		msg.setMsgtype("action_card");

        request.setMsg(msg);
        OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}


	@Override
	public void sendMessage69(String flag,CurrencyApply currencyApply) throws ApiException {
		//1.获取token
		String accessToken = getAccessToken();

        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
        String date2 = df.format(currencyApply.getCurrency_date());

		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();

		//自己测试使用
		//request.setAgentId(210224725L);
		//丽泽正式使用
		request.setAgentId(251250837L);
		request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209

		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();

        msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
        msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
        msg.getOa().getHead().setText("天人报备流程");
        msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		if ("0".equals(flag)){//未签订合同给曹静发送消息
            //request.setUseridList("0847572503855936"); //接收者的用户userid列表，最大列表长度：20
			request.setUseridList("203719292837623745");
            msg.getOa().getBody().setContent("日期："+date2+",编号："+currencyApply.getCurrency_number()
                    +"天人报备流程还未签订合同，单位名称："+currencyApply.getCurrency_string3()+"；项目名称："+currencyApply.getCurrency_string4()+",原因为："
                    +currencyApply.getCurrency_string6());
        }else if ("1".equals(flag)){
		    //已签订给流程发起人和曹静发送消息
			String users = currencyApply.getCurrency_string11()+","+currencyApply.getCurrency_string17();
			request.setUseridList(users); //接收者的用户userid列表，最大列表长度：20

            msg.getOa().getBody().setContent("日期："+date2+",编号："+currencyApply.getCurrency_number()
                    +"天人报备流程已签订合同，单位名称："+currencyApply.getCurrency_string3()+"；项目名称："+currencyApply.getCurrency_string4()+",签订日期为："
                    +df1.format(currencyApply.getCurrency_date3()));

        }else if ("2".equals(flag)){
		    //终止报备，分别为流程发起人和消息接收人发送消息
		    String users = currencyApply.getCurrency_string11()+","+currencyApply.getCurrency_string17();
            request.setUseridList(users); //接收者的用户userid列表，最大列表长度：20
            msg.getOa().getBody().setContent("日期："+date2+",编号："+currencyApply.getCurrency_number()
                    +"天人报备流程已经终止报备，单位名称："+currencyApply.getCurrency_string3()+"；项目名称："+currencyApply.getCurrency_string4());
        }else if ("3".equals(flag)){
            //提醒合同签订追踪，为消息接收人发送消息
            request.setUseridList(currencyApply.getCurrency_string17()); //接收者的用户userid列表，最大列表长度：20
            msg.getOa().getBody().setContent("日期："+date2+",编号："+currencyApply.getCurrency_number()
                    +"天人报备流程相应合同还未签订，请追踪。单位名称："+currencyApply.getCurrency_string3()+"；项目名称："+currencyApply.getCurrency_string4());
        }else {
		    //曹静选择给负责人发消息
            request.setUseridList(currencyApply.getCurrency_string17()); //接收者的用户userid列表，最大列表长度：20

            msg.getOa().getBody().setContent("日期："+date2+",编号："+currencyApply.getCurrency_number()
                    +"天人报备流程由你负责，单位名称："+currencyApply.getCurrency_string3()+"；项目名称："+currencyApply.getCurrency_string4());

        }
        msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}

	@Override
	public void sendMessageAgain69(String userId,String content) throws ApiException {
		//1.获取token
		String accessToken = getAccessToken();

		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		//自己测试使用
		//request.setAgentId(210224725L);
		//丽泽正式使用
		request.setAgentId(251250837L);
		request.setToAllUser(false); //	是否发送给企业全部用户(ISV不能设置true) 83307209

		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();

		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("天人报备流程");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		//提醒合同签订追踪，为消息接收人发送消息
		request.setUseridList(userId); //接收者的用户userid列表，最大列表长度：20
		msg.getOa().getBody().setContent(content);
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());
	}
	
	@Override
	public List<Long> getDingDepartmentSup(String department_id) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list_parent_depts_by_dept");
		OapiDepartmentListParentDeptsByDeptRequest request = new OapiDepartmentListParentDeptsByDeptRequest();
		request.setId(department_id);
		request.setHttpMethod("GET");
		OapiDepartmentListParentDeptsByDeptResponse response = client.execute(request, accessToken);
		return response.getParentIds();
	}

	@Override
	public OapiUserGetResponse selectDingUserDetils(String currency_string) throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
		OapiUserGetRequest request = new OapiUserGetRequest();
		request.setUserid(currency_string);
		request.setHttpMethod("GET");
		OapiUserGetResponse response = client.execute(request, accessToken);

		return response;
	}

	@Override
	public SystemStaff getUserId(String code) {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/getuserinfo");
		OapiUserGetuserinfoRequest request = new OapiUserGetuserinfoRequest();
		request.setCode(code);
		request.setHttpMethod("GET");
		OapiUserGetuserinfoResponse response = null;
		try {
			response = client.execute(request, accessToken);
		} catch (ApiException e) {
			e.printStackTrace();
		}
		String userId = response.getUserid();
		SystemStaff systemStaff = systemStaffMapper.selectStaffByDingdingId(userId);
		return systemStaff;
	}

	@Override
	public void sendrRemind(String userlist, String content) throws ApiException {
		String accessToken = getAccessToken();

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String date2 = df.format(date);// new Date()为获取当前系统时间

		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
		OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
		System.err.println(userlist+"发送抄送消息"+content);
		request.setUseridList(userlist);
		request.setAgentId(251250837L);
		request.setToAllUser(false);
		OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();

		msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
		msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
		msg.getOa().getHead().setText("超时提醒");
		msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
		msg.getOa().getBody().setTitle("超时提醒");
		msg.getOa().getBody().setContent("提醒时间:"+date2+";"+content);
		msg.setMsgtype("oa");
		request.setMsg(msg);
		OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
		System.err.println(response.getBody());

	}
}

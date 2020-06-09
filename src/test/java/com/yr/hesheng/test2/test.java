package com.yr.hesheng.test2;


import com.dingtalk.api.DefaultDingTalkClient;
import com.dingtalk.api.DingTalkClient;
import com.dingtalk.api.request.*;
import com.dingtalk.api.response.*;
import com.dingtalk.api.response.OapiDepartmentListResponse.Department;
import com.dingtalk.api.response.OapiUserSimplelistResponse.Userlist;
import com.taobao.api.ApiException;
import org.junit.Test;

import java.util.List;


public class test {
	
	public static String getAccessToken() {
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
		System.err.println(response.getBody());
		
		//返回AccessToken
        return response.getAccessToken();
	}
	
	//自己测试的
	private static String corpid = "ding6cfcd096b2a6319335c2f4657eb6378f";
	private static String corpSecret = "t41RQbwQGKiS0Xo7zkVmOZCgENsEpZ4JXvcyt-rzvraXwXcCBhL7e7XyOR6lsWr5";
	
	@Test	//递归获取此部门的上级部门id
	public void getDingDepartmentSup() throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list_parent_depts_by_dept");
		OapiDepartmentListParentDeptsByDeptRequest request = new OapiDepartmentListParentDeptsByDeptRequest();
		request.setId("94146236");
		request.setHttpMethod("GET");
		OapiDepartmentListParentDeptsByDeptResponse response = client.execute(request, accessToken);
		System.out.println(response.getBody());
		List<Long> parentIds = response.getParentIds();
		Integer index = 1;
		System.out.println(parentIds.get(index-1));
	}
	@Test
	public void selectDepartmentManage() throws ApiException {
    	//1.获取token
    	String accessToken = getAccessToken();
		// 根据部门id查询当前部门下的主管
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/get");
		OapiDepartmentGetRequest request = new OapiDepartmentGetRequest();
		request.setId("93085427");
		request.setHttpMethod("GET");
		OapiDepartmentGetResponse response = client.execute(request, accessToken);
		System.out.println(response.getDeptManagerUseridList());
		String str = response.getDeptManagerUseridList();
		String[]  strs=str.split("|");
		String userid = "";
		Integer index = 0;
		for(int i=0,len=strs.length;i<len;i++){
			
			if (strs[i].equals("|")) {
				userid += ",";
				index++;
			}else { 
				 userid += strs[i];
			}
		}
		System.err.println(index);
		System.err.println(userid);
		String[]  strs2=userid.split(",");
		String userid2 = "";
		for(int i=0,len=strs2.length;i<len;i++){
			
				 userid2 = strs2[i];
				 System.out.println(userid2);
		}
		System.err.println(userid2);
	}
	
	@Test	//获取钉钉当前部门员工信息
	public void getUser() throws ApiException {
		String accessToken = getAccessToken();
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/simplelist");
		OapiUserSimplelistRequest request = new OapiUserSimplelistRequest();
		request.setDepartmentId(1L);
		//request.setOffset(0L);
		//request.setSize(10L);
		request.setHttpMethod("GET");

		OapiUserSimplelistResponse response = client.execute(request, accessToken);
		//System.out.println(response.getBody());
		System.out.println(response.getBody());
		List<Userlist> users = response.getUserlist();
		for (Userlist userlist : users) {
			System.err.println(userlist.getName());
			System.err.println(userlist.getUserid());
		}
		//"https://oapi.dingtalk.com/user/simplelist?access_token="+accessToken+"&department_id=1"
	}
	
	@Test
	public void getDepartment() throws ApiException {
		
		String accessToken = getAccessToken();
		
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/department/list");
		OapiDepartmentListRequest request = new OapiDepartmentListRequest();
		//request.setId("1");
		request.setFetchChild(true);
		request.setHttpMethod("GET");
		OapiDepartmentListResponse response = client.execute(request, accessToken);
		List<Department> departments = response.getDepartment();
		System.out.println(response.getBody());
		for (Department department : departments) {
			System.err.println(department.getName());
			System.err.println(department.getId());
		}
	}
	
	@Test
	public void getUserDetails() throws ApiException {
		String accessToken = getAccessToken();
		
		DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/user/get");
		OapiUserGetRequest request = new OapiUserGetRequest();
		request.setUserid("216143085424204589");
		request.setHttpMethod("GET");
		OapiUserGetResponse response = client.execute(request, accessToken);
		System.out.println(response.getBody());
		System.out.println(response.getMobile());
	}
	@Test
	public void FaSongXiaoXi() throws ApiException {
		//发送工作消息
    	//1.获取token
    	String accessToken = getAccessToken();
    	
    	DingTalkClient client = new DefaultDingTalkClient("https://oapi.dingtalk.com/topapi/message/corpconversation/asyncsend_v2");
    	OapiMessageCorpconversationAsyncsendV2Request request = new OapiMessageCorpconversationAsyncsendV2Request();
    	request.setUseridList("216143085424204589");
    	request.setAgentId(210224725L);
    	request.setToAllUser(false);

    	OapiMessageCorpconversationAsyncsendV2Request.Msg msg = new OapiMessageCorpconversationAsyncsendV2Request.Msg();
    	msg.setOa(new OapiMessageCorpconversationAsyncsendV2Request.OA());
    	msg.getOa().setHead(new OapiMessageCorpconversationAsyncsendV2Request.Head());
    	msg.getOa().setMessageUrl("https://www.baidu.com/");
    	msg.getOa().getHead().setBgcolor("FFBBBBBB");
    	msg.getOa().getHead().setText("丽泽材料类出库审批");
    	msg.getOa().setBody(new OapiMessageCorpconversationAsyncsendV2Request.Body());
    	msg.getOa().getBody().setTitle("丽泽审批");
    	msg.getOa().getBody().setContent("哈哈哈哈");
    	msg.setMsgtype("oa");
    	request.setMsg(msg);
    	OapiMessageCorpconversationAsyncsendV2Response response = client.execute(request,accessToken);
    	System.out.println(response.getBody());
	}

}

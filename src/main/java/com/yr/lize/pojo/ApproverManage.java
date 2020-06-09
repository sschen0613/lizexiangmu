package com.yr.lize.pojo;

public class ApproverManage {
	private String approval_name;
	private Integer approval_id;
	private Integer approval_state;
	private Integer role_count;
	private String approval_action;
	private String approver_url;
	

	public String getApprover_url() {
		return approver_url;
	}
	public void setApprover_url(String approver_url) {
		this.approver_url = approver_url;
	}
	public String getApproval_action() {
		return approval_action;
	}
	public void setApproval_action(String approval_action) {
		this.approval_action = approval_action;
	}
	public Integer getRole_count() {
		return role_count;
	}
	public void setRole_count(Integer role_count) {
		this.role_count = role_count;
	}
	public Integer getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(Integer approval_state) {
		this.approval_state = approval_state;
	}
	public String getApproval_name() {
		return approval_name;
	}
	public void setApproval_name(String approval_name) {
		this.approval_name = approval_name;
	}
	public Integer getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(Integer approval_id) {
		this.approval_id = approval_id;
	}
	
}

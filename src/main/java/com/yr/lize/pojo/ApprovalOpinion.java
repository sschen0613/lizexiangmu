package com.yr.lize.pojo;

import java.util.Date;

public class ApprovalOpinion {

	private Integer approvalOpinion_id;
	
	private String approvalOpinion_result;
	
	private Integer approvalOpinion_type;
	
	private String approver_id;
	
	private String approver_name;
	
	private Integer approval_id;

	private Date approval_date;

	private Integer approval_stat;

	private String approval_state;

	public String getApproval_state() {
		return approval_state;
	}

	public void setApproval_state(String approval_state) {
		this.approval_state = approval_state;
	}

	public Date getApproval_date() {
		return approval_date;
	}

	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}

	public Integer getApproval_stat() {
		return approval_stat;
	}

	public void setApproval_stat(Integer approval_stat) {
		this.approval_stat = approval_stat;
	}

	public Integer getApproval_id() {
		return approval_id;
	}

	public void setApproval_id(Integer approval_id) {
		this.approval_id = approval_id;
	}

	public Integer getApprovalOpinion_id() {
		return approvalOpinion_id;
	}

	public void setApprovalOpinion_id(Integer approvalOpinion_id) {
		this.approvalOpinion_id = approvalOpinion_id;
	}

	public String getApprovalOpinion_result() {
		return approvalOpinion_result;
	}

	public void setApprovalOpinion_result(String approvalOpinion_result) {
		this.approvalOpinion_result = approvalOpinion_result;
	}

	public Integer getApprovalOpinion_type() {
		return approvalOpinion_type;
	}

	public void setApprovalOpinion_type(Integer approvalOpinion_type) {
		this.approvalOpinion_type = approvalOpinion_type;
	}

	public String getApprover_id() {
		return approver_id;
	}

	public void setApprover_id(String approver_id) {
		this.approver_id = approver_id;
	}

	public String getApprover_name() {
		return approver_name;
	}

	public void setApprover_name(String approver_name) {
		this.approver_name = approver_name;
	}
	
	
	
}

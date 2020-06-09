package com.yr.lize.pojo;

public class Approver {
	private Integer id;
	private String ding_staff_id;
	private Integer allocation_id;
	private Integer approval_result;
	private String staff_name;
	private Integer approval_id;
	public Integer getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(Integer approval_id) {
		this.approval_id = approval_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDing_staff_id() {
		return ding_staff_id;
	}
	public void setDing_staff_id(String ding_staff_id) {
		this.ding_staff_id = ding_staff_id;
	}
	public Integer getAllocation_id() {
		return allocation_id;
	}
	public void setAllocation_id(Integer allocation_id) {
		this.allocation_id = allocation_id;
	}
	public Integer getApproval_result() {
		return approval_result;
	}
	public void setApproval_result(Integer approval_result) {
		this.approval_result = approval_result;
	}
	public String getStaff_name() {
		return staff_name;
	}
	public void setStaff_name(String staff_name) {
		this.staff_name = staff_name;
	}
	
}

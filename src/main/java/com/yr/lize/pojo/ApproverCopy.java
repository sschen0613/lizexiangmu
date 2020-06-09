package com.yr.lize.pojo;

public class ApproverCopy {
	private Integer id;
	private String copy_person;
	private String copy_name;
	private Integer approval_id;
	private Integer company_id;
	public Integer getCompany_id() {
		return company_id;
	}
	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCopy_person() {
		return copy_person;
	}
	public void setCopy_person(String copy_person) {
		this.copy_person = copy_person;
	}
	public String getCopy_name() {
		return copy_name;
	}
	public void setCopy_name(String copy_name) {
		this.copy_name = copy_name;
	}
	public Integer getApproval_id() {
		return approval_id;
	}
	public void setApproval_id(Integer approval_id) {
		this.approval_id = approval_id;
	}
	
}

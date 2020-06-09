package com.yr.lize.pojo;

import java.util.Date;

public class OfficeOutprint {
    private Integer print_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String print_point;

    private String print_content;

    private String remark;

	public Integer getPrint_id() {
		return print_id;
	}

	public void setPrint_id(Integer print_id) {
		this.print_id = print_id;
	}

	public String getProposer() {
		return proposer;
	}

	public void setProposer(String proposer) {
		this.proposer = proposer;
	}

	public String getProposer_id() {
		return proposer_id;
	}

	public void setProposer_id(String proposer_id) {
		this.proposer_id = proposer_id;
	}

	public String getProposer_department() {
		return proposer_department;
	}

	public void setProposer_department(String proposer_department) {
		this.proposer_department = proposer_department;
	}

	public Date getProposer_date() {
		return proposer_date;
	}

	public void setProposer_date(Date proposer_date) {
		this.proposer_date = proposer_date;
	}

	public String getPrint_point() {
		return print_point;
	}

	public void setPrint_point(String print_point) {
		this.print_point = print_point;
	}

	public String getPrint_content() {
		return print_content;
	}

	public void setPrint_content(String print_content) {
		this.print_content = print_content;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

   
}
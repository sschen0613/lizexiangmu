package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class OfficeWorkovertime {
    private Integer workovertime_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private Date workovertime_start;

    private Date workovertime_off;

    private BigDecimal workovertime_date;

    private String request_reason;

    private String flow_number;

	public Integer getWorkovertime_id() {
		return workovertime_id;
	}

	public void setWorkovertime_id(Integer workovertime_id) {
		this.workovertime_id = workovertime_id;
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

	public Date getWorkovertime_start() {
		return workovertime_start;
	}

	public void setWorkovertime_start(Date workovertime_start) {
		this.workovertime_start = workovertime_start;
	}

	public Date getWorkovertime_off() {
		return workovertime_off;
	}

	public void setWorkovertime_off(Date workovertime_off) {
		this.workovertime_off = workovertime_off;
	}

	public BigDecimal getWorkovertime_date() {
		return workovertime_date;
	}

	public void setWorkovertime_date(BigDecimal workovertime_date) {
		this.workovertime_date = workovertime_date;
	}

	public String getRequest_reason() {
		return request_reason;
	}

	public void setRequest_reason(String request_reason) {
		this.request_reason = request_reason;
	}

	public String getFlow_number() {
		return flow_number;
	}

	public void setFlow_number(String flow_number) {
		this.flow_number = flow_number;
	}

    
}
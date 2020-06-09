package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class FinanceServerequest {
    private Integer businessreception_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String unit;

    private Integer person_number;

    private String accompanying_person;

    private Integer serve_reason;

    private BigDecimal applied_amount;

    private String applied_chineseamount;

	public Integer getBusinessreception_id() {
		return businessreception_id;
	}

	public void setBusinessreception_id(Integer businessreception_id) {
		this.businessreception_id = businessreception_id;
	}

	public String getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(String buy_number) {
		this.buy_number = buy_number;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Integer getPerson_number() {
		return person_number;
	}

	public void setPerson_number(Integer person_number) {
		this.person_number = person_number;
	}

	public String getAccompanying_person() {
		return accompanying_person;
	}

	public void setAccompanying_person(String accompanying_person) {
		this.accompanying_person = accompanying_person;
	}

	public Integer getServe_reason() {
		return serve_reason;
	}

	public void setServe_reason(Integer serve_reason) {
		this.serve_reason = serve_reason;
	}

	public BigDecimal getApplied_amount() {
		return applied_amount;
	}

	public void setApplied_amount(BigDecimal applied_amount) {
		this.applied_amount = applied_amount;
	}

	public String getApplied_chineseamount() {
		return applied_chineseamount;
	}

	public void setApplied_chineseamount(String applied_chineseamount) {
		this.applied_chineseamount = applied_chineseamount;
	}

}
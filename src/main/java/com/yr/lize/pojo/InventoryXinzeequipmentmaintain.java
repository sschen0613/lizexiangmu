package com.yr.lize.pojo;

import java.util.Date;

public class InventoryXinzeequipmentmaintain {
    private Integer maintain_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String error_description;

    private String technical_requirements;

    private String other_description;

	public Integer getMaintain_id() {
		return maintain_id;
	}

	public void setMaintain_id(Integer maintain_id) {
		this.maintain_id = maintain_id;
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

	public String getError_description() {
		return error_description;
	}

	public void setError_description(String error_description) {
		this.error_description = error_description;
	}

	public String getTechnical_requirements() {
		return technical_requirements;
	}

	public void setTechnical_requirements(String technical_requirements) {
		this.technical_requirements = technical_requirements;
	}

	public String getOther_description() {
		return other_description;
	}

	public void setOther_description(String other_description) {
		this.other_description = other_description;
	}

  
}
package com.yr.lize.pojo;

import java.util.Date;

public class InventoryXinzematerialsout {
    private Integer xinzeMaterials_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String warehouse;

    private String apply_reason;

	public Integer getXinzeMaterials_id() {
		return xinzeMaterials_id;
	}

	public void setXinzeMaterials_id(Integer xinzeMaterials_id) {
		this.xinzeMaterials_id = xinzeMaterials_id;
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

	public String getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}

	public String getApply_reason() {
		return apply_reason;
	}

	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}

   
}
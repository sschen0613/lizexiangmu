package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryLizematerialsout {
    private Integer lizeMaterials_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String area;

    private String customer_name;

    private String contract_id;

    private String warehouse;

    private String Payment_agreement;

    private String accessories_agreement;

    private String special_agreement;

    private String apply_reason;

    private BigDecimal contract_amount;

    private BigDecimal actual_receipt;

    private BigDecimal outstanding_receipt;

	public Integer getLizeMaterials_id() {
		return lizeMaterials_id;
	}

	public void setLizeMaterials_id(Integer lizeMaterials_id) {
		this.lizeMaterials_id = lizeMaterials_id;
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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getContract_id() {
		return contract_id;
	}

	public void setContract_id(String contract_id) {
		this.contract_id = contract_id;
	}

	public String getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(String warehouse) {
		this.warehouse = warehouse;
	}

	public String getPayment_agreement() {
		return Payment_agreement;
	}

	public void setPayment_agreement(String payment_agreement) {
		Payment_agreement = payment_agreement;
	}

	public String getAccessories_agreement() {
		return accessories_agreement;
	}

	public void setAccessories_agreement(String accessories_agreement) {
		this.accessories_agreement = accessories_agreement;
	}

	public String getSpecial_agreement() {
		return special_agreement;
	}

	public void setSpecial_agreement(String special_agreement) {
		this.special_agreement = special_agreement;
	}

	public String getApply_reason() {
		return apply_reason;
	}

	public void setApply_reason(String apply_reason) {
		this.apply_reason = apply_reason;
	}

	public BigDecimal getContract_amount() {
		return contract_amount;
	}

	public void setContract_amount(BigDecimal contract_amount) {
		this.contract_amount = contract_amount;
	}

	public BigDecimal getActual_receipt() {
		return actual_receipt;
	}

	public void setActual_receipt(BigDecimal actual_receipt) {
		this.actual_receipt = actual_receipt;
	}

	public BigDecimal getOutstanding_receipt() {
		return outstanding_receipt;
	}

	public void setOutstanding_receipt(BigDecimal outstanding_receipt) {
		this.outstanding_receipt = outstanding_receipt;
	}

   
}
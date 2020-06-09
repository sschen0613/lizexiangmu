package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryLizesellout {
    private Integer lizeSell_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String customer_name;

    private String contract_id;

    private String Payment_agreement;

    private String apply_reason;

    private BigDecimal contract_amount;

    private BigDecimal actual_receipt;

    private BigDecimal outstanding_receipt;

	public Integer getLizeSell_id() {
		return lizeSell_id;
	}

	public void setLizeSell_id(Integer lizeSell_id) {
		this.lizeSell_id = lizeSell_id;
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

	public String getPayment_agreement() {
		return Payment_agreement;
	}

	public void setPayment_agreement(String payment_agreement) {
		Payment_agreement = payment_agreement;
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
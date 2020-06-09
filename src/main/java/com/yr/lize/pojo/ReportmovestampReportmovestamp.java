package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ReportmovestampReportmovestamp {
    private Integer bills_id;

    private String bills_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String contract_number;

    private String contract_name;

    private Date contract_date;

    private BigDecimal received_amount ;

    private BigDecimal contract_sum;

    private BigDecimal owe_sum;

    private String payment_agreement;

    private String remark;

	public Integer getBills_id() {
		return bills_id;
	}

	public void setBills_id(Integer bills_id) {
		this.bills_id = bills_id;
	}

	public String getBills_number() {
		return bills_number;
	}

	public void setBills_number(String bills_number) {
		this.bills_number = bills_number;
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

	public String getContract_number() {
		return contract_number;
	}

	public void setContract_number(String contract_number) {
		this.contract_number = contract_number;
	}

	public String getContract_name() {
		return contract_name;
	}

	public void setContract_name(String contract_name) {
		this.contract_name = contract_name;
	}

	public Date getContract_date() {
		return contract_date;
	}

	public void setContract_date(Date contract_date) {
		this.contract_date = contract_date;
	}

	public BigDecimal getReceived_amount() {
		return received_amount;
	}

	public void setReceived_amount(BigDecimal received_amount) {
		this.received_amount = received_amount;
	}

	public BigDecimal getContract_sum() {
		return contract_sum;
	}

	public void setContract_sum(BigDecimal contract_sum) {
		this.contract_sum = contract_sum;
	}

	public BigDecimal getOwe_sum() {
		return owe_sum;
	}

	public void setOwe_sum(BigDecimal owe_sum) {
		this.owe_sum = owe_sum;
	}

	public String getPayment_agreement() {
		return payment_agreement;
	}

	public void setPayment_agreement(String payment_agreement) {
		this.payment_agreement = payment_agreement;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

    
}
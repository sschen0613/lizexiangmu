package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryBobuy {
    private Integer BO_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String area;

    private String customer_name;

    private String out_type;

    private String salesContract_id;

    private String payment_agreement;

    private Date beginning_endingtime;

    private Date expectedDelivery_date;

    private BigDecimal contract_amount;

    private BigDecimal actual_receipt;

    private BigDecimal outstanding_receipt;

    private String buy_number;

	public Integer getBO_id() {
		return BO_id;
	}

	public void setBO_id(Integer bO_id) {
		BO_id = bO_id;
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

	public String getOut_type() {
		return out_type;
	}

	public void setOut_type(String out_type) {
		this.out_type = out_type;
	}

	public String getSalesContract_id() {
		return salesContract_id;
	}

	public void setSalesContract_id(String salesContract_id) {
		this.salesContract_id = salesContract_id;
	}

	public String getPayment_agreement() {
		return payment_agreement;
	}

	public void setPayment_agreement(String payment_agreement) {
		this.payment_agreement = payment_agreement;
	}

	public Date getBeginning_endingtime() {
		return beginning_endingtime;
	}

	public void setBeginning_endingtime(Date beginning_endingtime) {
		this.beginning_endingtime = beginning_endingtime;
	}

	public Date getExpectedDelivery_date() {
		return expectedDelivery_date;
	}

	public void setExpectedDelivery_date(Date expectedDelivery_date) {
		this.expectedDelivery_date = expectedDelivery_date;
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

	public String getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(String buy_number) {
		this.buy_number = buy_number;
	}

   
}
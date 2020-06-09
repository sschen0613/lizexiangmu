package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryEquipmentbuy {
    private Integer equipment_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposerDate;

    private String area;

    private String customer_name;

    private String salesContract_id;

    private Date expectedDelivery_date;

    private Integer delivery_type;

    private Date expectedArrival_date;

    private Integer confirm_inventory;

    private String payment_agreement;

    private BigDecimal contract_amount;

    private BigDecimal actual_receipt;

    private BigDecimal outstanding_receipt;

	public Integer getEquipment_id() {
		return equipment_id;
	}

	public void setEquipment_id(Integer equipment_id) {
		this.equipment_id = equipment_id;
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

	public Date getProposerDate() {
		return proposerDate;
	}

	public void setProposerDate(Date proposerDate) {
		this.proposerDate = proposerDate;
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

	public String getSalesContract_id() {
		return salesContract_id;
	}

	public void setSalesContract_id(String salesContract_id) {
		this.salesContract_id = salesContract_id;
	}

	public Date getExpectedDelivery_date() {
		return expectedDelivery_date;
	}

	public void setExpectedDelivery_date(Date expectedDelivery_date) {
		this.expectedDelivery_date = expectedDelivery_date;
	}

	public Integer getDelivery_type() {
		return delivery_type;
	}

	public void setDelivery_type(Integer delivery_type) {
		this.delivery_type = delivery_type;
	}

	public Date getExpectedArrival_date() {
		return expectedArrival_date;
	}

	public void setExpectedArrival_date(Date expectedArrival_date) {
		this.expectedArrival_date = expectedArrival_date;
	}

	public Integer getConfirm_inventory() {
		return confirm_inventory;
	}

	public void setConfirm_inventory(Integer confirm_inventory) {
		this.confirm_inventory = confirm_inventory;
	}

	public String getPayment_agreement() {
		return payment_agreement;
	}

	public void setPayment_agreement(String payment_agreement) {
		this.payment_agreement = payment_agreement;
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
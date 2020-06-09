package com.yr.lize.pojo;

import java.util.Date;

public class InventoryStockupbuy {
    private Integer stockup_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private Date expectedDelivery_date;

    private String buy_number;

	public Integer getStockup_id() {
		return stockup_id;
	}

	public void setStockup_id(Integer stockup_id) {
		this.stockup_id = stockup_id;
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

	public Date getExpectedDelivery_date() {
		return expectedDelivery_date;
	}

	public void setExpectedDelivery_date(Date expectedDelivery_date) {
		this.expectedDelivery_date = expectedDelivery_date;
	}

	public String getBuy_number() {
		return buy_number;
	}

	public void setBuy_number(String buy_number) {
		this.buy_number = buy_number;
	}

   
}
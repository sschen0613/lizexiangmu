package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class OfficeCarmaintain {
    private Integer carMaintain_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String car_number;

    private String maintain_type;

    private BigDecimal predict_cost;

    private String maintain_reason;

    private String remark;

	public Integer getCarMaintain_id() {
		return carMaintain_id;
	}

	public void setCarMaintain_id(Integer carMaintain_id) {
		this.carMaintain_id = carMaintain_id;
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

	public String getCar_number() {
		return car_number;
	}

	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}

	public String getMaintain_type() {
		return maintain_type;
	}

	public void setMaintain_type(String maintain_type) {
		this.maintain_type = maintain_type;
	}

	public BigDecimal getPredict_cost() {
		return predict_cost;
	}

	public void setPredict_cost(BigDecimal predict_cost) {
		this.predict_cost = predict_cost;
	}

	public String getMaintain_reason() {
		return maintain_reason;
	}

	public void setMaintain_reason(String maintain_reason) {
		this.maintain_reason = maintain_reason;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

    
}
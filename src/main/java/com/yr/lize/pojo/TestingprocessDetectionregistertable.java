package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class TestingprocessDetectionregistertable {
    private Integer id;

    private Integer number;

    private String detection_site;

    private String detection_program;

    private String specimen_number;

    private Date specimen_date;

    private String specimen_vessel;

    private BigDecimal specimen_acount;

    private String detection_result;

    private String remark;

    private Integer detection_id;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getDetection_site() {
		return detection_site;
	}

	public void setDetection_site(String detection_site) {
		this.detection_site = detection_site;
	}

	public String getDetection_program() {
		return detection_program;
	}

	public void setDetection_program(String detection_program) {
		this.detection_program = detection_program;
	}

	public String getSpecimen_number() {
		return specimen_number;
	}

	public void setSpecimen_number(String specimen_number) {
		this.specimen_number = specimen_number;
	}

	public Date getSpecimen_date() {
		return specimen_date;
	}

	public void setSpecimen_date(Date specimen_date) {
		this.specimen_date = specimen_date;
	}

	public String getSpecimen_vessel() {
		return specimen_vessel;
	}

	public void setSpecimen_vessel(String specimen_vessel) {
		this.specimen_vessel = specimen_vessel;
	}

	public BigDecimal getSpecimen_acount() {
		return specimen_acount;
	}

	public void setSpecimen_acount(BigDecimal specimen_acount) {
		this.specimen_acount = specimen_acount;
	}

	public String getDetection_result() {
		return detection_result;
	}

	public void setDetection_result(String detection_result) {
		this.detection_result = detection_result;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getDetection_id() {
		return detection_id;
	}

	public void setDetection_id(Integer detection_id) {
		this.detection_id = detection_id;
	}

   
}
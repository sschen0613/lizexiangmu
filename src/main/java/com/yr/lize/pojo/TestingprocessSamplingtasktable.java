package com.yr.lize.pojo;

import java.math.BigDecimal;

public class TestingprocessSamplingtasktable {
    private Integer id;

    private Integer number;

    private String detection_site;

    private String detection_program;

    private String according;

    private BigDecimal detection_frequency;

    private BigDecimal detection_days;

    private String remark;

    private Integer samplingInform_id;

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

	public String getAccording() {
		return according;
	}

	public void setAccording(String according) {
		this.according = according;
	}

	public BigDecimal getDetection_frequency() {
		return detection_frequency;
	}

	public void setDetection_frequency(BigDecimal detection_frequency) {
		this.detection_frequency = detection_frequency;
	}

	public BigDecimal getDetection_days() {
		return detection_days;
	}

	public void setDetection_days(BigDecimal detection_days) {
		this.detection_days = detection_days;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSamplingInform_id() {
		return samplingInform_id;
	}

	public void setSamplingInform_id(Integer samplingInform_id) {
		this.samplingInform_id = samplingInform_id;
	}

    
}
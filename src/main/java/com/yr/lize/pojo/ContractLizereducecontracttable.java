package com.yr.lize.pojo;

import java.math.BigDecimal;

public class ContractLizereducecontracttable {
    private Integer id;

    private String product_id;

    private String product_name;

    private String stop_period;

    private BigDecimal stop_days;

    private String uploading_period;

    private BigDecimal uploading_days;

    private Integer lizeChangeRequest_id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductId() {
        return product_id;
    }

    public void setProductId(String product_id) {
        this.product_id = product_id == null ? null : product_id.trim();}

    public String getProductName() {
        return product_name;
    }

    public void setProductName(String product_name) {
        this.product_name = product_name == null ? null : product_name.trim();
    }

    public String getStopPeriod() {
        return stop_period;
    }

    public void setStopPeriod(String stop_period) {
        this.stop_period = stop_period == null ? null : stop_period.trim();
    }

    public BigDecimal getStopDays() {
        return stop_days;
    }

    public void setStopDays(BigDecimal stop_days) {
        this.stop_days = stop_days;
    }

    public String getUploadingPeriod() {
        return uploading_period;
    }

    public void setUploadingPeriod(String uploading_period) {
        this.uploading_period = uploading_period == null ? null : uploading_period.trim();
    }

    public BigDecimal getUploadingDays() {
        return uploading_days;
    }

    public void setUploadingDays(BigDecimal uploading_days) {
        this.uploading_days = uploading_days;
    }

    public Integer getLizechangerequestId() {
        return lizeChangeRequest_id;
    }

    public void setLizechangerequestId(Integer lizeChangeRequest_id) {
        this.lizeChangeRequest_id = lizeChangeRequest_id;
    }
}
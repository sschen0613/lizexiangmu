package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ContractLizeoperationcontracttable {
    private Integer id;

    private String product_id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal quantity;

    private Integer lizeServiceRequestid;

    private BigDecimal sum;

    private String remark;

    private String brand;

    private Date operationStart_date;

    private Date operationOver_date;

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
        this.product_id = product_id == null ? null : product_id.trim();
    }

    public String getProductName() {
        return product_name;
    }

    public void setProductName(String product_name) {
        this.product_name = product_name == null ? null : product_name.trim();
    }

    public String getSpecificationsModels() {
        return specifications_models;
    }

    public void setSpecificationsModels(String specifications_models) {
        this.specifications_models = specifications_models == null ? null : specifications_models.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public BigDecimal getQuantity() {
        return quantity;
    }

    public void setQuantity(BigDecimal quantity) {
        this.quantity = quantity;
    }

    public Integer getLizeservicerequestid() {
        return lizeServiceRequestid;
    }

    public void setLizeservicerequestid(Integer lizeServiceRequestid) {
        this.lizeServiceRequestid = lizeServiceRequestid;
    }

    public BigDecimal getSum() {
        return sum;
    }

    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public Date getOperationstartDate() {
        return operationStart_date;
    }

    public void setOperationstartDate(Date operationStart_date) {
        this.operationStart_date = operationStart_date;
    }

    public Date getOperationoverDate() {
        return operationOver_date;
    }

    public void setOperationoverDate(Date operationOver_date) {
        this.operationOver_date = operationOver_date;
    }
}
package com.yr.lize.pojo;

public class Flow {
    private String barcode;
    private String orderType;//录入类型
    private String vendor;//供应商/客户
    private String warehouse;//仓库
    private String num;//数量
    private String operator;//操作员
    private String opeDate;//操作时间
    private String remark;//备注

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getWarehouse() {
        return warehouse;
    }

    public void setWarehouse(String warehouse) {
        this.warehouse = warehouse;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOpeDate() {
        return opeDate;
    }

    public void setOpeDate(String opeDate) {
        this.opeDate = opeDate;
    }
}

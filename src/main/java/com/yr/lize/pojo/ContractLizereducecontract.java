package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ContractLizereducecontract {
    private Integer lizeChangeRequest_id;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String area;

    private String customer_name;

    private String customer_number;

    private BigDecimal contract_amount;

    private Integer contract_versons;

    private String contract_number;

    private String contract_name;

    private BigDecimal received_amount;

    private BigDecimal outstanding_amount;

    private BigDecimal overdue_amount;

    private BigDecimal applyreduction_amount;

    private BigDecimal ratifyreduction_amount;

    private String subtract_explain;

    private String contract_date;

    public Integer getLizechangerequestId() {
        return lizeChangeRequest_id;
    }

    public void setLizechangerequestId(Integer lizeChangeRequest_id) {
        this.lizeChangeRequest_id = lizeChangeRequest_id;
    }

    public String getProposer() {
        return proposer;
    }

    public void setProposer(String proposer) {
        this.proposer = proposer == null ? null : proposer.trim();
    }

    public String getProposerId() {
        return proposer_id;
    }

    public void setProposerId(String proposer_id) {
        this.proposer_id = proposer_id == null ? null : proposer_id.trim();
    }

    public String getProposerDepartment() {
        return proposer_department;
    }

    public void setProposerDepartment(String proposer_department) {
        this.proposer_department = proposer_department == null ? null : proposer_department.trim();
    }

    public Date getProposerDate() {
        return proposer_date;
    }

    public void setProposerDate(Date proposer_date) {
        this.proposer_date = proposer_date;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getCustomerName() {
        return customer_name;
    }

    public void setCustomerName(String customer_name) {
        this.customer_name = customer_name == null ? null : customer_name.trim();
    }

    public String getCustomerNumber() {
        return customer_number;
    }

    public void setCustomerNumber(String customer_number) {
        this.customer_number = customer_number == null ? null : customer_number.trim();
    }

    public BigDecimal getContractAmount() {
        return contract_amount;
    }

    public void setContractAmount(BigDecimal contract_amount) {
        this.contract_amount = contract_amount;
    }

    public Integer getContractVersons() {
        return contract_versons;
    }

    public void setContractVersons(Integer contract_versons) {
        this.contract_versons = contract_versons;
    }

    public String getContractNumber() {
        return contract_number;
    }

    public void setContractNumber(String contract_number) {
        this.contract_number = contract_number == null ? null : contract_number.trim();
    }

    public String getContractName() {
        return contract_name;
    }

    public void setContractName(String contract_name) {
        this.contract_name = contract_name == null ? null : contract_name.trim();
    }

    public BigDecimal getReceivedAmount() {
        return received_amount;
    }

    public void setReceivedAmount(BigDecimal received_amount) {
        this.received_amount = received_amount;
    }

    public BigDecimal getOutstandingAmount() {
        return outstanding_amount;
    }

    public void setOutstandingAmount(BigDecimal outstanding_amount) {
        this.outstanding_amount = outstanding_amount;
    }

    public BigDecimal getOverdueAmount() {
        return overdue_amount;
    }

    public void setOverdueAmount(BigDecimal overdue_amount) {
        this.overdue_amount = overdue_amount;
    }

    public BigDecimal getApplyreductionAmount() {
        return applyreduction_amount;
    }

    public void setApplyreductionAmount(BigDecimal applyreduction_amount) {
        this.applyreduction_amount = applyreduction_amount;
    }

    public BigDecimal getRatifyreductionAmount() {
        return ratifyreduction_amount;
    }

    public void setRatifyreductionAmount(BigDecimal ratifyreduction_amount) {
        this.ratifyreduction_amount = ratifyreduction_amount;
    }

    public String getSubtractExplain() {
        return subtract_explain;
    }

    public void setSubtractExplain(String subtract_explain) {
        this.subtract_explain = subtract_explain == null ? null : subtract_explain.trim();
    }

    public String getContractDate() {
        return contract_date;
    }

    public void setContractDate(String contract_date) {
        this.contract_date = contract_date == null ? null : contract_date.trim();
    }
}
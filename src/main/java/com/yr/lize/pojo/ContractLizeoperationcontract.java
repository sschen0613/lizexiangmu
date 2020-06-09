package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ContractLizeoperationcontract {
    private Integer lizeservicerequestid;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String area;

    private String customer_name;

    private String customer_number;

    private String remarkone;

    private BigDecimal contract_amount;

    private String contractChineseAmount;

    private Integer contract_versons;

    private String contract_number;

    private Integer payment;

    private String name;

    private String condition;

    private BigDecimal sum;

    private Date predictGetsum_date;

    private String special_terms;

    private String contract_date;

    private String partsspecial_terms;

    private String detection_icrms;

    private String remarktwo;

    public Integer getLizeservicerequestid() {
        return lizeservicerequestid;
    }

    public void setLizeservicerequestid(Integer lizeservicerequestid) {
        this.lizeservicerequestid = lizeservicerequestid;
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

    public String getRemarkone() {
        return remarkone;
    }

    public void setRemarkone(String remarkone) {
        this.remarkone = remarkone == null ? null : remarkone.trim();
    }

    public BigDecimal getContractAmount() {
        return contract_amount;
    }

    public void setContractAmount(BigDecimal contract_amount) {
        this.contract_amount = contract_amount;
    }

    public String getContractChineseamount() {
        return contractChineseAmount;
    }

    public void setContractChineseamount(String contractChineseAmount) {
        this.contractChineseAmount = contractChineseAmount == null ? null : contractChineseAmount.trim();
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

    public Integer getPayment() {
        return payment;
    }

    public void setPayment(Integer payment) {
        this.payment = payment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition == null ? null : condition.trim();
    }

    public BigDecimal getSum() {
        return sum;
    }

    public void setSum(BigDecimal sum) {
        this.sum = sum;
    }

    public Date getPredictgetsumDate() {
        return predictGetsum_date;
    }

    public void setPredictgetsumDate(Date predictGetsum_date) {
        this.predictGetsum_date = predictGetsum_date;
    }

    public String getSpecialTerms() {
        return special_terms;
    }

    public void setSpecialTerms(String special_terms) {
        this.special_terms = special_terms == null ? null : special_terms.trim();
    }

    public String getContractDate() {
        return contract_date;
    }

    public void setContractDate(String contract_date) {
        this.contract_date = contract_date == null ? null : contract_date.trim();
    }

    public String getPartsspecialTerms() {
        return partsspecial_terms;
    }

    public void setPartsspecialTerms(String partsspecial_terms) {
        this.partsspecial_terms = partsspecial_terms == null ? null : partsspecial_terms.trim();
    }

    public String getDetectionIcrms() {
        return detection_icrms;
    }

    public void setDetectionIcrms(String detection_icrms) {
        this.detection_icrms = detection_icrms == null ? null : detection_icrms.trim();
    }

    public String getRemarktwo() {
        return remarktwo;
    }

    public void setRemarktwo(String remarktwo) {
        this.remarktwo = remarktwo == null ? null : remarktwo.trim();
    }
}
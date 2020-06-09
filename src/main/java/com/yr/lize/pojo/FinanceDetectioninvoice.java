package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class FinanceDetectioninvoice {
    private Integer xinzeInvoice_id;

    private String buy_number;

    private String proposer;

    private String proposer_id;

    private String proposer_department;

    private Date proposer_date;

    private String area;

    private String customer_name;

    private String contract_id;

    private String invoice_name;

    private String tax_number;

    private String site;

    private String telephone;

    private String bankAndAccount;

    private String payment_agreement;

    private BigDecimal contract_totalamount;

    private BigDecimal actual_receipt;

    private BigDecimal outstanding_receipt;

    private BigDecimal alreadyInvoice_amount;

    private BigDecimal applyInvoice_amount;

    private Integer invoice_type;

    private Integer cost_type;

    private String invoice_reason;

    private Integer invoice_if;

    public Integer getXinzeinvoiceId() {
        return xinzeInvoice_id;
    }

    public void setXinzeinvoiceId(Integer xinzeInvoice_id) {
        this.xinzeInvoice_id = xinzeInvoice_id;
    }

    public String getBuyNumber() {
        return buy_number;
    }

    public void setBuyNumber(String buy_number) {
        this.buy_number = buy_number == null ? null : buy_number.trim();
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

    public String getContractId() {
        return contract_id;
    }

    public void setContractId(String contract_id) {
        this.contract_id = contract_id == null ? null : contract_id.trim();
    }

    public String getInvoiceName() {
        return invoice_name;
    }

    public void setInvoiceName(String invoice_name) {
        this.invoice_name = invoice_name == null ? null : invoice_name.trim();
    }

    public String getTaxNumber() {
        return tax_number;
    }

    public void setTaxNumber(String tax_number) {
        this.tax_number = tax_number == null ? null : tax_number.trim();
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getBankandaccount() {
        return bankAndAccount;
    }

    public void setBankandaccount(String bankAndAccount) {
        this.bankAndAccount = bankAndAccount == null ? null : bankAndAccount.trim();
    }

    public String getPaymentAgreement() {
        return payment_agreement;
    }

    public void setPaymentAgreement(String payment_agreement) {
        this.payment_agreement = payment_agreement == null ? null : payment_agreement.trim();
    }

    public BigDecimal getContractTotalamount() {
        return contract_totalamount;
    }

    public void setContractTotalamount(BigDecimal contract_totalamount) {
        this.contract_totalamount = contract_totalamount;
    }

    public BigDecimal getActualReceipt() {
        return actual_receipt;
    }

    public void setActualReceipt(BigDecimal actual_receipt) {
        this.actual_receipt = actual_receipt;
    }

    public BigDecimal getOutstandingReceipt() {
        return outstanding_receipt;
    }

    public void setOutstandingReceipt(BigDecimal outstanding_receipt) {
        this.outstanding_receipt = outstanding_receipt;
    }

    public BigDecimal getAlreadyinvoiceAmount() {
        return alreadyInvoice_amount;
    }

    public void setAlreadyinvoiceAmount(BigDecimal alreadyInvoice_amount) {
        this.alreadyInvoice_amount = alreadyInvoice_amount;
    }

    public BigDecimal getApplyinvoiceAmount() {
        return applyInvoice_amount;
    }

    public void setApplyinvoiceAmount(BigDecimal applyInvoice_amount) {
        this.applyInvoice_amount = applyInvoice_amount;
    }

    public Integer getInvoiceType() {
        return invoice_type;
    }

    public void setInvoiceType(Integer invoice_type) {
        this.invoice_type = invoice_type;
    }

    public Integer getCostType() {
        return cost_type;
    }

    public void setCostType(Integer cost_type) {
        this.cost_type = cost_type;
    }

    public String getInvoiceReason() {
        return invoice_reason;
    }

    public void setInvoiceReason(String invoice_reason) {
        this.invoice_reason = invoice_reason == null ? null : invoice_reason.trim();
    }

    public Integer getInvoiceIf() {
        return invoice_if;
    }

    public void setInvoiceIf(Integer invoice_if) {
        this.invoice_if = invoice_if;
    }
}
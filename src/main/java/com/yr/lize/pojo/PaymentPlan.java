package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LENOVO on 2019/6/19.
 */
public class PaymentPlan {
    private Integer id;
    private Integer currency_id;
    private Date dtPayDate;
    private BigDecimal dblPayRatio;
    private BigDecimal dblPayCurrency;
    private String strSettleStyleID;
    private String strPayFactor;
    private String strExp;
    private String string;
    private String string2;
    private Date date;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCurrency_id() {
        return currency_id;
    }

    public void setCurrency_id(Integer currency_id) {
        this.currency_id = currency_id;
    }

    public Date getDtPayDate() {
        return dtPayDate;
    }

    public void setDtPayDate(String dtPayDate) {
        SimpleDateFormat aDate= new SimpleDateFormat("yyyy-MM-dd");

        Date date = null;
        try {
            if (!"".equals(dtPayDate)) {
                date = aDate.parse(dtPayDate);
            }
            this.dtPayDate =date;
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public BigDecimal getDblPayRatio() {
        return dblPayRatio;
    }

    public void setDblPayRatio(BigDecimal dblPayRatio) {
        this.dblPayRatio = dblPayRatio;
    }

    public BigDecimal getDblPayCurrency() {
        return dblPayCurrency;
    }

    public void setDblPayCurrency(BigDecimal dblPayCurrency) {
        this.dblPayCurrency = dblPayCurrency;
    }

    public String getStrSettleStyleID() {
        return strSettleStyleID;
    }

    public void setStrSettleStyleID(String strSettleStyleID) {
        this.strSettleStyleID = strSettleStyleID;
    }

    public String getStrPayFactor() {
        return strPayFactor;
    }

    public void setStrPayFactor(String strPayFactor) {
        this.strPayFactor = strPayFactor;
    }

    public String getStrExp() {
        return strExp;
    }

    public void setStrExp(String strExp) {
        this.strExp = strExp;
    }

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }

    public String getString2() {
        return string2;
    }

    public void setString2(String string2) {
        this.string2 = string2;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(String date) {
        SimpleDateFormat aDate= new SimpleDateFormat("yyyy-MM-dd");

        Date date1 = null;
        try {
            if (!"".equals(date)) {
                date1 = aDate.parse(date);
            }
            this.date =date1;
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}

package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryLizematerialsouttable {
    private Integer id;

    private String number;

    private String runproduct_name;

    private Date runproduct_dates;

    private String inventory_id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal buy_quantity;

    private BigDecimal fAvaQuantity;

    private Integer lizeMaterials_id;
    
    private String cWhName;
    
    private String cPosCode;
    
    private String cWhCode;
    
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getRunproduct_name() {
		return runproduct_name;
	}
	public void setRunproduct_name(String runproduct_name) {
		this.runproduct_name = runproduct_name;
	}
	public Date getRunproduct_dates() {
		return runproduct_dates;
	}
	public void setRunproduct_dates(Date runproduct_dates) {
		this.runproduct_dates = runproduct_dates;
	}
	public String getInventory_id() {
		return inventory_id;
	}
	public void setInventory_id(String inventory_id) {
		this.inventory_id = inventory_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getSpecifications_models() {
		return specifications_models;
	}
	public void setSpecifications_models(String specifications_models) {
		this.specifications_models = specifications_models;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public BigDecimal getBuy_quantity() {
		return buy_quantity;
	}
	public void setBuy_quantity(BigDecimal buy_quantity) {
		this.buy_quantity = buy_quantity;
	}
	public BigDecimal getfAvaQuantity() {
		return fAvaQuantity;
	}
	public void setfAvaQuantity(BigDecimal fAvaQuantity) {
		this.fAvaQuantity = fAvaQuantity;
	}
	public Integer getLizeMaterials_id() {
		return lizeMaterials_id;
	}
	public void setLizeMaterials_id(Integer lizeMaterials_id) {
		this.lizeMaterials_id = lizeMaterials_id;
	}
	public String getcWhName() {
		return cWhName;
	}
	public void setcWhName(String cWhName) {
		this.cWhName = cWhName;
	}
	public String getcPosCode() {
		return cPosCode;
	}
	public void setcPosCode(String cPosCode) {
		this.cPosCode = cPosCode;
	}
	public String getcWhCode() {
		return cWhCode;
	}
	public void setcWhCode(String cWhCode) {
		this.cWhCode = cWhCode;
	}


   
}
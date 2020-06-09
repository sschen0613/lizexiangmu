package com.yr.lize.pojo;

import java.math.BigDecimal;

public class InventoryLabmedicinebuytable {
    private Integer id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal buy_quantity;

    private Integer lab_id;

    private String remark;

    private String product_manufacturer;

    private BigDecimal inventory_quantity;

    private String administrative_office;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Integer getLab_id() {
		return lab_id;
	}

	public void setLab_id(Integer lab_id) {
		this.lab_id = lab_id;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getProduct_manufacturer() {
		return product_manufacturer;
	}

	public void setProduct_manufacturer(String product_manufacturer) {
		this.product_manufacturer = product_manufacturer;
	}

	public BigDecimal getInventory_quantity() {
		return inventory_quantity;
	}

	public void setInventory_quantity(BigDecimal inventory_quantity) {
		this.inventory_quantity = inventory_quantity;
	}

	public String getAdministrative_office() {
		return administrative_office;
	}

	public void setAdministrative_office(String administrative_office) {
		this.administrative_office = administrative_office;
	}

    
}
package com.yr.lize.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class InventoryBobuytable {
    private Integer number;

    private String inventory_id;

    private String product_name;

    private Date start_time;

    private Date over_time;

    private String inventory_number;

    private String inventory_name;

    private String specifications_models;

    private String unit;

    private BigDecimal buy_quantity;

    private BigDecimal inventory_quantity;

    private BigDecimal offer;

    private Integer BO_id;

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
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

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public Date getOver_time() {
		return over_time;
	}

	public void setOver_time(Date over_time) {
		this.over_time = over_time;
	}

	public String getInventory_number() {
		return inventory_number;
	}

	public void setInventory_number(String inventory_number) {
		this.inventory_number = inventory_number;
	}

	public String getInventory_name() {
		return inventory_name;
	}

	public void setInventory_name(String inventory_name) {
		this.inventory_name = inventory_name;
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

	public BigDecimal getInventory_quantity() {
		return inventory_quantity;
	}

	public void setInventory_quantity(BigDecimal inventory_quantity) {
		this.inventory_quantity = inventory_quantity;
	}

	public BigDecimal getOffer() {
		return offer;
	}

	public void setOffer(BigDecimal offer) {
		this.offer = offer;
	}

	public Integer getBO_id() {
		return BO_id;
	}

	public void setBO_id(Integer bO_id) {
		BO_id = bO_id;
	}

  
}
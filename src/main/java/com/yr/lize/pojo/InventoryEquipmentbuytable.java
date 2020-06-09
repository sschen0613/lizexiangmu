package com.yr.lize.pojo;

import java.math.BigDecimal;

public class InventoryEquipmentbuytable {
    private Integer number;

    private String inventory_id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal buy_quantity;

    private BigDecimal inventory_quantity;

    private Integer equipment_id;

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

	public Integer getEquipment_id() {
		return equipment_id;
	}

	public void setEquipment_id(Integer equipment_id) {
		this.equipment_id = equipment_id;
	}

    
}
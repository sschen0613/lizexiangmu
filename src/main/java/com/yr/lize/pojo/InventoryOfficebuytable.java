package com.yr.lize.pojo;

import java.math.BigDecimal;

public class InventoryOfficebuytable {
    private Integer id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal quantity;

    private Integer buyEquipment_id;

    private BigDecimal anticipated_price;

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

	public BigDecimal getQuantity() {
		return quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public Integer getBuyEquipment_id() {
		return buyEquipment_id;
	}

	public void setBuyEquipment_id(Integer buyEquipment_id) {
		this.buyEquipment_id = buyEquipment_id;
	}

	public BigDecimal getAnticipated_price() {
		return anticipated_price;
	}

	public void setAnticipated_price(BigDecimal anticipated_price) {
		this.anticipated_price = anticipated_price;
	}

    
}
package com.yr.lize.pojo;

import java.math.BigDecimal;

public class FinanceSaleinvoicetable {
    private Integer lizesale_id;

    private String brand;

    private String product_name;

    private String specifications_models;

    private String unit;

    private Integer quantity;

    private BigDecimal sum;

	public Integer getLizesale_id() {
		return lizesale_id;
	}

	public void setLizesale_id(Integer lizesale_id) {
		this.lizesale_id = lizesale_id;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getSum() {
		return sum;
	}

	public void setSum(BigDecimal sum) {
		this.sum = sum;
	}

}
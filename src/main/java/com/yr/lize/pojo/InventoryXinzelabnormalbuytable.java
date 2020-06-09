package com.yr.lize.pojo;

import java.math.BigDecimal;

public class InventoryXinzelabnormalbuytable {
    private Integer id;

    private String product_name;

    private String specifications_models;

    private String unit;

    private BigDecimal buy_quantity;

    private Integer xinzelab_id;

    private String remark;

    private String product_manufacturer;

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

	public Integer getXinzelab_id() {
		return xinzelab_id;
	}

	public void setXinzelab_id(Integer xinzelab_id) {
		this.xinzelab_id = xinzelab_id;
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

   
}
package com.yr.lize.pojo;

import java.math.BigDecimal;

/**
 * @BelongsProject: lizexiangmu
 * @BelongsPackage: IntelliJ IDEA
 * @Author: D
 * @CreateTime: 2020-07-06 09:37
 * @Description:
 */
public class OfficeSupplies {
    private Integer id;
    private String name;
    private String unit;
    private BigDecimal price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}

package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryDrugout;


public interface InventoryDrugoutMapper {


    int deleteByPrimaryKey(Integer drugoutId);

    int insert(InventoryDrugout record);

    int insertSelective(InventoryDrugout record);


    InventoryDrugout selectByPrimaryKey(Integer drugoutId);



    int updateByPrimaryKeySelective(InventoryDrugout record);

    int updateByPrimaryKey(InventoryDrugout record);
}
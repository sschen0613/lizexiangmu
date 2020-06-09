package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryLizeinsideout;

//丽泽内部出库申请
public interface InventoryLizeinsideoutMapper {


    int deleteByPrimaryKey(Integer lizeinsideId);

    int insert(InventoryLizeinsideout record);

    int insertSelective(InventoryLizeinsideout record);


    InventoryLizeinsideout selectByPrimaryKey(Integer lizeinsideId);



    int updateByPrimaryKeySelective(InventoryLizeinsideout record);

    int updateByPrimaryKey(InventoryLizeinsideout record);


}
package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryLizesellout;

//丽泽销售类申请
public interface InventoryLizeselloutMapper {


    int deleteByPrimaryKey(Integer lizesellId);

    int insert(InventoryLizesellout record);

    int insertSelective(InventoryLizesellout record);


    InventoryLizesellout selectByPrimaryKey(Integer lizesellId);



    int updateByPrimaryKeySelective(InventoryLizesellout record);

    int updateByPrimaryKey(InventoryLizesellout record);

}
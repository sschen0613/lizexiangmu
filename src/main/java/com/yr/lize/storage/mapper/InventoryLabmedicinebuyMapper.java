package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryLabmedicinebuy;


public interface InventoryLabmedicinebuyMapper {


    int deleteByPrimaryKey(Integer labId);

    int insert(InventoryLabmedicinebuy record);

    int insertSelective(InventoryLabmedicinebuy record);


    InventoryLabmedicinebuy selectByPrimaryKey(Integer labId);



    int updateByPrimaryKeySelective(InventoryLabmedicinebuy record);

    int updateByPrimaryKey(InventoryLabmedicinebuy record);
}
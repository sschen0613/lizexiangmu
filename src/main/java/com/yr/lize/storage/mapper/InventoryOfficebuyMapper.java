package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryOfficebuy;


public interface InventoryOfficebuyMapper {


    int deleteByPrimaryKey(Integer buyequipmentId);

    int insert(InventoryOfficebuy record);

    int insertSelective(InventoryOfficebuy record);


    InventoryOfficebuy selectByPrimaryKey(Integer buyequipmentId);



    int updateByPrimaryKeySelective(InventoryOfficebuy record);

    int updateByPrimaryKey(InventoryOfficebuy record);
}
package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryXinzeequipmentmaintain;


public interface InventoryXinzeequipmentmaintainMapper {


    int deleteByPrimaryKey(Integer maintainId);

    int insert(InventoryXinzeequipmentmaintain record);

    int insertSelective(InventoryXinzeequipmentmaintain record);


    InventoryXinzeequipmentmaintain selectByPrimaryKey(Integer maintainId);



    int updateByPrimaryKeySelective(InventoryXinzeequipmentmaintain record);

    int updateByPrimaryKey(InventoryXinzeequipmentmaintain record);
}
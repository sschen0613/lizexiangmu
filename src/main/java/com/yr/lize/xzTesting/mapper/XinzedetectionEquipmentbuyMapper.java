package com.yr.lize.xzTesting.mapper;

import com.yr.lize.pojo.XinzedetectionEquipmentbuy;



public interface XinzedetectionEquipmentbuyMapper {
 

    int deleteByPrimaryKey(Integer xinzemaintainId);

    int insert(XinzedetectionEquipmentbuy record);

    int insertSelective(XinzedetectionEquipmentbuy record);


    XinzedetectionEquipmentbuy selectByPrimaryKey(Integer xinzemaintainId);



    int updateByPrimaryKeySelective(XinzedetectionEquipmentbuy record);

    int updateByPrimaryKey(XinzedetectionEquipmentbuy record);
}
package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryXinzelabnormalbuy;


public interface InventoryXinzelabnormalbuyMapper {


    int deleteByPrimaryKey(Integer xinzelabId);

    int insert(InventoryXinzelabnormalbuy record);

    int insertSelective(InventoryXinzelabnormalbuy record);


    InventoryXinzelabnormalbuy selectByPrimaryKey(Integer xinzelabId);



    int updateByPrimaryKeySelective(InventoryXinzelabnormalbuy record);

    int updateByPrimaryKey(InventoryXinzelabnormalbuy record);
}
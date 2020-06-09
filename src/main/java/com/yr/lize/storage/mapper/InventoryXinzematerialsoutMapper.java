package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryXinzematerialsout;


public interface InventoryXinzematerialsoutMapper {


    int deleteByPrimaryKey(Integer xinzematerialsId);

    int insert(InventoryXinzematerialsout record);

    int insertSelective(InventoryXinzematerialsout record);


    InventoryXinzematerialsout selectByPrimaryKey(Integer xinzematerialsId);



    int updateByPrimaryKeySelective(InventoryXinzematerialsout record);

    int updateByPrimaryKey(InventoryXinzematerialsout record);
}
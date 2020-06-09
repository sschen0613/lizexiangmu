package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryLizematerialsout;
import com.yr.lize.pojo.InventoryLizematerialsouttable;

public interface InventoryLizematerialsoutMapper {


    int deleteByPrimaryKey(Integer lizematerialsId);
    //添加主表信息
    int insert(InventoryLizematerialsout record);
    //添加附表信息
    Integer inserttable(InventoryLizematerialsouttable inventoryLizematerialsouttable);

    int insertSelective(InventoryLizematerialsout record);


    InventoryLizematerialsout selectByPrimaryKey(Integer lizematerialsId);



    int updateByPrimaryKeySelective(InventoryLizematerialsout record);

    int updateByPrimaryKey(InventoryLizematerialsout record);
}
package com.yr.lize.storage.mapper;

import com.yr.lize.pojo.InventoryEquipmentbuy;
import com.yr.lize.pojo.InventoryEquipmentbuytable;

public interface InventoryEquipmentbuyMapper {

	int deleteByPrimaryKey(Integer equipmentId);

	// 添加主表信息
	int insert(InventoryEquipmentbuy record);

	// 添加附表信息
	Integer inserttable(InventoryEquipmentbuytable inventoryLizematerialsouttable);

	int insertSelective(InventoryEquipmentbuy record);

	InventoryEquipmentbuy selectByPrimaryKey(Integer equipmentId);

	int updateByPrimaryKeySelective(InventoryEquipmentbuy record);

	int updateByPrimaryKey(InventoryEquipmentbuy record);

}
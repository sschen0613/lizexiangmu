package com.yr.lize.storage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.yr.lize.storage.service.IStorageRequisitionsOfSaleService;
import com.yr.lize.pojo.InventoryEquipmentbuy;
import com.yr.lize.pojo.InventoryEquipmentbuytable;
import com.yr.lize.storage.mapper.InventoryEquipmentbuyMapper;

@Service
//销售请购申请
public class StorageRequisitionsOfSaleServiceImpl implements IStorageRequisitionsOfSaleService {
@Autowired
InventoryEquipmentbuyMapper InventoryEquipmentbuyMapper;
//添加主表信息
@Override
public Integer insert(InventoryEquipmentbuy InventoryLizematerialsout) {
	// TODO Auto-generated method stub
	return InventoryEquipmentbuyMapper.insert(InventoryLizematerialsout);
}
//添加附表信息
@Override
public Integer inserttable(InventoryEquipmentbuytable InventoryLizematerialsouttable) {
	// TODO Auto-generated method stub
	return InventoryEquipmentbuyMapper.inserttable(InventoryLizematerialsouttable);
}

}

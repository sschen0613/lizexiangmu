package com.yr.lize.storage.service;

import com.yr.lize.pojo.InventoryEquipmentbuy;
import com.yr.lize.pojo.InventoryEquipmentbuytable;


//销售请购申请
public interface IStorageRequisitionsOfSaleService {
	// 添加主表单数据
	Integer insert(InventoryEquipmentbuy InventoryLizematerialsout);

	// 添加附表表单数据
	Integer inserttable(InventoryEquipmentbuytable InventoryLizematerialsouttable);
}

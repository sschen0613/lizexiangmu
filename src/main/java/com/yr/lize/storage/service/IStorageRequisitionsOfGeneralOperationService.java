package com.yr.lize.storage.service;

import com.yr.lize.pojo.InventoryBobuy;
import com.yr.lize.pojo.InventoryBobuytable;

//普通运营请购申请 
public interface IStorageRequisitionsOfGeneralOperationService  {
	// 添加主表单数据
	Integer insert(InventoryBobuy InventoryBobuy);

	// 添加附表表单数据
	Integer inserttable(InventoryBobuytable InventoryBobuytable);
}

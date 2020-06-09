package com.yr.lize.storage.service.impl;

import com.st.rbac.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yr.lize.pojo.InventoryStockupbuy;
import com.yr.lize.pojo.InventoryStockupbuytable;
import com.yr.lize.storage.service.IStorageRequisitionsOfStockupService;
import com.yr.lize.storage.mapper.InventoryStockupbuyMapper;

import java.util.HashMap;
import java.util.List;

@Service

public class StorageRequisitionsOfStockupServiceImpl implements IStorageRequisitionsOfStockupService{
@Autowired
InventoryStockupbuyMapper InventoryStockupbuyMapper;


//添加主表信息
	@Override
	public Integer insert(InventoryStockupbuy InventoryStockupbuy) {
		// TODO Auto-generated method stub
		return InventoryStockupbuyMapper.insert(InventoryStockupbuy);	
	}
//添加附表信息
	@Override
	public Integer inserttable(InventoryStockupbuytable InventoryStockupbuytable) {
		// TODO Auto-generated method stub
		return InventoryStockupbuyMapper.inserttable(InventoryStockupbuytable);
	}
	@Override
	public Integer dalete(InventoryStockupbuy InventoryStockupbuy) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Integer select() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<HashMap<String, Object>> selectInventoryName() {
		return InventoryStockupbuyMapper.selectInventoryName();
	}
}

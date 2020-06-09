package com.yr.lize.storage.service.impl;

import com.st.rbac.util.Page;
import org.springframework.beans.factory.annotation.Autowired;

import com.yr.lize.pojo.InventoryBobuy;
import com.yr.lize.pojo.InventoryBobuytable;
import com.yr.lize.storage.service.IStorageRequisitionsOfGeneralOperationService;
import com.yr.lize.storage.mapper.InventoryBobuyMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StorageRequisitionsOfGeneralOperationServiceImpl implements IStorageRequisitionsOfGeneralOperationService {
	@Autowired
	InventoryBobuyMapper InventoryBobuyMapper;
//添加主表信息
	@Override
	public Integer insert(InventoryBobuy InventoryBobuy) {
		// TODO Auto-generated method stub
		return InventoryBobuyMapper.insert(InventoryBobuy);
	}
//添加附表信息
	@Override
	public Integer inserttable(InventoryBobuytable InventoryBobuytable) {
		// TODO Auto-generated method stub
		return InventoryBobuyMapper.inserttable(InventoryBobuytable);
	}

}

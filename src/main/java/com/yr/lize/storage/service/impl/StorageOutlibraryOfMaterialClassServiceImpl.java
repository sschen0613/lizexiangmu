package com.yr.lize.storage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import com.yr.lize.pojo.InventoryLizematerialsout;
import com.yr.lize.pojo.InventoryLizematerialsouttable;
import com.yr.lize.storage.service.IStorageOutlibraryOfMaterialClassService;
import com.yr.lize.storage.mapper.InventoryLizematerialsoutMapper;
@Service
public class StorageOutlibraryOfMaterialClassServiceImpl implements IStorageOutlibraryOfMaterialClassService{
@Autowired
private InventoryLizematerialsoutMapper InventoryLizematerialsoutMapper;
//添加主表信息
	@Override
	public Integer insert(InventoryLizematerialsout InventoryLizematerialsout) {
		// TODO Auto-generated method stub
		return InventoryLizematerialsoutMapper.insert(InventoryLizematerialsout);	
	}
//添加附表信息
	@Override
	public Integer inserttable(InventoryLizematerialsouttable InventoryLizematerialsouttable) {
		// TODO Auto-generated method stub
		return InventoryLizematerialsoutMapper.inserttable(InventoryLizematerialsouttable);
	}
	@Override
	public Integer dalete(InventoryLizematerialsout InventoryLizematerialsout) {
		// TODO Auto-generated method stub
		return null;
	}
	//查询表单记录
	@Override
	public Integer select() {
		// TODO Auto-generated method stub
		return null;
	}

}

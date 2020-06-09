package com.yr.lize.storage.service;

import org.springframework.stereotype.Service;


import com.yr.lize.pojo.InventoryLizematerialsout;
import com.yr.lize.pojo.InventoryLizematerialsouttable;


//丽泽材料类出库申请
@Service
public interface IStorageOutlibraryOfMaterialClassService {
    //添加主表单数据
	Integer insert(InventoryLizematerialsout InventoryLizematerialsout);
	//添加附表表单数据
	Integer inserttable(InventoryLizematerialsouttable InventoryLizematerialsouttable);
	//删除表单数据
	Integer dalete(InventoryLizematerialsout InventoryLizematerialsout);
	//查询表单记录
	Integer select();
	//修改表单数据
}

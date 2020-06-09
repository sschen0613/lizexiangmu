package com.yr.lize.storage.service;


import com.st.rbac.util.Page;
import com.yr.lize.pojo.InventoryStockupbuy;
import com.yr.lize.pojo.InventoryStockupbuytable;

import java.util.HashMap;
import java.util.List;

//备货请购申请
public interface IStorageRequisitionsOfStockupService {

	   //添加主表单数据
		Integer insert(InventoryStockupbuy InventoryStockupbuy);
		//添加附表表单数据
		Integer inserttable(InventoryStockupbuytable InventoryStockupbuytable);
		//删除表单数据
		Integer dalete(InventoryStockupbuy InventoryStockupbuy);
		//查询表单记录
		Integer select();


	    //查询商品名称
        List<HashMap<String,Object>> selectInventoryName();
    //修改表单数据

}

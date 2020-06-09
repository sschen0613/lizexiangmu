package com.yr.lize.storage.mapper;


import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.InventoryStockupbuy;
import com.yr.lize.pojo.InventoryStockupbuytable;

import java.util.HashMap;
import java.util.List;

@DataSource(value = "1")
public interface InventoryStockupbuyMapper {


    int deleteByPrimaryKey(Integer stockupId);
    //添加主表信息
    int insert(InventoryStockupbuy record);
    
    //添加附表信息
    int inserttable(InventoryStockupbuytable InventoryStockupbuytable);


    int insertSelective(InventoryStockupbuy record);


    InventoryStockupbuy selectByPrimaryKey(Integer stockupId);



    int updateByPrimaryKeySelective(InventoryStockupbuy record);

    int updateByPrimaryKey(InventoryStockupbuy record);


    //查询商品名称
    List<HashMap<String,Object>> selectInventoryName();
}
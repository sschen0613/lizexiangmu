package com.yr.lize.storage.mapper;

import com.st.rbac.util.DataSource;
import com.yr.lize.pojo.InventoryBobuy;
import com.yr.lize.pojo.InventoryBobuytable;

@DataSource(value="1")
public interface InventoryBobuyMapper {


    int deleteByPrimaryKey(Integer boId);
//添加主表信息
	int insert(InventoryBobuy record);
//添加附表信息
	Integer inserttable(InventoryBobuytable inventoryBobuytable);

	int insertSelective(InventoryBobuy record);

    InventoryBobuy selectByPrimaryKey(Integer boId);



    int updateByPrimaryKeySelective(InventoryBobuy record);

    int updateByPrimaryKey(InventoryBobuy record);

}
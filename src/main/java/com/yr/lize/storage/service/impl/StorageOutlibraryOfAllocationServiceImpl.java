package com.yr.lize.storage.service.impl;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.InventoryLizeinsideout;
import com.yr.lize.storage.mapper.InventoryLizeinsideoutMapper;
import com.yr.lize.storage.service.IStorageOutlibraryOfAllocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

//丽泽内部出库申请表
@Service
public class StorageOutlibraryOfAllocationServiceImpl implements IStorageOutlibraryOfAllocationService {
    @Autowired
    InventoryLizeinsideoutMapper inventoryLizeinsideoutMapper;
    //插入主表信息
    @Override
    public int insert(InventoryLizeinsideout record) {
        return inventoryLizeinsideoutMapper.insert(record);
    }


}

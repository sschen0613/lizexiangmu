package com.yr.lize.storage.service.impl;

import com.st.rbac.util.Page;
import com.yr.lize.storage.mapper.InventoryLizeselloutMapper;
import com.yr.lize.storage.service.IStorageOutlibraryOfSaleClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.java2d.pipe.SpanShapeRenderer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
//丽泽销售类出库申请
public class StorageOutlibraryOfSaleClassServiceImpl implements IStorageOutlibraryOfSaleClassService {

    @Autowired
    InventoryLizeselloutMapper inventoryLizeselloutMapper;

}

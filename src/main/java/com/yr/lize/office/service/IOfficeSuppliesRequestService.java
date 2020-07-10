package com.yr.lize.office.service;

import com.github.pagehelper.PageInfo;
import com.yr.lize.pojo.OfficeSupplies;

/**
 * @BelongsProject: lizexiangmu
 * @BelongsPackage: IntelliJ IDEA
 * @Author: D
 * @CreateTime: 2020-07-06 09:33
 * @Description:
 */
public interface IOfficeSuppliesRequestService {
    //分页查询办公用品
    public PageInfo<OfficeSupplies> selectOfficeSuppliesList(Integer limit, Integer page, OfficeSupplies officeSupplies);

    //新增办公用品
    public Integer addOfficeSupplies(OfficeSupplies officeSupplies);

    //更新办公用品
    public Integer updateOfficeSupplies(OfficeSupplies officeSupplies);

    //删除办公用品
    public Integer deleteOfficeSupplies(OfficeSupplies officeSupplies);
}

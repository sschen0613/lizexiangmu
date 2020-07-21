package com.yr.lize.office.mapper;

import com.st.rbac.util.DataSource;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.OfficeSupplies;

import java.util.HashMap;
import java.util.List;

/**
 * @BelongsProject: lizexiangmu
 * @BelongsPackage: IntelliJ IDEA
 * @Author: D
 * @CreateTime: 2020-07-06 14:22
 * @Description:
 */
@DataSource(value="1")
public interface OfficeSuppliesMapper {
    //查询办公用品列表
    public List<OfficeSupplies> selectOfficeSuppliesList(OfficeSupplies officeSupplies);

    //新增办公用品
    public Integer addOfficeSupplies(OfficeSupplies officeSupplies);

    //更新办公用品
    public Integer updateOfficeSupplies(OfficeSupplies officeSupplies);

    //删除办公用品
    public Integer deleteOfficeSupplies(OfficeSupplies officeSupplies);

    //查询每个部门办公用品使用总额
    public List<HashMap<String,Object>> selectOfficeSuppliesAmountList(CurrencyApply currencyApply);

    //查询每个部门办公用品使用总额
    public List<HashMap<String,Object>> selectOfficeSuppliesAmountListByDep(CurrencyApply currencyApply);
}

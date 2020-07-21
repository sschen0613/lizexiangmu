package com.yr.lize.office.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yr.lize.office.mapper.OfficeSuppliesMapper;
import com.yr.lize.office.service.IOfficeSuppliesRequestService;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.OfficeSupplies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * @BelongsProject: lizexiangmu
 * @BelongsPackage: IntelliJ IDEA
 * @Author: D
 * @CreateTime: 2020-07-06 09:36
 * @Description:
 */
@Service
public class OfficeSuppliesRequestServiceImpl implements IOfficeSuppliesRequestService {

    @Autowired
    private OfficeSuppliesMapper officeSuppliesMapper;

    @Override
    public PageInfo<OfficeSupplies> selectOfficeSuppliesList(Integer limit, Integer page, OfficeSupplies officeSupplies) {

        PageHelper.startPage(page,limit);
        List<OfficeSupplies> officeSuppliesList = officeSuppliesMapper.selectOfficeSuppliesList(officeSupplies);
        PageInfo<OfficeSupplies> pageInfo = new PageInfo<>(officeSuppliesList);
        return pageInfo;
    }

    @Override
    public Integer addOfficeSupplies(OfficeSupplies officeSupplies) {
        if (officeSupplies.getId() == null){
            return officeSuppliesMapper.addOfficeSupplies(officeSupplies);
        }else {
            return officeSuppliesMapper.updateOfficeSupplies(officeSupplies);
        }
    }

    @Override
    public Integer updateOfficeSupplies(OfficeSupplies officeSupplies) {
        return officeSuppliesMapper.updateOfficeSupplies(officeSupplies);
    }

    @Override
    public Integer deleteOfficeSupplies(OfficeSupplies officeSupplies) {
        return officeSuppliesMapper.deleteOfficeSupplies(officeSupplies);
    }

    @Override
    public List<HashMap<String, Object>> selectOfficeSuppliesAmountList(CurrencyApply currencyApply) {
        return officeSuppliesMapper.selectOfficeSuppliesAmountList(currencyApply);
    }

    @Override
    public List<HashMap<String, Object>> selectOfficeSuppliesAmountListByDep(CurrencyApply currencyApply) {
        return officeSuppliesMapper.selectOfficeSuppliesAmountListByDep(currencyApply);
    }
}

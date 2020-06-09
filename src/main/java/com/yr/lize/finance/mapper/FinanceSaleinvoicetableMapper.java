package com.yr.lize.finance.mapper;

import com.yr.lize.pojo.FinanceSaleinvoicetable;

public interface FinanceSaleinvoicetableMapper {


    int deleteByPrimaryKey(Integer lizesaleId);

    int insert(FinanceSaleinvoicetable record);

    int insertSelective(FinanceSaleinvoicetable record);


    FinanceSaleinvoicetable selectByPrimaryKey(Integer lizesaleId);



    int updateByPrimaryKeySelective(FinanceSaleinvoicetable record);

    int updateByPrimaryKey(FinanceSaleinvoicetable record);
}
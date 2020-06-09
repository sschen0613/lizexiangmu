package com.yr.lize.finance.mapper;

import com.yr.lize.pojo.FinanceSaleinvoice;

public interface FinanceSaleinvoiceMapper {


    int deleteByPrimaryKey(Integer lizesaleId);

    int insert(FinanceSaleinvoice record);

    int insertSelective(FinanceSaleinvoice record);


    FinanceSaleinvoice selectByPrimaryKey(Integer lizesaleId);



    int updateByPrimaryKeySelective(FinanceSaleinvoice record);

    int updateByPrimaryKey(FinanceSaleinvoice record);
}
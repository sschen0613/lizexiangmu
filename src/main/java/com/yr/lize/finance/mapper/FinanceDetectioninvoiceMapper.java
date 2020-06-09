package com.yr.lize.finance.mapper;

import com.yr.lize.pojo.FinanceDetectioninvoice;

public interface FinanceDetectioninvoiceMapper {


    int deleteByPrimaryKey(Integer xinzeinvoiceId);

    int insert(FinanceDetectioninvoice record);

    int insertSelective(FinanceDetectioninvoice record);


    FinanceDetectioninvoice selectByPrimaryKey(Integer xinzeinvoiceId);



    int updateByPrimaryKeySelective(FinanceDetectioninvoice record);

    int updateByPrimaryKey(FinanceDetectioninvoice record);
}
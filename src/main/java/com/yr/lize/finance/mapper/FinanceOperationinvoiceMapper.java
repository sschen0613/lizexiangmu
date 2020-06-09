package com.yr.lize.finance.mapper;

import com.yr.lize.pojo.FinanceOperationinvoice;

public interface FinanceOperationinvoiceMapper {
  

    int deleteByPrimaryKey(Integer lizeinvoiceId);

    int insert(FinanceOperationinvoice record);

    int insertSelective(FinanceOperationinvoice record);

   

    FinanceOperationinvoice selectByPrimaryKey(Integer lizeinvoiceId);



    int updateByPrimaryKeySelective(FinanceOperationinvoice record);

    int updateByPrimaryKey(FinanceOperationinvoice record);
}
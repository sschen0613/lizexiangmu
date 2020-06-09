package com.yr.lize.finance.mapper;

import com.yr.lize.pojo.FinanceServerequest;

public interface FinanceServerequestMapper {


    int deleteByPrimaryKey(Integer businessreceptionId);

    int insert(FinanceServerequest record);

    int insertSelective(FinanceServerequest record);


    FinanceServerequest selectByPrimaryKey(Integer businessreceptionId);



    int updateByPrimaryKeySelective(FinanceServerequest record);

    int updateByPrimaryKey(FinanceServerequest record);
}
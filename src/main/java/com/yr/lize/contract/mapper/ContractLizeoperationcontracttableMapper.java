package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizeoperationcontracttable;


public interface ContractLizeoperationcontracttableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(ContractLizeoperationcontracttable record);

    int insertSelective(ContractLizeoperationcontracttable record);


    ContractLizeoperationcontracttable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(ContractLizeoperationcontracttable record);

    int updateByPrimaryKey(ContractLizeoperationcontracttable record);
}
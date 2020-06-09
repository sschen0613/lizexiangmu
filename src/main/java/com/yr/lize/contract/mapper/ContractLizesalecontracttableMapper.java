package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizesalecontracttable;

public interface ContractLizesalecontracttableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(ContractLizesalecontracttable record);

    int insertSelective(ContractLizesalecontracttable record);


    ContractLizesalecontracttable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(ContractLizesalecontracttable record);

    int updateByPrimaryKey(ContractLizesalecontracttable record);
}
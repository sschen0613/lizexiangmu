package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizereducecontracttable;

public interface ContractLizereducecontracttableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(ContractLizereducecontracttable record);

    int insertSelective(ContractLizereducecontracttable record);


    ContractLizereducecontracttable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(ContractLizereducecontracttable record);

    int updateByPrimaryKey(ContractLizereducecontracttable record);
}
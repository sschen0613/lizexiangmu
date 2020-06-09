package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizereducecontract;


public interface ContractLizereducecontractMapper {


    int deleteByPrimaryKey(Integer lizechangerequestId);

    int insert(ContractLizereducecontract record);

    int insertSelective(ContractLizereducecontract record);


    ContractLizereducecontract selectByPrimaryKey(Integer lizechangerequestId);



    int updateByPrimaryKeySelective(ContractLizereducecontract record);

    int updateByPrimaryKey(ContractLizereducecontract record);
}
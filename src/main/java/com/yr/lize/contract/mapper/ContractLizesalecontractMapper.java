package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizesalecontract;

public interface ContractLizesalecontractMapper {


    int deleteByPrimaryKey(Integer lizesalerequestId);

    int insert(ContractLizesalecontract record);

    int insertSelective(ContractLizesalecontract record);


    ContractLizesalecontract selectByPrimaryKey(Integer lizesalerequestId);



    int updateByPrimaryKeySelective(ContractLizesalecontract record);

    int updateByPrimaryKey(ContractLizesalecontract record);
}
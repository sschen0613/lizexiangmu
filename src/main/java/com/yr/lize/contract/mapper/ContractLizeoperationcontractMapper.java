package com.yr.lize.contract.mapper;

import com.yr.lize.pojo.ContractLizeoperationcontract;


public interface ContractLizeoperationcontractMapper {


    int deleteByPrimaryKey(Integer lizeservicerequestid);

    int insert(ContractLizeoperationcontract record);

    int insertSelective(ContractLizeoperationcontract record);


    ContractLizeoperationcontract selectByPrimaryKey(Integer lizeservicerequestid);



    int updateByPrimaryKeySelective(ContractLizeoperationcontract record);

    int updateByPrimaryKey(ContractLizeoperationcontract record);
}
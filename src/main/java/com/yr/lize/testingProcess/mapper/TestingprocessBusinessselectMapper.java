package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessBusinessselect;


public interface TestingprocessBusinessselectMapper {
  

    int deleteByPrimaryKey(Integer businessId);

    int insert(TestingprocessBusinessselect record);

    int insertSelective(TestingprocessBusinessselect record);


    TestingprocessBusinessselect selectByPrimaryKey(Integer businessId);



    int updateByPrimaryKeySelective(TestingprocessBusinessselect record);

    int updateByPrimaryKey(TestingprocessBusinessselect record);
}
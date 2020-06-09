package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessDetectionregistertable;


public interface TestingprocessDetectionregistertableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(TestingprocessDetectionregistertable record);

    int insertSelective(TestingprocessDetectionregistertable record);


    TestingprocessDetectionregistertable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(TestingprocessDetectionregistertable record);

    int updateByPrimaryKey(TestingprocessDetectionregistertable record);
}
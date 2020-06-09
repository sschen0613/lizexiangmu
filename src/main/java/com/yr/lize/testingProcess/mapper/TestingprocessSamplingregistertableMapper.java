package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSamplingregistertable;


public interface TestingprocessSamplingregistertableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(TestingprocessSamplingregistertable record);

    int insertSelective(TestingprocessSamplingregistertable record);


    TestingprocessSamplingregistertable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(TestingprocessSamplingregistertable record);

    int updateByPrimaryKey(TestingprocessSamplingregistertable record);
}
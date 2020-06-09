package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSamplingregister;


public interface TestingprocessSamplingregisterMapper {


    int deleteByPrimaryKey(Integer samplingregisterId);

    int insert(TestingprocessSamplingregister record);

    int insertSelective(TestingprocessSamplingregister record);


    TestingprocessSamplingregister selectByPrimaryKey(Integer samplingregisterId);



    int updateByPrimaryKeySelective(TestingprocessSamplingregister record);

    int updateByPrimaryKey(TestingprocessSamplingregister record);
}
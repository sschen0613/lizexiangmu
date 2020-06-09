package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSamplingtasktable;


public interface TestingprocessSamplingtasktableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(TestingprocessSamplingtasktable record);

    int insertSelective(TestingprocessSamplingtasktable record);


    TestingprocessSamplingtasktable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(TestingprocessSamplingtasktable record);

    int updateByPrimaryKey(TestingprocessSamplingtasktable record);
}
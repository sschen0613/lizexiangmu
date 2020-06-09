package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSpecimencodingtable;


public interface TestingprocessSpecimencodingtableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(TestingprocessSpecimencodingtable record);

    int insertSelective(TestingprocessSpecimencodingtable record);


    TestingprocessSpecimencodingtable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(TestingprocessSpecimencodingtable record);

    int updateByPrimaryKey(TestingprocessSpecimencodingtable record);
}
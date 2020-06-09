package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSpecimencoding;


public interface TestingprocessSpecimencodingMapper {


    int deleteByPrimaryKey(Integer specimenId);

    int insert(TestingprocessSpecimencoding record);

    int insertSelective(TestingprocessSpecimencoding record);


    TestingprocessSpecimencoding selectByPrimaryKey(Integer specimenId);



    int updateByPrimaryKeySelective(TestingprocessSpecimencoding record);

    int updateByPrimaryKey(TestingprocessSpecimencoding record);
}
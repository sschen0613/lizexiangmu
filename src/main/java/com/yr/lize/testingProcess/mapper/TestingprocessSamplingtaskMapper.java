package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSamplingtask;

public interface TestingprocessSamplingtaskMapper {


    int deleteByPrimaryKey(Integer samplinginformId);

    int insert(TestingprocessSamplingtask record);

    int insertSelective(TestingprocessSamplingtask record);


    TestingprocessSamplingtask selectByPrimaryKey(Integer samplinginformId);



    int updateByPrimaryKeySelective(TestingprocessSamplingtask record);

    int updateByPrimaryKey(TestingprocessSamplingtask record);
}
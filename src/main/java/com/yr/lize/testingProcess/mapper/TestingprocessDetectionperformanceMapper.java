package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessDetectionperformance;


public interface TestingprocessDetectionperformanceMapper {


    int deleteByPrimaryKey(Integer detectionId);

    int insert(TestingprocessDetectionperformance record);

    int insertSelective(TestingprocessDetectionperformance record);


    TestingprocessDetectionperformance selectByPrimaryKey(Integer detectionId);



    int updateByPrimaryKeySelective(TestingprocessDetectionperformance record);

    int updateByPrimaryKey(TestingprocessDetectionperformance record);
}
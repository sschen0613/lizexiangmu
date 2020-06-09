package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessDetectionregister;


public interface TestingprocessDetectionregisterMapper {


    int deleteByPrimaryKey(Integer detectionId);

    int insert(TestingprocessDetectionregister record);

    int insertSelective(TestingprocessDetectionregister record);


    TestingprocessDetectionregister selectByPrimaryKey(Integer detectionId);



    int updateByPrimaryKeySelective(TestingprocessDetectionregister record);

    int updateByPrimaryKey(TestingprocessDetectionregister record);
}
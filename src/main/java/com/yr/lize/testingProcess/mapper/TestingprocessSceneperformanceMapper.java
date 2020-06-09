package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessSceneperformance;


public interface TestingprocessSceneperformanceMapper {


    int deleteByPrimaryKey(Integer sceneNumber);

    int insert(TestingprocessSceneperformance record);

    int insertSelective(TestingprocessSceneperformance record);


    TestingprocessSceneperformance selectByPrimaryKey(Integer sceneNumber);



    int updateByPrimaryKeySelective(TestingprocessSceneperformance record);

    int updateByPrimaryKey(TestingprocessSceneperformance record);
}
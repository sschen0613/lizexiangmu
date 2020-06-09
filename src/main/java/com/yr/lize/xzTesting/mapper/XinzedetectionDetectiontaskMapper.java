package com.yr.lize.xzTesting.mapper;

import com.yr.lize.pojo.XinzedetectionDetectiontask;


public interface XinzedetectionDetectiontaskMapper {


    int deleteByPrimaryKey(Integer detectiontaskId);

    int insert(XinzedetectionDetectiontask record);

    int insertSelective(XinzedetectionDetectiontask record);


    XinzedetectionDetectiontask selectByPrimaryKey(Integer detectiontaskId);

  

    int updateByPrimaryKeySelective(XinzedetectionDetectiontask record);

    int updateByPrimaryKey(XinzedetectionDetectiontask record);
}
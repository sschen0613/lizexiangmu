package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationDetectiontask;


public interface OnlineoperationDetectiontaskMapper {


    int deleteByPrimaryKey(Integer reagentgetId);

    int insert(OnlineoperationDetectiontask record);

    int insertSelective(OnlineoperationDetectiontask record);


    OnlineoperationDetectiontask selectByPrimaryKey(Integer reagentgetId);



    int updateByPrimaryKeySelective(OnlineoperationDetectiontask record);

    int updateByPrimaryKey(OnlineoperationDetectiontask record);
}
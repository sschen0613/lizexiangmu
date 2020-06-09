package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationAbnormalclear;


public interface OnlineoperationAbnormalclearMapper {


    int deleteByPrimaryKey(Integer abnormityId);

    int insert(OnlineoperationAbnormalclear record);

    int insertSelective(OnlineoperationAbnormalclear record);


    OnlineoperationAbnormalclear selectByPrimaryKey(Integer abnormityId);



    int updateByPrimaryKeySelective(OnlineoperationAbnormalclear record);

    int updateByPrimaryKey(OnlineoperationAbnormalclear record);
}
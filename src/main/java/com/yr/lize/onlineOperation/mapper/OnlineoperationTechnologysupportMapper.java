package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationTechnologysupport;

public interface OnlineoperationTechnologysupportMapper {


    int deleteByPrimaryKey(Integer supportId);

    int insert(OnlineoperationTechnologysupport record);

    int insertSelective(OnlineoperationTechnologysupport record);


    OnlineoperationTechnologysupport selectByPrimaryKey(Integer supportId);



    int updateByPrimaryKeySelective(OnlineoperationTechnologysupport record);

    int updateByPrimaryKey(OnlineoperationTechnologysupport record);
}
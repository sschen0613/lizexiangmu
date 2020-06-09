package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationReceivingdeliverytable;

public interface OnlineoperationReceivingdeliverytableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationReceivingdeliverytable record);

    int insertSelective(OnlineoperationReceivingdeliverytable record);


    OnlineoperationReceivingdeliverytable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationReceivingdeliverytable record);

    int updateByPrimaryKey(OnlineoperationReceivingdeliverytable record);
}
package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationReceivingdelivery;


public interface OnlineoperationReceivingdeliveryMapper {


    int deleteByPrimaryKey(Integer sitechangeId);

    int insert(OnlineoperationReceivingdelivery record);

    int insertSelective(OnlineoperationReceivingdelivery record);


    OnlineoperationReceivingdelivery selectByPrimaryKey(Integer sitechangeId);



    int updateByPrimaryKeySelective(OnlineoperationReceivingdelivery record);

    int updateByPrimaryKey(OnlineoperationReceivingdelivery record);
}
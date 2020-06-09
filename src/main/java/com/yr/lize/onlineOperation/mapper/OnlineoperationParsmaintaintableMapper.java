package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationParsmaintaintable;


public interface OnlineoperationParsmaintaintableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationParsmaintaintable record);

    int insertSelective(OnlineoperationParsmaintaintable record);


    OnlineoperationParsmaintaintable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationParsmaintaintable record);

    int updateByPrimaryKey(OnlineoperationParsmaintaintable record);
}
package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationStandbybuytable;

public interface OnlineoperationStandbybuytableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationStandbybuytable record);

    int insertSelective(OnlineoperationStandbybuytable record);


    OnlineoperationStandbybuytable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationStandbybuytable record);

    int updateByPrimaryKey(OnlineoperationStandbybuytable record);
}
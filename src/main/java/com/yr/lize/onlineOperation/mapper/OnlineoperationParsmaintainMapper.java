package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationParsmaintain;


public interface OnlineoperationParsmaintainMapper {


    int deleteByPrimaryKey(Integer patsmaintainId);

    int insert(OnlineoperationParsmaintain record);

    int insertSelective(OnlineoperationParsmaintain record);


    OnlineoperationParsmaintain selectByPrimaryKey(Integer patsmaintainId);



    int updateByPrimaryKeySelective(OnlineoperationParsmaintain record);

    int updateByPrimaryKey(OnlineoperationParsmaintain record);
}
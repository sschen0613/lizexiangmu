package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationReportget;


public interface OnlineoperationReportgetMapper {


    int deleteByPrimaryKey(Integer reportId);

    int insert(OnlineoperationReportget record);

    int insertSelective(OnlineoperationReportget record);


    OnlineoperationReportget selectByPrimaryKey(Integer reportId);



    int updateByPrimaryKeySelective(OnlineoperationReportget record);

    int updateByPrimaryKey(OnlineoperationReportget record);
}
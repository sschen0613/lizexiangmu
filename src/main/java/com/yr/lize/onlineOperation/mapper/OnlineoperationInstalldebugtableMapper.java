package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationInstalldebugtable;


public interface OnlineoperationInstalldebugtableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationInstalldebugtable record);

    int insertSelective(OnlineoperationInstalldebugtable record);


    OnlineoperationInstalldebugtable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationInstalldebugtable record);

    int updateByPrimaryKey(OnlineoperationInstalldebugtable record);
}
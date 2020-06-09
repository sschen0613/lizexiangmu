package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationInstalldebug;


public interface OnlineoperationInstalldebugMapper {


    int deleteByPrimaryKey(Integer installdebugId);

    int insert(OnlineoperationInstalldebug record);

    int insertSelective(OnlineoperationInstalldebug record);


    OnlineoperationInstalldebug selectByPrimaryKey(Integer installdebugId);



    int updateByPrimaryKeySelective(OnlineoperationInstalldebug record);

    int updateByPrimaryKey(OnlineoperationInstalldebug record);
}
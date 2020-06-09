package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationTechnologysupporttable;

public interface OnlineoperationTechnologysupporttableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationTechnologysupporttable record);

    int insertSelective(OnlineoperationTechnologysupporttable record);


    OnlineoperationTechnologysupporttable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationTechnologysupporttable record);

    int updateByPrimaryKey(OnlineoperationTechnologysupporttable record);
}
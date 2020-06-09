package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationReagentgettable;


public interface OnlineoperationReagentgettableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(OnlineoperationReagentgettable record);

    int insertSelective(OnlineoperationReagentgettable record);


    OnlineoperationReagentgettable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(OnlineoperationReagentgettable record);

    int updateByPrimaryKey(OnlineoperationReagentgettable record);
}
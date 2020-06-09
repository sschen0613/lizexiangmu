package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationReagentget;


public interface OnlineoperationReagentgetMapper {


    int deleteByPrimaryKey(Integer reagentId);

    int insert(OnlineoperationReagentget record);

    int insertSelective(OnlineoperationReagentget record);


    OnlineoperationReagentget selectByPrimaryKey(Integer reagentId);



    int updateByPrimaryKeySelective(OnlineoperationReagentget record);

    int updateByPrimaryKey(OnlineoperationReagentget record);
}
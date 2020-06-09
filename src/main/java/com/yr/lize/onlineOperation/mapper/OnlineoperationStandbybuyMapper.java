package com.yr.lize.onlineOperation.mapper;

import com.yr.lize.pojo.OnlineoperationStandbybuy;



public interface OnlineoperationStandbybuyMapper {


    int deleteByPrimaryKey(Integer standbyId);

    int insert(OnlineoperationStandbybuy record);

    int insertSelective(OnlineoperationStandbybuy record);


    OnlineoperationStandbybuy selectByPrimaryKey(Integer standbyId);



    int updateByPrimaryKeySelective(OnlineoperationStandbybuy record);

    int updateByPrimaryKey(OnlineoperationStandbybuy record);
}
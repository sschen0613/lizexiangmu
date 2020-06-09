package com.yr.lize.office.mapper;

import com.yr.lize.pojo.OfficeTakeworkingdaysoff;

public interface OfficeTakeworkingdaysoffMapper {


    int deleteByPrimaryKey(Integer offworkingdaysId);

    int insert(OfficeTakeworkingdaysoff record);

    int insertSelective(OfficeTakeworkingdaysoff record);


    OfficeTakeworkingdaysoff selectByPrimaryKey(Integer offworkingdaysId);



    int updateByPrimaryKeySelective(OfficeTakeworkingdaysoff record);

    int updateByPrimaryKey(OfficeTakeworkingdaysoff record);
}
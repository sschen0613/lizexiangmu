package com.yr.lize.office.mapper;

import com.yr.lize.pojo.OfficeDepartregister;

public interface OfficeDepartregisterMapper {


    int deleteByPrimaryKey(Integer goId);

    int insert(OfficeDepartregister record);

    int insertSelective(OfficeDepartregister record);


    OfficeDepartregister selectByPrimaryKey(Integer goId);



    int updateByPrimaryKeySelective(OfficeDepartregister record);

    int updateByPrimaryKey(OfficeDepartregister record);
}
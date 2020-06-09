package com.yr.lize.office.mapper;

import com.yr.lize.pojo.OfficeWorkovertime;

public interface OfficeWorkovertimeMapper {


    int deleteByPrimaryKey(Integer workovertimeId);

    int insert(OfficeWorkovertime record);

    int insertSelective(OfficeWorkovertime record);


    OfficeWorkovertime selectByPrimaryKey(Integer workovertimeId);



    int updateByPrimaryKeySelective(OfficeWorkovertime record);

    int updateByPrimaryKey(OfficeWorkovertime record);
}
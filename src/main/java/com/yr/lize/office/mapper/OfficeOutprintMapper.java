package com.yr.lize.office.mapper;

import com.yr.lize.pojo.OfficeOutprint;

public interface OfficeOutprintMapper {


    int deleteByPrimaryKey(Integer printId);

    int insert(OfficeOutprint record);

    int insertSelective(OfficeOutprint record);


    OfficeOutprint selectByPrimaryKey(Integer printId);



    int updateByPrimaryKeySelective(OfficeOutprint record);

    int updateByPrimaryKey(OfficeOutprint record);
}
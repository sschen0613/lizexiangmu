package com.yr.lize.office.mapper;

import com.yr.lize.pojo.OfficeCarmaintain;


public interface OfficeCarmaintainMapper {


    int deleteByPrimaryKey(Integer carmaintainId);

    int insert(OfficeCarmaintain record);

    int insertSelective(OfficeCarmaintain record);


    OfficeCarmaintain selectByPrimaryKey(Integer carmaintainId);



    int updateByPrimaryKeySelective(OfficeCarmaintain record);

    int updateByPrimaryKey(OfficeCarmaintain record);
}
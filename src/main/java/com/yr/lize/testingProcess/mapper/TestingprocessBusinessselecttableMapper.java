package com.yr.lize.testingProcess.mapper;

import com.yr.lize.pojo.TestingprocessBusinessselecttable;


public interface TestingprocessBusinessselecttableMapper {
  

    int deleteByPrimaryKey(Integer id);

    int insert(TestingprocessBusinessselecttable record);

    int insertSelective(TestingprocessBusinessselecttable record);


    TestingprocessBusinessselecttable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(TestingprocessBusinessselecttable record);

    int updateByPrimaryKey(TestingprocessBusinessselecttable record);
}
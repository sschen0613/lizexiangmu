package com.yr.lize.reportMoveStamp.mapper;

import com.yr.lize.pojo.ReportmovestampReportmovestamptable;


public interface ReportmovestampReportmovestamptableMapper {


    int deleteByPrimaryKey(Integer id);

    int insert(ReportmovestampReportmovestamptable record);

    int insertSelective(ReportmovestampReportmovestamptable record);


    ReportmovestampReportmovestamptable selectByPrimaryKey(Integer id);



    int updateByPrimaryKeySelective(ReportmovestampReportmovestamptable record);

    int updateByPrimaryKey(ReportmovestampReportmovestamptable record);
}
package com.yr.lize.reportMoveStamp.mapper;

import com.yr.lize.pojo.ReportmovestampReportmovestamp;


public interface ReportmovestampReportmovestampMapper {


    int deleteByPrimaryKey(Integer billsId);

    int insert(ReportmovestampReportmovestamp record);

    int insertSelective(ReportmovestampReportmovestamp record);


    ReportmovestampReportmovestamp selectByPrimaryKey(Integer billsId);



    int updateByPrimaryKeySelective(ReportmovestampReportmovestamp record);

    int updateByPrimaryKey(ReportmovestampReportmovestamp record);
}
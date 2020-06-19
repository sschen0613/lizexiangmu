package com.yr.lize.scheduler.controller;

import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.mapper.CurrencyApplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
@EnableScheduling
public class UpdateRefused {

    @Autowired
    CurrencyApplyMapper currencyApplyMapper;

    @Scheduled(cron = "0 0 8 * * ?")    //每天早晨8点执行
    //@Scheduled(cron="0/5 * *  * * ? ")   //每5秒执行一次
    public void test(){
        System.out.println("--------------------------------定时任务开始-----------------");
        currencyApplyMapper.updateRefused();//将拒绝的流程状态更改为拒绝
        System.out.println("--------------------------------定时任务结束-----------------");
    }
}

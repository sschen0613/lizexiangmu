package com.yr.lize.scheduler.controller;

import com.taobao.api.ApiException;
import com.yr.lize.currencyapply.mapper.CurrencyApplyMapper;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@EnableScheduling
public class BusinessReportRemind {

    @Autowired
    CurrencyApplyMapper currencyApplyMapper;

    @Autowired
    IDingDingUtilsService dingDingUtilsService;

    @Scheduled(cron = "0 0 8 * * ?")    //每天早晨8点执行
    public void test() throws ApiException {
        //查询天人报备所有数据，1.审批完成 2.合同未签订 3距离第一次审批通知日期7天
        List<HashMap<String,Object>> list69 = currencyApplyMapper.getCurrencyApply69ForRemind();

        for(HashMap<String,Object> map:list69){

            //要提醒的人
            String userId = String.valueOf(map.get("currency_string17"));

            //流程编号
            String currency_number = String.valueOf(map.get("currency_number"));
            //单位名称
            String currency_string3 = String.valueOf(map.get("currency_string3"));
            //项目名称
            String currency_string4 = String.valueOf(map.get("currency_string4"));

            //给检测科长发提醒
            String content = "天人报备流程，编号："+currency_number+"；单位名称："+currency_string3+"；项目名称："+currency_string4+"还未签订合同，请追踪并反馈。";
            this.remind(userId,content);
        }
        System.out.println("--------------------------------定时任务测试-----------------");
    }
    /**
     *
     * @param userList  钉钉id
     * @param content 提醒内容
     * @throws ApiException
     */
    public void remind(String userList,String content) throws ApiException {
        //发送工作消息
        dingDingUtilsService.sendMessageAgain69(userList, content);
    }
}

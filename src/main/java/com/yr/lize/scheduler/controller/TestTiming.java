package com.yr.lize.scheduler.controller;

import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.xinze.mapper.DetectionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Lic on 2019/7/27.
 */
@Service
@EnableScheduling
public class TestTiming{

    @Autowired
    DetectionMapper detectionMapper;

    @Autowired
    IDingDingUtilsService dingDingUtilsService;

    @Scheduled(cron = "0 0 0/6 * * ?")
    public void test() throws ApiException {

        Page page2 = new Page();
        CurrencyApply currencyApply = new CurrencyApply();
        currencyApply.setCurrency_type(51);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        //查询通过审批的信泽业务下发
        List<HashMap<String, Object>> taskList = detectionMapper.selectOneUpApply(page2, currencyApply);

        for (HashMap<String, Object> hashMap : taskList){
            //判断业务科任务是否通知
            if ((Integer)hashMap.get("currency_int") == -1){
                hashMap.put("notice","已通知");
                //拿取业务下发主键id，查询采样通知
                String taskId = hashMap.get("currency_id")+"";
                CurrencyApply taskApply = detectionMapper.selectCurrencyApplyByString17(taskId,43);

                //采样要求完成时间
                Date currency_date2 = taskApply.getCurrency_date2();

                hashMap.put("registerTime",taskApply.getCurrency_date());
                //判断采样登记状态
                if (taskApply.getCurrency_int() == -1){
                    hashMap.put("register","已完成");
                    int a = 0;
                    //如果样品来源是现场采样，则查询流转下去采用登记
                    if (taskApply.getCurrency_int2()==1) {
                        //判断交接是否完成,查询流转下去采用登记
                        List<HashMap<String, Object>> registerList = detectionMapper.selectTaskRegisterByString17(taskApply.getCurrency_id(), 44);

                        //采样科完成超时判断
                       /* Date currency_date = (Date) registerList.get(registerList.size() - 1).get("currency_date");
                        if (currency_date.compareTo(currency_date2) == 1){
                            hashMap.put("register","超时完成");
                        }*/

                        for (HashMap<String, Object> hashMap1 : registerList) {
                            //判断已交接的个数
                            if ((Integer) hashMap1.get("currency_int") == -1) {
                                a++;
                            }
                        }

                        //已交接的数量等于流转下去的登记，则采样交接完成
                        if (a != registerList.size()) {
                            hashMap.put("handoverTime",registerList.get(registerList.size()-1).get("currency_date"));
                            hashMap.put("handover", "进行中");
                            hashMap.put("testing", "未开始");
                            hashMap.put("report","未开始");
                            hashMap.put("finance","未开始");
                            continue;
                        }
                        /*hashMap.put("handover", "已完成");
                        hashMap.put("handoverTime",registerList.get(registerList.size()-1).get("currency_date"));*/

                        //检测科要求完成时间
                        Date test = null;
                        //质控科报告要求完成时间
                        Date report = null;

                        //判断检测科状态
                        Boolean falg = true;
                        for (HashMap<String, Object> hashMap1 : registerList){
                            List<HashMap<String, Object>> handoverList = detectionMapper.selectTaskRegisterByString17(Integer.parseInt((String) hashMap1.get("currency_string17")), 45);
                            for (HashMap<String, Object> hashMap2 : handoverList){
                                List<HashMap<String, Object>> testList = detectionMapper.selectCurrencyApplyDetailsCode((Integer) hashMap2.get("currency_id"));
                                for(HashMap<String, Object> hashMap3 : testList){
                                    if (hashMap3.containsKey("code_int")) {
                                        if ((Integer) hashMap3.get("code_int") != -1) {
                                            falg = false;
                                        }
                                    }else {
                                        falg = false;
                                        break;
                                    }
                                }
                                hashMap.put("time",testList.get(testList.size()-1).get("code_time"));
                            }
                            //hashMap.put("testTime",handoverList.get(handoverList.size()-1).get("currency_date"));

                            test = (Date) handoverList.get(handoverList.size() - 1).get("currency_date2");
                            report = (Date) handoverList.get(handoverList.size() - 1).get("currency_date3");
                        }
                        if (falg){
                            hashMap.put("testing","已完成");

                            //检测科超时完成判断
                            /*Date time1 = (Date) hashMap.get("time");
                            if (time1.compareTo(test) == 1){
                                hashMap.put("testing","超时完成");
                            }*/

                            hashMap.put("reportTime",hashMap.get("time"));
                            if (taskApply.getCurrency_int6() != null){
                                /*hashMap.put("report","已完成");

                                //质控科报告超时完成判断
                                if (taskApply.getCurrency_date4().compareTo(report) == 1){
                                    hashMap.put("report","超时完成");
                                }

                                hashMap.put("financeTime",taskApply.getCurrency_date4());
                                if (taskApply.getCurrency_int7() != null){
                                    hashMap.put("finance","已完成");
                                }else {
                                    hashMap.put("finance","进行中");
                                }
                            }else {*/
                               /* hashMap.put("report","进行中");
                                hashMap.put("finance","未开始");*/

                                //判断质控科报告是否超时未完成
                                Date time = report;
                                Date date = new Date();
                                if (date.compareTo(time) == 1){
                                    //hashMap.put("report","超时进行中");
                                    //给质控科长发提醒
                                    String content = "任务编号为"+taskApply.getCurrency_number()+","+taskApply.getCurrency_string2()
                                            +"的报告已超时(要求完成时间:"+sdf.format(time)+")，请尽快完成！！！";
                                    this.remind("449576508",content);
                                    //dingDingUtilsService.sendrRemind("271968415120919703", content);
                                }

                            }

                        }else {
                           /* hashMap.put("testing","进行中");
                            hashMap.put("report","未开始");
                            hashMap.put("finance","未开始");*/

                            //判断检测科是否超时未完成
                            Date time = test;
                            Date date = new Date();
                            if (date.compareTo(time) == 1){
                                //hashMap.put("testing","超时进行中");
                                //给检测科长发提醒
                                String content = "任务编号为"+taskApply.getCurrency_number()+","+taskApply.getCurrency_string2()
                                        +"的检测任务已超时(要求完成时间:"+sdf.format(time)+")，请尽快完成！！！";
                                this.remind("449618522",content);
                                //dingDingUtilsService.sendrRemind("271968415120919703", content);
                            }
                        }

                    }else {
                        /*hashMap.put("handover", "已完成");
                        hashMap.put("handoverTime",taskApply.getCurrency_date());*/
                        //查询采样交接信息
                        CurrencyApply handoverApply = detectionMapper.selectCurrencyApplyByString17(taskId, 45);
                        hashMap.put("testTime",handoverApply.getCurrency_date());
                        List<HashMap<String, Object>> testList = detectionMapper.selectCurrencyApplyDetailsCode(handoverApply.getCurrency_id());

                        //检测科要求完成时间
                        Date test = handoverApply.getCurrency_date2();
                        //质控科报告要求完成时间
                        Date report = handoverApply.getCurrency_date3();

                        //判断检测科状态
                        Boolean falg = true;
                        for(HashMap<String, Object> hashMap1 : testList){
                            if (hashMap1.containsKey("code_int")) {
                                if ((Integer) hashMap1.get("code_int") != -1) {
                                    falg = false;
                                }
                            }else {
                                falg = false;
                                break;
                            }
                        }
                        if (falg){
                            hashMap.put("testing","已完成");

                            //检测科超时完成判断
                            Date time1 = (Date) testList.get(testList.size()-1).get("code_time");
                            if (time1.compareTo(test) == 1){
                                hashMap.put("testing","超时完成");
                            }

                            hashMap.put("reportTime",testList.get(testList.size()-1).get("code_time"));
                            if (taskApply.getCurrency_int6() == null){
                                /*hashMap.put("report","已完成");

                                //质控科报告超时完成判断
                                if (taskApply.getCurrency_date4().compareTo(report) == 1){
                                    hashMap.put("report","超时完成");
                                }

                                hashMap.put("financeTime",taskApply.getCurrency_date4());
                                if (taskApply.getCurrency_int7() != null){
                                    hashMap.put("finance","已完成");
                                }else {
                                    hashMap.put("finance","进行中");
                                }
                            }else {*/
                               /* hashMap.put("report","进行中");
                                hashMap.put("finance","未开始");*/

                                //判断质控科报告是否超时未完成
                                Date date = new Date();
                                if (date.compareTo(report) == 1){
                                    //hashMap.put("report","超时进行中");
                                    //给质控科长发提醒
                                    String content = "任务编号为"+taskApply.getCurrency_number()+","+taskApply.getCurrency_string2()
                                            +"的报告已超时(要求完成时间:"+sdf.format(report)+")，请尽快完成！！！";
                                    this.remind("449576508",content);
                                    //dingDingUtilsService.sendrRemind("271968415120919703", content);
                                }
                            }
                        }else {
                            /*hashMap.put("testing","进行中");
                            hashMap.put("report","未开始");
                            hashMap.put("finance","未开始");*/

                            //判断检测科是否超时未完成
                            Date date = new Date();
                            if (date.compareTo(test) == 1){
                                //hashMap.put("testing","超时进行中");
                                //给检测科长发提醒
                                String content = "任务编号为"+taskApply.getCurrency_number()+","+taskApply.getCurrency_string2()
                                        +"的检测任务已超时(要求完成时间:"+sdf.format(test)+")，请尽快完成！！！";
                                this.remind("449618522",content);
                                //dingDingUtilsService.sendrRemind("271968415120919703", content);
                            }
                        }
                    }

                }else {
                    if (taskApply.getCurrency_int2()==1) {

                        String content = "任务编号为"+taskApply.getCurrency_number()+","+taskApply.getCurrency_string2()
                                +"的采样任务已超时(要求完成时间:"+sdf.format(currency_date2)+")，请尽快完成！！！";

                        //判断现场科是否超时未完成
                        Date date = new Date();
                        if (date.compareTo(currency_date2) == 1) {
                            //给现场科长发提醒
                            this.remind("450152153",content);
                            //dingDingUtilsService.sendrRemind("271968415120919703", content);
                        }
                    }/*else {
                        hashMap.put("handoverTime",taskApply.getCurrency_date());
                        hashMap.put("register", "已完成");
                        hashMap.put("handover", "进行中");
                        hashMap.put("testing", "未开始");
                        hashMap.put("report", "未开始");
                        hashMap.put("finance", "未开始");
                    }*/
                }

            }/*else {
                hashMap.put("notice","未通知");
                hashMap.put("register","未开始");
                hashMap.put("handover","未开始");
                hashMap.put("testing","未开始");
                hashMap.put("report","未开始");
                hashMap.put("finance","未开始");
            }*/
        }
    }

    /**
     *
     * @param dingId  钉钉id
     * @param content 提醒内容
     * @throws ApiException
     */
    public void remind(String dingId,String content) throws ApiException {
        ResponseResult result = dingDingUtilsService.selectDingRoleStaff(dingId);
        if (!"".equals(result.getMsg())) {
            String[]  strs2=result.getMsg().split(",");
            for(int i=0,len=strs2.length;i<len;i++){
                //发送工作消息
                dingDingUtilsService.sendrRemind(strs2[i], content);
            }
        }
    }
}

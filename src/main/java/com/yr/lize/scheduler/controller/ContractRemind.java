package com.yr.lize.scheduler.controller;

import com.taobao.api.ApiException;
import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemStaff;
import com.yr.lize.system.mapper.SystemStaffMapper;
import com.yr.lize.system.mapper.U8DataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@EnableScheduling
public class ContractRemind {

    @Autowired
    U8DataMapper u8DataMapper;

    @Autowired
    SystemStaffMapper systemStaffMapper;

    @Autowired
    IDingDingUtilsService dingDingUtilsService;

    @Scheduled(cron = "0 0 8 5,15,25 * ?") // 每个月5号，15号，25号，八点执行0
    //@Scheduled(cron = "0 */8 * * * ?")
    public void test() throws ApiException {
        //查询所有运营合同，运维期间还有一个月就结束了的
        List<HashMap<String,Object>> contractList = u8DataMapper.selectContractForTask("02");

        for(HashMap<String,Object> map:contractList){
            //1.获取业务员在system_staff表中的staff_idture，根据合同的strPersonID
            String staff_idture = String.valueOf(map.get("strPersonID")).replaceAll("^(0+)", "");
            SystemStaff systemStaff = systemStaffMapper.selectStaffByIdTure(staff_idture);
            //2.//获取合同的 strContractName strContractID strContractStartDate strContractEndDate
            String strContractName = String.valueOf(map.get("strContractName"));//合同名称
            String strContractStartDate = String.valueOf(map.get("strContractStartDate"));//运营时间
            String strContractEndDate = String.valueOf(map.get("strContractEndDate"));//运营时间

            //给检测科长发提醒
            String content = "合同"+strContractName+"的运营时间为"+strContractStartDate+"到"+strContractEndDate+"即将到期。";
            this.remind(systemStaff.getDingding_staffid(),content);
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
        dingDingUtilsService.sendrRemind(userList, content);
    }
}

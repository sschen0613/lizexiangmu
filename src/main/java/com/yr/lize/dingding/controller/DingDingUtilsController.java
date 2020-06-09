package com.yr.lize.dingding.controller;

import com.yr.lize.dingding.service.IDingDingUtilsService;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.pojo.SystemStaff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LENOVO on 2019/7/11.
 */
@Controller
public class DingDingUtilsController {

    @Autowired
    IDingDingUtilsService iDingDingUtilsService;

    @RequestMapping("/Ding/dingdingUserId.action")
    @ResponseBody
    public ResponseResult dingdingUserId(String code){
        ResponseResult result = new ResponseResult();
        SystemStaff staff =  iDingDingUtilsService.getUserId(code);
        result.setData(staff);
        return result;
    }
}

package com.yr.lize.storage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Lic on 2019/5/24.
 */
@Controller
public class StorageRepairWarehousingController {
    //跳转条码录入页面
    @RequestMapping("storage/repairWarehousing.action")
    public String setupAllocationApproverView1() {
        return "WEB-INF/views/storage/repairWarehousing";
    }

    //跳转条码录入申请表页面
    @RequestMapping("storage/repairWarehousingForm.action")
    public String setupAllocationApproverView2() {
        return "WEB-INF/views/storage/repairWarehousingForm";
    }

    //跳转条码录入审批页面
    @RequestMapping("storage/repairWarehousingApproval.action")
    public String setupAllocationApproverView3() {
        return "WEB-INF/views/storage/repairWarehousingApproval";
    }

}

package com.yr.lize.xinze.service;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Lic on 2019/5/10.
 */
public interface DetectionService {
    Integer launchpurchase(HttpServletRequest request,CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss, SystemStaff staff, List<ApproverRole> roles,MultipartFile[] files)throws Exception;

    Integer launchpurchaseTemporary(CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss, SystemStaff staff)throws Exception;

    List<HashMap<String,Object>> selectOneUpApply(Page page2, CurrencyApply currencyApply);

    Integer getApplyCurrencyRows(CurrencyApply currencyApply);

    CurrencyApply selectCurrencyApply(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectCurrencyDetailss(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectLatest(Page page,CurrencyApply currencyApply);

    void insertLingQuMsg(String detailsId,CurrencyDetails details);

    List<HashMap<String,Object>> selectOneDetails(sampleCode sampleCode);

    List<HashMap<String,Object>> selectProcessByDetailsId(Page page2, Integer details_id);

    List<HashMap<String,Object>> selectCaiyangOrShangJiApplicantCurrency(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectReadeyLingQuDetails(Page page2, CurrencyDetails details);

    List<HashMap<String,Object>> selectReadeyCurrency(Page page2, CurrencyApply currencyApply);

    Integer selectErrorJianCeCount(Integer details_id);

    Integer updateJianceBiaoshi(Integer currency_details_id);

    List<HashMap<String,Object>> selectCurrencyDetailss1(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectLatest1(Page page2,CurrencyApply currencyApply,CurrencyDetails currencyDetails);

    Integer updateSampleCode(CurrencyDetails details);

    String selectStandart(CurrencyDetails details);

    List<HashMap<String,Object>> selectFinanceAccount(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectBusinessPerformance(Page page2, CurrencyApply currencyApply);
    List<HashMap<String, Object>> selectStaffName();

    List<HashMap<String,Object>> selectJianCeJiXiaoManarge(Page page2,CurrencyApply currencyApply);

    Integer getApplyCurrencyRows1(CurrencyApply currencyApply,CurrencyDetails currencyDetails);

    List<HashMap<String,Object>> selectJianCeJiXiaoManarge1(Page page2, CurrencyApply currencyApply);

    CurrencyApply selectReprotOne(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectReportOneDetails(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectSceneSectionPerformance(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectBusinessTracking(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectAllTesting(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectTestResult(CurrencyApply currencyApply);

    Integer updateGaiZhang(CurrencyApply currencyApply);

    Integer taskRecall(CurrencyDetails details);

    List<HashMap<String,Object>> selectXCStaff(String department_id);

    List<HashMap<String,Object>> selectAllNotice(CurrencyApply currencyApply);

    Integer confirmTest45(CurrencyApply currencyApply);//质控科科长确认，检测结束，报告开始testingReportAdd

    Integer testingReportAdd(CurrencyDetails currencyDetails);

    Integer complieReport(CurrencyApply currencyApply);

    HashMap<String,String> selectStaff(HashMap<String,Object> map);

    Integer uploadFiles(HttpServletRequest request,MultipartFile[] files, Integer currency_id);

    Integer endTest(CurrencyApply currencyApply);

    Integer getSample(CurrencyApply currencyApply);

    Integer transSample(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectCurrencyDetailsReport(Page page2,CurrencyDetails currencyDetails);

    Integer confirmReport(CurrencyDetails currencyDetails);
}

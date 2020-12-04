package com.yr.lize.xinze.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.CurrencyDetails;
import com.yr.lize.pojo.TestProcess;
import com.yr.lize.pojo.sampleCode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Lic on 2019/5/10.
 */
@Repository
@DataSource(value="1")
public interface DetectionMapper {
    Integer addCurrencyApply(CurrencyApply currencyApply);

    void updateString17(CurrencyApply currencyApply);

    void addCurrencyApplyDetais(CurrencyDetails currencyDetailss);

    //查询上一级申请信息
    List<HashMap<String, Object>> selectOneUpApply(Page page2, CurrencyApply currencyApply);

    //查询上一级申请信息
    List<HashMap<String, Object>> selectOneUpApplyForManager(Page page2, CurrencyApply currencyApply);

    //查询上一级申请信息
    List<HashMap<String, Object>> selectOneUpApplyForTest(Page page2, CurrencyApply currencyApply);

    //查询记录数
    Integer getApplyCurrencyRows(CurrencyApply currencyApply);

    //查询记录数
    Integer getApplyCurrencyRowsForTest(CurrencyApply currencyApply);

    //查询记录数
    Integer getApplyCurrencyRowsForManager(CurrencyApply currencyApply);

    //根据Id查询上一级表单信息
    CurrencyApply selectCurrencyApplyById(Integer currency_id);

    //根据ID查询上一级任务书详情
    List<HashMap<String,Object>> selectCurrencyDetails(CurrencyApply currencyApply);

    Integer updateMoney3(CurrencyApply currencyApply, Integer details_int2, BigDecimal details_money3);

    List<HashMap<String,Object>> selectLatest(Page page,CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectPerformance(CurrencyApply currencyApply);

    //添加项目分配
    Integer addTestProcess(List<TestProcess> list,CurrencyDetails details);

    //根据任务明细ID查询对应所有项目
    List<HashMap<String,Object>> selectProcessByDetailsId(Page page,Integer details_id);

    //添加领取信息
    Integer updateLingQuDetails(CurrencyDetails details);

    List<HashMap<String,Object>> selectOneDetails(sampleCode sampleCode);

    List<HashMap<String,Object>> selectCaiyangOrShangJiApplicantCurrency(Page page2, CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectReadeyLingQuDetails(Page page2, CurrencyDetails details);

    List<HashMap<String,Object>> selectReadeyCurrency(Page page2, CurrencyApply currencyApply);

    Integer updateShangjiMsg(Integer currency_details_id);

    Integer selectErrorJianCeCount(@Param("details_string12") String details_string12);

    void addSampleCode(sampleCode code, CurrencyDetails details);

    void addStandartProcess(TestProcess process, CurrencyDetails details);

    void addCurrencyApplyDetais1(CurrencyDetails details);

    List<HashMap<String,Object>> selectCurrencyDetailss1(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectLatest1(Page page2,CurrencyApply currencyApply,CurrencyDetails currencyDetails);

    Integer updateSampleType(CurrencyApply currencyApply, Integer details_int2, String details_string7, String details_string13);

    Integer updateMoney(CurrencyApply currencyApply, Integer details_int2, BigDecimal i);

    Integer updateSampleCode(CurrencyDetails details);

    String selectStandart(CurrencyDetails details);

    String selectResult(Integer currency_details_id);

    List<HashMap<String,Object>> selectJianCeJiXiaoManarge(Page page2,CurrencyApply currencyApply);

    void updateSampleCodeInt2(Integer currency_details_id);

    List<HashMap<String, Object>> selectStaffName();

    Integer getApplyCurrencyRows1(CurrencyApply currencyApply,CurrencyDetails currencyDetails);

    List<HashMap<String,Object>> selectJianCeJiXiaoManarge1(Page page2, CurrencyApply currencyApply);
    CurrencyApply selectselectReprotOneMaxDate(int i, Integer currency_id);

    CurrencyApply selectselectReprotOneMinDate(int i, Integer currency_id);


    Integer getApplyCurrencyRows1(CurrencyApply currencyApply);

    String selectProjectName(Integer currency_id);

    //根据上一级主键id和当前type查询当前信息
    CurrencyApply selectCurrencyApplyByString17(String taskId, int i);

    List<HashMap<String,Object>> selectTaskRegisterByString17(Integer currency_id, int i);

    List<HashMap<String,Object>> selectCurrencyApplyDetailsCode(Integer currency_id);

    List<HashMap<String,Object>> selectTestResult(Integer currency_id,int currency_type);

    Integer updateGaiZhang(Integer currency_id);

    Integer recallLingQuDetails(CurrencyDetails details);

    Integer recallSampleCode(CurrencyDetails details);

    List<HashMap<String,Object>> selectXCStaff(@Param("department_id") String department_id);

    String selectStaffNameById(Integer staff_id);

    HashMap<String,String> selectStaff(HashMap<String,Object> map);

    List<HashMap<String,Object>> selectAllNotice(CurrencyApply currencyApply);

    Integer complieReport(CurrencyApply currencyApply);

    HashMap<String,Object> selectCurrencyApplyByString18(String currency_string18);

    CurrencyApply selectCurrencyApplyByString17ForReport(String taskId, int i);

    Integer endTest(CurrencyApply currencyApply);

    //根据ID查询上一级任务书详情
    List<HashMap<String,Object>> selectCurrencyDetails49(Integer currency_id);

    //查询还未完成的明细信息
    Integer selectCurrencyDetailsCount45 (Integer currency_id);

    Integer testingReportAdd(CurrencyDetails currencyDetails);

    List<HashMap<String,Object>> selectCurrencyDetailsReport(CurrencyDetails currencyDetails);
}

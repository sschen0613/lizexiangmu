package com.yr.lize.currencyapply.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.*;

import java.util.HashMap;
import java.util.List;

@DataSource(value="1")
public interface CurrencyApplyMapper {

	//添加当前通用审批的详情
	void addCurrencyApplyDetais(List<CurrencyDetails> currencyDetailss, Integer currency_id);

	//添加调拨审批请求
	Integer addCurrencyApply(CurrencyApply currencyApply);

	//根据id查询当前审批的信息
	CurrencyApply selectCurrencyApplyById(Integer currency_id);

	//审批 
	Integer refuseRequest(CurrencyApply currencyApply);

	//修改当前审批层级
	void updateApplyCount(Integer currency_id);

	//修改审批请求对应的审批人数
	void updateApplyState(CurrencyApply currencyApply);

	//发起人查询自己发起的审批流程
	List<HashMap<String, Object>> selectApplyAllocationCurrency(Page page2, CurrencyApply currencyApply);

	//发起人查询自己发起的审批流程数量
	Integer getApplyAllocationCurrencyRows(CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请条数
	Integer getCurrencyApproverRows(CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请条数
	Integer getCurrencyApproverRowsTr(CurrencyApply currencyApply);

	//销售请购审批人查询自己需要审批的申请条数
	Integer getCurrencyApproverRows1(CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApprover(Page page2, CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApproverTr(Page page2, CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApprover2(CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApprover1(Page page2, CurrencyApply currencyApply);

	//添加审批意见
	void addApprovalOpinion(ApprovalOpinion approvalOpinions);

	//查询相关审批意见
	List<HashMap<String, Object>> selectApprovalOpinion(ApprovalOpinion approvalOpinions);

	//查看申请详情
	List<HashMap<String, Object>> selectCurrencyDetails(CurrencyApply currencyApply);

	//查看收款计划
	List<HashMap<String, Object>> selectPaymentPlan(CurrencyApply currencyApply);

	//更改商品明细
	Integer updateCurrencyDetailsByCurrencyId(CurrencyDetails currencyDetails);

	//添加总经理已审批唯一标识
	void updateApprovalmark(CurrencyApply currencyApply3);

	//撤回主表信息
	Integer deleteCurrencyApply(CurrencyApply currencyApply);

	//撤回子表信息
	Integer deleteCurrencyDetails(CurrencyApply currencyApply);

	//修改申请表单信息
	Integer updateCurrencyApplyByCurrencyId(CurrencyApply currencyApply);

	Integer updateSignById(Integer currency_id);

	Integer updateFlagById(Integer currency_id);

	Integer update43After44(CurrencyApply currencyApply);
	Integer updateDetails43After44(CurrencyDetails details);

	Integer updateFlagById66(Integer currency_id);

	CurrencyApply selectIsExistApply(CurrencyApply currencyApply);

	List<HashMap<String,Object>> selectCurrency(Page page2, CurrencyApply currencyApply);


	//查询货品流转信息
	List<HashMap<String,Object>> selectFlowMessage(Page page2, Flow flow);

	//查询货品流转数量
	Integer getFlowRows(Flow flow);

	//查询货品流转信息
	List<HashMap<String,Object>> selectFlowMessageDetail(Page page2,String barcode);

	//查询货品流转数量
	Integer getFlowDetailRows(String barcode);

	List<HashMap<String,Object>> selectApplyAllocationCurrency1(CurrencyApply currencyApply);

	//插入货品流转信息日志
	Integer addBarcode(CurrencyApply currencyApply);

    //插入货品流转信息日志
    Integer insertFlowMessage(Flow flow);

	void addPaymentPlans(List<PaymentPlan> paymentPlans, Integer currency_id);

	void addProgramDetails(List<ProgramDetails> programDetails, Integer currency_id);

	List<HashMap<String,Object>> selectProgramDetails(CurrencyApply currencyApply);

	Integer selectStaffU8Code(Integer currency_applicant);

	List<HashMap<String,Object>> selectBilling(String strContractID, Integer currency_type);

	CurrencyDetails selectCurrencyDetailsByID(Integer currency_details_id);

	Integer uploadFiles(ContractPicture contractPicture);

	List<HashMap<String,Object>> selectContractPicture(CurrencyApply currencyApply);

	Integer recallCurrencyApply(CurrencyApply currencyApply);

	Integer signCurrencyApply(CurrencyApply currencyApply);

	List<HashMap<String, Object>> selectAllCurrency(Page page2, CurrencyApply currencyApply);
	Integer getAllCurrencyRows(CurrencyApply currencyApply);

	Integer findCurrencyDetailsByMap(String barcode);

	Integer getProductCount(String product_id);

	void updateRefused();

	List<HashMap<String,Object>> getCurrencyApply69ForRemind();

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyList(Page page2, CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请条数
	Integer getCurrencyListRows(CurrencyApply currencyApply);

	//用于导出
	List<HashMap<String, Object>> selectAllCurrencyList(CurrencyApply currencyApply);

	List<HashMap<String,Object>> selectSite(String companyCode);

	List<HashMap<String,Object>> getDevilLiquor(CurrencyApply currencyApply);

	void updateDevilLiquor(CurrencyDetails currencyDetails);

	List<HashMap<String,Object>> getDevilLiquorTotal(CurrencyApply currencyApply);

	List<HashMap<String,Object>> getDevilLiquorDetail(CurrencyApply currencyApply);
}

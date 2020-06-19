package com.yr.lize.currencyapply.service;

import com.st.rbac.util.Page;
import com.taobao.api.ApiException;
import com.yr.lize.pojo.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

public interface ICurrencyApplyService {

	//发起通用审批
	Integer launchpurchase(HttpServletRequest request,CurrencyApply currencyApply, SystemStaff staff, List<ApproverRole> roles,
			List<CurrencyDetails> currencyDetailss,List<PaymentPlan> paymentPlans,List<ProgramDetails> programDetails,MultipartFile[] files) throws ApiException;

	//审批操作
	Integer approvalCurrencyApply(CurrencyApply currencyApply, String approvalOpinion,SystemStaff staff) throws ApiException;

	//车辆维修申请审批操作
//    Integer carMaintainRequestApproval(CurrencyApply currencyApply, String approvalOpinion)throws Exception;

	//发起人查询自己发起的审批流程
	List<HashMap<String, Object>> selectApplyAllocationCurrency(Page page2, CurrencyApply currencyApply);
	
	//发起人查询自己发起的审批流程数量
	Integer getApplyAllocationCurrencyRows(CurrencyApply currencyApply);

	//审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApprover(Page page2, CurrencyApply currencyApply);

    //天人审批人查询自己需要审批的申请
    List<HashMap<String, Object>> selectCurrencyApproverTr(Page page2, CurrencyApply currencyApply);

	//销售请购审批人查询自己需要审批的申请
	List<HashMap<String, Object>> selectCurrencyApprover1(Page page2, CurrencyApply currencyApply);
	
	//审批人查询自己需要审批的申请记录条数
	Integer getCurrencyApproverRows(CurrencyApply currencyApply);

    //审批人查询自己需要审批的申请记录条数
    Integer getCurrencyApproverRowsTr(CurrencyApply currencyApply);

	//销售请购审批人查询自己需要审批的申请记录条数
	Integer getCurrencyApproverRows1(CurrencyApply currencyApply);

	//查看申请详情
	List<HashMap<String, Object>> selectCurrencyDetails(CurrencyApply currencyApply);
	
	//查询审批意见
	List<HashMap<String, Object>> selectApprovalOpinion(ApprovalOpinion approvalOpinions);

	//更改商品明细
	Integer updateCurrencyDetailsByCurrencyId(CurrencyDetails currencyDetails);

	//查询申请表单详情
    CurrencyApply selectCurrencyApply(CurrencyApply currencyApply);
	//撤回主表信息
    Integer deleteCurrencyApply(CurrencyApply currencyApply);

    //撤回子表信息
	Integer deleteCurrencyDetails(CurrencyApply currencyApply);

	//修改申请信息
	Integer updateCurrency(CurrencyApply currencyApply, List<CurrencyDetails> currencyDetailss);

    CurrencyApply selectIsExistApply(CurrencyApply currencyApply);

    //查询审批详情
    String getCurrencyApproval(CurrencyApply currencyApply);

    //查询申请类别
	ApproverManage findApproverManageByTyep(ApproverManage approverManage);

    List<HashMap<String,Object>> selectCurrency(Page page2, CurrencyApply currencyApply);

    //查询货品流转信息
    List<HashMap<String,Object>> selectFlowMessage(Page page2,Flow flow);

    //查询货品流转数量
	Integer getFlowRows(Flow flow);

	//查询货品流转信息
	List<HashMap<String,Object>> selectFlowMessageDetail(Page page2,String barcode);

	//查询货品流转数量
	Integer getFlowDetailRows(String barcode);

	//通用打印
    List<HashMap<String,Object>> selectApplyAllocationCurrency1(CurrencyApply currencyApply);

	//插入货品流转信息日志
	Integer insertFlowMessage(Flow flow);

	List<HashMap<String,Object>> selectProgramDetails(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectPaymentPlan(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectProgramDetailsByContract(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectContractStatement(Page page2, CurrencyApply currencyApply);

	List<HashMap<String,Object>> selectXZContractStatement(Page page2, CurrencyApply currencyApply);

    Integer getContractStatementRows(CurrencyApply currencyApply);
	Integer getXZContractStatementRows(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectContractItem(String strContractID);

	List<HashMap<String,Object>> selectPayment(String strContractID);

    List<HashMap<String,Object>> selectReceive(String strContractID);

    List<HashMap<String,Object>> selectContractMemo(String strContractID);

	SystemStaff selectStaff(Integer currency_applicant);

	CurrencyDetails selectCurrencyDetailsByID(Integer currency_details_id);

	List<HashMap<String,Object>> selectCurrencyApprover2(CurrencyApply currencyApply);

	Integer uploadFiles(HttpServletRequest request,MultipartFile[] files, Integer currency_id);

    List<HashMap<String,Object>> selectContractPicture(CurrencyApply currencyApply);

    Integer recallCurrencyApply(CurrencyApply currencyApply);

    Integer signCurrencyApply(CurrencyApply currencyApply);

    List<HashMap<String,Object>> selectAllCurrency(Page page2, CurrencyApply currencyApply);

	Integer getAllCurrencyRows(CurrencyApply currencyApply);

	Integer findCurrencyDetailsByMap(String barcode);


	Integer getProductCount(String product_id);

	void addBarcode(SystemStaff staff,CurrencyApply currencyApply,String currencyDetails);

	//更新天人报备流程（通知人钉钉id和通知人名称）
	void sendMessage69(CurrencyApply currencyApply) throws ApiException ;

}

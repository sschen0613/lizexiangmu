package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.CurrencyApply;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@DataSource(value="3")
public interface XZU8DataMapper {
		//获取U8所有地区
		List<HashMap<String, Object>> getRegion();
		//根据地区查询客户
		List<HashMap<String, Object>> selectUser(Integer cDCCode);
		//查询U8当前的客户合同
		List<HashMap<String, Object>> selectContract(Integer cCusCode, String strContractType);
		//获取U8当前的客户合同中收款总金额
		List<HashMap<String, Object>> selectReceivables(String strContractID);
		//根据合同编码查询所有合同带出内容
		List<HashMap<String, Object>> selectContractAll(String strContractID);
		//根据存货编码查询所有合同带出最近日期价格
		List<HashMap<String, Object>> selectCost(String cInvCode);
		//
		List<HashMap<String, Object>> selectshebei(String strContractID, Integer type);
		List<HashMap<String, Object>> selectshebei1(String strContractID, Integer type);
		//动态获取商品名称
		List<HashMap<String, Object>> selectInvName(@Param("cInvName") String cInvName, String type);

		//动态获取商品数量
		HashMap<String, Object> selectInvQuantity(@Param("cInvName") String cInvName);

		List<HashMap<String, Object>> selectInvName1(@Param("cInvName") String cInvName);
		//获取U8当前的客户合同中的商品信息
		List<HashMap<String, Object>> selectTarget(String cInvName);
		//获取仓库信息
		List<HashMap<String, Object>> selectWH(String cWhCode);
		//获取货位信息
		List<HashMap<String, Object>> selectPosition(String cInvCode, String cWhCode);

		//获取其他出库单最大单号
		Integer selectNumber();
		void addQinggoudan();
		void addQinggoudan2();
		//修改库存冻结量
		void updateCurrentStockfStopQuantity(String cWhCode, String cInvCode, BigDecimal fStopQuantity, Integer type);
		//生成其他出库单子表
		void addOtheroutlets(HashMap<String, Object> hashMap);
		//生成其他出库单主表
		void addOtheR(CurrencyApply currencyApply3);

		//生成请购单子表
		void addBuys(HashMap<String, Object> hashMap);
		//生成请购单主表
		void addBuy(CurrencyApply currencyApply3);

		//修改流水号
		void updateSerialNumber(Integer AutoId, String CardNumber);
		//查询其他出库单最大id
		Integer selectOtheRID();
		//查询其他出库单字子表最大id
		Integer selectOtherIDs();
		//查询流水单号
		Integer selectSerialNumber(Integer AutoId, String CardNumber);
		//查询销售主表最大值
		Integer selectSaleBuy();
		//查询销售副表最大值
		Integer selectSaleBuys();
		//查询所有仓库
		List<HashMap<String, Object>> selectCangKu();
		//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量
		List<HashMap<String, Object>> selectTarget2(@Param("cInvName") String cInvNam, String cWhCode);
		//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 货位名称 货位编码
		List<HashMap<String, Object>> selectTarget3(@Param("cInvName") String cInvNam, String cWhCode);
		//添加其他出库单字表关联表
		void addOtheroutletRelation(HashMap<String, Object> hashMap);
		//查询所有客户合同
		List<HashMap<String,Object>> selectAllContract(@Param("cName") String cName);
		//反写合同——添加合同主表信息
		Integer insertCMContractB(CurrencyApply currencyApply3);
		//反写合同——添加合同子表信息
		Integer insertCMContractItemB(HashMap<String, Object> hashMap);
		Integer insertCMContractItemB35(HashMap<String, Object> hashMap);
		//丽泽销售出库单——对U8生成发货单
		Integer insertDispatchList(CurrencyApply currencyApply3);
		//反写合同——添加合同条款信息
		Integer insertCMContractCaluseB(CurrencyApply currencyApply3);
		//反写合同——添加合同处理记录列表信息
		Integer insertCMList(CurrencyApply currencyApply3);
		//反写合同——添加合同管理设置信息
		Integer insertCMContractMain(CurrencyApply currencyApply3);
		//查询存货编码对应字段，组装标的编码使用
		String selectInventory(@Param("param1") String cInvCode);
		//更新合同信息
		Integer updateCMContract(CurrencyApply currencyApply);

		Integer updateCMContractMoney(HashMap<String,Object> hashMap);

		//丽泽销售出库单——对U8生成发货单子表
	    Integer insertDispatchLists(HashMap<String, Object> hashMap);
		//查询发货单最大id
	    String selectDispatchListDLID();

		//查询所有客户信息
	    List<HashMap<String,Object>> selectAllUser();

	    //反写丽泽技术服务合同
	    Integer insertCMContractB35(CurrencyApply currencyApply3);

	    //按类别查询商品
		List<HashMap<String,Object>> selectInventoryByCcode(@Param("type") String type);

	    Integer selectOtherMaxIDs();
	    //反写丽泽运营服务合同
	    Integer insertCMContractBAs35(CurrencyApply currencyApply3);

		Integer insertCMContractMemo(HashMap<String, Object> hashMap);

    	List<HashMap<String,Object>> selectInvTypeByCode(@Param("type") String type);

	    String selectStrContractID9();

		Integer insertCMContractB36(CurrencyApply currencyApply3);

		Integer insertCMContractMain36(CurrencyApply currencyApply3);
		//根据合同编码id获取收款金额
		BigDecimal findReceiveAmountByCContractId(@Param("cContractID") String cContractID);
		List<HashMap<String, Object>> selectCDepCode();

		//根据合同编号获取合同金额
		Float selectContractByContractId(@Param("strContractID") String strContractID);

		List<HashMap<String,BigDecimal>> findReceiveAmountByCContractId1(@Param("cContractID") String cContractID);

		//根据合同编号获取合同信息
		List<HashMap<String,Object>> selectContractInformation(@Param("strContractID") String strContractID);

		List<HashMap<String,Object>> selectAllContractByContractId(@Param("contractNumber") String contractNumber);
		//查询材料类出库单主表最大ID
        Integer selectMaterialOutID();
		//查询材料类出库单子表最大AutoID
        Integer selectMaterialOutIDs();
		//查询材料类出库单子表最大ID
        Integer selectMaterialOutMaxIDs();
        //生成材料出库单主表
        void addMaterialOut(CurrencyApply currencyApply3);
        //生成材料出库单子表
        void addMaterialOuts(HashMap<String, Object> hashMap);

        //信泽技术服务合同
		void insertCMContractB47(CurrencyApply currencyApply3);

		//查询信泽合同，业务科绩效
		List<HashMap<String,Object>> selectXZContract();

		List<HashMap<String,Object>> selectCusInv();

		String selectDispatchListiDLsID();

    	BigDecimal selectDisQuantity(String strContractID, String cInvCode);

		Integer insertCMContractPay(HashMap<String, Object> hashMap);

		String selectCitemcode();

		Integer insertfitemss04(HashMap<String, Object> hashMap);

		List<Map<String,Object>> selectTestName();

		List<HashMap<String,Object>> selectContractItem(@Param("strContractID") String strContractID);

		//合同报表
    	List<HashMap<String,Object>> selectContractStatement(Page page2, CurrencyApply currencyApply);

    	Integer getContractStatementRows(CurrencyApply currencyApply);

		List<HashMap<String,Object>> selectItem(@Param("strContractID") String strContractID);

		List<HashMap<String,Object>> selectContractMemo(String strContractID);
		List<HashMap<String,Object>> selectReceiveByCContractId(String strContractID);

		List<HashMap<String,Object>> selectSODetails(String currency_string3);

    	Integer updateSODetails(String iSOsID, HashMap<String, Object> hashMap);
}

package com.yr.lize.system.service;

import com.yr.lize.pojo.ResponseResult;

import java.math.BigDecimal;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface U8DataService {
	  
		//获取所有u8地区
		List<HashMap<String, Object>> getRegion();

		List<HashMap<String, Object>> getXZRegion();

		//根据地区查询客户
		List<HashMap<String, Object>> selectUser(Integer cDCCode);
		List<HashMap<String, Object>> selectXZUser(Integer cDCCode);
		//查询U8当前的客户合同
		List<HashMap<String, Object>> selectContract(Integer cCusCode,String strContractType);

		List<HashMap<String, Object>> selectXZContract(Integer cCusCode,String strContractType);

		//获取U8当前的客户合同中收款总金额
		List<HashMap<String, Object>> selectReceivables(String strContractID);

		List<HashMap<String, Object>> selectXZReceivables(String strContractID);

		public HashMap selectContractById(String strContractID);

		//根据合同编码查询所有合同带出内容
		List<HashMap<String, Object>>selectContractAll(String strContractID);

		List<HashMap<String, Object>>selectXZContractAll(String strContractID);

		//根据存货编码查询最近日期该商品报价
		List<HashMap<String, Object>>selectCost(String cInvCode);

		//根据存货编码获取u8设置参考成本
		HashMap<String, Object> selectInvSPrice(String cInvCode);

		//动态获取商品名称
		List<HashMap<String, Object>> selectInvName(String cInvName,String type);

		//动态获取商品名称
		HashMap<String, Object> selectInvQuantity(String cInvName,String type);

		List<HashMap<String, Object>> selectInvName1(String cInvName);
	//获取U8当前的客户合同中的商品信息
		List<HashMap<String, Object>> selectTarget(String cInvName);
		//获取仓库信息
		List<HashMap<String, Object>> selectWH(String cWhCode);
		//获取货位信息
		List<HashMap<String, Object>> selectPosition(String cInvName, String cWhCode);
		//获取请购单最大单号
		Integer selectNumber();
		//添加请购单
		Integer addQinggoudan();
		//根据合同编号获取运营设备信息
		List<HashMap<String, Object>> selectshebei(String strContractID ,Integer type);

		List<HashMap<String, Object>> selectshebei1(String strContractID ,Integer type);
		//修改冻结量
		void updateCurrentStockfStopQuantity(String cWhCode, String cInvCode, BigDecimal fStopQuantity, Integer type);
		//查询所有仓库
		List<HashMap<String, Object>> selectCangKu();
		List<HashMap<String, Object>> selectXZCangKu();
		//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量
		List<HashMap<String, Object>> selectTarget2(String cInvName, String cWhCode);

		//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 信泽
		List<HashMap<String, Object>> selectXzTarget2(String cInvName, String cWhCode);

		//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 货位名称 货位编码
		List<HashMap<String, Object>> selectTarget3(String cInvName, String cWhCode);
		//查询所有客户合同
		List<HashMap<String,Object>> selectAllContract(String cName);

		List<HashMap<String,Object>> selectXZAllContract(String cName);

		//查询所有客户信息
	    List<HashMap<String,Object>> selectAllUser();

		//查询所有客户信息
		List<HashMap<String,Object>> selectXZAllUser();

		//查询按类型分类的商品(比如:01开头的为设备类)
    	List<HashMap<String,Object>> selectInventoryByCcode(String type);

    	List<HashMap<String,Object>> selectInvTypeByCode(String type);
    	
		List<HashMap<String, Object>> selectCDepCode();

		List<HashMap<String,Object>> selectCusInv();

		BigDecimal selectDisQuantity(String strContractID,String cInvCode);

		List<HashMap<String,Object>> selectSODetails(String strContractID);

		List<Map<String,Object>> selectTestName();

		List<HashMap<String,Object>> selectOutOrder(String outOrderDate,String flag);

		List<HashMap<String,Object>> selectOutInv(String cCode,String flag);
}

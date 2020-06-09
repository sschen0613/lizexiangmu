package com.yr.lize.system.service.impl;

import java.math.BigDecimal;
import java.util.*;

import com.yr.lize.system.mapper.XZU8DataMapper;
import org.apache.poi.xslf.model.geom.IfElseExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.yr.lize.system.mapper.U8DataMapper;
import com.yr.lize.system.service.U8DataService;

@Service
public class U8DataServiceImpl implements U8DataService{
	@Autowired
	U8DataMapper U8DataMapper;
	@Autowired
	XZU8DataMapper xzu8DataMapper;

	public List<HashMap<String, Object>> getRegion() {
		// 获取u8所有地区
		return U8DataMapper.getRegion();
	}

	public List<HashMap<String, Object>> getXZRegion() {
		// 获取u8所有地区
		return xzu8DataMapper.getRegion();
	}

	@Override
	public List<HashMap<String, Object>> selectUser(Integer cDCCode) {
		//根据地区查询客户
		return U8DataMapper.selectUser(cDCCode);
	}

	@Override
	public List<HashMap<String, Object>> selectXZUser(Integer cDCCode) {
		//根据地区查询客户
		return xzu8DataMapper.selectUser(cDCCode);
	}

	//查询所有客户信息
	@Override
	public List<HashMap<String, Object>> selectAllUser() {
		return U8DataMapper.selectAllUser();
	}

	@Override
	public List<HashMap<String, Object>> selectXZAllUser() {
		return xzu8DataMapper.selectAllUser();
	}

	@Override
	public List<HashMap<String, Object>> selectInventoryByCcode(String type) {
		return  U8DataMapper.selectInventoryByCcode(type);
	}

	@Override
	public List<HashMap<String, Object>> selectInvTypeByCode(String type) {
		return U8DataMapper.selectInvTypeByCode(type);
	}


	@Override
	public List<HashMap<String, Object>> selectContract(Integer cCusCode,String strContractType) {
		//查询U8当前的客户合同
		return U8DataMapper.selectContract(cCusCode,strContractType);
	}

	@Override
	public List<HashMap<String, Object>> selectXZContract(Integer cCusCode,String strContractType) {
		//查询U8当前的客户合同
		return xzu8DataMapper.selectContract(cCusCode,strContractType);
	}


	@Override
	public List<HashMap<String, Object>> selectReceivables(String strContractID) {
		List<HashMap<String, Object>> list = new ArrayList<>();
		HashMap<String, Object> hashMap = new HashMap<>();
		//获取U8当前的客户合同中收款总金额
		BigDecimal receiveAmount = U8DataMapper.findReceiveAmountByCContractId(strContractID);
		hashMap.put("dblPayCurrency",receiveAmount);
		list.add(hashMap);
		return list;

	}

	@Override
	public List<HashMap<String, Object>> selectXZReceivables(String strContractID) {
		List<HashMap<String, Object>> list = new ArrayList<>();
		HashMap<String, Object> hashMap = new HashMap<>();
		//获取U8当前的客户合同中收款总金额
		BigDecimal receiveAmount = xzu8DataMapper.findReceiveAmountByCContractId(strContractID);
		hashMap.put("dblPayCurrency",receiveAmount);
		list.add(hashMap);
		return list;

	}

	@Override
	public HashMap selectContractById(String strContractID) {
		return U8DataMapper.selectContractById(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectTarget(String cInvName) {
		//获取U8当前的客户合同中的商品信息
		return U8DataMapper.selectTarget(cInvName);
	}

	@Override
	public List<HashMap<String, Object>> selectContractAll(String strContractID) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectContractAll(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectXZContractAll(String strContractID) {
		// TODO Auto-generated method stub
		return xzu8DataMapper.selectContractAll(strContractID);
	}

	@Override
	public List<HashMap<String, Object>> selectInvName(String cInvName,String type) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectInvName(cInvName,type);
	}

	@Override
	public HashMap<String, Object> selectInvQuantity(String cInvName, String type) {
		return xzu8DataMapper.selectInvQuantity(cInvName);
	}

	@Override
	public List<HashMap<String, Object>> selectInvName1(String cInvName) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectInvName1(cInvName);
	}

	@Override
	public List<HashMap<String, Object>> selectWH(String cWhCode) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectWH(cWhCode);
	}

	@Override
	public List<HashMap<String, Object>> selectPosition(String cInvName,String cWhCode) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectPosition(cInvName,cWhCode);
	}



	@Override
	public Integer selectNumber() {
		// TODO Auto-generated method stub
		return U8DataMapper.selectNumber();
	}

	@Override
	public Integer addQinggoudan() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HashMap<String, Object>> selectshebei(String strContractID, Integer type) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectshebei(strContractID,type);
	}

	@Override
	public List<HashMap<String, Object>> selectshebei1(String strContractID, Integer type) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectshebei1(strContractID,type);
	}

	@Override
	public void updateCurrentStockfStopQuantity(String cWhCode, String cInvCode, BigDecimal fStopQuantity,
			Integer type) {
		// TODO Auto-generated method stub
		U8DataMapper.updateCurrentStockfStopQuantity(cWhCode,cInvCode,fStopQuantity,type);
	}
	@Override
	public List<HashMap<String, Object>> selectCost(String cInvCode) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectCost(cInvCode);
	}

	@Override
	public HashMap<String, Object> selectInvSPrice(String cInvCode) {
		return U8DataMapper.selectInvSPrice(cInvCode);
	}

	@Override
	public List<HashMap<String, Object>> selectCangKu() {
		// TODO Auto-generated method stub
		return U8DataMapper.selectCangKu();
	}

	@Override
	public List<HashMap<String, Object>> selectXZCangKu() {
		return xzu8DataMapper.selectCangKu();
	}

	@Override
	public List<HashMap<String, Object>> selectTarget2(String cInvName, String cWhCode) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectTarget2(cInvName,cWhCode);
	}

	//信泽查询相关数据
	@Override
	public List<HashMap<String, Object>> selectXzTarget2(String cInvName, String cWhCode) {
		return xzu8DataMapper.selectTarget2(cInvName,cWhCode);
	}

	@Override
	public List<HashMap<String, Object>> selectTarget3(String cInvName, String cWhCode) {
		// TODO Auto-generated method stub
		return U8DataMapper.selectTarget3(cInvName,cWhCode);
	}

	@Override
	public List<HashMap<String, Object>> selectAllContract(String cName) {
		return U8DataMapper.selectAllContract(cName);
	}

	@Override
	public List<HashMap<String, Object>> selectXZAllContract(String cName) {
		return xzu8DataMapper.selectAllContract(cName);
	}

	@Override
	public List<HashMap<String, Object>> selectCDepCode() {
		// TODO Auto-generated method stub
		return xzu8DataMapper.selectCDepCode();
	}

	@Override
	public List<HashMap<String, Object>> selectCusInv() {
		return U8DataMapper.selectCusInv();
	}

	@Override
	public BigDecimal selectDisQuantity(String strContractID,String cInvCode) {
		return U8DataMapper.selectDisQuantity(strContractID,cInvCode);
	}

	@Override
	public List<HashMap<String, Object>> selectSODetails(String strContractID) {
		return U8DataMapper.selectSODetails(strContractID);
	}

	@Override
	public List<Map<String, Object>> selectTestName() {
		return xzu8DataMapper.selectTestName();
	}

	@Override
	public List<HashMap<String, Object>> selectOutOrder(String outOrderDate,String flag) {
		if ("配件入库".equals(flag)){//1入库
			return U8DataMapper.selectInOrder(outOrderDate);
		}else{//2出库
			return U8DataMapper.selectOutOrder(outOrderDate);
		}

	}

	@Override
	public List<HashMap<String, Object>> selectOutInv(String cCode, String flag) {
		if ("配件入库".equals(flag)){//1入库
			return U8DataMapper.selectInInv(cCode);
		}else{//2出库
			return U8DataMapper.selectOutInv(cCode);
		}
	}


}

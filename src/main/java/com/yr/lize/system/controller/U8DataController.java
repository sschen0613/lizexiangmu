package com.yr.lize.system.controller;

import com.yr.lize.currencyapply.service.ICurrencyApplyService;
import com.yr.lize.pojo.CurrencyApply;
import com.yr.lize.pojo.ResponseResult;
import com.yr.lize.system.service.U8DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.*;

@Controller
public class U8DataController {
	@Autowired
	U8DataService U8DataService;

	@Autowired
	ICurrencyApplyService iCurrencyApplyService;

	// 查询区域
	@RequestMapping("/System/getRegion.action")
	@ResponseBody
	public ResponseResult getRegion() {
		List<HashMap<String, Object>> region = U8DataService.getRegion();

		ResponseResult result = new ResponseResult();

		result.setData(region);
		return result;

	}

	// 信泽查询区域
	@RequestMapping("/System/getXZRegion.action")
	@ResponseBody
	public ResponseResult getXZRegion() {
		List<HashMap<String, Object>> region = U8DataService.getXZRegion();

		ResponseResult result = new ResponseResult();

		result.setData(region);
		return result;

	}

	// 查询U8当前地区的客户
	@RequestMapping("/System/selectUser.action")
	@ResponseBody
	public ResponseResult selectUser(Integer[] cDCCode) {

		List<HashMap<String, Object>> user = new ArrayList<>();
		for (Integer i : cDCCode){
            List<HashMap<String, Object>> selectUser = U8DataService.selectUser(i);
            user.addAll(selectUser);
        }

		ResponseResult result = new ResponseResult();

		result.setData(user);
		return result;

	}

	// 信泽查询U8当前地区的客户
	@RequestMapping("/System/selectXZUser.action")
	@ResponseBody
	public ResponseResult selectXZUser(Integer[] cDCCode) {

		List<HashMap<String, Object>> user = new ArrayList<>();
		for (Integer i : cDCCode){
			List<HashMap<String, Object>> selectUser = U8DataService.selectXZUser(i);
			user.addAll(selectUser);
		}

		ResponseResult result = new ResponseResult();

		result.setData(user);
		return result;

	}

	//查询所有客户信息
	@RequestMapping("System/selectAllUser.action")
	@ResponseBody
	public ResponseResult selectAllUser(){
		List<HashMap<String,Object>> users = U8DataService.selectAllUser();
		ResponseResult result = new ResponseResult();
		result.setData(users);
		return result;
	}

	//查询所有客户信息
	@RequestMapping("System/selectXZAllUser.action")
	@ResponseBody
	public ResponseResult selectXZAllUser(){
		List<HashMap<String,Object>> users = U8DataService.selectXZAllUser();
		ResponseResult result = new ResponseResult();
		result.setData(users);
		return result;
	}

	// 查询U8当前的客户合同
	@RequestMapping("/System/selectContract.action")
	@ResponseBody
	public ResponseResult selectContract(Integer cCusCode,String strContractType) {
		List<HashMap<String, Object>> contract = U8DataService.selectContract(cCusCode,strContractType);

		ResponseResult result = new ResponseResult();

		result.setData(contract);
		return result;
	}

	// 信泽查询U8当前的客户合同
	@RequestMapping("/System/selectXZContract.action")
	@ResponseBody
	public ResponseResult selectXZContract(Integer cCusCode,String strContractType) {
		List<HashMap<String, Object>> contract = U8DataService.selectXZContract(cCusCode,strContractType);

		ResponseResult result = new ResponseResult();

		result.setData(contract);
		return result;
	}

	// 获取U8当前的客户合同中收款总金额
	@RequestMapping("/System/selectContractById.action")
	@ResponseBody
	public ResponseResult selectContractById(String strContractID) {

		HashMap<String, Object> contract = U8DataService.selectContractById(strContractID);

		ResponseResult result = new ResponseResult();

		result.setData(contract);
		return result;
	}

	// 获取U8当前的客户合同中收款总金额
	@RequestMapping("/System/selectXZContractById.action")
	@ResponseBody
	public ResponseResult selectXZContractById(String strContractID) {

		HashMap<String, Object> contract = U8DataService.selectXZContractById(strContractID);

		ResponseResult result = new ResponseResult();

		result.setData(contract);
		return result;
	}

	// 获取U8当前的客户合同中收款总金额
	@RequestMapping("/System/selectReceivables.action")
	@ResponseBody
	public ResponseResult selectReceivables(String strContractID) {

		List<HashMap<String, Object>> receivables = U8DataService.selectReceivables(strContractID);

		ResponseResult result = new ResponseResult();

		result.setData(receivables);
		return result;
	}

	// 获取信泽U8当前的客户合同中收款总金额
	@RequestMapping("/System/selectXZReceivables.action")
	@ResponseBody
	public ResponseResult selectXZReceivables(String strContractID) {

		List<HashMap<String, Object>> receivables = U8DataService.selectXZReceivables(strContractID);

		ResponseResult result = new ResponseResult();

		result.setData(receivables);
		return result;
	}

	// 根据合同编号获取合同金额 收付金额 合同付款约定 合同特殊约定
	@RequestMapping("/System/selectContractAll.action")
	@ResponseBody
	public ResponseResult selectContractAll(String strContractID) {

		List<HashMap<String, Object>> receivables = U8DataService.selectContractAll(strContractID);

		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(receivables);
		return result;
	}

	// 根据合同编号获取合同金额 收付金额 合同付款约定 合同特殊约定
	@RequestMapping("/System/selectContractAll1.action")
	@ResponseBody
	public ResponseResult selectContractAll1(CurrencyApply currencyApply) {

		currencyApply = iCurrencyApplyService.selectCurrencyApply(currencyApply);

		List<HashMap<String, Object>> receivables = U8DataService.selectContractAll(currencyApply.getCurrency_string3());

		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(receivables);
		return result;
	}

	// 信泽根据合同编号获取合同金额 收付金额 合同付款约定 合同特殊约定
	@RequestMapping("/System/selectXZContractAll.action")
	@ResponseBody
	public ResponseResult selectXZContractAll(String strContractID) {

		List<HashMap<String, Object>> receivables = U8DataService.selectXZContractAll(strContractID);

		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(receivables);
		return result;
	}

	// 信泽根据合同编号获取合同金额 收付金额 合同付款约定 合同特殊约定
	@RequestMapping("/System/selectXZContractDetails.action")
	@ResponseBody
	public ResponseResult selectXZContractDetails(String strContractID) {

		List<HashMap<String, Object>> receivables = U8DataService.selectXZContractDetails(strContractID);

		ResponseResult result = new ResponseResult();
		result.setCode(0);
		result.setData(receivables);
		return result;
	}

	// 根据合同编号获取运营设备信息
	@RequestMapping("/System/selectshebei.action")
	@ResponseBody
	public ResponseResult selectshebei(String strContractID ,Integer type) {
//type 1 运维类合同    2运营类合同
		List<HashMap<String, Object>> receivables = U8DataService.selectshebei(strContractID ,type);

		ResponseResult result = new ResponseResult();

		result.setData(receivables);
		return result;
	}

	// 根据合同编号获取运营设备信息
	@RequestMapping("/System/selectshebei1.action")
	@ResponseBody
	public ResponseResult selectshebei1(String strContractID ,Integer type) {
//type 1 运维类合同    2运营类合同
		List<HashMap<String, Object>> receivables = U8DataService.selectshebei1(strContractID ,type);

		ResponseResult result = new ResponseResult();

		result.setData(receivables);
		return result;
	}

	// 动态获取商品名称
	@RequestMapping("/System/selectInvName.action")
	@ResponseBody
	public ResponseResult selectInvName(String cInvName,String type) {

		List<HashMap<String, Object>> target = U8DataService.selectInvName(cInvName,type);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 动态获取商品名称
	@RequestMapping("/System/selectInvQuantity.action")
	@ResponseBody
	public ResponseResult selectInvQuantity(String cInvName,String type) {

		HashMap<String, Object> target = U8DataService.selectInvQuantity(cInvName,type);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	@RequestMapping("/System/selectInvName1.action")
	@ResponseBody
	public ResponseResult selectInvName1(String cInvName) {

		List<HashMap<String, Object>> target = U8DataService.selectInvName1(cInvName);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 根据商品名称获取所有商品信息
	@RequestMapping("/System/selectTarget.action")
	@ResponseBody
	public ResponseResult selectTarget(String cInvName) {

		List<HashMap<String, Object>> target = U8DataService.selectTarget(cInvName);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 根据商品编码和仓库编码获取仓库信息
	@RequestMapping("/System/selectWH.action")
	@ResponseBody
	public ResponseResult selectWH(String cInvCode) {

		List<HashMap<String, Object>> target = U8DataService.selectWH(cInvCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 根据仓库编码和商品编码获取货架信息
	@RequestMapping("/System/selectPosition.action")
	@ResponseBody
	public ResponseResult selectPosition(String cInvCode, String cWhCode) {

		List<HashMap<String, Object>> target = U8DataService.selectPosition(cInvCode, cWhCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 获取请购单最大单号
	@RequestMapping("/System/selectNumber.action")
	@ResponseBody
	public ResponseResult selectNumber() {

		Integer number = U8DataService.selectNumber();

		ResponseResult result = new ResponseResult();

		result.setData(number);
		return result;
	}

	// 根据存货编码获取最近日期该商品单价
	@RequestMapping("/System/selectCost.action")
	@ResponseBody
	public ResponseResult selectCost(String cInvCode) {

		List<HashMap<String, Object>> target = U8DataService.selectCost(cInvCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	// 根据存货编码获取u8设置的参考成本
	@RequestMapping("/System/selectInvSPrice.action")
	@ResponseBody
	public ResponseResult selectInvSPrice(String cInvCode) {

		HashMap<String, Object> target = U8DataService.selectInvSPrice(cInvCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//查询所有仓库
	@RequestMapping("/System/selectCangKu.action")
	@ResponseBody
	public ResponseResult selectCangKu() {

		List<HashMap<String, Object>> target = U8DataService.selectCangKu();

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//查询所有仓库
	@RequestMapping("/System/selectXZCangKu.action")
	@ResponseBody
	public ResponseResult selectXZCangKu() {

		List<HashMap<String, Object>> target = U8DataService.selectXZCangKu();

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}
	//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 货位名称 货位编码
	@RequestMapping("/System/selectTarget2.action")
	@ResponseBody
	public ResponseResult selectTarget2(String cInvName,String cWhCode) {

		List<HashMap<String, Object>> target = U8DataService.selectTarget2(cInvName,cWhCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//信泽
	//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 货位名称 货位编码
	@RequestMapping("/System/selectXzTarget2.action")
	@ResponseBody
	public ResponseResult selectXzTarget2(String cInvName,String cWhCode) {

		List<HashMap<String, Object>> target = U8DataService.selectXzTarget2(cInvName,cWhCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//根据存货名称和仓库编码带出存货名称 存货编码  规格型号 单位名称 最近商品单价 可用量 货位名称 货位编码
	@RequestMapping("/System/selectTarget3.action")
	@ResponseBody
	public ResponseResult selectTarget3(String cInvName,String cWhCode) {

		List<HashMap<String, Object>> target = U8DataService.selectTarget3(cInvName,cWhCode);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//查询所有客户合同
	@RequestMapping("/System/selectAllContract.action")
	@ResponseBody
	public ResponseResult selectAllContract(String cName){
		List<HashMap<String, Object>> allContract = U8DataService.selectAllContract(cName);

		ResponseResult result = new ResponseResult();

		result.setData(allContract);
		return result;
	}

	//查询所有信泽客户合同
	@RequestMapping("/System/selectXZAllContract.action")
	@ResponseBody
	public ResponseResult selectXZAllContract(String cName){
		List<HashMap<String, Object>> allContract = U8DataService.selectXZAllContract(cName);

		ResponseResult result = new ResponseResult();

		result.setData(allContract);
		return result;
	}

	//查询所有信泽客户合同
	@RequestMapping("/System/selectXZCustomerByContract.action")
	@ResponseBody
	public ResponseResult selectXZCustomerByContract(String cContractID){
		HashMap<String, Object> customer = U8DataService.selectXZCustomerByContract(cContractID);

		ResponseResult result = new ResponseResult();

		result.setData(customer);
		return result;
	}

	//查询按类型分类的商品(比如:01开头的为设备类)
	@RequestMapping("/System/selectInventoryByCcode.action")
	@ResponseBody
	public ResponseResult selectInventoryByCcode(String type){
		List<HashMap<String, Object>> allContract = U8DataService.selectInventoryByCcode(type);

		ResponseResult result = new ResponseResult();

		result.setData(allContract);
		return result;
	}

	//查询设备类型
	@RequestMapping("/System/selectInvTypeByCode.action")
	@ResponseBody
	public ResponseResult selectInvTypeByCode(String type){
		List<HashMap<String, Object>> invTypeByCode = U8DataService.selectInvTypeByCode(type);

		ResponseResult result = new ResponseResult();

		result.setData(invTypeByCode);
		return result;
	}
	
	//查询使用科室
	@RequestMapping("/System/selectCDepCode.action")
	@ResponseBody
	public ResponseResult selectCDepCode(){
		List<HashMap<String, Object>> cDepCode = U8DataService.selectCDepCode();

		ResponseResult result = new ResponseResult();

		result.setData(cDepCode);
		return result;
	}

	//查询客户设备
	@RequestMapping("/System/selectCusInv.action")
	@ResponseBody
	public ResponseResult selectCusInv(){
		List<HashMap<String, Object>> cusInv = U8DataService.selectCusInv();

		ResponseResult result = new ResponseResult();

		result.setData(cusInv);
		return result;
	}

	//查询已发货数量
	@RequestMapping("/System/selectDisQuantity.action")
	@ResponseBody
	public ResponseResult selectDisQuantity(String strContractID,String cInvCode){
		BigDecimal quantity = U8DataService.selectDisQuantity(strContractID,cInvCode);

		ResponseResult result = new ResponseResult();

		result.setData(quantity);
		return result;
	}

	//查询销售订单
	@RequestMapping("/System/selectSODetails.action")
	@ResponseBody
	public ResponseResult selectSODetails(String strContractID){
		List<HashMap<String, Object>> soDetails = U8DataService.selectSODetails(strContractID);

		ResponseResult result = new ResponseResult();

		result.setData(soDetails);
		return result;
	}

	//查询标的
	@RequestMapping("/System/selectTestName.action")
	@ResponseBody
	public ResponseResult selectTestName() {

		List<Map<String, Object>> target = U8DataService.selectTestName();

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//查询标的
	@RequestMapping("/System/selectOutOrder.action")
	@ResponseBody
	public ResponseResult selectOutOrder(String outOrderDate,String flag) {

		List<HashMap<String, Object>> target = U8DataService.selectOutOrder(outOrderDate,flag);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}

	//查询标的
	@RequestMapping("/System/selectOutInv.action")
	@ResponseBody
	public ResponseResult selectOutInv(String cCode,String flag) {

		List<HashMap<String, Object>> target = U8DataService.selectOutInv(cCode,flag);

		ResponseResult result = new ResponseResult();

		result.setData(target);
		return result;
	}
}

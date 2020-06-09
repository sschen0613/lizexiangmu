package com.yr.lize.system.service;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemCode;
import com.yr.lize.pojo.SystemCompany;

import java.util.HashMap;
import java.util.List;

public interface ISystemCompanyService {
	//查询所有分公司
	List<HashMap<String, Object>> getCompany(Page page, SystemCompany company);
	//查询公司数量
	Integer getRows(SystemCompany company);
	//删除分公司
	Integer deleteCompany(Integer company_Id);
	//添加分公司
	Integer addCompany(SystemCompany company);
	//修改分公司信息
	Integer updateCompany(SystemCompany company);
	//修改删除标识
	Integer updateDelete(Integer company_Id);
	//修改审批条件金额
	Integer updateApprovalMoney(Integer id, Integer money, Integer approval_id);
	//根据id查询公司
	SystemCompany selectCompanyById(Integer company_Id);
	//获取审批条件
	Integer selectApprovalCondition(Integer company_id, Integer approval_id);
	//修改编码字段
	void updateCode(Integer id);
	//查询修改后的值
	SystemCode selectCode(Integer id);

	Integer addCondition(Integer id, Integer money, Integer approval_id);
}

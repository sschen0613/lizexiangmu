package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemCode;
import com.yr.lize.pojo.SystemCompany;

import java.util.HashMap;
import java.util.List;
@DataSource(value = "1")
public interface SystemCompanyMapper {
	//获取所有公司信息
	List<HashMap<String, Object>> getCompany(Page page, SystemCompany company);
	//获取所有公司数量
	Integer getRows(SystemCompany company);
	//删除分公司
	Integer deleteCompany(Integer company_Id);
	//添加分工司
	Integer addCompany(SystemCompany company);
	//修改分公司信息
	Integer updateCompany(SystemCompany company);
	//修改删除标识
	Integer updateDelete(Integer company_Id);
	//修改审批条件金额
	Integer updateApprovalMoney(Integer id, Integer money, Integer approval_id);
	//根据id查询公司
	SystemCompany selectCompanyById(Integer company_Id);
	//添加公司审批条件
	Integer addApprovalCondition(Integer company_Id, int[] approval_ids);
	//获取审批条件
	Integer selectApprovalCondition(Integer company_id, Integer approval_id);
	//查询修改后的值
	SystemCode selectCode(Integer id);
	//修改编码字段
	void updateCode(Integer id);

	Integer addCondition(Integer id, Integer money, Integer approval_id);
}
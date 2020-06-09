package com.yr.lize.system.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemCode;
import com.yr.lize.pojo.SystemCompany;
import com.yr.lize.system.mapper.SystemCompanyMapper;
import com.yr.lize.system.mapper.SystemDepartmentMapper;
import com.yr.lize.system.service.ISystemCompanyService;

@Service
public class SystemCompanyServerImpl implements ISystemCompanyService {
	
	@Autowired
	SystemCompanyMapper systemCompanMapper;
	@Autowired
	SystemDepartmentMapper systemDepartmentMapper;
	//获取所有公司信息
	@Override
	public List<HashMap<String, Object>> getCompany(Page page, SystemCompany company) {
		return systemCompanMapper.getCompany(page, company);
	}
	//获取所有公司数量
	@Override
	public Integer getRows(SystemCompany company) {
		// TODO Auto-generated method stub
		return systemCompanMapper.getRows(company);
	}
	@Override
	public Integer deleteCompany(Integer company_Id) {
		//删除分公司
		List<SystemCompany> companies = systemDepartmentMapper.selectCompanyId(company_Id);
		if (companies != null && !companies.isEmpty()) {
			return -100;
		}else {
			return systemCompanMapper.deleteCompany(company_Id);
		}
	}
	@Override
	public Integer addCompany(SystemCompany company) {
		// 添加分公司
		int res2 = 0;
		int res = systemCompanMapper.addCompany(company);
		if (res > 0) {
			int[] approval_ids = {3,4,5,6,7};
			System.err.println(company.getApproval_money());
			res2 = systemCompanMapper.addApprovalCondition(company.getCompany_Id(),approval_ids);
		}
		return res2;
		
	}
	@Override
	public Integer updateCompany(SystemCompany company) {
		// 修改分公司信息
		return systemCompanMapper.updateCompany(company);
	}
	@Override
	public Integer updateDelete(Integer company_Id) {
		// 修改删除标识
		List<SystemCompany> companies = systemDepartmentMapper.selectCompanyId(company_Id);
		if (companies != null && !companies.isEmpty()) {
			return -100;
		}else {
			return systemCompanMapper.updateDelete(company_Id);
		}
	}
	@Override
	public Integer updateApprovalMoney(Integer id, Integer money,Integer approval_id) {
		//修改审批条件金额
		return systemCompanMapper.updateApprovalMoney(id, money,approval_id);
	}
	@Override
	public SystemCompany selectCompanyById(Integer company_Id) {
		//根据id查询公司
		return systemCompanMapper.selectCompanyById(company_Id);
	}
	@Override
	public Integer selectApprovalCondition(Integer company_id, Integer approval_id) {
		// 获取审批条件
		return systemCompanMapper.selectApprovalCondition(company_id,approval_id);
	}
	@Override
	public void updateCode(Integer id) {
		//修改编码字段
		systemCompanMapper.updateCode(id);
	}
	@Override
	public SystemCode selectCode(Integer id) {
		//查询修改后的值
		return systemCompanMapper.selectCode(id);
	}

	@Override
	public Integer addCondition(Integer id, Integer money, Integer approval_id) {
		return systemCompanMapper.addCondition(id,money,approval_id);
	}

}

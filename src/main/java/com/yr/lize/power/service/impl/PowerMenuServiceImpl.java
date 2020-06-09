package com.yr.lize.power.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.PowerMenu;
import com.yr.lize.power.mapper.PowerMenuMapper;
import com.yr.lize.power.service.IPowerMenuService;
@Service
public class PowerMenuServiceImpl implements IPowerMenuService {
	
	@Autowired
	PowerMenuMapper powerMenuMapper;
	
	@Override
	public List<HashMap<String, Object>> selectNoMenu(Page page, PowerMenu menu) {
		//查询职位未拥有的菜单
		return powerMenuMapper.selectNoMenu(page, menu);
	}

	@Override
	public Integer getNoRows(PowerMenu powerMenu) {
		//查询职位未拥有的菜单数量
		return powerMenuMapper.getNoRows(powerMenu);
	}

	@Override
	public List<HashMap<String, Object>> selectYesMenu(Page page2, PowerMenu powerMenu) {
		//查询拥有的菜单列表
		return powerMenuMapper.selectYesMenu(page2,powerMenu);
	}

	@Override
	public Integer getYesRows(PowerMenu powerMenu) {
		//查询拥有的菜单列表数量
		return powerMenuMapper.getYesRows(powerMenu);
	}

}

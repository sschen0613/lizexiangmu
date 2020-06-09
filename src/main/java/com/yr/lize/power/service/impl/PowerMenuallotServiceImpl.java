package com.yr.lize.power.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yr.lize.pojo.PowerMenuallot;
import com.yr.lize.power.mapper.PowerMenuallotMapper;
import com.yr.lize.power.service.IPowerMenuallotService;

@Service
public class PowerMenuallotServiceImpl implements IPowerMenuallotService{
	
	@Autowired
	PowerMenuallotMapper powerMenuallotMapper;
	
	@Override
	public Integer deleteMenuallot(Integer id) {
		// 删除拥有菜单
		return powerMenuallotMapper.deleteMenuallot(id);
	}

	@Override
	public Integer addMenuallot(PowerMenuallot menuallot) {
		//添加未拥有菜单
		return powerMenuallotMapper.addMenuallot(menuallot);
	}

	@Override
	public Integer addMenuallots(Integer[] menu_ids, Integer position_id) {
		//批量添加未拥有菜单
		return powerMenuallotMapper.addMenuallots(menu_ids,position_id);
	}

	@Override
	public Integer deleteMenuallots(Integer[] ids) {
		//批量删除未拥有菜单
		return powerMenuallotMapper.deleteMenuallots(ids);
	}

}

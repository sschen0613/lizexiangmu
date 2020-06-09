package com.yr.lize.power.service;

import com.yr.lize.pojo.PowerMenuallot;

public interface IPowerMenuallotService {
	// 删除拥有菜单
	Integer deleteMenuallot(Integer id);
	//添加未拥有菜单
	Integer addMenuallot(PowerMenuallot menuallot);
	//批量添加未拥有菜单
	Integer addMenuallots(Integer[] menu_ids, Integer position_id);
	//批量删除未拥有菜单
	Integer deleteMenuallots(Integer[] ids);
}

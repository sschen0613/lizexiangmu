package com.yr.lize.power.mapper;

import java.util.HashMap;
import java.util.List;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.PowerMenu;

public interface PowerMenuMapper {
	//查询职位未拥有的菜单
	List<HashMap<String, Object>> selectNoMenu(Page page, PowerMenu menu);
	//查询职位未拥有的菜单
	Integer getNoRows(PowerMenu powerMenu);
	//查询拥有的菜单列表
	List<HashMap<String, Object>> selectYesMenu(Page page2, PowerMenu powerMenu);
	//查询拥有的菜单列表数量
	Integer getYesRows(PowerMenu powerMenu);

}
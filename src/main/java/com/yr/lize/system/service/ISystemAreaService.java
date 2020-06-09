package com.yr.lize.system.service;

import java.util.HashMap;
import java.util.List;

public interface ISystemAreaService {
	    //查询角色已管理区域信息
		List<HashMap<String, Object>> getAlready(Integer staff_id);
		//查询角色未管理区域信息
		List<HashMap<String, Object>> getNotyet(Integer staff_id);
		//添加未管理区域
		Integer insertNoArea(Integer cDCCode,Integer staff_id);
		//删除已管理区域
		Integer daleteArea(Integer id);
		//模糊查询区域
		List<HashMap<String, Object>> selectArea(String cDCName);
}

package com.yr.lize.system.mapper;

import java.util.HashMap;
import java.util.List;

import com.st.rbac.util.DataSource;
@DataSource(value="2")
public interface SystemAreaMapper {
	 //查询角色已管理区域信息
	List<HashMap<String, Object>> getAlready(Integer staff_id);
	//查询角色未管理区域信息
	List<HashMap<String, Object>> getNotyet(Integer staff_id);
	//添加未管理区域
	Integer insertNoArea( Integer cDCCode,Integer staff_id);
	//删除已管理区域
	Integer daleteArea(Integer staff_id);
	//模糊查询区域
	List<HashMap<String, Object>> selectArea(String cDCName);
}

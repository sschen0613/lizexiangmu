package com.yr.lize.system.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yr.lize.system.mapper.SystemAreaMapper;
import com.yr.lize.system.service.ISystemAreaService;

@Service
public class SystemAreaServiceImpl implements ISystemAreaService{
	@Autowired
	SystemAreaMapper SystemAreaMapper;
@Override
//查询角色已管理区域信息
	public List<HashMap<String, Object>> getAlready(Integer staff_id) {
		return SystemAreaMapper.getAlready(staff_id);
	}
@Override
//查询角色未管理区域信息
	public List<HashMap<String, Object>> getNotyet(Integer staff_id) {
		return SystemAreaMapper.getNotyet(staff_id);
	}
@Override
//添加未管理区域
	public Integer insertNoArea(Integer cDCCode, Integer staff_id) {
		return SystemAreaMapper.insertNoArea(cDCCode,staff_id);
	}
@Override
//删除已管理区域
	public Integer daleteArea(Integer staff_id) {
		return SystemAreaMapper.daleteArea(staff_id);
	}
//模糊查询区域
@Override
public List<HashMap<String, Object>> selectArea(String cDCName) {
	// TODO Auto-generated method stub
	return SystemAreaMapper.selectArea(cDCName);
}

}

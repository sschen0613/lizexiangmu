package com.yr.lize.system.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemPosition;
import com.yr.lize.system.mapper.SystemPositionMapper;
import com.yr.lize.system.service.ISystemPositionService;
@Service
public class SystemPositionServiceImpl implements ISystemPositionService {
	
	@Autowired
	SystemPositionMapper systemPositionMapper;
	
	@Override
	public List<SystemPosition> getPosition() {
		//获取所有职位信息
		return systemPositionMapper.getPosition();
	}
	//删除职位
	@Override
	public Integer deletePosition(Integer positionId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<HashMap<String, Object>> seletePosition(Page page2, SystemPosition position) {
		//查询所有职位信息
		return systemPositionMapper.seletePosition(page2,position);
	}
	@Override
	public Integer getRows(SystemPosition position) {
		//查询所有职位信息数量
		return systemPositionMapper.getRows(position);
	}
	@Override
	public Integer updatePosition(SystemPosition position) {
		SystemPosition position2 = systemPositionMapper.selectPositionName(position.getPosition_Name());
		if (position2 == null) {
			//修改职位名称
			return systemPositionMapper.updatePosition(position);
		}else {
			return -100;
		}
	}
	@Override
	public Integer addPosition(SystemPosition position) {
		SystemPosition position2 = systemPositionMapper.selectPositionName(position.getPosition_Name());
		if (position2 == null) {
			//添加职位
			return systemPositionMapper.addPosition(position);
		}else {
			return -100;
		}
	}
	@Override
	public Integer deletePosition2(Integer id) {
		//修改职位删除标识
		return systemPositionMapper.deletePosition2(id);
	}
	@Override
	public SystemPosition selectPositionById(Integer position_Id) {
		//根据id查询职位信息
		return systemPositionMapper.selectPositionById(position_Id);
	}

}

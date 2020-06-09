package com.yr.lize.system.service;

import java.util.HashMap;
import java.util.List;

import com.st.rbac.util.Page;
import com.yr.lize.pojo.SystemPosition;

public interface ISystemPositionService {
	//查询所有职位信息
	List<SystemPosition> getPosition();
	//删除职位
	Integer deletePosition(Integer positionId);
	//查询所有职位信息
	List<HashMap<String, Object>> seletePosition(Page page2, SystemPosition position);
	//查询所有职位信息数量
	Integer getRows(SystemPosition position);
	//修改职位名称
	Integer updatePosition(SystemPosition position);
	//添加职位
	Integer addPosition(SystemPosition position);
	//修改职位删除标识
	Integer deletePosition2(Integer id);
	//根据id查询职位信息
	SystemPosition selectPositionById(Integer position_Id);
	
	
}

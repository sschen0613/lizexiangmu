package com.yr.lize.system.mapper;

import java.util.HashMap;
import java.util.List;

import com.st.rbac.util.DataSource;

@DataSource(value="2")
public interface TextMapper {
	List<HashMap<String, Object>> selectTest();
}

package com.yr.lize.system.mapper;

import com.st.rbac.util.DataSource;
import com.st.rbac.util.Page;
import com.yr.lize.pojo.CurrencyApply;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

@DataSource(value="4")
public interface U8SystemDataMapper {

		//更新系统表中，其他出库单以及明细表中中最大id（解决红冲主键重复问题）
		void updateSystemRdRecord09Id(Integer id);
		Integer querySystemRdRecord09Id();
		void updateSystemRdRecord09ChildId(Integer id);
		Integer querySystemRdRecord09ChildId();
}

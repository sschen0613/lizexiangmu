<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测科绩效统计表 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
	 	
		<table id="tab" lay-filter="table"></table>

		<script>
		//一般直接写在一个js文件中
			layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'], function(){
				var laydate = layui.laydate //日期
				,laypage = layui.laypage //分页
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form
				,layedit = layui.layedit;

				//表单更新渲染
				form.render();
				form.render('select');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});

				//创建table实例
				table.render({
					elem: '#tab'
					,height: 312
					,url: 'Xinze/jianceJiXiaoManarge1.action?currency_type=45&currency_int=2&code_int2=1' //数据接口
					,page: true //开启分页
					// ,toolbar: '#toolbarDemo'
			    	,title: '检测科绩效管理'
			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{field: 'number', title: '序号',minWidth:150, totalRowText: '合计'}
						,{field: 'details_string12', title: '员工姓名',minWidth:100}
						,{field: 'currency_string2', title: '样品名称',minWidth:100}
						,{field: 'code', title: '样品编码',minWidth:100}
						,{field: 'details_date4', title: '检测日期',minWidth:100, templet:'<div>{{ Format(d.details_date4,"yyyy-MM-dd")}}</div>'}
						,{field: 'jixiaoStandart', title: '绩效标准',minWidth:100}
						,{field: 'details_string', title: '检测点位',minWidth:100}
						,{field: 'details_int3', title: '检测数量',minWidth:100, totalRow: true}
						,{field: 'price', title: '绩效单价',minWidth:100, totalRow: true}
						,{field: 'sum', title: '绩效金额',minWidth:100, totalRow: true}
					]]
				});

				

			});
		</script> 
	</body>
</html>
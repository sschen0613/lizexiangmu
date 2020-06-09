<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 现场科绩效统计表 -->
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
					,url: 'Xinze/selectSceneSectionPerformance.action?currency_type=44' //数据接口
					,page: true //开启分页
					// ,toolbar: '#toolbarDemo'
			    	,title: '现场科绩效统计表'
			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{field: 'number', title: '序号',minWidth:150, totalRowText: '合计'}
						,{field: 'staff_name', title: '员工姓名',minWidth:100}
						,{field: 'processName', title: '检测项目',minWidth:100}
						/*,{field: '', title: '样品编码',minWidth:100}*/
						,{field: 'currency_date', title: '采样日期',minWidth:100, templet:'<div>{{ Format0(d.currency_date,"yyyy-MM-dd HH:mm:ss")}}</div>'}
						,{field: '绩效标准', title: '绩效标准',minWidth:100}
						,{field: 'details_money2', title: '应采样数量',minWidth:110, totalRow: true}
						,{field: 'details_money4', title: '采样数量',minWidth:110, totalRow: true}
						,{field: '绩效单价', title: '绩效单价',minWidth:100, totalRow: true}
						,{field: '绩效金额', title: '绩效金额',minWidth:100, totalRow: true}
					]]
				});

				

			});
		</script> 
	</body>
</html>
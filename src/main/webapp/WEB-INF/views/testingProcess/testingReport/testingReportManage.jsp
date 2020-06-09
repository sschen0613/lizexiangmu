<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测报告管理 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="layui/layui.js"></script>
	</head>
	<body>
<!--  	 	<form class="layui-form form-top" action=""> -->
<!-- 	 		<div class="layui-form-item"> -->
<!-- 				<div class="layui-inline"> -->
<!-- 					<label class="layui-form-label label-revise">输入框 :</label> -->
<!-- 					<div class="layui-input-block"> -->
<!-- 						<input type="text" name="name1" required  lay-verify="" placeholder="请输入" autocomplete="off" class="layui-input input-revise"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="layui-inline"> -->
<!-- 					<label class="layui-form-label label-revise">选择框 :</label> -->
<!-- 					<div class="layui-input-block"> -->
<!-- 						<select name="name2" lay-verify="" lay-search class="select-revise"> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="layui-inline"> -->
<!-- 					<label class="layui-form-label label-revise">日期选择框 :</label> -->
<!-- 					<div class="layui-input-block"> -->
<!-- 						<input name="name3" type="text" class="layui-input date-revise" id="date" placeholder="请选择日期"> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			  	<div class="layui-inline"> -->
<!-- 					<button lay-filter="search" class="layui-btn layui-btn-warm" lay-submit=""> -->
<!-- 	              		检索 -->
<!-- 					</button> -->
<!-- 				</div>  -->
<!-- 			</div> -->
<!-- 		</form> -->
		<table id="tab" lay-filter="table"></table>

<!-- 		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> -->
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">明细信息</a>
		</script>
		<script>
		//一般直接写在一个js文件中
			layui.use(['laydate', 'laypage', 'layer', 'table',  'element', 'form'], function(){
				var laydate = layui.laydate //日期
				,laypage = layui.laypage //分页
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form;

				//表单更新渲染
				form.render();
				form.render('select');
				//执行一个laydate实例
				laydate.render({
					elem: '#date' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});

				//监听检索按钮
				form.on('submit(search)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	  
					//重载表格
					tableInner.reload({
						where: data.field
						//重新从第 1 页开始
						,page: {curr: 1}
					});
	  
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});

				//创建table实例		
				var tableInner = table.render({
					elem: '#tab'
					,url: 'Company/getCompany.action' //数据接口
					,page: true //开启分页
					,toolbar: true
			    	,title: '检测报告管理'
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_number', title: '编码单号', minWidth:200, sort:true}
						,{field: '', title: '项目名称', minWidth:150}
						,{field: '', title: '联系人', minWidth:80}
						,{field: '', title: '联系电话', minWidth:100}
						,{field: '', title: '委托单位地址', minWidth:200}
						,{field: '', title: '委托单位名称', minWidth:120}
						,{field: '', title: '样品编码', minWidth:100}
						,{field: '', title: '检测类型', minWidth:100}
						,{field: '', title: '执行标准', minWidth:200}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:100}
					]]
				});

				//监听工具条
				table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
					if(layEvent === 'detail'){ //查看明细
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '检测报告管理明细信息',
							//shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'testingProcess/testingReport/testingReportManageDetails.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
						});
					}
				});

			});
		</script> 
	</body>
</html>
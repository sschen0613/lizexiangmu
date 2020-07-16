<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 办公用品列表 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
	 	<form class="layui-form form-top" action="">
	 		<div class="layui-form-item">
				<div class="layui-inline searchintop_inline">
					<label class="layui-form-label label-revise searchintop_label_revise">名称 :</label>
					<div class="layui-input-inline">
						<input name="name" lay-verify="" autocomplete="" placeholder="请输入名称" class="layui-input input-revise searchintop_input_revise">
					</div>
				</div>
			  	<div class="layui-inline">
					<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-xs button-revise" lay-submit="">
	              		检索
					</button>
				</div> 
			</div>
		</form>
		
		<table id="tab" lay-filter="table"></table>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-xs" lay-event="add">增加办公用品</button>
			</div>
		</script>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="edit">修改</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
		</script>
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

				//监听检索按钮
				form.on('submit(search)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					data = data.field //当前容器的全部表单字段，名值对形式：{name: value}
					//重载表格
					table.reload("tab" ,{
						page: true,
						where : {"name":data.name},
					});
	  
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});

				//创建table实例					
				table.render({
					elem: '#tab'
					,url: 'office/selectOfficeSuppliesList.action' //数据接口
					,page: true //开启分页
					,toolbar: '#toolbarDemo'
			    	,title: '办公用品列表'
 			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'code', title: '编码', minWidth:40}
 						,{field: 'name', title: '名称', minWidth:40}
 						,{field: 'unit', title: '单位', minWidth:20}
						,{field: 'price', title: '价格', minWidth:20}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:30}
					]]
				});

				//监听工具条
				table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
					if(layEvent === 'edit'){ //编辑
						layer.open({
							type: 2,
							title: '办公用品修改',
							//shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'office/reviseOfficeSupplies.action?id='+data.id+'&code='+data.code+'&name='+data.name+'&unit='+data.unit+'&price='+data.price//iframe的url
							,end:function () {//关闭弹框，刷新里诶包
								location.reload();
							}
						});
				    	//同步更新缓存对应的值
				   		obj.update({
					    	// username: '123'
					    	// ,title: 'xxx'
					    	// 字段 : '要更新的值',
						});
					} else if(layEvent === 'del'){ //撤回
						layer.confirm('确认删除此数据？', function(index){
							//向服务端发送删除指令
							$.ajax({
								url:'office/deleteOfficeSupplies.action',
								type:'post',
								data:{'id':data.id},
								dataType:'JSON',
								success:function(result){
									obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
									layer.close(index);
									layer.msg(result.msg,{time: 2000});
								}
							});
						});
					}
				});
				//监听头工具栏事件
				table.on('toolbar(table)', function(obj){
					var checkStatus = table.checkStatus(obj.config.id);
					switch(obj.event){
						case 'add':
							layer.open({
								type: 2,
								// skin:'layui-layer-molv', //layui-layer-lan
								title: '办公用品添加',
								//shadeClose: true,
								shade: 0.8,
								maxmin: true,
								area: ['80%', '80%'],
								content: 'office/reviseOfficeSupplies.action' //iframe的url
								,end:function () {
									location.reload();
								}
							});
				    	break;
				    	case 'delete':
				    		layer.msg('删除');
				    	break;
				    	case 'update':

				    	break;
					};
				});
			});
		</script>
	</body>
</html>
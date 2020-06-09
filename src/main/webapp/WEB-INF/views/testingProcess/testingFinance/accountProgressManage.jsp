<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 账款进度管理 -->
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
	</head>
	<body>
	 	<form class="layui-form form-top" action="">
	 		<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label label-revise">合同编号 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_string18" required  lay-verify="" placeholder="请输入合同编号" autocomplete="off" class="layui-input input-revise">
					</div>
				</div>
			  	<div class="layui-inline">
					<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
	              		检索
					</button>
				</div> 
			</div>
		</form>

		<table id="tab" lay-filter="table"></table>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-xs" lay-event="add"></button>
			</div>
		</script>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="detail">盖章</a>
			<%--<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
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
					,url: 'Xinze/selectFinanceAccount.action?currency_type=43&currency_int7=1' //数据接口
					,page: true //开启分页
					// ,toolbar: '#toolbarDemo'
			    	,title: '账款进度管理'
// 			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_string18', title: '合同编号', minWidth: 110}
						//,{field: '', title: '账目名称', minWidth: 100}
						//,{field: 'currency_string5', title: '项目地址', minWidth: 100}
						,{field: 'details_string', title: '检测点位', minWidth: 100}
						,{field: 'processName', title: '检测项目', minWidth: 100}
						//,{field: 'methodBasis', title: '方法依据', minWidth: 100}
						,{field: 'details_money2', title: '检测次数', minWidth: 100}
						,{field: 'details_int4', title: '检测天数', minWidth: 100}
						,{field: 'currency_string3', title: '现场联系人', minWidth:110}
						,{field: 'currency_string4', title: '联系电话', minWidth: 100}
						,{field: 'bigDecimal', title: '合同金额', minWidth: 100}
						,{field: 'accountPay', title: '已支付金额', minWidth:110}
						,{field: 'uncollectedAmount', title: '未支付金额', minWidth:110}
						,{field: 'details_string6', title: '备注', minWidth: 200}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:100}
					]]
				});

				//监听工具条
				table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
					if(layEvent === 'detail'){ //查看
				    	//do somehing
                        layer.confirm('确认盖章', function(index){
                            //obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            //layer.close(index);
							$.ajax({
								url:'Xinze/updateGaiZhang.action',
                                type : "post",
								data:{"currency_id":data.currency_id},
                                dataType : "JSON",
                                beforeSend: function(){
                                    layer.msg('正在提交', {
                                        icon: 16
                                        ,shade: 0.01
                                    });
                                },
                                success : function(result){
                                    layer.msg(result.msg);
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                    layer.close(index);
                                }
							});
                        });
					} else if(layEvent === 'del'){ //删除
						layer.confirm('确认删除', function(index){
							obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							layer.close(index);
							//向服务端发送删除指令
						});
					} else if(layEvent === 'edit'){ //编辑
				    	//do something
				    
				    	//同步更新缓存对应的值
				   		obj.update({
					    	// username: '123'
					    	// ,title: 'xxx'
					    	// 字段 : '要更新的值',
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
								title: '填写',
								shadeClose: true,
								shade: 0.8,
								maxmin: true,
								area: ['80%', '80%'],
								content: '' //iframe的url
							}); 
				    	break;
				    	case 'delete':
				    		layer.msg('删除');
				    	break;
				    	case 'update':
				    		layer.msg('编辑');
				    	break;
					};
				});

			});
		</script> 
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 配件内部维修申请 -->
<html>
<head>
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
	 			<div class="layui-inline">
					<label class="layui-form-label label-revise">流程编号 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_number" required  lay-verify="" placeholder="请输入流程编号" autocomplete="off" class="layui-input input-revise">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">开始日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date2" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="请选择开始日期">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">结束日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date3" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="请选择结束日期">
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
				<button class="layui-btn layui-btn-xs" lay-event="add">添加配件内部维修申请表</button>
			</div>
		</script>
<!-- 		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> -->
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
			<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">撤回</a>
			<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="approval">审批详情</a>
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
					elem: '#date1' //指定元素
			        ,done: function(value, date, endDate){
				    	// console.log(value); //得到日期生成的值
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#date2').val() != ''){
				    		$('#date2').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1').val('');}); 
				    	}
				    }
				});
				laydate.render({
					elem: '#date2' //指定元素
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				    	}
			        }
				});
				
				//检索栏数据初始化
				//查询所有部门
// 				$.ajax({
// 					url : "Department/selectDingDepartmentId.action",
// 					type : "post",
// 					data : {},
// 					dataType : "JSON",
// 					success : function(res){
// 						var html = '<option value="">请选择部门</option>';
// 						$.each(res.data,function(index,item){
// 							html += '<option value="'+item.department_Id+'">'+item.department_Name+'</option>';
// 						});
// 						$('#department').html(html);
// 						form.render('select');
// 					}
// 				});

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
					,url: 'Currency/selectApplicantCurrency.action?currency_type=20' //数据接口
					,page: true //开启分页
					,toolbar: '#toolbarDemo'
			    	,title: '配件内部维修申请表'
			    	// ,totalRow: true //开启合计行, totalRowText: '合计'
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_number', title: '流程编号', minWidth:100, sort:true}
 						,{field: 'staff_name', title: '申请人', minWidth:80}
 						,{field: 'department_name', title: '申请部门', minWidth:100}
						,{field: 'currency_date', title: '申请日期', sort: true, minWidth:100,templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
						,{field: 'currency_string7', title: '申请事由', minWidth:200}
						,{field: 'currency_string4', title: '故障描述', minWidth:200}
						,{field: 'currency_string5', title: '申请原因', minWidth:200}
// 						,{field: 'details_string8', title: '企业名称', minWidth:100}
// 						,{field: 'details_string2', title: '配件名称', minWidth:100}
// 						,{field: 'details_string6', title: '规格型号', minWidth:100}
// 						,{field: 'details_string9', title: '用途', minWidth:80}
// 						,{field: 'details_string3', title: '备注', minWidth:80}
						,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:210}
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
							title: '查看明细',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'Currency/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
						});
					} else if(layEvent === 'edit'){ //编辑
						layer.open({
							type: 2,
							title: '配件内部维修申请表修改',
							//shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: '' //iframe的url
						});
				    	//同步更新缓存对应的值
				   		obj.update({
					    	// username: '123'
					    	// ,title: 'xxx'
					    	// 字段 : '要更新的值',
						});
					} else if(layEvent === 'del'){ //撤回
						layer.confirm('确认撤回申请？', function(index){
							//向服务端发送删除指令
							$.ajax({
								url:'Currency/deleteCurrencyApply.action',
								type:'post',
								data:{'currency_id':data.currency_id,'currency_type':data.currency_type},
								dataType:'JSON',
								success:function(result){
									if(result.msg==null || result.msg == ""){
							        	obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							        	layer.close(index);
							        	layer.msg('您的申请已成功撤回',{time: 2000});
									}else{
							        	layer.msg(result.msg);
									}
								}
							});
						});
					} else if(layEvent === 'approval'){ //审批详情
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '审批详情',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'Currency/approvalProgress.action?currency_id='+data.currency_id+"&current_approvalCount="
									+data.current_approvalCount+"&approver_count="+data.approver_count+"&approvalOpinion_type="+data.currency_type
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
								title: '配件内部维修申请表',
								//shadeClose: true,
								shade: 0.8,
								maxmin: true,
								shadeClose: true,
								area: ['80%', '80%'],
								content: 'onlineOperation/partsMaintainRequestForm.action' //iframe的url
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
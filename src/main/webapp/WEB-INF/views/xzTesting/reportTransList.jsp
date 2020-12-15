<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测科绩效管理 -->
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
	<script src="layui_exts/excel.js"></script>
</head>
<body>
<form class="layui-form form-top" action="">
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label label-revise">报告编码 :</label>
			<div class="layui-input-block">
				<input type="text" name="details_string" required  lay-verify="" placeholder="请输入报告编码" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">开始日期 :</label>
			<div class="layui-input-block">
				<input name="details_date2" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="请选择完成日期">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">结束日期 :</label>
			<div class="layui-input-block">
				<input name="details_date3" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="请选择完成日期">
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

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">确认</a>
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
					$('#date2').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				}
			}
		});
		laydate.render({
			elem: '#date2' //指定元素
			,done: function (value, date, endDate) {
				// console.log(value); //得到日期生成的值
				//结束日选好后，判断开始日期是否合法
				if($('#date1').val() != ''){
					$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1').val('');});
				}
			}
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

		//执行一个 table 实例
		table.render({
			elem: '#tab'
			,url: 'Xinze/selectCurrencyDetailsReport.action' //数据接口
			,page: true
			,toolbar: true
			,title: '报告确认列表'
			,totalRow: true
			,cols: [[ //表头
				{fixed: 'left', field: 'details_string', title: '报告编码', minWidth: 120}
				,{field: 'details_string5', title: '是否确认', minWidth: 120,templet:'<div>{{d.details_string5.equals("确认") ? "逾期" : "未逾期"}}</div>'}
				,{field: 'details_string2', title: '报告类型', minWidth: 100}
				,{field: 'details_string4', title: '业务员', minWidth: 100}
				,{field: 'details_date', title: '完成时间', minWidth:120, sort: true, templet:'<div>{{ Format0(d.details_date,"yyyy-MM-dd HH:ss:mm")}}</div>'}
				,{field: 'details_int2', title: '是否逾期', minWidth: 120,templet:'<div>{{d.details_int2 == 1 ? "逾期" : "未逾期"}}</div>'}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:150}
			]]
		});

		//监听工具条
		table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的DOM对象

			if(layEvent === 'detail'){ //查看
				//do somehing
			} else if(layEvent === 'del'){ //删除
				layer.confirm('确认删除', function(index){
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
				});
			} else if(layEvent === 'edit'){ //编辑
				//向服务端发送删除指令
				$.ajax({
					url:'Xinze/confirmReport.action',
					type:'post',
					data:{'currency_details_id':data.currency_details_id,'details_string5':'1'},
					dataType:'JSON',
					success:function(result){
						obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
						layer.close(index);
						layer.msg(result.msg,{time: 2000});
					}
				});
			}
		});

	});
</script>
</body>
</html>
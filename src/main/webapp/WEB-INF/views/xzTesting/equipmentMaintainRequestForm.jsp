<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽设备维修请购单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan="6" class="table-h">信泽设备维修请购单</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">请购单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
				<tr>
					<th colspan=6 style="text-align:center;">基本信息</th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
				<tr>
					<td>设备名称</td>
					<td colspan=2><input type="text" id="parts_name" name="parts_name" placeholder="请务必填写设备名称"  lay-verify="required" /></td>
					<td>故障发生日期</td>
					<td colspan=2><input type="text" name="start_date" class="layui-input date-revise" id="date1" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
				</tr>
				<tr>
					<td>故障描述</td>
					<td colspan=5><input type="text" name="breakdown_describe" placeholder="请务必填写故障描述" lay-verify="required"></td>
				</tr>
				<tr>
					<td>申请原因</td>
					<td colspan=5><input type="text" name="apply_reason" placeholder="请务必填写申请原因" lay-verify="required"></td>
				</tr>
				<tr>
					<td>维修建议厂家</td>
					<td colspan=5><input type="text" name="suggest"></td>
				</tr>
			</tbody>
			<thead>
	 			<tr>
	 				<th colspan=6></th>
				</tr>
		 	</thead>
		</table>
		<div class="layui-form-item button-div">
		 	<div class="layui-input-block">
		 		<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
	        	<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
		 	</div>
		</div>		
		</form>
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
					elem: '#date1' ,//指定元素
					type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				inputRender();//input框自定义渲染
				   
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;
					var parts_name = data.field.parts_name;
					var start_date = data.field.start_date;
					var breakdown_describe = data.field.breakdown_describe;
					var apply_reason = data.field.apply_reason;
					var suggest = data.field.suggest;
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_number':buy_number,
                            'currency_string10':parts_name,//设备名称
                            "currency_date2":start_date,//故障发生日期
                            "currency_string11":breakdown_describe,//故障描述
                            "currency_string7":apply_reason,//申请原因
                            'currency_string13':suggest,
                            "currency_type":46
				 			
				 		}
				 		,dataType : "JSON"
				 		,beforeSend: function(){
					 		layer.msg('正在提交申请', {
					 			icon: 16
					 			,shade: 0.01
					 		});
					 	}
				 		,success : function(result){
				 			layer.msg(result.msg);
                            $('#myForm').addClass('layui-btn-disabled');
                            $('#myForm').attr("disabled",'disabled');
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});
                
    			//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

                //操作
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}

			});
		</script> 
	</body>
</html>
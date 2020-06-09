<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 在线运维部调休申请表 -->
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
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan="6" class="table-h">在线运维部调休申请表</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">流程编号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
		 			<th colspan=6 style="text-align:center;">基本信息</th>
		 		</tr>
		 		<tr>
		 			<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
		 		<tr>
		 			<td>调休开始时间</td>
		 			<td><input type="text" class="layui-input" id="date1" name="starttime" placeholder="请开始时间" lay-verify="required"></td>			
		 			<td>调休结束时间</td>
					<td><input type="text" class="layui-input" id="date2" name="overtime" placeholder="请结束时间" lay-verify="required"></td>
					<td>调休时长</td>
					<td><input type="text" id='days' name="offworkingdays_date" readonly></td>
		 		</tr>
		 		<tr>
		 			<td>申请事由</td>
					<td colspan=5><input type="text" name="request_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
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
					elem: '#date1' //指定元素
					,type: 'datetime'
			        ,done: function(value, date, endDate){
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#date2').val() != ''){
				    		$('#date2').val() >= value ? $('#days').val(getDays(value,$('#date2').val())) : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1').val('');$('#days').val('');});
				    	}
				    }
				});
				laydate.render({
					elem: '#date2' //指定元素
					,type: 'datetime'
			        ,done: function (value, date, endDate) {
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() <= value ? $('#days').val(getDays($('#date1').val(),value)) : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');$('#days').val('');});
				    	}
			        }
				});
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var starttime = data.field.starttime;//调休开始时间
                    var overtime = data.field.overtime;//调休结束时间
                    var offworkingdays_date = data.field.offworkingdays_date;//调休时长
                    var request_reason = data.field.request_reason;//申请事由

                    var currency_type = 26;
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            "currency_date2":starttime,
                            "currency_date3":overtime,
                            "currency_string2":offworkingdays_date,
                            "currency_string7":request_reason,
                            "currency_type":currency_type
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
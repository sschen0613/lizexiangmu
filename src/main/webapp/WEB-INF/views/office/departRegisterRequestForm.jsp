<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 出发登记申请单 -->
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
					<th colspan="6" class="table-h">出发登记申请单</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">流水号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
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
					<td>出发地点</td>
					<td><input type="text" id='departure_point' name="departure_point" placeholder="必填" lay-verify="required"></td>
					<td>目的地</td>
					<td><input type="text" id='destination' name="destination" placeholder="必填" lay-verify="required"></td>
					<td>用车类型</td>
					<td colspan=2>
						<input type="radio" name="car_type" value="1" title="公车" checked>
						<input type="radio" name="car_type" value="2" title="私家车">
					</td>
		 		</tr>
				<tr>
					<td>驾驶员</td>
					<td><input type="text" id='driver' name="driver" placeholder="必填" lay-verify="required"></td>
					<td>公车车牌号</td>
					<td><input type="text" id='publicCar_number' name="publicCar_number"></td>
					<td>私车车牌号</td>
					<td><input type="text" id='privateCar_number' name="privateCar_number"></td>
				</tr>
				<tr>
					<td>设备商及人员</td>
					<td colspan=2><input type="text" name="equipmentProducer_person"></td>
					<td>出发日期</td>
					<td colspan=2><input type="text" class="layui-input" id="date1" name="out_date" autocomplete="off" lay-verify="required"></td>
				</tr>
		 		<tr>
		 			<td>申请事由</td>
					<td colspan=5><input type="text" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
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
			layui.use(['laydate', 'element', 'form'], function(){
				var laydate = layui.laydate //日期
				,element = layui.element //元素操作
				,form = layui.form;

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
                    var buy_number = data.field.buy_number;//流水号
                    var departure_point = data.field.departure_point;//出发地
                    var destination = data.field.destination;//目的地
                    var car_type = data.field.car_type;//用车类型
                    var driver = data.field.driver;//驾驶员
                    var publicCar_number = data.field.publicCar_number;//公车车牌号
                    var privateCar_number = data.field.privateCar_number;//私车车牌号
                    var equipmentProducer_person = data.field.equipmentProducer_person;//设备商
                    var apply_reason = data.field.apply_reason;//申请事由
					var out_date = data.field.out_date;
                    var currency_type = 21;
                    
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
							"currency_number":buy_number,
							"currency_string2":departure_point,
							"currency_string3":destination,
							"currency_int2":car_type,
							"currency_string4":driver,
							"currency_string5":publicCar_number,
							"currency_string9":privateCar_number,
							"currency_string8":equipmentProducer_person,
							"currency_string7":apply_reason,
							"currency_date2":out_date,
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
                //监听车牌输入框输入正确车牌格式
				inputLimitCarPlate($('#publicCar_number'));//公车车牌号
				inputLimitCarPlate($('#privateCar_number'));//私车车牌号
				
			});
		</script> 
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 出发登记申请-手机端 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/mobile.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/iconfont.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="container-apply">
			<div class="approval-list-title">
				<a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
				<h2 class="">出发登记申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'office/mDepartRegisterRequestList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">流水号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请人 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_applicant" id="staffName" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请部门 :</label>
						<div class="layui-input-block">
							<input type="text" name="department_Id" id="department" class="layui-input" readonly>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">申请日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_date" id="date" class="layui-input" readonly>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">出发地点 :</label>
						<div class="layui-input-block">
							<input type="text" name="departure_point" id="departure_point" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">目的地 :</label>
						<div class="layui-input-block">
							<input type="text" name="destination" id="destination" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">用车类型 :</label>
						<div class="layui-input-block">
							<input type="radio" name="car_type" value="1" title="公车" checked>
							<input type="radio" name="car_type" value="2" title="私家车">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">驾驶员 :</label>
						<div class="layui-input-block">
							<input type="text" name="driver" id="driver" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">公车车牌号 :</label>
						<div class="layui-input-block">
							<input type="text" name="publicCar_number" id="publicCar_number" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">私车车牌号 :</label>
						<div class="layui-input-block">
							<input type="text" name="privateCar_number" id="privateCar_number" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">设备商及人员 :</label>
						<div class="layui-input-block">
							<input type="text" name="equipmentProducer_person" id="equipmentProducer_person" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">出发日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="out_date" id="date1" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">申请事由 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="request_reason" placeholder="请务必填写申请事由" lay-verify="required"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
						</div>
					</div>
				</form>
			</div>
		</div>
    	<script type="text/javascript">
            layui.use(['form','element','layer','laydate' ],function(){
                var form = layui.form
                ,element = layui.element
                ,layer = layui.layer
                ,laydate = layui.laydate;

                //表单更新渲染
				form.render();
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				//执行一个laydate实例
                
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
                    var request_reason = data.field.request_reason;//申请事由
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
                            "currency_string7":request_reason,
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
                            $('#myForm').attr("disabled", "disabled");
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});
                
    			//表单初始化
                //获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);
            	
            	//操作
                
            	
            });
        </script>
	</body>
</html>
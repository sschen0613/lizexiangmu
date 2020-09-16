<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 员工补卡申请-手机端 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/mobile.css">
		<link rel="stylesheet" href="formselect/formSelects-v4.css" />
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/iconfont.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="formselect/formSelects-v4.min.js"></script>
	</head>
	<body>
		<div class="container-apply">
			<div class="approval-list-title">
				<a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
				<h2 class="">员工补卡申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'office/mCardReplacementList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action=""   method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">请购单号 :</label>
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
						<label class="layui-form-label">补卡日期 :</label>
						<div class="layui-input-block">
							<input name="currency_date2" type="text" class="layui-input date-revise" id="date1" placeholder="请选择日期">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">时间段 :</label>
						<div class="layui-input-block">
							<select class="layui-select" name="use_type" id="use_type" lay-filter="use_type" lay-verify="required">
								<option value="">请选择</option>
								<option value="上午">上午</option>
								<option value="下午">下午</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">时间点 :</label>
						<div class="layui-input-block">
							<select class="layui-select" name="use_company" id="use_company" lay-filter="use_company" lay-verify="required">
								<option value="">请选择</option>
								<option value="上班补卡">上班补卡</option>
								<option value="下班补卡">下班补卡</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<input type="text" name="remark" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary" lay-filter="resetForm">重置</button>
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
				var formSelects = layui.formSelects;
                //表单更新渲染
				form.render();
				form.render('select');
				formSelects.render('seal_type');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
				});
				
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var currency_date2 = data.field.currency_date2;//补卡日期
					var use_type = data.field.use_type;//时间段
					var use_company = data.field.use_company;//时间点
					var remark = data.field.remark;
					var currency_type = 76;//1是当前审批请求的类型,审批管理主键id;

					$.ajax({
						url : "Currency/launchCurrencyApply.action"
						,type : "post"
						,data : {
							'currency_type':currency_type//
							,'currency_date2':currency_date2//补卡日期
							,'currency_string2':use_type//时间段
							,'currency_string3':use_company//时间点
							,'currency_string7':remark//备注
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
                
            });
        </script>
	</body>
</html>
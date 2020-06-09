<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 业务招待申请表 -->
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
					<th colspan=6 class="table-h">业务招待申请表</th>
				</tr>
				<tr>
					<th colspan=6 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>客人单位</td>
					<td colspan=2><input name="unit" id="unit" lay-filter="unit" lay-search lay-verify="required"></td>
					<td>客人人数</td>
					<td colspan=2><input type="text" id="person_number" name="person_number" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required" lay-verify="required"></td>
				</tr>
				<tr>
					<td>陪同人</td>
					<td colspan=3><input type="text" name="accompanying_person" lay-verify="required"></td>
					<td>招待时间</td>
					<td colspan=1><input type="text" name="serve_date" id="date1" lay-verify="required"></td>
				</tr>
				<tr>
					<td>招待事由</td>
					<td colspan=5><input type="text" name="serve_reason" placeholder="请务必填写招待事由" lay-verify="required"></td>
				</tr>
				<tr>
					<td>申请金额</td>
					<td colspan=2>
						<!-- 限制金额必须是数字 -->
						<input id="amount" type="text" name="applied_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
					</td>
					<td>申请金额大写</td>
					<td colspan=2><input id="amountCapitals" type="text" name="applied_ChineseAmount" readonly></td>
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
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var unit = data.field.unit;//单位
					var person_number = data.field.person_number;//客户数量
					var accompanying_person = data.field.accompanying_person;//陪同人
					var serve_reason = data.field.serve_reason;//招待事由
					var applied_amount = data.field.applied_amount;//申请金额
					var applied_ChineseAmount = data.field.applied_ChineseAmount;//金额大写

					var serve_date = data.field.serve_date;//招待时间
					     	
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"//数据接口
				 		,type : "post"
				 		,data : {
							"currency_string4":unit,
							"currency_int6":person_number,
							"currency_string8":accompanying_person,
							"currency_string7":serve_reason,
							"currency_money6":applied_amount,
							"currency_type":30,
							"currency_string5":applied_ChineseAmount,
							"currency_date2":serve_date

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
				//获取客人单位
				/* $.ajax({
					url:'System/selectAllUser.action',
					type:'post',
					data:{},
					dataType:'JSON',
					success:function(res){
						var html = '<option value="">请选择客人单位</option>';
						$.each(res.data,function(index,item){
							html += '<option value="'+item.cCusName+'">'+item.cCusName+'</option>';
						});
						$('#unit').html(html);
						form.render('select');
					}
				}); */

                //操作
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}
				//限制客人人数只允许输入整数
				inputLimitInteger($('#person_number'));
                //金额自动翻译成大写且金额保留两位小数
                inputLimitAmount($("#amount"),$('#amountCapitals'));

			});
		</script> 
		<script>
             
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 公章使用申请单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<link rel="stylesheet" href="formselect/formSelects-v4.css" />
		<script src="layui/layui.js"></script>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="js/ajaxfileupload.js"></script>
		<script src="formselect/formSelects-v4.min.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=7 class="table-h">公章使用申请单</th>
				</tr>
				<tr>
					<th colspan=7 style="text-align:right">申请单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请部门</td>
					<td><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请人</td>
					<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
					<td>申请日期</td>
					<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>使用方式</td>
					<td>
						<select  id='use_type' name="use_type" lay-filter="use_type" class="layui-select" lay-verify="required">
							<option value="">请选择</option>
							<option value="盖章">盖章</option>
							<option value="外带">外带</option>
						</select>
					</td>
					<td>使用公司</td>
					<td><input type="text" id="use_company" name="use_company" class="layui-input" lay-verify="required"></td>
					<td>公章类型</td>
					<td>
						<select  id='seal_type' name="seal_type" xm-select="seal_type" xm-select-skin="default" lay-verify="required">
							<option value="">请选择</option>
							<option value="法人章">法人章</option>
							<option value="合同章">合同章</option>
							<option value="公章">公章</option>
						</select>
					</td>
				</tr>
				<tr class="back" style="display: none">
					<td>归还日期</td>
					<td colspan=5><input name="currency_date2" type="text" class="layui-input date-revise" id="date2" placeholder="请选择日期"></td>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan="5"><input type="text" id="request_reason" name="request_reason" class="layui-input" lay-verify="required"></td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan="5"><input type="text" id="remark" name="remark" class="layui-input"></td>
				</tr>
			</tbody>
			<thead>
				<tr>
					<td>上传图片</td>
					<td><input type="file" id="pics" name="pics" multiple="multiple"></td>
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
				var formSelects = layui.formSelects;
				
				//表单更新渲染
				form.render();
				form.render('select');
				formSelects.render('seal_type');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date2' //指定元素
					,trigger: 'click'
				});
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					var use_type = data.field.use_type;//事由方式
					var use_company = data.field.use_company;//使用公司
					var seal_type = formSelects.value('seal_type','valStr');
					//var seal_type = data.field.seal_type;//公章类型
					var currency_date2 = data.field.currency_date2;//归还日期
					var request_reason = data.field.request_reason;//申请事由
					var remark = data.field.remark;
					var currency_type = 72;//1是当前审批请求的类型,审批管理主键id;

					var myForm = new FormData();
					myForm.set("currency_type",currency_type);
					myForm.set("currency_string2",use_type);
					myForm.set("currency_string3",use_company);
					myForm.set("currency_string4",seal_type);
					myForm.set("currency_date2",currency_date2);
					myForm.set("currency_string5",request_reason);
					myForm.set("currency_string7",remark);
					for(let i = 0;i < $("#pics")[0].files.length;i++){
						myForm.append("pics",$("#pics")[0].files[i])
					}

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : myForm
						,contentType: false
						,processData: false
						,cache:false
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

				form.on('select(use_type)', function(data){
					var use_type = data.value; //合同编号
					if ("盖章" == use_type){

						$(".back").hide();
						$("#date2").attr("lay-verify","");
						$("#date2").val("");
					}else if ("外带" == use_type){
						$(".back").show();
						$("#date2").attr("lay-verify","required");
						$("#date2").val("");
					}
				});

				//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

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
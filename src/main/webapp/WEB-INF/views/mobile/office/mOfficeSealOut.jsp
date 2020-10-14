<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 公章使用申请-手机端 -->
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
				<h2 class="">公章使用申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'office/mOfficeSealOutList.action';">查看申请记录</li>
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
						<label class="layui-form-label">使用方式 :</label>
						<div class="layui-input-block">
							<select class="layui-select" name="use_type" id="use_type" lay-filter="use_type" lay-verify="required">
								<option value="">请选择</option>
								<option value="盖章">盖章</option>
								<option value="外带">外带</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">使用公司 :</label>
						<div class="layui-input-block">
							<select class="layui-select" name="use_company" id="use_company" lay-filter="use_company" lay-verify="required">
								<option value="">请选择</option>
								<option value="丽泽">丽泽</option>
								<option value="信泽">信泽</option>
								<option value="天人">天人</option>
								<option value="菏泽">菏泽</option>
								<option value="滨州">滨州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">公章类型 :</label>
						<div class="layui-input-block">
							<select name="seal_type" id="seal_type" xm-select="seal_type" xm-select-skin="default" lay-verify="required">
								<option value="">请选择</option>
								<option value="法人章">法人章</option>
								<option value="合同章">合同章</option>
								<option value="公章">公章</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">材料类型 :</label>
						<div class="layui-input-block">
							<select class="layui-select" name="doc_type" id="doc_type" lay-filter="doc_type" lay-verify="required">
								<option value="">请选择</option>
								<option value="故障报告">故障报告</option>
								<option value="其他">其他</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item back" style="display: none">
						<label class="layui-form-label">归还日期 :</label>
						<div class="layui-input-block">
							<input name="currency_date2" type="text" class="layui-input date-revise" id="date1" placeholder="请选择日期">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请事由 :</label>
						<div class="layui-input-block">
							<input type="text" name="request_reason" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<input type="text" name="remark" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">上传图片 :</label>
						<div class="layui-input-block">
							<input type="file" id="pics" name="pics" accept="image/*" capture="camera" multiple lay-verify="required">
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
					var use_type = data.field.use_type;//事由方式
					var use_company = data.field.use_company;//使用公司
					var seal_type = formSelects.value('seal_type','valStr');
					var doc_type = data.field.doc_type;//公章类型
					var currency_date2 = data.field.currency_date2;//归还日期
					var request_reason = data.field.request_reason;//申请事由
					var remark = data.field.remark;
					var currency_type = 72;//1是当前审批请求的类型,审批管理主键id;

					var myForm = new FormData();
					myForm.set("currency_type",currency_type);
					myForm.set("currency_string2",use_type);
					myForm.set("currency_string3",use_company);
					myForm.set("currency_string4",seal_type);
					myForm.set("currency_string8",doc_type);
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
					}else{
						$(".back").hide();
						$("#date2").attr("lay-verify","");
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
                
            });
        </script>
	</body>
</html>
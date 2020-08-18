<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽其他合同盖章申请单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="js/ajaxfileupload.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open"  enctype="multipart/form-data" method="post" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=9 class="table-h">其他合同盖章申请单</th>
				</tr>
		 	</thead>
		 	<tbody >
		 		<tr>
		 			<td>说明</td>
		 			<td colspan=6><input type="text" name="illustration" value="用于其他合同盖章申请" readonly></td>
		 		</tr>
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
					<td>合同类型</td>
					<td>
						<select id="contractType" name="contractType" lay-search lay-verify="required">
							<option value="">请选择</option>
							<option value="制式">制式</option>
							<option value="非制式">非制式</option>
						</select>
					</td>
					<td>签约单位</td>
					<td><input type="text" name="company" id="company"></td>
					<td>签约内容</td>
					<td><input type="text" name="content" id="content"></td>
		 		</tr>
				<tr>
					<td>合同总金额</td>
					<td colspan=1><input type="text" id="contract_amount" name="contract_amount" ></td>
					<td>已收/付金额</td>
					<td colspan=1><input type="text" id="actual_receipt" name="actual_receipt" ></td>
					<td>未收/付金额</td>
					<td><input type="text" id="outstanding_receipt" name="outstanding_receipt" ></td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan=5><input type="text" name="remark"></td>
				</tr>
		 	</tbody>
			<thead>
				<tr>
					<td>上传图片</td>
					<td><input type="file" id="pics" name="pics" multiple="multiple" lay-verify="required"></td>
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
					//,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					//var buy_number = data.field.buy_number; //请购单号
					var illustration = data.field.illustration; //说明

					var contractType = data.field.contractType;//合同类型
                    var content = data.field.content; //签约内容
                    var company = data.field.company; //签约单位

                    var contract_amount = data.field.contract_amount;
                    var actual_receipt = data.field.actual_receipt;
                    var outstanding_receipt = data.field.outstanding_receipt;

					var remark = data.field.remark;//备注
					
					var currency_type = 63;

                    var myForm = new FormData();
                    myForm.set("currency_type",currency_type);
                    myForm.set("currencyDate",currencyDate);
                    myForm.set("currency_string",illustration);
					myForm.set("currency_string4",contractType);//合同类型
                    myForm.set("currency_string2",company);
                    myForm.set("currency_string3",content);
                    myForm.set("currency_string10",contract_amount);
                    myForm.set("currency_string11",actual_receipt);
                    myForm.set("currency_string12",outstanding_receipt);
					myForm.set("currency_string13",remark);

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
        		
    			//表单数据初始化
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
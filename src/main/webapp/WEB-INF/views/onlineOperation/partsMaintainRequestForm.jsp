<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 配件内部维修申请表 -->
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
					<th colspan="6" class="table-h">配件内部维修申请表</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">流水号：<input type="text" id='buy_number' name="buy_number"> </th>
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
					<td>申请事由</td>
					<td colspan=5><input type="text" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
				</tr>
				<tr>
					<td>故障描述</td>
					<td colspan=5><input type="text" name="breakdown_describe" placeholder="请务必填写故障描述" lay-verify="required"></td>
				</tr>
				<tr>
					<td>申请原因</td>
					<td colspan=5><input type="text" name="proposer_for" placeholder="请务必填写申请原因" lay-verify="required"></td>
				</tr>
		 		<tr>	
					<td>企业名称</td>
					<td>配件名称</td>
					<td>规格型号</td>
					<td>用途</td>
					<td>备注</td>	
					<td>操作</td>		
				</tr>
				<tr class="details">
					<td><select name="enterprise" id="enterprise1" lay-filter="enterprise" lay-search lay-verify="required"></select></td>
					<td><input type="text" name="parts_name"></td>
					<td><input type="text" name="specifications_models"></td>
					<td><input type="text" name="service_character"></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
			<thead>
				<tr>
		 			<td colspan=6 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
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
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;   
					var apply_reason = data.field.apply_reason;
					var breakdown_describe = data.field.breakdown_describe;
					var proposer_for = data.field.proposer_for;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var enterprise_name = $(item).find('select[name="enterprise"]').val();
                        var equipment_name = $(item).find('input[name="parts_name"]').val();
                        var specifications_models = $(item).find('input[name="specifications_models"]').val();
                        var service_character = $(item).find('input[name="service_character"]').val();
                        var remark = $(item).find('input[name="remark"]').val();

						var obj = {'details_string8':enterprise_name,'details_string2':equipment_name,'details_string6':specifications_models
								,'details_string9':service_character,'details_string3':remark};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url :"Currency/launchCurrencyApply.action"
				 		,type :"post"
				 		,data :{
				 			'currency_type':20,
				 			'currency_number':buy_number,
				 			'currency_string7':apply_reason,
				 			'currency_string4':breakdown_describe,
				 			'currency_string5':proposer_for,
				 			'currencyDetails':JSON.stringify(currentDetails)
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
				//查询所有企业名称
				var enterprise_name_html = '';
                $.ajax({
                    url: 'System/selectAllUser.action',
                    type: 'post',
                    data: {},
                    dataType: 'JSON',
                    success: function (res) {
                        var html = '<option value="">请选择企业名称</option>';
                        $.each(res.data, function (index, item) {
                            html += '<option value="' + item.cCusName + '">' + item.cCusName + '</option>'
                        });
                        enterprise_name_html = html;
                        $('#enterprise1').html(html);
                        form.render('select');
                    }
                });
				
                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><select name="enterprise" id="enterprise'+d_count+'" lay-filter="enterprise" lay-search lay-verify="required">'+enterprise_name_html+'</select></td>'
				 			 +	'<td><input type="text" name="parts_name"></td>'
				 			 +	'<td><input type="text" name="specifications_models"></td>'
				 			 +	'<td><input type="text" name="service_character"></td>'
				 			 +	'<td><input type="text" name="remark"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
					form.render();
				}
				//行删除事件
                function deleteItem($demo){
                	deleteDetailsItem1($demo);
                }
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
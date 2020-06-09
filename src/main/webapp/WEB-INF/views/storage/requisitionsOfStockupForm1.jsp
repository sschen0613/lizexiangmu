<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 安装组请购单 -->
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
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=9 class="table-h">其他类请购单</th>
				</tr>
				<tr>
	 				<th colspan=9 style="text-align:right">请购单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >
		 		<tr>
		 			<td>说明</td>
		 			<td colspan=8><input type="text" name="illustration" value="用于丽泽公司其他类（包含设备、配件）" readonly></td>
		 		</tr>
		 		<tr>
		 			<th colspan=9 style="text-align:center;">基本信息</th>
		 		</tr>
		 		<tr>
		 			<td>申请人</td>
		 			<td colspan=2><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
		 		<tr>
		 			<td>期望到货日期</td>
		 			<td colspan=8><input name="expectedDelivery_date" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off"></td>
		 		</tr>
		 		<tr>
		 			<th colspan=9 style="text-align:center;">明细信息</th>
		 		</tr>
		 		<tr>
		 			<td>序号</td>
		 			<td colspan="3">商品名称</td>
		 			<td colspan="2">规格型号</td>
		 			<td colspan="2">请购数量</td>
		 			<td>操作</td>
		 		</tr>
		 		<tr class="details">
		 			<td><input type="text" name="number" value="1" readonly></td>
					<td colspan="3"><input type="text" id='product_name' name="product_name" lay-verify="required"></td>
		 			<td colspan="2"><input type="text" name="specifications_models"></td>
		 			<td colspan="2"><input type="text" id="buy_quantity1" name="buy_quantity" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
		 			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		 		</tr>
		 	</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=9 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=9></th>
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
				detailsRender(1); //明细信息第一行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number; //请购单号
					var illustration = data.field.illustration; //说明
					var expectedDelivery_date = data.field.expectedDelivery_date; //期望到货日期
					
					var currency_type = 68;
					var price = 0, currentDetails = [];
					$.each($('.details'),function(index,item){
						var number = $(item).find('input[name="number"]').val(); //序号
						var product_name = $(item).find('input[name="product_name"]').val(); //商品名称
						var specifications_models = $(item).find('input[name="specifications_models"]').val(); //规格型号
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val()); //请购数量

                        var obj = {'details_string':number
								,'details_string5':product_name
								,'details_string6':specifications_models
								,'details_money':buy_quantity
								};
                        currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			"currency_money6":price
				 			,"currency_type":currency_type
				 			,"currency_date":currencyDate
				 			,"currency_number":buy_number
				 			,"currency_string":illustration
				 			,"currency_date3":expectedDelivery_date
				 			,"currencyDetails":JSON.stringify(currentDetails)
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
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
				 			 +	'<td colspan="3">'
							 +		'<input type="text" id="product_name" name="product_name"  lay-verify="required">'
							 +	'</td>'
				 			 +	'<td colspan="2"><input type="text" name="specifications_models"></td>'
				 			 +	'<td colspan="2"><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender(); //input框自定义渲染
				});
				//明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                    //searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
				//行删除事件
				function deleteItem($demo){
					deleteDetailsItem2($demo);
				}
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}
				//过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
				}

			});
		</script> 
	</body>
</html>
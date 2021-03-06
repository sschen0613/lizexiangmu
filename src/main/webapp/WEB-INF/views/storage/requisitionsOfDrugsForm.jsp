<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 实验室药品请购申请单 -->
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
					<th colspan=7 class="table-h">实验室药品请购申请单</th>
				</tr>
				<tr>
					<th colspan=7 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan=6><input type="text" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
				</tr>
				<tr>
					<td>技术要求</td>
					<td colspan=6><input type="text" name="technical_requirements" placeholder="请务必填写技术要求" lay-verify="required"></td>
				</tr>
				<tr>
					<td>其它说明</td>
					<td colspan=6><input type="text" name="other_description"></td>
				</tr>
				<tr>
					<td>物品名称</td>
					<td>规格型号</td>
					<td>单位</td>
					<td>申请数量</td>
					<td>库存数量</td>
					<td>使用科室</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td id="container1" class="container container1">
						<input id='product_name' type="text" name="product_name" class="search-box" placeholder="商品名称" lay-verify="required">
					</td>
					<td><input type="text" name="specifications_models"></td>
					<td><input type="text" name="unit" lay-verify="required"></td>
					<td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
					<td><input type="text" name="inventory_quantity" lay-verify="required"></td>
					<td><select name="administrative_office" id="administrative_office" lay-filter="administrative_office"  lay-verify="required"></select></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=7 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=7></th>
				</tr>
				<tr>
					<td>上传附件</td>
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

                var flag = '${param.flag}';

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
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;
					var apply_reason = data.field.apply_reason;
					var technical_requirements = data.field.technical_requirements;
					var other_description = data.field.other_description;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var administrative_office = $(item).find('select[name="administrative_office"]>option:selected').text();

						var obj = {'details_string2':product_name,'details_string6':specifications_models,'details_string7':unit
								,'details_money':buy_quantity,'details_money2':inventory_quantity,'details_string8':administrative_office};
						currentDetails.push(obj);
					});

                    var myForm = new FormData();
                    myForm.set("currency_type",17);
                    myForm.set("currency_number",buy_number);
                    myForm.set("currency_string7",apply_reason);
                    myForm.set("currency_string8",technical_requirements);
                    myForm.set("currency_string9",other_description);
                    myForm.set("currency_string10",flag);
                    myForm.set("currencyDetails",JSON.stringify(currentDetails));
                    for(let i = 0;i < $("#pics")[0].files.length;i++){
                        myForm.append("pics",$("#pics")[0].files[i])
                    }

                    $.ajax({
                        url : "Currency/launchCurrencyApply.action"
                        ,type : "POST"
                        ,data : myForm
                        ,contentType: false
                        ,processData: false
                        ,cache:false
                        ,dataType : "JSON"
                        ,beforeSend: function(){
                            console.log(myForm.get("pics"));
                            console.log(myForm.get("currencyDetails"));
                            layer.msg('正在提交申请', {
                                icon: 16
                                ,shade: 0.01
                            });
                        }
                        ,success : function(result){
                            layer.msg(result.msg);
                            $('#myForm').addClass('layui-btn-disabled');
                            $('#myForm').attr("disabled", 'disabled');
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
				var information_html = '';
				$.ajax({
 					url : "System/selectCDepCode.action",
 					type : "post",
 					data : {},
 					dataType : "JSON",
 					success : function(res){
						var html = '<option value="">请选择科室</option>';
						$.each(res.data,function(index,item){
							html += '<option value="'+item.cDepCode+'">'+item.cDepName+'</option>';						
						});
						information_html = html;
						$('#administrative_office').html(html);
						form.render('select');
					}
				});
                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
							 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
							 +		'<input id="product_name" type="text" name="product_name" class="search-box" placeholder="输入商品名称" lay-verify="required">'
							/* +		'<div class="list-container" style="display:none;">'
				             +   		'<ul></ul>'
				             +		'</div>'*/
							 +	'</td>'
				 			 +	'<td><input type="text" name="specifications_models"></td>'
				 			 +	'<td><input type="text" name="unit" lay-verify="required" ></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="inventory_quantity" lay-verify="required"></td>'
				 			+	'<td><select name="administrative_office" lay-filter="administrative_office"  lay-verify="required">'+information_html+'</select></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
					form.render('select');
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
					searchInventoryQuantity($('.container'+index));//为每一行绑定查询库存数量
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
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
				//过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
				}
				function searchInventoryQuantity($demo){
                    productInventoryQuantity($demo);
                }

			});
		</script> 
	</body>
</html>
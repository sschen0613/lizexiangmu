<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人公司销售合同发票开具请购单 -->
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
					<th colspan=7 class="table-h">天人销售合同开票单</th>
				</tr>
				<tr>
					<th colspan=7 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number"> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th colspan=7 style="text-align: center;">基本信息</th>
				</tr>
				<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>所属区域</td>
					<td colspan=2><input type="text" name="area" id="area" lay-verify="required"></td>
					<td>客户名称</td>
					<td colspan=3><input type="text" name="customer_name" id="customer_name" lay-verify="required"></td>
				</tr>
				<tr>
					<td>开票名称</td>
					<td colspan=6><input type="text" name="invoice_name" id="invoice_name" lay-verify="required"></td>
				</tr>
				<tr>
					<td>税号（社会统一信用码）</td>
					<td colspan=6><input type="text" name="tax_number" id="tax_number" lay-verify="required"></td>
				</tr>
				<tr>
					<td>地址</td>
					<td colspan=2><input type="text" id="site" name="site" lay-verify="required"></td>
					<td>电话</td>
					<td colspan=3><input type="text" id="telephone" name="telephone" lay-verify="required"></td>
				</tr>
				<tr>
					<td>开户行</td>
					<td colspan=2><input type="text" id="bank" name="bank" lay-verify="required"></td>
					<td>账号</td>
					<td colspan=3><input type="text" id="account" name="account" lay-verify="required"></td>
				</tr>
				<tr>
					<td>合同总金额</td>
					<td colspan=2><input type="text" id="contract_totalamount" name="contract_totalamount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td>实际收款</td>
					<td><input type="text" id="actual_receipt" name="actual_receipt" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td>欠款金额</td>
					<td><input type="text" id="outstanding_receipt" name="outstanding_receipt" lay-verify="required"></td>
				</tr>
				<tr>
					<td>已开票金额</td>
					<td colspan=2><input type="text" id="alreadyInvoice_amount" name="alreadyInvoice_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
					<td>申请开票金额</td>
					<td><input type="text" id="applyInvoice_amount" name="applyInvoice_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td>发票类型</td>
					<td><select name="invoice_type"><option value="1">普通发票</option><option value="2">专用发票</option></select></td>
				</tr>
				<tr>
					<td>开票事由</td>
					<td colspan=6><input type="text" name="invoice_reason" placeholder="请务必填写开票事由" lay-verify="required"></td>
				</tr>
				<tr>
					<th colspan=7 style="text-align: center;">明细信息</th>
				</tr>
				<tr>
					<td>货物名称</td>
					<td>型号</td>
					<td>单位</td>
					<td>数量</td>
					<td>金额</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" id='product_name' name="product_name"  lay-verify="required"></td>
					<td><input type="text" name="specifications_models" lay-verify="required"></td>
					<td><input type="text" name="unit" lay-verify="required"></td>
					<td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
					<td><input type="text" id="sum1" name="unit_price" lay-verify="required"></td>
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
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;
                    var area = data.field.area;
                    var customer_name = data.field.customer_name;
					var invoice_name = data.field.invoice_name;
					var tax_number = data.field.tax_number;
					var site = data.field.site;
					var telephone = data.field.telephone;
					//bankAndAccount
					var bank = data.field.bank;//开户行
					var account = data.field.account;//账号
					//payment_agreement //合同付款约定
					var contract_totalamount = Number(data.field.contract_totalamount);
					var actual_receipt = Number(data.field.actual_receipt);
					var outstanding_receipt = Number(data.field.outstanding_receipt);
					var alreadyInvoice_amount = Number(data.field.alreadyInvoice_amount);
					var applyInvoice_amount = Number(data.field.applyInvoice_amount);
					var invoice_type = data.field.invoice_type;

					var invoice_reason = data.field.invoice_reason;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var product_name = $(item).find('input[name="product_name"]').val();
						/*var brand = Number($(item).find('input[name="brand"]').val());*/
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var sum = Number($(item).find('input[name="unit_price"]').val());

						var obj = {'details_string5':product_name,'details_string6':specifications_models
								,'details_string7':unit,'details_money':quantity,'details_money4':sum};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			'currency_type':70,
				 			'currency_number':buy_number,
				 			'currency_string2':area,  //区域
				 			'currency_string3':customer_name,//客户名称
				 			'currency_string5':invoice_name,
				 			'currency_string7':tax_number,
				 			'currency_string8':site,
				 			'currency_string9':telephone,
				 			'currency_string10':bank,//开户行
				 			'currency_string11':account,//账号
				 			'currency_money':contract_totalamount,
				 			'currency_money2':actual_receipt,
				 			'currency_money3':outstanding_receipt,
				 			'currency_string12':alreadyInvoice_amount,
				 			'currency_string13':applyInvoice_amount,
				 			'currency_int5':invoice_type,
				 			'currency_string14':invoice_reason,
				 			'currencyDetails':JSON.stringify(currentDetails)}
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
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款

                $("#contract_totalamount").on("input",function(e){
                    var contractAmount = Number($("#contract_totalamount").val());//合同金额
                    var acceptAmount = Number($('#actual_receipt').val());//已收金额
					if (contractAmount != null && acceptAmount!= null){
                        $('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
					}
                });

                $("#actual_receipt").on("input",function(e){
                    var contractAmount = Number($("#contract_totalamount").val());//合同金额
                    var acceptAmount = Number($('#actual_receipt').val());//已收金额
                    if (contractAmount != null && acceptAmount!= null){
                        $('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
                    }
                });

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
							 +		'<input type="text" id="product_name" name="product_name" lay-verify="required">'
							 +	'</td>'
				 			 +	'<td><input type="text" name="specifications_models"></td>'
				 			 +	'<td><input type="text" name="unit"></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td><input type="text" id="sum'+d_count+'" name="unit_price" lay-verify="required"></td>'
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
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				    //inputLimitAmount0($('#sum'+index));////监听金额输入框只允许输入数字(小数点后保留两位)
				}
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
        		//监听金额输入框只允许输入数字(小数点后保留两位)
                inputLimitAmount0($('#contract_totalamount'));//合同总金额
                inputLimitAmount0($('#actual_receipt'));//已收款金额
				inputLimitAmount0($('#alreadyInvoice_amount'));//已开票金额
				inputLimitAmount0($('#applyInvoice_amount'));//申请开票金额
				//监听电话输入框输入正确格式
				inputLimitPhone($('#telephone'));
			});
		</script> 
	</body>
</html>
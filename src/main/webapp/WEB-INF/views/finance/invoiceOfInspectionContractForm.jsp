<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽公司检测合同发票开具请购单 -->
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
					<th colspan=6 class="table-h">信泽公司检测合同发票开具请购单</th>
				</tr>
				<tr>
					<th colspan=6 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th colspan=6 style="text-align: center;">基本信息</th>
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
					<td>所属区域</td>
					<td colspan=2><select name="area" id="area" lay-filter="area" lay-search disabled></select></td>
					<td>客户名称</td>
					<td colspan=2><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>合同编号</td>
					<td colspan=5><select name="contract_id" id="contract_id" lay-filter="contract_id" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>开票名称</td>
					<td colspan=5><input type="text" name="invoice_name" id="invoice_name" ></td>
				</tr>
				<tr>
					<td>税号（社会统一信用码）</td>
					<td colspan=5><input type="text" name="tax_number" id="tax_number" ></td>
				</tr>
				<tr>
					<td>地址</td>
					<td colspan=2><input type="text" id="site" name="site" ></td>
					<td>电话</td>
					<td colspan=2><input type="text" id="telephone" name="telephone" ></td>
				</tr>
				<tr>
					<td>开户行</td>
					<td colspan=2><input type="text" id="bank" name="bank" ></td>
					<td>账号</td>
					<td colspan=2><input type="text" id="account" name="account" ></td>
				</tr>
				<tr>
		 			<th colspan="6" style="text-align: center;">合同付款约定</th> <!--payment_agreement-->
		 		</tr>
				<tr class="contract">
					<th colspan=1>合同条款名称</th>
					<th colspan=5>合同条款内容</th>
				</tr>
				<tr>
					<td>合同总金额</td>
					<td><input type="text" id="contract_amount" name="contract_totalamount" readonly></td>
					<td>实际收款</td>
					<td><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
					<td>欠款金额</td>
					<td><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
				</tr>
				<tr>
					<td>已开票金额</td>
					<td><input type="text" id="alreadyInvoice_amount" name="alreadyInvoice_amount" readonly></td>
					<td>申请开票金额</td>
					<td><input type="text" id="applyInvoice_amount" name="applyInvoice_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td>发票类型</td>
					<td><select name="invoice_type"><option value="1">普通发票</option><option value="2">专用发票</option></select></td>
				</tr>
				<tr>
					<td>期初合同已收款</td>
					<td colspan="2"><input type="text" id="moneyBegin" name="moneyBegin" readonly></td>
					<td>期初合同已开票</td>
					<td colspan="2"><input type="text" id="invoiceBegin" name="invoiceBegin" readonly></td>
				</tr>
				<tr>
					<td>费用类型</td>
					<td colspan=5><select name="cost_type"><option value="1">检测费</option><option value="2">技术服务费</option></select></td>
				</tr>
				<tr>
					<td>开票事由</td>
					<td colspan=5><input type="text" name="invoice_reason" placeholder="请务必填写开票事由" lay-verify="required"></td>
				</tr>
				<tr>
					<th colspan=6 style="text-align: center;">核对开票信息</th>
				</tr>
				<tr>
					<td>开票信息是否一致</td>
					<td colspan=5>
						<input type="radio" name="invoice_if" value="1" title="是" checked>
						<input type="radio" name="invoice_if" value="2" title="否">
					</td>
				</tr>
			</tbody>	
		 	<thead>
	 			<tr>
	 				<th colspan=6></th>
				</tr>
		 	</thead>
		</table>
		<div class="form-notes">
			<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号的顺序进行选择</i>
		</div>
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
                    $("#area").removeAttr("disabled");
					var buy_number = data.field.buy_number;
					var area = $('#area').find('option:selected').text();
					var customer_name = $('#customer_name').find('option:selected').text();
					var contract_id = data.field.contract_id;
					var invoice_name = data.field.invoice_name;
					var tax_number = data.field.tax_number;
					var site = data.field.site;
					var telephone = data.field.telephone;
                    var bank = data.field.bank;//开户行
                    var account = data.field.account;//账号
					var contract_totalamount = Number(data.field.contract_totalamount);
					var actual_receipt = Number(data.field.actual_receipt);
					var outstanding_receipt = Number(data.field.outstanding_receipt);
					var alreadyInvoice_amount = Number(data.field.alreadyInvoice_amount);
					var applyInvoice_amount = Number(data.field.applyInvoice_amount);
					var invoice_type = data.field.invoice_type;
					var cost_type = data.field.cost_type;
					var invoice_reason = data.field.invoice_reason;
					var invoice_if = data.field.invoice_if;

                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额
                    var invoiceBegin = data.field.invoiceBegin;//客户付款已开票金额
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			'currency_type':29,
				 			'currency_number':buy_number,
				 			'currency_string2':area,  //区域
				 			'currency_string3':customer_name,
				 			'currency_string4':contract_id,
				 			'currency_string5':invoice_name,
				 			'currency_string7':tax_number,
				 			'currency_string8':site,
				 			'currency_string9':telephone,
				 			'currency_string10':bank,
				 			'currency_string11':account,
				 			'currency_money':contract_totalamount,
				 			'currency_money2':actual_receipt,
				 			'currency_money3':outstanding_receipt,
				 			'currency_string12':alreadyInvoice_amount,
				 			'currency_string13':applyInvoice_amount,
				 			'currency_int3':invoice_type,
				 			'currency_int4':cost_type,
				 			'currency_string14':invoice_reason,
				 			'currency_int6':invoice_if,
                            'currency_string15':invoiceBegin,//期出合同已开票
                            'currency_string16':moneyBegin//期出合同已收款
				 			
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
                <%--var areaid = "${sessionScope.systemStaff.staff_Address }";--%>
				setApplyMessage(staffName,departmentId);
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款
				// 过程一第一级 - 获取所有区域
    			$.ajax({
    				url:'System/getXZRegion.action',
    				type:'post',
    				data:{},
    				dataType:'JSON',
    				success:function(res){
    	 				var html = '<option value="">请选择区域</option>';
    					$.each(res.data,function(index,item){
    						html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
    					});
    					$('#area').html(html);
//                        $('#area').val(areaid);
    					form.render('select');
    				}
    			});
    			// 过程一第二级 - 根据区域获取客户名称(同时获取业务员编码)
				$.ajax({
					url:'System/selectXZAllUser.action',
					type:'post',
					data:{},
					dataType:'JSON',
					success:function(res){
						var html = '<option value="">请选择客户名称</option>';
						$.each(res.data,function(index,item){
							html += '<option value="'+item.cCusCode+'" data-cDCCode="'+item.cDCCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-cDep="'+item.cCusDepart+'" data-regcode="'+item.cCusRegCode+'" data-site="'+item.cCusAddress+'" data-phone="'+item.cCusPhone+'" data-bank="'+item.cCusBank+'" data-account="'+item.cCusAccount+'">'+item.cCusName+'</option>'
						});
						$('#customer_name').html(html);
						form.render('select');
					}
				});

        		// 过程一第三级 - 根据客户名称获取销售合同编号
        		var cCusPPerson = '';//保存业务员编码
				var cCusDepart = '';//保存业务员部门
        		form.on('select(customer_name)', function(data){
    				var cCusCode = data.value;
    				cCusPPerson = $("#customer_name").find('option:selected').attr('data-cCusPPerson');
    				cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
    				var cCusName = $("#customer_name").find('option:selected').text();
    				var cRegCode =  $("#customer_name").find('option:selected').attr('data-regcode');//税号
    				var cSite =  $("#customer_name").find('option:selected').attr('data-site');//地址
    				var cPhone =  $("#customer_name").find('option:selected').attr('data-phone');//电话
    				var cBank =  $("#customer_name").find('option:selected').attr('data-bank');//开户行
    				var cAccount =  $("#customer_name").find('option:selected').attr('data-account');//账号

					var cDCCode = $("#customer_name").find('option:selected').attr('data-cDCCode');//地区

                    $("#area").removeAttr("disabled");
                    $('#area').val(cDCCode);//选择完客户，设置地区
                    $("#area").attr("disabled","disabled");
                    form.render('select');

                    // 重置[客户名称]级下面的内容(销售合同编号 金额信息 合同条款 明细信息)
                    $('#contract_id').siblings().remove();
                    $('#contract_id').html('');
                    $('#contract_amount').val('');
                    $('#actual_receipt').val('');
                    $('#outstanding_receipt').val('');
                    $("#invoice_name").val('');
                    $("#tax_number").val('');
                    $("#site").val('');
                    $("#telephone").val('');
                    $("#bank").val('');
                    $("#account").val('');
                    $('.contract-details').remove();


                    $("#alreadyInvoice_amount").val('');
                    $('#moneyBegin').val('');
                    $('#invoiceBegin').val('');


    				$("#tax_number").val(cRegCode);
    				$('#invoice_name').val(cCusName);
    				$('#site').val(cSite);
    				$('#telephone').val(cPhone);
    				$('#bank').val(cBank);
    				$('#account').val(cAccount);
    				$.ajax({
    					url:'System/selectXZContract.action',
    					type:'post',
    					data:{"cCusCode": cCusCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择销售合同编号</option>';
    						$.each(res.data,function(index,item){
    							html += '<option data-money="'+item.dblTotalCurrency+'"  data-moneyBegin="'+item.cDefine14+'" data-invoiceBegin="'+item.cDefine11+'" data-invoiceAlready="'+item.cDefine13+'" value="'+item.strContractID+'">名称：'+item.strContractName
    							+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
    						});
    						$('#contract_id').html(html);
    						form.render('select');
    					}
    				});
    				//重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
    				$('#contract_amount').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('.contract-details').remove();
					form.render();
        		});
        		// 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 
        		var contract_price = 0;	//合同条款带出的价格
        		var contract_type = 1;	//设置合同类型
    			form.on('select(contract_id)', function(data){
    				var strContractID = data.value;//合同编号
    				var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
    				$("#contract_amount").val(contractAmount);//合同金额

                    var moneyBegin =  $(data.elem).find("option:selected").attr('data-moneyBegin');

                    var invoiceBegin =  $(data.elem).find("option:selected").attr('data-invoiceBegin');

                    $("#moneyBegin").val(moneyBegin == "undefined"?"无":moneyBegin);//期初合同已收款金额
                    $("#invoiceBegin").val(invoiceBegin == "undefined"?"无":invoiceBegin);//期初合同已开票金额

                    var invoiceAlready =  Number($(data.elem).find("option:selected").attr('data-invoiceAlready'));
                    $("#alreadyInvoice_amount").val(isNaN(invoiceAlready)?0:invoiceAlready);//合同已开票金额

    				//查询合同收款计划
            		$.ajax({
            			url:'System/selectXZReceivables.action',
            			type:'post',
            			data:{'strContractID':strContractID},
            			dataType:'JSON',
            			success:function(result){
            				var acceptAmount = 0;
    						$.each(result.data,function(index,item){
    							acceptAmount += Number(item.dblPayCurrency);
	    					});
    						$('#actual_receipt').val(acceptAmount);//已收金额
    						$('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
            			}
            		});
    				//重置合同条款
    				$('.contract-details').remove();
    				//重置合同条款带出的价格
    				contract_price = 0;
            		//查询合同条款
            		$.ajax({
            			url:'System/selectXZContractAll.action',
            			type:'post',
            			data:{'strContractID':strContractID},
            			dataType:'JSON',
            			success:function(res){
            				$.each(res.data,function(index,item){
            					contract_price = Math.max(item.cDefine26,contract_price); //number类型
            					var html = '<tr class="contract-details">'
            							 + 	'<td colspan=1><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
            							 +	'<td colspan=5><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
            							 + '</tr>';
            					$('.contract').after(html);
            					inputRender();//input框自定义渲染
            				});
            			}
            		});
            		form.render();
    			});
				
                //操作
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}
				//监听金额输入框只允许输入数字(小数点后保留两位)
				/*inputLimitAmount0($('#alreadyInvoice_amount'));//已开票金额*/
				inputLimitAmount0($('#applyInvoice_amount'));//申请开票金额
				//监听电话输入框输入正确格式
				inputLimitPhone($('#telephone'));
				
			});
		</script> 
	</body>
</html>
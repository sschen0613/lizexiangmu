<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人公司合同发票开具申请-手机端 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/mobile.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
<!-- 		<script type="text/javascript" src="js/iconfont.js"></script> -->
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="container-apply">
			<div class="approval-list-title">
				<a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
				<h2 class="">天人公司合同发票开具申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'finance/mInvoiceOfSalesContractTrList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
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
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="customer_name" id="customer_name" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">税号 :</label>
						<div class="layui-input-block">
							<input type="text" name="tax_number" id="tax_number" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">地址 :</label>
						<div class="layui-input-block">
							<input type="text" name="site" id="site" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">电话 :</label>
						<div class="layui-input-block">
							<input type="text" name="telephone" id="telephone" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">开户行 :</label>
						<div class="layui-input-block">
							<input type="text" name="bank" id="bank" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">账号 :</label>
						<div class="layui-input-block">
							<input type="text" name="account" id="account" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同总金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_totalamount" name="contract_totalamount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">实际收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">已开票金额 :</label>
						<div class="layui-input-block">
							<input type="text" name="alreadyInvoice_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" id="alreadyInvoice_amount" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请开票金额 :</label>
						<div class="layui-input-block">
							<input type="text" name="applyInvoice_amount" class="layui-input" placeholder="由明细金额累计得出" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">发票类型 :</label>
						<div class="layui-input-block">
							<select name="invoice_type"><option value="1">普通发票</option><option value="2">专用发票</option></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<input type="text" name="invoice_reason" class="layui-input">
						</div>
					</div>
					<!-- 明细信息 -->
					<div class="layui-btn layui-btn-normal layui-btn-xs addDetails">
						<i class="layui-icon layui-icon-add-1" title="点击添加明细信息"></i>点击添加明细信息
					</div>
					<div class="apply-detail-container">
						<div class="details-title details-title1">明细信息#1<span class="layui-icon layui-icon-up"></span></div>
						<div class="apply-detail">
							<div class="details">
								<div class="layui-form-item">
									<label class="layui-form-label">货物名称 :</label>
									<div class="layui-input-block">
										<input id="product_name" name="product_name" class="layui-input" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="specifications_models" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">单位 :</label>
									<div class="layui-input-block">
										<input type="text" name="unit" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">金额 :</label>
									<div class="layui-input-block">
										<input type="text" id="sum1" name="unit_price" class="layui-input" lay-verify="required">
									</div>
								</div>
							</div>
							<div class="delete delete1">
								<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
							</div>
						</div>
					</div>  
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
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

                form.render();
                laydate.render({
                    elem: '#date1'
                });
                detailsRender(1); //明细信息第一行自定义渲染事件
                
              
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var buy_number = data.field.buy_number;
                    var customer_name = data.field.customer_name;
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
					var invoice_reason = data.field.invoice_reason;
					//如果已申请开票+申请开票大于合同金额，阻止提交
					if ((applyInvoice_amount+alreadyInvoice_amount)>contract_totalamount){
						layer.msg("开票总金额不能大于合同总金额");
						return false;
					}
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var product_name = $(item).find('input[name="product_name"]').val();
                        //var brand = Number($(item).find('input[name="brand"]').val());
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
				 			'currency_string3':customer_name,
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
                            'currencyDetails':JSON.stringify(currentDetails)
						}
				 		,dataType : "JSON"
				 		
				 		,success : function(result){

				 				if(result){
				 					layer.msg("提交成功");
                                    $('#myForm').addClass('layui-btn-disabled');
                                    $('#myForm').attr("disabled", "disabled");
				 				}else{
				 					layer.msg("提交失败");
                                    $('#myForm').addClass('layui-btn-disabled');
                                    $('#myForm').attr("disabled", "disabled");
				 				}
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
              	//监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});

    			//表单初始化
                //获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

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

                $('input[name="unit_price"]').on("input",function(e){
                	var sum = 0;
					$.each($('.details'),function(index,item){
						sum += Number($(item).find('input[name="unit_price"]').val());
					});
					$("#applyInvoice_amount").val(sum);
				});

                //操作
                //点击添加明细按钮
                var d_count = 1;
                $('.addDetails').click(function(){
                  d_count++;
                  var html = ''
                    +  '<div class="apply-detail">'
                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                    +    '<div class="details">'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">货物名称 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input id="product_name" name="product_name" class="layui-input" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                   
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">型号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specifications_models" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">单位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="unit" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">金额 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="sum'+d_count+'" name="unit_price" class="layui-input" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                    +    '</div>'
                    +    '<div class="delete delete'+d_count+'">'
                    +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                    +    '</div>'
                    +  '</div>';
                  $('.apply-detail-container').append(html);
                  //渲染
                  detailsRender(d_count); //明细信息每行自定义渲染事件
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
					applyInvoiceAmount($('#sum'+index));
                }
                function applyInvoiceAmount($demo) {
					$demo.on("input",function(e){
						var sum = 0;
						$.each($('.details'),function(index,item){
							sum += Number($(item).find('input[name="unit_price"]').val());
						});
						$("#applyInvoice_amount").val(sum);
					});

				}
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }

                //监听金额输入框只允许输入数字(小数点后保留两位)
                inputLimitAmount0($('#contract_totalamount'));//合同总金额
                inputLimitAmount0($('#actual_receipt'));//已收款金额
                inputLimitAmount0($('#alreadyInvoice_amount'));//已开票金额
                //监听电话输入框输入正确格式
                inputLimitPhone($('#telephone'));
                
            });
        </script>
	</body>
</html>
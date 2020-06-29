<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽公司合同发票开具申请-手机端 -->
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
				<h2 class="">丽泽公司销售合同发票开具申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'finance/mInvoiceOfSalesContractList.action';">查看申请记录</li>
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
						<label class="layui-form-label">所属区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required" disabled></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同编号 :</label>
						<div class="layui-input-block">
							<select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">开票名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="invoice_name" id="invoice_name" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">税号 :</label>
						<div class="layui-input-block">
							<input type="text" name="tax_number" id="tax_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">地址 :</label>
						<div class="layui-input-block">
							<input type="text" name="site" id="site" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">电话 :</label>
						<div class="layui-input-block">
							<input type="text" name="telephone" id="telephone" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">开户行 :</label>
						<div class="layui-input-block">
							<input type="text" name="bank" id="bank" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">账号 :</label>
						<div class="layui-input-block">
							<input type="text" name="account" id="account" class="layui-input" readonly>
						</div>
					</div>
					<!-- <div class="layui-form-item">
						<label class="layui-form-label">合同付款约定 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="contract" readonly></textarea>
						</div>
					</div> -->
					<div class="layui-form-item">
						<label class="layui-form-label">合同总金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount" name="contract_totalamount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">实际收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">已开票金额 :</label>
						<div class="layui-input-block">
							<input type="text" name="alreadyInvoice_amount" id="alreadyInvoice_amount" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请开票金额 :</label>
						<div class="layui-input-block">
							<input type="text" name="applyInvoice_amount" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">发票类型 :</label>
						<div class="layui-input-block">
							<select name="invoice_type"><option value="1">普通发票</option><option value="2">专用发票</option></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">期初合同已收款 :</label>
						<div class="layui-input-block">
							<input type="text" name="moneyBegin" id="moneyBegin" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">期初合同已开票 :</label>
						<div class="layui-input-block">
							<input type="text" name="invoiceBegin" id="invoiceBegin" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">开票事由 :</label>
						<div class="layui-input-block">
							<input type="text" name="invoice_reason" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">开票信息是否一致 :</label>
						<div class="layui-input-block">
							<input type="radio" name="invoice_if" value="1" title="是" checked>
      						<input type="radio" name="invoice_if" value="2" title="否">
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
									<div id="container1" class="layui-input-block container container1">
										<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询">
										<div class="list-container" style="display:none;">
											<ul></ul>
										</div>
									</div>
								</div>
								<!-- <div class="layui-form-item">
									<label class="layui-form-label">品牌 :</label>
									<div class="layui-input-block">
										<input type="text" name="brand" class="layui-input" readonly>
									</div>
								</div> -->
								<div class="layui-form-item">
									<label class="layui-form-label">型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="specifications_models" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">单位 :</label>
									<div class="layui-input-block">
										<input type="text" name="unit" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">金额 :</label>
									<div class="layui-input-block">
										<input type="text" name="unit_price" class="layui-input" readonly>
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
                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额
                    var invoiceBegin = data.field.invoiceBegin;//客户付款已开票金额
					var invoice_reason = data.field.invoice_reason;
					var invoice_if = data.field.invoice_if;
					
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
				 			'currency_type':28,
				 			'currency_number':buy_number,
				 			'currency_string2':area,  //区域
				 			'currency_string3':customer_name,
				 			'currency_string4':contract_id,
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
                            'currency_string15':invoiceBegin,//期出合同已开票
                            'currency_string16':moneyBegin,//期出合同已收款
				 			'currency_string14':invoice_reason,
				 			'currency_int6':invoice_if,

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

                //过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
                // 过程一第一级 - 获取登陆人区域
                var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
                var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
                var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";
                setApplyMessage(staffName,departmentId);
                $.ajax({
                    url:'System/getRegion.action',
                    type:'post',
                    data:{},
                    dataType:'JSON',
                    success:function(res){
                        var html = '<option value="">请选择区域</option>';
                        $.each(res.data,function(index,item){
                            html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
                        });
                        $('#area').html(html);
                        $('#area').val(areaid);
                        form.render('select');
                    }
                });
                // 过程一第二级 - 根据区域获取客户名称
                //form.on('select(area)', function(data){
                    var cDCCode = areaid;
                    $.ajax({
                        url:'System/selectUser.action',
                        type:'post',
                        data:{"cDCCode": cDCCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择客户名称</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-regcode="'+item.cCusRegCode+'" data-site="'+item.cCusAddress+'" data-phone="'+item.cCusPhone+'" data-bank="'+item.cCusBank+'" data-account="'+item.cCusAccount+'">'+item.cCusName+'</option>'
                            });
                            $('#customer_name').html(html);
                            form.render('select');
                        }
                    });
                    // 重置[客户名称]级下面的内容(合同编号 金额信息 合同条款 明细信息)
                    $('#contract_id').siblings().remove();
                    $('#contract_id').html('');
                    $('#contract_amount').val('');
                $("#alreadyInvoice_amount").val('');
                $('#moneyBegin').val('');
                $('#invoiceBegin').val('');
                    $('#actual_receipt').val('');
                    $('#outstanding_receipt').val('');
                    $("#invoice_name").val('');
					$("#tax_number").val('');
					$("#site").val('');
					$("#telephone").val('');
					$("#bank").val('');
					$("#account").val('');
                    $('.contract-details').remove();
                    $($('.details')[0]).siblings('.details').remove();
                    $('.details').find('input').val('');
                    $('.details').find('select[name="runproduct_name"]').html('');
                    $('.details').find('select[name="runproduct_name"]').siblings().remove();
                    form.render();
                    //当前明细信息每一行的商品名称input框值重置
                    currentProductValues = [];
                //});
                // 过程一第三级 - 根据客户名称获取销售合同编号
                var cCusPPerson;
                form.on('select(customer_name)', function(data){
                    cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');
                    var cCusName = $("#customer_name").find('option:selected').text();
    				var cRegCode =  $("#customer_name").find('option:selected').attr('data-regcode');//税号
    				var cSite =  $("#customer_name").find('option:selected').attr('data-site');//地址
    				var cPhone =  $("#customer_name").find('option:selected').attr('data-phone');//电话
    				var cBank =  $("#customer_name").find('option:selected').attr('data-bank');//开户行
    				var cAccount =  $("#customer_name").find('option:selected').attr('data-account');//账号
    				$("#tax_number").val(cRegCode);
    				$('#invoice_name').val(cCusName);
    				$('#site').val(cSite);
    				$('#telephone').val(cPhone);
    				$('#bank').val(cBank);
    				$('#account').val(cAccount);
                    var cCusCode = data.value;
                    $.ajax({
                        url:'System/selectContract.action',
                        type:'post',
                        data:{"cCusCode": cCusCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择销售合同编号</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.strContractID+'" data-name="'+item.strContractName+'" data-moneyBegin="'+item.cDefine14+'" data-invoiceBegin="'+item.cDefine11+'" data-invoiceAlready="'+item.cDefine3+'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
                                    +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
                            });
                            $('#contract_id').html(html);
                            form.render('select');
                        }
                    });
                    //重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
                    $('#contract_amount').val('');
                    $("#alreadyInvoice_amount").val('');
                    $('#moneyBegin').val('');
                    $('#invoiceBegin').val('');
                    $('#actual_receipt').val('');
                    $('#outstanding_receipt').val('');
                    $('.contract-details').remove();
                    $($('.details')[0]).siblings('.details').remove();
                    $('.details').find('input').val('');
                    $('.details').find('select[name="runproduct_name"]').html('');
                    $('.details').find('select[name="runproduct_name"]').siblings().remove();
                    form.render();
                    //当前明细信息每一行的商品名称input框值重置
                    currentProductValues = [];
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
            			url:'System/selectReceivables.action',
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
            			url:'System/selectContractAll.action',
            			type:'post',
            			data:{'strContractID':strContractID},
            			dataType:'JSON',
            			success:function(res){
            				$.each(res.data,function(index,item){
            					contract_price = Math.max(item.cDefine26,contract_price); //number类型
            					var html = '<tr class="contract-details">'
            							 + 	'<td colspan=1><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
            							 +	'<td colspan=6><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
            							 + '</tr>';
            					$('.contract').after(html);
            					
            				});
            			}
            		});
            		//明细信息重置,重置[运营设备]级下面的内容
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					form.render();
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];

                    //获取运营设备(附带运营设备编码和设备运营期间)
                    $.ajax({
                        url:'System/selectshebei.action',
                        type:'post',
                        data:{"strContractID": strContractID,'type':contract_type},
                        dataType:'JSON',
                        success:function(res){
                            //$('.details').remove();
                            $('.apply-detail-container').html('');
                            n_count = 0;
                            var d_count = 1;
                            $.each(res.data,function(index,item){
								var models = item.规格;  if(models == undefined){models = '无';}
								d_count++;
								var html = ''
									+  '<div class="apply-detail">'
									+    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
									+    '<div class="details">'
									+      '<div class="layui-form-item">'
									+        '<label class="layui-form-label">货物名称 :</label>'
									+        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
									+          '<input id="product_name" name="product_name" value="'+item.商品名称+'" class="layui-input" readonly>'
									+        '</div>'
									+      '</div>'

									+      '<div class="layui-form-item">'
									+        '<label class="layui-form-label">型号 :</label>'
									+        '<div class="layui-input-block">'
									+          '<input type="text" name="specifications_models" value="'+models+'" class="layui-input" readonly>'
									+        '</div>'
									+      '</div>'
									+      '<div class="layui-form-item">'
									+        '<label class="layui-form-label">单位 :</label>'
									+        '<div class="layui-input-block">'
									+          '<input type="text" name="unit" class="layui-input" value="'+item.数量单位+'" readonly>'
									+        '</div>'
									+      '</div>'
									+      '<div class="layui-form-item">'
									+        '<label class="layui-form-label">数量 :</label>'
									+        '<div class="layui-input-block">'
									+          '<input type="text" id="buy_quantity'+d_count+'" value="'+item.合同数量+'" name="buy_quantity" class="layui-input">'
									+        '</div>'
									+      '</div>'
									+      '<div class="layui-form-item">'
									+        '<label class="layui-form-label">金额 :</label>'
									+        '<div class="layui-input-block">'
									+          '<input type="text"  name="unit_price" value="'+item.含税原币单价+'" class="layui-input"  readonly>'
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
                        }
                    });
    			});
    			//表单初始化
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
                  var html = ''
                    +  '<div class="apply-detail">'
                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                    +    '<div class="details">'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">货物名称 :</label>'
                    +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
                    +          '<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询">'
                    +          '<div class="list-container" style="display:none;">'
                    +            '<ul></ul>'
                    +          '</div>'
                    +        '</div>'
                    +      '</div>'
                   
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">型号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specifications_models" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">单位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="unit" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">金额 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text"  name="unit_price" class="layui-input" readonly>'
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
                    searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
				}
                
            });
        </script>
	</body>
</html>
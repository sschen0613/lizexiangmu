<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 报告流转及盖章申请-手机端 -->
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
		<script type="text/javascript" src="js/iconfont.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="container-apply">
			<div class="approval-list-title">
				<a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
				<h2 class="">报告流转及盖章申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'testingProcess/reportMoveStamp/mReportMoveStampList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">单据单号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请人 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_applicant" id="staffName" class="layui-input" readonly="">
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
							<input type="text" name="currency_date" id="date" class="layui-input" readonly lay-key="1">
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">报告编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="code" id="code" class="layui-input">
						</div>
					</div>
					<%--<div class="layui-form-item" id="source_div">
						<label class="layui-form-label">申请来源 :</label>
						<div class="layui-input-block">
							<select type="text" name="source" class="layui-select" lay-filter="source">
								<option value="1">信泽</option>
								<option value="2">丽泽</option>
							</select>
						</div>
					</div>--%>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<input id='customer_name' name="customer_name" class="layui-input" readonly>
						</div>
					</div>
 					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">合同编号 :</label>
						<div id="contract" class="layui-input-block container">
							<input id='contract_id' name="contract_id" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">合同签订日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="contract_date" id="contract_date" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="contract_name" id="contract_name" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">合同金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount" name="contract_amount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">已收金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">合同状况 :</label>
						<div class="layui-input-block">
							<input type="radio" name="state" value="已合同及付款" title="已合同及付款" checked>
							<input type="radio" name="state" value="未到合同及付款" title="未到合同及付款">
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">合同条款 :</label>
						<div class="layui-input-block">
							<input type="text" name="contract_str_name" id="contract_str_name" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item contract_tr">
						<label class="layui-form-label">条款内容 :</label>
						<div class="layui-input-block">
							<input type="text" name="contract_str_memo" id="contract_str_memo" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="remark"></textarea>
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

				var currency_id43 = '${param.currency_id}';//43id
				var contract_id = '${param.contract_id}';//合同编号
				var code = '${param.code}';//报告编码
				$("#code").val(code);

                //申请来源添加事件
                /*form.on('select(source)', function(data){
                    if(data.value == 1){//默认信泽
                        $(".contract_tr").show();
                        //$("#contract_id").attr("lay-verify","required");
                        $('#contract').show();
                    }else{
                        $(".contract_tr").hide();
                        //$("#contract_id").attr("lay-verify","");
                        $('#contract').hide();
                    }
                });*/


                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    //var source = data.field.source;
                    var buy_number = data.field.buy_number;//编号
					var code = data.field.code;//报表编码
					var customer_name = data.field.customer_name;//客户名称
                    var contract_number = data.field.contract_id;//合同id
                    var contract_name = data.field.contract_name;//合同名称
                    var contract_date = data.field.contract_date;//签订日期
                    var contract_sum = Number(data.field.contract_amount);//合同金额
                    var received_amount = Number(data.field.actual_receipt);//已收金额
                    var outstanding_receipt = Number(data.field.outstanding_receipt);
                    var contract_str_name = data.field.contract_str_name;//条款名称
                    var contract_str_memo = data.field.contract_str_memo;//条款内容
                    var remark = data.field.remark;//备注

                    var state = data.field.state;//合同状况

                   /* var currentDetails = [];
                    $.each($('.details'),function(index,item){
                        var name = $(item).find('input[name="unit_name"]').val();
                        var type = $(item).find('select[name="apply_type"]>option:selected').text();
                        var report_id = $(item).find('input[name="report_id"]').val();
                        var report_number = Number($(item).find('input[name="report_number"]').val());

                        var obj = {'details_string2':name,'details_string3':type,'details_string4':report_id,'details_int2':report_number};
                        currentDetails.push(obj);
                    });*/

                    //if (source == 1){//信泽
                        $.ajax({
                            url : "Currency/launchCurrencyApply.action"
                            ,type : "post"
                            ,data : {
                                //'currencyDetails':JSON.stringify(currentDetails),
                                'currency_type':50,
                                'currency_number':buy_number,
                                //'currency_int2':source,
                                'currency_string3':contract_number,
                                'currency_string4':contract_name,
                                'currency_date2':contract_date,
                                'currency_money':contract_sum,
                                'currency_money2':received_amount,
                                'currency_money3':outstanding_receipt,
                                'currency_string7':remark,
                                'currency_string8':contract_str_name,
                                'currency_string9':contract_str_memo,
                                'currency_string10':state
								,'currency_string11':code//报表编码
								,'currency_string17':customer_name//任务内容
								,'currency_string18':currency_id43//任务内容
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
                    /*}else if (source == 2) {//丽泽
                        $.ajax({
                            url : "Currency/launchCurrencyApply.action"
                            ,type : "post"
                            ,data : {
                                'currencyDetails':JSON.stringify(currentDetails),
                                'currency_type':50,
                                'currency_number':buy_number,
                                'currency_int2':source,
                                'currency_string4':contract_name,
                                'currency_string7':remark,
                                //'currency_string8':contract_str_name,
                                //'currency_string9':contract_str_memo,

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
                    }*/

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
				var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
				//过程三 - 合同编号 - 合同名称+合同签订日期+(合同金额+已收金额+欠款金额)+合同条款
                //searchXZProcessOfContract($('#contract'));

				$.ajax({
					url:'System/selectXZContractById.action',
					type:'post',
					data:{"strContractID": contract_id},
					dataType:'JSON',
					success:function(res){
						//查询客户名称
						$.ajax({
							url:'System/selectXZCustomerByContract.action',
							type:'post',
							data:{"cContractID": contract_id},
							dataType:'JSON',
							success:function(res){
								//查询客户名称
								$("#customer_name").val(res.data.cCusName);
							}
						});
						var contractAmount = res.data.dblTotalCurrency;//合同金额
						var strContractName = res.data.strContractName;//合同名称
						var strContractOrderDate = res.data.strContractOrderDate;//合同签订时间

						$("#contract_id").val(contract_id); //合同金额
						$("#contract_amount").val(contractAmount); //合同金额
						$("#contract_date").val(strContractOrderDate); //合同签订时间
						$("#contract_name").val(strContractName); //合同名称
						//重置合同条款带出的价格
						var contract_price = 0;
						//查询合同收款计划
						$.ajax({
							url:'System/selectXZReceivables.action',
							type:'post',
							data:{'strContractID':contract_id},
							dataType:'JSON',
							success:function(result){
								var acceptAmount = 0;
								$.each(result.data,function(index,item){
									acceptAmount += Number(item.dblPayCurrency);
								});
								$("#contract_amount").val(contractAmount);//合同金额
								$('#actual_receipt').val(acceptAmount);//已收金额
								$('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额

							}
						});

						//查询合同条款
						$.ajax({
							url:'System/selectXZContractAll.action',
							type:'post',
							data:{'strContractID':contract_id},
							dataType:'JSON',
							success:function(res){
								$.each(res.data,function(index,item){
									contract_price = Math.max(item.cDefine26,contract_price); //number类型
									$("#contract_str_name").val(item.strName);//
									$("#contract_str_memo").val(item.strMemo);//
									/*var html = '<tr class="contract-details">'
											+ 	'<td colspan=2><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
											+	'<td colspan=4><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
											+  '</tr>';
									$('.contract').after(html);
									inputRender();//input框自定义渲染*/
								});
							}
						});

					}
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
                    +        '<label class="layui-form-label">项目名称 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="unit_name" class="layui-input" />'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">申请类型 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<select name="apply_type" lay-filter="apply_type" class="layui-select" lay-search lay-verify="required">'
                    +  				'<option value="">请选择</option>'
                    +    			'<option value="普通检测">普通检测</option>'
                    +    			'<option value="自行检测">自行检测</option>'
                    +    			'<option value="环评现状检测">环评现状检测</option>'
                    +    			'<option value="比对检测">比对检测</option>'
                    +    			'<option value="验收检测">验收检测</option>'
				    + 		   '</select>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">报告编号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="report_id" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">报告份数 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="number" name="report_number" class="layui-input">'
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
                  //渲染
                  form.render();
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                //行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                
            });
        </script>
	</body>
</html>
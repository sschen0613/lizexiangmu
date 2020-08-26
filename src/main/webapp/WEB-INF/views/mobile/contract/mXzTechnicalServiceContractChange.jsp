<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽技术服务合同变更申请-手机端 -->
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
				<h2 class="">信泽技术服务合同变更申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'contract/mXzTechnicalServiceContractChangeList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号的顺序进行选择</i>
				</div>
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">申请人 :</label>
						<div class="layui-input-block">
							<input type="text" name="staffName" id="staffName" class="layui-input" readonly>
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
						<label class="layui-form-label">区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select>
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
						<label class="layui-form-label">合同签订日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="strContractOrderDate" class="layui-input date-revise" id="date1" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同开始日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="strContractStartDate" class="layui-input date-revise" id="date2" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同结束日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="strContractEndDate" class="layui-input date-revise" id="date3" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同开始日期变更 :</label>
						<div class="layui-input-block">
							<input type="text" name="strContractStartDateChange" class="layui-input date-revise" id="date4" placeholder="请选择日期" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同结束日期变更 :</label>
						<div class="layui-input-block">
							<input type="text" name="strContractEndDateChange" class="layui-input date-revise" id="date5" placeholder="请选择日期" lay-verify="required">
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">合同总额 :</label>
						<div class="layui-input-block">
							<input type="text" name="contract_amount" id="contract_amount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同总额变更 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount_change" name="contract_amount_change" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同描述 :</label>
						<div class="layui-input-block">
							<input type="text" id="strContractDesc" name="strContractDesc" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同描述变更 :</label>
						<div class="layui-input-block">
							<input type="text" id="strContractDescChange" name="strContractDescChange" class="layui-input">
						</div>
					</div>
					<div class="layui-btn layui-btn-normal layui-btn-xs addPayDetails">
						<i class="layui-icon layui-icon-add-1" title=""></i>合同付款约定
					</div>
					<div class="pay-detail-container">

					</div>
					<!-- 明细信息 -->
					<div class="layui-btn layui-btn-normal layui-btn-xs addDetails">
						<i class="layui-icon layui-icon-add-1" title=""></i>明细信息
					</div>
					<div class="apply-detail-container">

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
                //执行laydate实例
                laydate.render({
                    elem: '#date1'
                });
				laydate.render({
					elem: '#date2'
				});
				laydate.render({
					elem: '#date3'
				});
				laydate.render({
					elem: '#date4'
				});
				laydate.render({
					elem: '#date5'
				});
                
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;											//请购单号
					var illustration = data.field.illustration;										//说明
					var area_id = data.field.area;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var customer_id = data.field.customer_name;										//客户编号
					var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
					var contract_id = data.field.contract_id;										//合同编号
					//var contract_name = $('#contract_id').find('option:selected').attr('data-name'); //合同名称
					var strContractOrderDate = data.field.strContractOrderDate;						//合同签订日期
					var strContractStartDate = data.field.strContractStartDate;						//合同开始日期
					var strContractEndDate = data.field.strContractEndDate;							//合同结束日期
					var strContractStartDateChange = data.field.strContractStartDateChange;			//合同开始日期变更
					var strContractEndDateChange = data.field.strContractEndDateChange;				//合同结束日期变更

					var contract_amount = Number(data.field.contract_amount);						//合同总额
					var contract_amount_change = Number(data.field.contract_amount_change);			//合同总额变更
					var strContractDesc = data.field.strContractDesc;								//合同描述
					var strContractDescChange = data.field.strContractDescChange;					//合同描述变更

					var currency_type = 74;
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var strCode = $(item).find('input[name="strCode"]').val();				//序号
						var strName = $(item).find('input[name="strName"]').val();	//存货编码
						var cDefine28 = $(item).find('input[name="cDefine28"]').val();	//商品名称
						var cDefine28Change = $(item).find('input[name="cDefine28Change"]').val(); //规格型号
						var dblQuantity = Number($(item).find('input[name="dblQuantity"]').val());
						var dblQuantityChange = Number($(item).find('input[name="dblQuantityChange"]').val()); //合同数量
						var dblPrice = Number($(item).find('input[name="dblPrice"]').val());	//请购数量
						var dblPriceChange = Number($(item).find('input[name="dblPriceChange"]').val()); //库存数量
						var dblSum = Number($(item).find('input[name="dblSum"]').val()); //参考成本

						var obj = {'details_string4':strCode
							,'details_string5':strName
							,'details_string6':cDefine28
							,'details_string7':cDefine28Change
							,'details_money':dblQuantity
							,'details_money2':dblQuantityChange
							,'details_money3':dblPrice
							,'details_money4':dblPriceChange
							,'details_money5':dblSum
						};
						currentDetails.push(obj);
					});
					var payDetails = [];
					$.each($('.contract-details'),function(index,item){
						var contract_str_name = $(item).find('input[name="contract_str_name"]').val();	//存货编码
						var contract_str_name_change = $(item).find('input[name="contract_str_name_change"]').val();	//商品名称
						var contract_str_memo = $(item).find('input[name="contract_str_memo"]').val(); //规格型号
						var contract_str_memo_change = $(item).find('input[name="contract_str_memo_change"]').val(); 		//单位
						var obj = {
							'dtPayDate':currencyDate
							,'dblPayRatio':0
							,'dblPayCurrency':0
							,'strSettleStyleID':contract_str_name
							,'strPayFactor':contract_str_memo
							,'string':contract_str_name_change
							,'string2':contract_str_memo_change
						};
						payDetails.push(obj);
					});
					//价格判断不符合要求,表单不提交
// 					if(flag == 0){
// 						layer.msg('商品单价大于合同条款规定价格('+contract_price+'元)');
// 						return false;
// 					}
					//表单提交
					$.ajax({
						url : "Currency/launchCurrencyApply.action"
						,type : "post"
						,data : {
							'currency_type':currency_type
							,"currency_number":buy_number
							,"currency_string":illustration
							,"currency_string2":area_id
							,"currency_string3":area_name
							,"currency_string4":customer_id
							,"currency_string5":customer_name
							,"currency_string7":contract_id
							,"currency_string8":strContractDesc
							,"currency_string9":strContractDescChange
							,"currency_date":currencyDate
							,"currency_date2":strContractOrderDate
							,"currency_date3":strContractStartDate
							,"currency_date4":strContractEndDate
							,"currency_date5":strContractStartDateChange
							,"currency_date6":strContractEndDateChange
							,"currency_money":contract_amount//合同总额
							,"currency_money2":contract_amount_change//合同总额变更
							,"payDetails":JSON.stringify(payDetails)
							,'currencyDetails':JSON.stringify(currentDetails)}
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
				//过程一:区域 - 客户名称(客户编号) - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
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
                        form.render('select');
                    }
                });
				// 过程一第二级 - 根据区域获取客户名称
        		form.on('select(area)', function(data) {
					var cDCCode = data.value;
					$.ajax({
						url: 'System/selectXZUser.action',
						type: 'post',
						data: {"cDCCode": cDCCode},
						dataType: 'JSON',
						success: function (res) {
							var html = '<option value="">请选择客户名称</option>';
							$.each(res.data, function (index, item) {
								html += '<option value="' + item.cCusCode + '" data-cCusPPerson="' + item.cCusPPerson + '" data-dept="' + item.cCusDepart + '">' + item.cCusName + '</option>'
							});
							$('#customer_name').html(html);
							form.render('select');
						}
					});
					// 重置[客户名称]级下面的内容(销售合同编号 金额信息 合同条款 明细信息)
					$('#contract_id').siblings().remove();
					$('#contract_id').html('');
					$('#contract_amount').val('');

					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('.contract-details').remove();

					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					form.render();
				});
				// 过程一第三级 - 根据客户名称获取销售合同编号
				var cCusPPerson = '';//保存业务员编码
				var cCusDepart = '';//保存业务员部门
        		form.on('select(customer_name)', function(data){
        			cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');//
                    cCusDepart = $(data.elem).find("option:selected").attr('data-dept');//
        			var cCusCode = data.value;
    				$('#customer_number').val(cCusCode); //客户编码
    				$.ajax({
    					url:'System/selectXZContract.action',
    					type:'post',
    					data:{"cCusCode": cCusCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择合同编号</option>';
							$.each(res.data,function(index,item){
								html += '<option data-money="'+item.dblTotalCurrency+'" data-begin="'+item.strContractStartDate
										+'" data-end="'+item.strContractEndDate
										+'" data-order="'+item.strContractOrderDate
										+'" data-desc="'+item.strContractDesc+'" value="'+item.strContractID+'">名称：'+item.strContractName
										+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；签订时间：'+item.strContractOrderDate+'</option>';
							});
    						$('#contract_id').html(html);
    						form.render('select');
    					}
    				});
					//重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
					$('#contract_amount').val('');
					$('.contract-details').remove();
					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					form.render();
        		});
				// 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
				//获取存货编码 / 存货名称 /规格型号/单位/合同数量/库存数量
				var runproduct_name_html = ''; //运营设备下拉列表
				var contract_price = 0;	//合同条款带出的价格
				form.on('select(contract_id)', function(data){
					//重置之前内容
					//明细信息重置
					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					form.render();

					//获取新内容
					var strContractID = data.value; //合同编号
					var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));//合同金额
					var strContractOrderDate = $(data.elem).find("option:selected").attr('data-order');//合同签订时间
					var strContractStartDate = $(data.elem).find("option:selected").attr('data-begin');//合同开始时间
					var strContractEndDate = $(data.elem).find("option:selected").attr('data-end');//合同结束时间
					var strContractDesc = $(data.elem).find("option:selected").attr('data-desc');//合同内容描述

					$("#contract_amount").val(contractAmount); //合同金额
					$("#date1").val(strContractOrderDate); //合同金额
					$("#date2").val(strContractStartDate); //合同金额
					$("#date3").val(strContractEndDate); //合同金额
					$("#strContractDesc").val(strContractDesc); //合同金额
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
							var p_count = 0;
							$.each(res.data,function(index,item){
								p_count++;
								contract_price = Math.max(item.cDefine26,contract_price); //number类型
								var html = ''
										+  '<div class="pay-detail">'
										+    '<div class="payDetails">'

										+		'<div class="layui-form-item">'
										+			'<label class="layui-form-label">合同条款名称 :</label>'
										+			'<div class="layui-input-block">'
										+				'<input type="text" name="contract_str_name" id="contract_str_name'+p_count+'" value="'+item.strName+'" class="layui-input" readonly>'
										+			'</div>'
										+		'</div>'

										+		'<div class="layui-form-item">'
										+			'<label class="layui-form-label">合同条款名称变更 :</label>'
										+			'<div class="layui-input-block">'
										+				'<input type="text" name="contract_str_name_change" id="contract_str_name_change'+p_count+'" class="layui-input">'
										+			'</div>'
										+		'</div>'

										+		'<div class="layui-form-item">'
										+			'<label class="layui-form-label">合同条款内容 :</label>'
										+			'<div class="layui-input-block">'
										+				'<input type="text" name="contract_str_memo" id="contract_str_memo'+p_count+'" value="'+item.strMemo+'" class="layui-input" readonly>'
										+			'</div>'
										+		'</div>'

										+		'<div class="layui-form-item">'
										+			'<label class="layui-form-label">合同条款内容变更 :</label>'
										+			'<div class="layui-input-block">'
										+				'<input type="text" name="contract_str_memo_change" id="contract_str_memo_change'+p_count+'" class="layui-input">'
										+			'</div>'
										+		'</div>'

										+    '</div>'
										+  '</div>';
								$('.pay-detail-container').append(html);
								form.render();
							});
						}
					});
					//获取运营设备(附带运营设备编码和设备运营期间)
					$.ajax({
						url:'System/selectXZContractDetails.action',
						type:'post',
						data:{"strContractID": strContractID},
						dataType:'JSON',
						success:function(res){
							$('.details').remove();
							var n_count = 0;
							var d_count = 0;
							$.each(res.data,function(index,item){
								d_count++;
								var html = ''
										+  '<div class="apply-detail">'
										+    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
										+    '<div class="details">'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">项目编码 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" name="strCode" class="layui-input" value="'+item.strCode+'" readonly>'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">项目名称 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" name="strName" class="layui-input" value="'+item.strName+'" readonly>'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">内容描述 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" name="cDefine28" class="layui-input" value="'+item.cDefine28+'" readonly>'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">内容描述变更 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" name="cDefine28Change" class="layui-input">'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">数量 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" name="dblQuantity" id="dblQuantity'+d_count+'" class="layui-input" value="'+item.dblQuantity+'" readonly>'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">数量变更 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" id="dblQuantityChange'+d_count+'" name="dblQuantityChange" class="layui-input">'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">含税原币单价 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" id="dblPrice'+d_count+'" name="dblPrice" class="layui-input" value="'+item.dblPrice+'" readonly>'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">含税原币单价变更 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" id="dblPriceChange'+d_count+'" name="dblPriceChange" class="layui-input">'
										+        '</div>'
										+      '</div>'
										+      '<div class="layui-form-item">'
										+        '<label class="layui-form-label">含税原币金额 :</label>'
										+        '<div class="layui-input-block">'
										+          '<input type="text" id="dblSum'+d_count+'" name="dblSum" class="layui-input" readonly>'
										+        '</div>'
										+      '</div>'
										+  '</div>';
								$('.apply-detail-container').append(html);
								detailsRender(d_count);
							});
						}
					});
				});

                //明细信息每行自定义渲染事件
                function detailsRender1(index){
                    getSum1($('#scale'+index),$('#amount'),$('#amountMoney'+index));
                }

                //明细信息每行自定义渲染事件
                function detailsRender(index){
					//给明细中数量变更框添加更改事件
					$('#dblQuantityChange'+index).bind("input propertychange",function(e){
						var dblQuantityChange =  $(e.target).val();//变更的数量值
						if (dblQuantityChange != null && dblQuantityChange != ""){
							var dblPriceChange = $('#dblPriceChange'+index).val();//变更的价格值
							var dblPrice = 0;
							if (dblPriceChange == null || dblPriceChange == ""){//如果变更的价格值为空，即没变更
								dblPrice = $('#dblPrice'+index).val();//取未变更的价格值
							}else{
								dblPrice = dblPriceChange;
							}
							var dblSum = dblQuantityChange * dblPrice;
							$('#dblSum'+index).val(dblSum);
							contractAmountSum();
						}
					});

					//给明细中价格变更框添加更改事件
					$('#dblPriceChange'+index).bind("input propertychange",function(e){
						var dblPriceChange =  $(e.target).val();//变更的价格值
						if (dblPriceChange != null && dblPriceChange != null){
							var dblQuantityChange = $('#dblQuantityChange'+index).val();//变更的数量值
							var dblQuantity = 0;
							if (dblQuantityChange == null || dblQuantityChange == ""){//如果变更的数量值为空，即没变更
								dblQuantity = $('#dblQuantity'+index).val();//取未变更的数量值
							}else{
								dblQuantity = dblQuantityChange;
							}
							var dblSum = dblQuantity * dblPriceChange;
							$('#dblSum'+index).val(dblSum);
							contractAmountSum();
						}
					});

                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    inputLimitNumber($('#dblQuantityChange'+index)); //每一行给数量绑定方法,限制输入内容(数字)(in function_tool.js)
					inputLimitNumber($('#dblPriceChange'+index)); //每一行给单价绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                //监听金额输入框只允许输入数字(小数点后保留两位)
				inputLimitAmount0($('#sum'));//金额

				function contractAmountSum(){
					var price = 0;
					$.each($('.details'),function(index,item) {
						var dblSum = Number($(item).find('input[name="dblSum"]').val()); //销售单价
						price += dblSum;
					});
					$("#contract_amount_change").val(price); //合同金额
				}
            });
        </script>
	</body>
</html>
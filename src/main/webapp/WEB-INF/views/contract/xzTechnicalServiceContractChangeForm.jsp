<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽技术服务合同变更申请-->
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
					<th colspan="10" class="table-h">信泽技术服务合同变更申请</th>
				</tr>
				<tr>
	 				<th colspan=10 style="text-align:right">申请单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >
		 		<tr>
		 			<td>说明</td>
		 			<td colspan=9><input type="text" name="illustration" value="用于信泽技术服务合同变更" readonly></td>
		 		</tr>
		 		<tr>
		 			<th colspan=10 style="text-align:center;">基本信息</th>
		 		</tr>
		 		<tr>
		 			<td>申请人</td>
		 			<td colspan=2><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=3><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
		 		<tr>
		 			<td>区域</td>
		 			<td colspan=2><select name="area" id="area" lay-filter="area" lay-search lay-verify="required"></select></td>
		 			<td>客户名称</td>
		 			<td colspan=6><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
		 		</tr>
		 		<tr>
		 			<td>合同编号</td>
		 			<td colspan=9><select name="contract_id" id="contract_id" lay-filter="contract_id" lay-search lay-verify="required"></select></td>
		 		</tr>
				<tr>
					<td>合同签订日期</td>
					<td colspan=9><input type="text" name="strContractOrderDate" id="date1" class="layui-input" readonly></td>
				</tr>
		 		<tr>
					<td>合同开始日期</td>
					<td colspan=4><input type="text" name="strContractStartDate" id="date2" class="layui-input" readonly></td>
		 			<td>合同结束日期</td>
		 			<td colspan=4><input type="text" name="strContractEndDate" id="date3" class="layui-input" readonly></td>
		 		</tr>
				<tr>
					<td>合同开始日期变更</td>
					<td colspan=4><input type="text" name="strContractStartDateChange" id="date4" class="layui-input" placeholder="请选择日期" autocomplete="off"></td>
					<td>合同结束日期变更</td>
					<td colspan=4><input type="text" name="strContractEndDateChange" id="date5" class="layui-input" placeholder="请选择日期" autocomplete="off"></td>
				</tr>
				<tr>
					<td>合同总额</td>
					<td colspan=4><input type="text" id="contract_amount" name="contract_amount" readonly></td>
					<td>合同总额变更</td>
					<td colspan=4><input type="text" id="contract_amount_change" name="contract_amount_change" readonly></td>
				</tr>
				<tr>
					<td>变更说明</td>
					<td colspan=4><input type="text" id="strContractDesc" name="strContractDesc"></td>
				</tr>
				<tr>
		 			<th colspan="10" style="text-align: center;">合同付款约定</th> <!--payment_agreement-->
		 		</tr>
		 		<tr class="contract">
					<th colspan=2>合同条款名称</th>
					<th colspan=2>合同条款名称变更</th>
					<th colspan=3>合同条款内容</th>
					<th colspan=3>合同条款内容变更</th>
				</tr>
		 		<tr>
		 			<th colspan=10 style="text-align:center;">明细信息</th>
		 		</tr>
		 		<tr id='prc'>
		 			<td>项目编码</td>
		 			<td>项目名称</td>
		 			<td>内容描述</td>
		 			<td>内容描述变更</td>
		 			<td>数量</td>
					<td>数量变更</td>
					<td>含税原币单价</td>
		 			<td>含税原币单价变更</td>
					<td>含税原币金额</td>
		 			<td>操作</td>
		 		</tr>
		 		<tr class="details">

		 		</tr>
		 	</tbody>
		 	<thead>
	 			<tr>
	 				<th colspan=10></th>
				</tr>
				<tr>
					<td>上传原合同</td>
					<td><input type="file" id="pics1" name="pics1" multiple="multiple"></td>
				</tr>
				<tr>
					<td>上传变更合同</td>
					<td><input type="file" id="pics2" name="pics2" multiple="multiple"></td>
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
				form.render('radio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date4' //指定元素
					//,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				laydate.render({
					elem: '#date5' //指定元素
					//,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				detailsRender(1); //明细信息第一行自定义渲染事件
				inputRender();//input框自定义渲染
				
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
					
					var currency_type = 74;
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var strCode = $(item).find('input[name="strCode"]').val();				//序号
						var strName = $(item).find('input[name="strName"]').val();	//存货编码
						var cDefine28 = $(item).find('textarea[name="cDefine28"]').val();	//商品名称
						var cDefine28Change = $(item).find('textarea[name="cDefine28Change"]').val(); //规格型号
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
						var contract_str_name = $(item).find('textarea[name="contract_str_name"]').val();	//存货编码
						var contract_str_name_change = $(item).find('textarea[name="contract_str_name_change"]').val();	//商品名称
						var contract_str_memo = $(item).find('textarea[name="contract_str_memo"]').val(); //规格型号
						var contract_str_memo_change = $(item).find('textarea[name="contract_str_memo_change"]').val(); 		//单位
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
					var myForm = new FormData();
					myForm.set("currency_type",currency_type);
					myForm.set("currency_number",buy_number);
					myForm.set("currency_string",illustration);
					myForm.set("currency_string2",area_name);
					myForm.set("currency_string3",customer_name);
					myForm.set("currency_string4",strContractStartDate);
					myForm.set("currency_string5",strContractEndDate);
					myForm.set("currency_string7",contract_id);
					myForm.set("currency_string8",strContractDesc);
					myForm.set("currency_string9",strContractOrderDate);
					myForm.set("currency_date",currencyDate);
					myForm.set("currency_date2",strContractStartDateChange);
					myForm.set("currency_date3",strContractEndDateChange);
					myForm.set("currency_money",contract_amount);//合同金额
					myForm.set("currency_money2",contract_amount_change);//合同金额变更
					myForm.set("payDetails",JSON.stringify(payDetails));
					myForm.set("currencyDetails",JSON.stringify(currentDetails));
					for(let i = 0;i < $("#pics1")[0].files.length;i++){
						myForm.append("pics1",$("#pics1")[0].files[i])
					}
					for(let i = 0;i < $("#pics2")[0].files.length;i++){
						myForm.append("pics2",$("#pics2")[0].files[i])
					}
					//表单提交
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply74.action"
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
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";
                var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息

				setApplyMessage(staffName,departmentId);
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
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
    			// 过程一第二级 - 根据区域获取客户名称(同时获取业务员编码)
        		form.on('select(area)', function(data){
    				var cDCCode = data.value;
    				$.ajax({
    					url:'System/selectXZUser.action',
    					type:'post',
    					data:{"cDCCode": cDCCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择客户名称</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-cDep="'+item.cCusDepart+'">'+item.cCusName+'</option>'
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
    				var cCusCode = data.value;
    				cCusPPerson = $("#customer_name").find('option:selected').attr('data-cCusPPerson');
    				cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
    				$.ajax({
    					url:'System/selectXZContract.action',
    					type:'post',
    					//客户编号加合同类型（销售类合同）
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

    				$("#contract_amount").val(contractAmount); //合同金额
					$("#date1").val(strContractOrderDate); //合同金额
					$("#date2").val(strContractStartDate); //合同金额
					$("#date3").val(strContractEndDate); //合同金额
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
										+	'<td colspan=2><textarea name="contract_str_name" class="layui-textarea" readonly>'+item.strName+'</textarea></td>'
										+	'<td colspan=2><textarea name="contract_str_name_change" class="layui-textarea"></textarea></td>'
										+	'<td colspan=2><textarea name="contract_str_memo" class="layui-textarea" readonly>'+item.strMemo+'</textarea></td>'
										+	'<td colspan=2><textarea name="contract_str_memo_change" class="layui-textarea"></textarea></td>'
										+  '</tr>';
            					$('.contract').after(html);
            					inputRender();//input框自定义渲染
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
    						n_count = 0;
    						$.each(res.data,function(index,item){
								d_count++;
								var html = '<tr class="details">'
										+	'<td><input type="text" name="strCode" value="'+item.strCode+'" readonly></td>'
										+	'<td><input type="text" name="strName" value="'+item.strName+'" readonly></td>'
										+	'<td><textarea name="cDefine28" class="layui-textarea" readonly>'+item.cDefine28+'</textarea></td>'
										+	'<td><textarea name="cDefine28Change" class="layui-textarea"></textarea></td>'
										+	'<td><input type="text" id="dblQuantity'+d_count+'" name="dblQuantity" value="'+item.dblQuantity+'" readonly></td>'
										+	'<td><input type="text" id="dblQuantityChange'+d_count+'" name="dblQuantityChange"></td>'
										+	'<td><input type="text" id="dblPrice'+d_count+'" name="dblPrice" value="'+item.dblPrice+'" readonly></td>'
										+	'<td><input type="text" id="dblPriceChange'+d_count+'" name="dblPriceChange"></td>'
										+	'<td><input type="text" id="dblSum'+d_count+'" name="dblSum" value="'+item.dblSum+'" readonly></td>'
										+	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
										+ '</tr>';

								$('table.table-open>tbody').append(html);
								//渲染
								detailsRender(d_count); //明细信息每行自定义渲染事件
								inputRender(); //input滑过显示内容详情 - 防止溢出情况
    						});
    					}
    				});
    			});
				
				//操作
				var d_count = 1;
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



					deleteItem($('.delete'+index));  //每一行绑定行删除事件
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
				//行删除事件
                function deleteItem($demo){
                	deleteDetailsItem2($demo);
                }
    			//文本输入框自定义渲染事件	//input滑过显示内容详情 - 防止溢出情况
                function inputRender(){
                	$('input').mouseover(function(e){
                		e.target.title = e.target.value;
                	});
                }

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
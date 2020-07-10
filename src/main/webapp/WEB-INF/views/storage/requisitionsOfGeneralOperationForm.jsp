<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 普通运营、BO配件请购单 -->
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
					<th colspan="13" class="table-h">运营、BO配件请购单</th>
				</tr>
				<tr>
	 				<th colspan=13 style="text-align:right">请购单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >
		 		<tr>
		 			<td colspan=2>说明</td>
		 			<td colspan=11><input type="text" name="illustration" value="用于丽泽公司运营合同、BO合同" readonly></td>
		 		</tr>
		 		<tr>
		 			<th colspan="13" style="text-align: center;">基本信息</th>
		 		</tr>
		 		<tr>
		 			<td colspan=2>申请人</td>
		 			<td colspan=2><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td colspan=2>申请部门</td>
		 			<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
		 			<td colspan=2>申请日期</td>
		 			<td colspan=3><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
		 		<tr>
		 			<td colspan=2>区域</td>
		 			<td colspan=2><select name="area" id="area" lay-filter="area" lay-search lay-verify="required" disabled></select></td>
		 			<td colspan=2>客户名称</td>
		 			<td colspan=2><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
		 			<%--<td colspan=2>出库类型</td>
		 			<td colspan=3><select name="out_type"><option value="1">BO设备出库</option><option value="2">运营出库</option></select></td>--%>
		 		</tr>
		 		<tr>
		 			<td colspan=2>销售合同编号</td>
		 			<td colspan=11><select name="contract_id" id="contract_id" lay-filter="contract_id" lay-search lay-verify="required"></select></td>
		 		</tr>
				<tr>
					<td colspan=2>申请类型</td>
					<td colspan=4>
						<select name="applyType" id="applyType" lay-filter="applyType" lay-search lay-verify="required">
							<option value="">请选择申请类型</option>
							<option value="1" selected>普通请购</option>
							<option value="2">维修入库</option>
						</select>
					</td>
					<td colspan=2>货品流转编码</td>
					<td colspan=6><input type="text" name="productNumber" id="productNumber" class="layui-input" placeholder="申请类型为维修入库时请输入货品编码" autocomplete="off" disabled></td>
				</tr>
		 		<tr>
		 			<th colspan="13" style="text-align: center;">销售合同付款约定</th> <!--payment_agreement-->
		 		</tr>
		 		<tr class="contract">
					<th colspan=3>合同条款名称</th>
					<th colspan=10>合同条款内容</th>
				</tr>
		 		<tr>
		 			<td colspan="2">运营合同开始时间</td>
<!-- 		 			<td colspan=11><input type="text" id="date2" name="beginning_endingtime" class="layui-input" placeholder="请选择日期"></td> -->
<!-- 		 			<div class="layui-inline">合同开始日期<input type="text" name="beginning_endingtime">至合同结束日期<input type="text" name="beginning_endingtime"></div> -->
		 			<td colspan=4>
						<div class="layui-inline">
							<input type="text" name="start_time" class="layui-input" id="start_time" readonly>
						</div>
					</td>

					<td colspan="2">运营合同结束时间</td>
					<!-- 		 			<td colspan=11><input type="text" id="date2" name="beginning_endingtime" class="layui-input" placeholder="请选择日期"></td> -->
					<!-- 		 			<div class="layui-inline">合同开始日期<input type="text" name="beginning_endingtime">至合同结束日期<input type="text" name="beginning_endingtime"></div> -->
					<td colspan=4>
						<div class="layui-inline">
							<input type="text" name="end_time" class="layui-input" id="end_time" readonly>
						</div>
					</td>
		 		</tr>
		 		<tr>
		 			<td colspan=2>期望到货日期</td>
		 			<td colspan=11><input type="text" id="date1" name="expectedDelivery_date" class="layui-input" placeholder="请选择日期" autocomplete="off"></td>
		 		</tr>
		 		<tr style="display: none">
		 			<td colspan=2>合同总额</td>
		 			<td colspan=2><input type="text" id="contract_amount" name="contract_amount" readonly></td>
		 			<td colspan=2>实际已收款</td>
		 			<td colspan=2><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
		 			<td colspan=2>欠款金额</td>
		 			<td colspan=3><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
		 		</tr>
				<tr>
					<td>期初合同已收款</td>
					<td colspan=12><input type="text" id="moneyBegin" name="moneyBegin" readonly></td>
				</tr>
		 		<tr>
		 			<th colspan="13" style="text-align: center;">明细信息</th>
		 		</tr>
		 		<tr>
		 			<td>序号</td>
		 			<td>运营设备编码</td>
		 			<td>运营设备</td>
		 			<%--<td>运营设备开始日期</td>
		 			<td>运营设备结束日期</td>--%>
		 			<td>存货编码</td>
		 			<td>商品名称</td>
		 			<td>规格型号</td>
		 			<td>单位</td>
		 			<td>请购数量</td>
		 			<td>库存数量</td>
		 			<td name="recent">物品报价</td>
		 			<td>操作</td>
		 		</tr>
		 		<tr class="details">
		 			<td><input type="text" name="number" value="1" readonly></td>
		 			<td><input type="text" name="runproduct_id" readonly></td>
		 			<td><input type="text" name="runproduct_name" readonly></td>
		 			<%--<td><input type="text" name="start_time" readonly></td>
		 			<td><input type="text" name="over_time" readonly></td>--%>
		 			<td><input type="text" name="inventory_id" readonly></td>
		 			<td id="container1" class="container container1">
						<input id='product_name' name="product_name" class="search-box" placeholder="输入关键字查询">
						<div class="list-container" style="display:none;">
		                	<ul></ul>
		            	</div>
					</td>
		 			<td><input type="text" name="specifications_models" readonly></td>
		 			<td><input type="text" name="unit" readonly></td>
		 			<td><input type="text" id="buy_quantity1" name="buy_quantity"></td>
		 			<td><input type="text" name="inventory_quantity" readonly></td>
		 			<td name="recent"><input type="text" name="item_offer" lay-verify="required"></td>
		 			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		 		</tr>
		 	</tbody>
		 	<thead>
<!-- 		 		<tr> -->
<!-- 		 			<td colspan=13 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td> -->
<!-- 		 		</tr> -->
	 			<tr>
	 				<th colspan=13></th>
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
					//,type: 'datetime' ,//yyyy-MM-dd HH:mm:ss
				});
                /*//运营合同起止时间
				laydate.render({
					elem: '#start_time' //指定元素
					//,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function(value, date, endDate){
				    	// console.log(value); //得到日期生成的值
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#end_time').val() != ''){
				    		$('#end_time').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#start_time').val('');});
				    	}
				    }
				});
				laydate.render({
					elem: '#end_time' //指定元素
					//,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#start_time').val() != ''){
				    		$('#start_time').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#end_time').val('');});
				    	}
			        }
				});*/
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";

                var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息
                //如果当前登录人角色不为  5:管理员；23:总经理；34:财务主管；47:区域经理；29:开发管理员 26：物资部长
                if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70){
                    //登录人角色不为上述角色，则将合同金额信息隐藏
                    $('td[name="recent"]').css('display','none');
                }


				setApplyMessage(staffName,departmentId);
				//监听申请类型，维修入库添加货品流转编码输入框
				form.on('select(applyType)',function (data) {
					var applyType = data.value;
					if(applyType == '2'){
					    $('#productNumber').removeAttr("disabled");
                        $('#productNumber').attr("lay-verify","required");
					}else {
					    $('#productNumber').attr("disabled",true);
					}
                });

				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款
				// 第一级 - 获取所有区域
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
    			// 第二级 - 根据区域获取客户名称
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
                $('#moneyBegin').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('.contract-details').remove();
					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					$('.details').find('select[name="runproduct_name"]').html('');
					$('.details').find('select[name="runproduct_name"]').siblings().remove();
					form.render();
        		//});
        		// 第三级 - 根据客户名称获取销售合同编号
                var cCusPPerson = '';//保存业务员编码
                var cCusDepart = '';//保存业务员部门
        		form.on('select(customer_name)', function(data){
    				var cCusCode = data.value;
                    cCusPPerson = $("#customer_name").find('option:selected').attr('data-cCusPPerson');
                    cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
    				$.ajax({
    					url:'System/selectContract.action',
    					type:'post',
    					data:{"cCusCode": cCusCode,"strContractType":"02"},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择销售合同编号</option>';
    						$.each(res.data,function(index,item){
    							html += '<option data-money="'+item.dblTotalCurrency+'"  data-moneyBegin="'+item.cDefine14+'"  value="'+item.strContractID+'">名称：'+item.strContractName
    							+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
    						});
    						$('#contract_id').html(html);
    						form.render('select');
    					}
    				});
    				//重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
    				$('#contract_amount').val('');
                    $('#moneyBegin').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('.contract-details').remove();
					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					$('.details').find('select[name="runproduct_name"]').html('');
					$('.details').find('select[name="runproduct_name"]').siblings().remove();
					form.render();
        		});
        		// 第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)
        		var runproduct_name_html = ''; // 运营设备下拉列表
    			form.on('select(contract_id)', function(data){
    				var strContractID = data.value;//合同编号

                    $.ajax({
                        url:'System/selectContractById.action',
                        type:'post',
                        data:{'strContractID':strContractID},
                        dataType:'JSON',
                        success:function(result){
                            var contract = result.data;
                            //合同起止时间
                            $('#start_time').val(contract.strContractStartDate);//
                            $('#end_time').val(contract.strContractEndDate);//
                        }
                    });


    				var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
                    var moneyBegin =  $(data.elem).find("option:selected").attr('data-moneyBegin');
    				$("#contract_amount").val(contractAmount);//合同金额
                    $("#moneyBegin").val(moneyBegin == "undefined"?"无":moneyBegin);//期初合同已收款金额
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
            		//查询合同条款
            		$.ajax({
            			url:'System/selectContractAll.action',
            			type:'post',
            			data:{'strContractID':strContractID},
            			dataType:'JSON',
            			success:function(res){
            				$.each(res.data,function(index,item){
            					var html = '<tr class="contract-details">'
            							 + 	'<td colspan=3><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
            							 +	'<td colspan=10><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
            							 + '</tr>';
            					$('.contract').after(html);
            					inputRender();//input框自定义渲染
            				});
            			}
            		});
            		//获取运营设备(附带运营设备编码和设备运营期间)
    				$.ajax({
    					url:'System/selectshebei.action',
    					type:'post',
    					data:{"strContractID": strContractID},
    					dataType:'JSON',
    					success:function(res){
    						$('.details').remove();
    						var n_count = 0, d_count = 0, models = '无';
    						$.each(res.data,function(index,item){
    							n_count++;d_count++;
    							if(item.规格 != undefined){models = item.规格;}
    							var html = '<tr class="details">'
    					 			 +	'<td><input type="text" name="number" value="'+n_count+'" readonly></td>'
    					 			 +	'<td><input type="text" name="runproduct_id" value="'+item.商品编号+'" readonly></td>'
    					 			 +	'<td><input type="text" name="runproduct_name" value="'+item.商品名称+'" readonly></td>'
    					 			/* +	'<td><input type="text" name="start_time" value="'+item.开始时间+'" readonly></td>'
    					 			 +	'<td><input type="text" name="over_time" value="'+item.结束时间+'" readonly></td>'*/
    					 			 +	'<td><input type="text" name="inventory_id" readonly></td>'
    					 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
    								 +		'<input id="product_name" name="product_name" class="search-box" placeholder="输入关键字查询">'
    								 +		'<div class="list-container" style="display:none;">'
    					             +   		'<ul></ul>'
    					             +		'</div>'
    								 +	'</td>'
    					 			 +	'<td><input type="text" name="specifications_models" readonly></td>'
    					 			 +	'<td><input type="text" name="unit" readonly></td>'
    					 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity"></td>'
    					 			 +	'<td><input type="text" name="inventory_quantity" readonly></td>'
    					 			 +	'<td name="recent"><input type="text" name="item_offer" lay-verify="required"></td>'
    					 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
    					 			 +	'</tr>';
    					 		$('table.table-open>tbody').append(html);
    					 		//渲染
    					 		detailsRender(d_count); //明细信息每行自定义渲染事件
	    						inputRender();//input框自定义渲染
    						});
    					}
    				});
            		//明细信息重置,重置[运营设备]级下面的内容??????????????????????????
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input:not(input[name="number"])').val('');
					form.render();
    			});

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    $("#area").removeAttr("disabled");
					var buy_number = data.field.buy_number;
					var area_id = data.field.area;													//区域编号
					var date = data.field.date;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var customer_id = data.field.customer_name;										//客户编号
					var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
					//var out_type = data.field.out_type;
					var contract_id = data.field.contract_id;										//合同编号
					var contract_name = $('#contract_id').find('option:selected').attr('data-name'); //合同名称
					//var payment_agreement = data.field.payment_agreement;
					//运营合同起止时间//beginning_endingtime
					var start_time = data.field.start_time;
					var end_time = data.field.end_time;
					var expectedDelivery_date = data.field.expectedDelivery_date;
					var contract_amount = Number(data.field.contract_amount);
					var actual_receipt = Number(data.field.actual_receipt);
					var outstanding_receipt = Number(data.field.outstanding_receipt);

                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额

					var applyType = $('#applyType').find('option:selected').val();//申请类型
					var productNumber = data.field.productNumber;//货品流转编码
					
					var currencyDetails = [];
					$.each($('.details'),function(index,item){
						var number = $(item).find('input[name="number"]').val(); //序号
						var runproduct_id = $(item).find('input[name="runproduct_id"]').val(); //运营设备编码
						var runproduct_name = $(item).find('input[name="runproduct_name"]').val();  //运营设备名称
						/*var start_time = $(item).find('input[name="start_time"]').val();
						var over_time = $(item).find('input[name="over_time"]').val();*/
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var item_offer = Number($(item).find('input[name="item_offer"]').val());

						var obj = {'details_string':runproduct_id,
								'details_string2':runproduct_name,
								/*'details_date2':start_time,
								'details_date3':over_time,*/
								'details_string4':inventory_id,
								'details_string5':product_name,
								'details_string6':specifications_models,
								'details_string7':unit,
								'details_money':buy_quantity,
								'details_money3':inventory_quantity,
								'details_money4':item_offer};
                        currencyDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			'currency_number':buy_number,
				 			'currency_int':area_id,
				 			'currency_string2':area_name,
				 			'currency_string4':customer_id,
				 			'currency_string7':customer_name,
				 			'currency_int2':2,
				 			'currency_int3':applyType,
				 			'currency_string3':contract_id,
				 			'currency_string9':productNumber,
				 			//'currency_string9':payment_agreement,
				 			//'currency_date':date,
				 			//'currency_date2':beginning_endingtime,
                            'currency_date2':start_time,
                            'currency_date4':end_time,
				 			'currency_date3':expectedDelivery_date,
				 			'currency_money':contract_amount,
				 			'currency_money2':actual_receipt,
				 			'currency_money3':outstanding_receipt,
				 			'currency_money6':1000,
				 			'currency_type':10,
                            'currency_string5':cCusPPerson,
                            'currency_string11':cCusDepart,
                            'currency_string16':moneyBegin,
				 			'currencyDetails':JSON.stringify(currencyDetails)}
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
				
//                 //操作
//                 //点击添加明细按钮
// 				var d_count = 1;
// 				$('.addDetails').click(function(){
// 					d_count++;
// 					var html = '<tr class="details">'
// 				 			 +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
// 				 			 +	'<td><input type="text" name="runproduct_id" readonly></td>'
// 				 			 +	'<td><select name="runproduct_name" lay-filter="runproduct_name" lay-search>'+runproduct_name_html+'</select></td>'
// 				 			 +	'<td><input type="text" name="start_time" readonly></td>'
// 				 			 +	'<td><input type="text" name="over_time" readonly></td>'
// 				 			 +	'<td><input type="text" name="inventory_id" readonly></td>'
// 				 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
// 							 +		'<input id="product_name" name="product_name" class="search-box" placeholder="输入关键字查询">'
// 							 +		'<div class="list-container" style="display:none;">'
// 				             +   		'<ul></ul>'
// 				             +		'</div>'
// 							 +	'</td>'
// 				 			 +	'<td><input type="text" name="specifications_models" readonly></td>'
// 				 			 +	'<td><input type="text" name="unit" readonly></td>'
// 				 			 +	'<td><input type="text" name="buy_quantity"></td>'
// 				 			 +	'<td><input type="text" name="inventory_quantity" readonly></td>'
// 				 			 +	'<td><input type="text" name="item_offer" readonly></td>'
// 				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
// 				 			 +	'</tr>';
// 					$('table.table-open>tbody').append(html);
// 					//渲染
// 					detailsRender(d_count); //明细信息每行自定义渲染事件
// 					//form.render();
// 					inputRender();//input框自定义渲染
// 				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
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
                    processProductSale($demo);
				}
				
			});
		</script> 
	</body>
</html>
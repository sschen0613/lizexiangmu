<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽材料类出库申请表编辑 -->
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
		<form class="layui-form form-open" action="Storage/insert.action">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=13 class="table-h">丽泽材料类出库申请表</th>
				</tr>
				<tr>
					<th colspan=13 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
		 			<td colspan=3><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td colspan=3><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=4><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>区域</td>
					<td colspan=3><select name="area" id="area" lay-filter="area" lay-search lay-verify="required"></select></td>
					<td>客户名称</td>
					<td colspan=8><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>合同编号</td>
					<td colspan=12><select name="contract_id" id="contract_id" lay-filter="contract_id" lay-search lay-verify="required"></select></td>
				</tr>
				<tr style="display: none">
					<td>合同金额</td>
					<td colspan=3><input type="text" id="contract_amount" name="contract_amount" readonly></td>
					<td>已收金额</td>
					<td colspan=3><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
					<td>欠款金额</td>
					<td colspan=4><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
				</tr>
				<tr>
		 			<th colspan="13" style="text-align: center;">销售合同付款约定</th> <!--payment_agreement-->
		 		</tr>
				<tr class="contract">
					<th colspan=4>合同条款名称</th>
					<th colspan=9>合同条款内容</th>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan=12><input type="text" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
				</tr>
				<tr>
					<td>仓库</td>
					<td colspan=12><select name="cangku" id="cangku" lay-filter="cangku" data-cknumber="" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<th colspan=13 style="text-align:center;">明细信息</th>
				</tr>
				<tr>
					<td>运营设备编码</td>
					<td>运营设备</td>
					<td>设备运营期间</td>
					<td>存货编码</td>
					<td>商品名称</td>
					<td>规格型号</td>
					<td>单位</td>
					<td>申请数量</td>
					<td>可用量</td>
					<td>近期商品价格</td>
					<td style="display: none">货架编码</td>
					<td style="display: none">货架货物数量</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="runproduct_id" readonly></td>
					<td><select name="runproduct_name" lay-filter="runproduct_name" lay-search lay-verify="required"></select></td>
					<td><input type="text" name="runproduct_dates" readonly></td>
					<td><input type="text" name="inventory_id" readonly></td>
					<td id="container1" class="container container1">
						<input id='product_name' name="product_name" class="search-box" placeholder="输入关键字查询" lay-verify="required">
						<div class="list-container" style="display:none;">
		                	<ul></ul>
		            	</div>
					</td>
					<td><input type="text" name="specifications_models" readonly></td>
					<td><input type="text" name="unit" readonly></td>
					<td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
					<td><input type="text" name="fAvaQuantity" readonly></td>
					<td><input type="text" name="recent_price" readonly></td>
					<td style="display: none"><input type="text" name="huojia" readonly></td>
					<td style="display: none"><input type="text" name="huojiahuowu" readonly></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=13 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=13></th>
				</tr>
		 	</thead>
		</table>
		<div class="form-notes">
			<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号 - 运营设备的顺序进行选择</i>
			<i class="layui-icon layui-icon-about"> 添加商品前请先确定仓库</i>
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
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					//console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;											//单号
					var area_id = data.field.area;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var contract_id = data.field.contract_id;										//合同编号
					var contract_name = $('#contract_id').find('option:selected').attr('data-name');//合同名称
					var customer_id = data.field.customer_name;										//客户编号
					var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
					//var currency_applicant = data.field.currency_applicant;						//申请人
					var department_Id = data.field.department_Id;									//申请部门
					//var currency_date = data.field.currency_date;									//申请时间
					var contract_amount = data.field.contract_amount;								//合同总金额
					var actual_receipt = data.field.actual_receipt;									//已收金额
					var outstanding_receipt = data.field.outstanding_receipt;						//欠款金额
					var apply_reason = data.field.apply_reason;										//申请事由
					var cWhName = $('#cangku').find('option:selected').text();						//仓库名称
					var cWhId = data.field.cangku;													//仓库编码
					
					var details = $('.details');
					var price = 0, flag = 1, currencyDetails = [];
					$.each(details,function(index,item){
						var runproduct_id = $(item).find('input[name="runproduct_id"]').val();						//运营设备编码
						var runproduct_name = $(item).find('select[name="runproduct_name"]>option:selected').text();	//运营设备名称
						var runproduct_dates = $(item).find('input[name="runproduct_dates"]').val();	//运营期间
						var inventory_id = $(item).find('input[name="inventory_id"]').val();			//存货编码
						var product_name = $(item).find('input[name="product_name"]').val();			//存货名称
						var specifications_models = $(item).find('input[name="specifications_models"]').val(); //规格型号
						var unit = $(item).find('input[name="unit"]').val();								//单位
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());		//申请数量
						var fAvaQuantity = Number($(item).find('input[name="fAvaQuantity"]').val());		//可用量
						var recent_price = Number($(item).find('input[name="recent_price"]').val());		//最近日期商品价格
						var cPosCode = $(item).find('input[name="huojia"]').val();							//货架编码
						var cWhCode = Number($(item).find('input[name="huojiahuowu"]').val());				//货架货物数量
						
						price += buy_quantity * recent_price ;
						//价格判断是否符合要求
						if(recent_price > contract_price){
							flag = 0; //价格大于合同条款规定价格
							return;
						}
						var obj = {'details_string':runproduct_id,'details_string2':runproduct_name,'details_string3':runproduct_dates
								,'details_string4':inventory_id,'details_string5':product_name,"details_string6":specifications_models
								,'details_string7':unit,'details_money':buy_quantity,'details_money2':fAvaQuantity
								,'details_string10':cPosCode,'details_money3':cWhCode};
						currencyDetails.push(obj);
					});
					//价格判断不符合要求,表单不提交
					if(flag == 0){
						layer.msg('商品单价大于合同条款规定价格('+contract_price+'元)');
						return false;
					}
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {'currency_number':buy_number ,"currency_int": area_id,"currency_string2":area_name ,"currency_string3": contract_id
				 			 ,"currency_string4": customer_id,"department_Id": department_Id,"currency_type":2,"currency_string5":cCusPPerson
				 			 ,"currency_money":contract_amount,"currency_money2":actual_receipt,"currency_money3":outstanding_receipt
				 			 ,"currency_string7":apply_reason ,'details_string8':cWhName,'details_string9':cWhId
				 			 ,"currencyDetails":JSON.stringify(currencyDetails),'currency_money6':price}
				 		,dataType : "JSON"
				 		,beforeSend: function(){
				 			layer.msg('正在提交申请', {
				 				icon: 16
				 				,shade: 0.01
				 			});
				 		}
				 		,success : function(result){
				 			layer.msg(result.msg);
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});
				
				//表单数据初始化
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
				// 过程一第一级 - 获取登陆人区域
				var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
//     			$.ajax({
//     				url:'System/getAlready.action',
//     				type:'post',
//     				data:{'staff_id':staff_id},
//     				dataType:'JSON',
//     				success:function(res){
//     	 				var html = '<option value="">请选择区域</option>';
//     					$.each(res.data,function(index,item){
//     						html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
//     					});
//     					$('#area').html(html); 
//     					form.render('select');
//     				}
//     			});
    			// 过程一第二级 - 根据区域获取客户名称
        		form.on('select(area)', function(data){
    				var cDCCode = data.value;
    				$.ajax({
    					url:'System/selectUser.action',
    					type:'post',
    					data:{"cDCCode": cDCCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择客户名称</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'">'+item.cCusName+'</option>'
    						});
    						$('#customer_name').html(html);
    						form.render('select');
    					}
    				});
    				// 重置[客户名称]级下面的内容(合同编号 金额信息 合同条款 明细信息)
					$('#contract_id').siblings().remove();
					$('#contract_id').html('');
					$('#contract_amount').val('');
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
        		// 过程一第三级 - 根据客户名称获取销售合同编号
        		var cCusPPerson;
        		form.on('select(customer_name)', function(data){
        			cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');
    				var cCusCode = data.value;
    				$.ajax({
    					url:'System/selectContract.action',
    					type:'post',
    					data:{"cCusCode": cCusCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择销售合同编号</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.strContractID+'" data-name="'+item.strContractName+'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
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
					$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					$('.details').find('select[name="runproduct_name"]').html('');
					$('.details').find('select[name="runproduct_name"]').siblings().remove();
					form.render();
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});
        		// 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)
        		var runproduct_name_html = ''; //运营设备下拉列表
        		var contract_price = 0;	//合同条款带出的价格
        		var contract_type = 1;	//设置合同类型
    			form.on('select(contract_id)', function(data){
    				var strContractID = data.value;//合同编号
    				var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
    				$("#contract_amount").val(contractAmount);//合同金额
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
            							 + 	'<td colspan=4><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
            							 +	'<td colspan=9><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
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
    					data:{"strContractID": strContractID,'type':contract_type},
    					dataType:'JSON',
    					success:function(res){
    						var html = '<option value="">请选择运营设备</option>';
    						$.each(res.data,function(index,item){
    							var quantity = 0;
    							if(item.iQuantity != undefined)
    								quantity = item.iQuantity;
    							var std = '无';
    							if(item.cinvStd != undefined)
    								std = item.cinvStd;
    							html += '<option value="'+item.商品编号+'" data-EndDate="'+item.结束时间+'" data-StartDate="'
    							+item.开始时间+'">'+item.商品名称+'</option>';
    						});
    						runproduct_name_html = html;
    						$.each($('.details'),function(index,item){
    							$(item).find('select[name="runproduct_name"]').html(html);
    							form.render('select'); 
    						});
    					}
    				});
            		//明细信息重置,重置[运营设备]级下面的内容
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					form.render();
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
    			});
        		// 过程一第五级 - 根据运营设备设置运营设备编码和设备运营期间
        		form.on('select(runproduct_name)',function(data){
        			//判断明细信息中是否已存在相同项
			    	if( ! judgeItems($(data.elem).closest('.details'),$(data.elem).closest('.details').find('input[name="product_name"]').val(),data.value) ){
			    		$(data.elem).closest('.details').find('input[name="runproduct_id"]').val('');
	        			$(data.elem).closest('.details').find('input[name="runproduct_dates"]').val('');
			    		$(data.elem).html(runproduct_name_html);
						form.render('select');
			    		return;
			    	}
        			var cInvCode = data.value;
        			var StartDate = $(data.elem).find("option:selected").attr('data-StartDate');
        			var EndDate = $(data.elem).find("option:selected").attr('data-EndDate');
        			var period = StartDate +" - "+EndDate;
        			$(data.elem).closest('.details').find('input[name="runproduct_id"]').val(cInvCode);
        			$(data.elem).closest('.details').find('input[name="runproduct_dates"]').val(period);
        		});
        		//过程二初始化
        		// 一:获取仓库
//     			$.ajax({
//     				url:'System/selectCangKu.action',
//     				type:'post',
//     				dataType:'JSON',
//     				success:function(res){
//     	 				var html = '<option value="">请选择仓库</option>';
//     					$.each(res.data,function(index,item){
//     						html += '<option value="'+item.cWhCode+'">'+item.cWhName+'</option>';
//     					});
//     					$('#cangku').html(html); 
//     					form.render('select');
//     				}
//     			});
        		//二:选择仓库,之后就可以选择商品
        		var currentCangkuId = '';	//当前选中仓库的id
        		form.on('select(cangku)',function(data){
        			//保存当前选中仓库的id
        			currentCangkuId = data.value;//string类型
        			//明细信息重置
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					$('.details').find('select[name="runproduct_name"]').html(runproduct_name_html);
					form.render('select');
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});
        		
				//操作
                //点击添加明细按钮
				var count = 1;
				$('.addDetails').click(function(){
					count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="runproduct_id" readonly></td>'
				 			 +	'<td><select name="runproduct_name" lay-filter="runproduct_name" lay-search lay-verify="required">'+runproduct_name_html+'</select></td>'
				 			 +	'<td><input type="text" name="runproduct_dates" readonly></td>'
				 			 +	'<td><input type="text" name="inventory_id" readonly></td>'
				 			 +	'<td id="container'+count+'" class="container container'+count+'">'
							 +		'<input id="product_name" name="product_name" class="search-box" placeholder="输入关键字查询" lay-verify="required">'
							 +		'<div class="list-container" style="display:none;">'
				             +   		'<ul></ul>'
				             +		'</div>'
							 +	'</td>'
				 			 +	'<td><input type="text" name="specifications_models" readonly></td>'
				 			 +	'<td><input type="text" name="unit" readonly></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="fAvaQuantity" readonly></td>'
				 			 +  '<td><input type="text" name="recent_price" readonly></td>'
				 			 +  '<td><input type="text" name="huojia" readonly></td>'
				 			 +  '<td><input type="text" name="huojiahuowu" readonly></td>'
				 			 +	'<td class="delete'+count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
					form.render();
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
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
        			// 过程二第一级 - 获取商品名称
            		//即时监听搜索框,形成商品列表下拉列表框(附带其它内容)
    				$demo.find('.search-box').bind("input propertychange",function(event){
    					var currentKey = $(event.target).val();//搜索框值
    					if(currentKey == '' || currentCangkuId == ''){
    						if(currentCangkuId == '') layer.msg('请先选择仓库');
    						$demo.find('.list-container>ul').html('');
    						$demo.find('.list-container').css('display','none');
    					}else{
    			        	$.ajax({
    			        		url:'System/selectTarget2.action',
    			        		type:'post',
    			        		data:{'cInvName':currentKey,'cWhCode':currentCangkuId},
    			        		dataType:'JSON',
    			        		success:function(res){
    			        			var html = '<li value="" class="list-this">请选择商品名称</li>';
    			        			$.each(res.data,function(index,item){
    			        				var models = item.规格型号;
    			        				if(models == undefined) models = '无';
    			        				var recentPrice = item.单价;
    			        				if(recentPrice == undefined) recentPrice = 0;
    			        				var fAvaQuantity = 0;
    			        				if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
    			        				var hjnumber = item.货位编码;
    			        				if(hjnumber == undefined) hjnumber = '无';
    			        				var hjcount = item.货架货物数量;
    			        				if(hjcount == undefined) hjcount = 0;
    			        				html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
    			        				+models+'" data-unit="'+item.单位名称+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cangku="'
    			        				+item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'
    			        				+hjcount+'" data-recentPrice="'+recentPrice+'">'+item.存货名称+'</li>';
    			        			});
    			        			$demo.find('.list-container>ul').html(html);
    			        			$demo.find('.list-container').css('display','block');
    			        			//给下拉列表框绑定隐藏事件
    			        			hideListContainer($demo.attr('id'));
    			        		}
    			        	});
    					}
    				});
    				//过程二第二级 - 根据商品名称设置其它内容
    				//给下拉列表框绑定点击事件
    			    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
    			    	//判断明细信息中是否已存在相同项
    			    	if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
    			    	var value = $(this).val();//number类型
    			    	var text = $(this).text();
    			    	$(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id'));
    			      	$(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name'));
    			       	$(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models'));
    			       	$(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit'));
    			       	$(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity'));
    			       	$(this).closest('.details').find('input[name="recent_price"]').val($(this).attr('data-recentPrice'));
    			       	$(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber'));
    			       	$(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount'));
    			        //保存明细信息当前行的商品名称input框值
    			       	var n = Number( $demo.attr('id').replace('container','') );
    					currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
    			       	//重置下拉列表框
    					$(this).parent().empty();
    					$demo.find('.list-container').css('display','none');
    					
    			    });
        		}
				
        		//表单数据初始化填写
                var currency_id0 = '${param.currency_id}';	//number类型
                var currency_type0 = Number('${param.currency_type}'); //string类型
				$.ajax({
                    url:'Currency/selectCurrencyApply.action',
                    type:'post',
                    data:{"currency_id":currency_id0},
                    dataType:'JSON',
                    success:function(res){
                    	//表单赋值操作
                        $('input[name="buy_number"]').val(res.data.currency_id);//请购单号
                        //获取申请人/申请部门
        				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
        				$("#staffName").val(staffName);//申请人
        				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
        				//根据id查询部门
        				$.ajax({
        					url : "Department/selectDingDepartmentId.action",
        					type : "post",
        					data : {"id": departmentId},
        					dataType : "JSON",
        					success : function(res){
        						var departmentName = '无记录';
        						if(res.data != null) departmentName = res.data.department_Name;
        						$("#department").val(departmentName);//申请部门
        					}
        				});
                        $('input[name="currency_date"]').val(Format(res.data.currency_date,"yyyy-MM-dd"));//申请日期
                        var areaId = res.data.currency_int;//地区编号
                        var customerId = res.data.currency_string4;//客户名称编号
                        var contractId = res.data.currency_string3;//合同编号
                        $('input[name="contract_amount"]').val(res.data.currency_money); //合同金额
                        $('input[name="actual_receipt"]').val(res.data.currency_money2); //已收金额
						$('input[name="outstanding_receipt"]').val(res.data.currency_money3); //欠款金额
                        cCusPPerson = res.data.currency_string5; //业务员编码
                        // 过程一第一级 - 获取所有区域
            			$.ajax({
            				url:'System/getRegion.action',
            				type:'post',
            				data:{},
            				dataType:'JSON',
            				success:function(res){
            	 				var html = '<option value="">请选择区域</option>';
            	 				$.each(res.data,function(index,item){
            						html += '<option value="'+item.cDCCode+'" ';
            						if(item.cDCCode == areaId){html += 'selected';}
            						html += '>'+item.cDCName+'</option>';
            					});
            					$('#area').html(html); 
            					form.render('select');
            					// 过程一第二级 - 根据区域获取客户名称(同时获取业务员编码)
                    			$.ajax({
                					url:'System/selectUser.action',
                					type:'post',
                					data:{"cDCCode": areaId},
                					dataType:'JSON',
                					success:function(res){
                		 				var html = '<option value="">请选择客户名称</option>';
                						$.each(res.data,function(index,item){
                							html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-cDep="'+item.cCusDepart+'" ';
                							if(item.cCusCode == customerId){html += 'selected';}
                							html += '>'+item.cCusName+'</option>';
                						});
                						$('#customer_name').html(html);
                						form.render('select');
                						// 过程一第三级 - 根据客户名称获取销售合同编号
                						$.ajax({
            		    					url:'System/selectContract.action',
            		    					type:'post',
            		    					data:{"cCusCode": customerId},
            		    					dataType:'JSON',
            		    					success:function(res){
            		    		 				var html = '<option value="">请选择销售合同编号</option>';
            		    						$.each(res.data,function(index,item){
            		    							html += '<option data-money="'+item.dblTotalCurrency+'" value="'+item.strContractID+'" ';
            		    							if(item.strContractID == contractId){html += 'selected';}
            		    							html += '>名称：'+item.strContractName+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
            		    						});
            		    						$('#contract_id').html(html);
            		    						form.render('select');
            		    						// 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 + 获取存货编码 / 存货名称 /规格型号/单位/合同数量/库存数量
            		    		        		//查询合同条款
        		    		            		$.ajax({
        		    		            			url:'System/selectContractAll.action',
        		    		            			type:'post',
        		    		            			data:{'strContractID':contractId},
        		    		            			dataType:'JSON',
        		    		            			success:function(res){
        		    		            				$.each(res.data,function(index,item){
        		    		            					contract_price = Math.max(item.cDefine26,contract_price); //number类型
        		    		            					var html = '<tr class="contract-details">'
        		    		            							 + 	'<td colspan=4><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
        		    		            							 +	'<td colspan=9><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
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
        		    		    					data:{"strContractID": contractId,'type':contract_type},
        		    		    					dataType:'JSON',
        		    		    					success:function(res){
        		    		    						var runproductNameArray = res.data;
        		    		    						var html0 = '<option value="">请选择运营设备</option>';
        		    		    						$.each(res.data,function(index0,item0){
        		    		    							var quantity = 0;
        		    		    							if(item0.iQuantity != undefined)
        		    		    								quantity = item0.iQuantity;
        		    		    							var std = '无';
        		    		    							if(item0.cinvStd != undefined)
        		    		    								std = item0.cinvStd;
        		    		    							html0 += '<option value="'+item0.商品编号+'" data-EndDate="'+item0.结束时间+'" data-StartDate="'
        		    		    							+item0.开始时间+'">'+item0.商品名称+'</option>';
        		    		    						});
        		    		    						runproduct_name_html = html0;
        		    		    						//获取明细信息
        		    		    						$.ajax({
        		    		    							url:'Currency/selectCurrencyDetails.action',
        		    		    							type:'post',
        		    		    							data:{"currency_id":currency_id0},
        		    		                                dataType:'JSON',
        		    		    							success:function (res) {
        		    		    								$('.details').remove();
        		    		    								$.each(res.data,function(index,item){
        		    		    									count++;
        		    		    									var html = '<tr class="details">'
        		    		    							 			 +	'<td><input type="text" name="runproduct_id" value="'+item.details_string+'" readonly></td>'
        		    		    							 			 +	'<td><select name="runproduct_name" lay-filter="runproduct_name" lay-search lay-verify="required">'
        		    		    							 			 +  '<option value="">请选择运营设备</option>';
        		    		        		    					$.each(runproductNameArray,function(index00,item00){
        		    		        		    						var quantity = 0;
        		    		        		    						if(item00.iQuantity != undefined) quantity = item00.iQuantity;
        		    		        		    						var std = '无';
        		    		        		    						if(item00.cinvStd != undefined) std = item00.cinvStd;
        		    		        		    						html += '<option value="'+item00.商品编号+'" data-EndDate="'+item00.结束时间+'" data-StartDate="'+item00.开始时间+'" ';
        		    		        		    						if(item00.商品名称 == item.details_string2){html += 'selected';}
        		    		        		    						html += '>'+item00.商品名称+'</option>';
        		    		        		    					});
        		    		        		    					var recentPrice = item.recent_price;
        		    		        		    					if(recentPrice == undefined) recentPrice = 0;
        		    		        		    					var huojiaNumber = item.details_string10;
        		    		        		    					if(huojiaNumber == undefined) huojiaNumber = '无';
        		    		    							 		html += '</select></td>'
        		    		    							 			 +	'<td><input type="text" name="runproduct_dates" value="'+item.details_string3+'" readonly></td>'
        		    		    							 			 +	'<td><input type="text" name="inventory_id" value="'+item.details_string4+'" readonly></td>'
        		    		    							 			 +	'<td id="container'+count+'" class="container container'+count+'">'
        		    		    										 +		'<input id="product_name" name="product_name" value="'+item.details_string5+'" class="search-box" placeholder="输入关键字查询" lay-verify="required">'
        		    		    										 +		'<div class="list-container" style="display:none;">'
        		    		    							             +   		'<ul></ul>'
        		    		    							             +		'</div>'
        		    		    										 +	'</td>'
        		    		    							 			 +	'<td><input type="text" name="specifications_models" value="'+item.details_string6+'" readonly></td>'
        		    		    							 			 +	'<td><input type="text" name="unit" value="'+item.details_string7+'" readonly></td>'
        		    		    							 			 +	'<td><input type="text" id="buy_quantity'+count+'" name="buy_quantity" value="'+item.details_money+'" lay-verify="required"></td>'
        		    		    							 			 +	'<td><input type="text" name="fAvaQuantity" value="'+item.details_money2+'" readonly></td>'
        		    		    							 			 +  '<td><input type="text" name="recent_price" value="'+recentPrice+'" readonly></td>'
        		    		    							 			 +  '<td><input type="text" name="huojia" value="'+huojiaNumber+'" readonly></td>'
        		    		    							 			 +  '<td><input type="text" name="huojiahuowu" value="'+item.details_money3+'" readonly></td>'
        		    		    							 			 +	'<td class="delete'+count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
        		    		    							 			 +	'</tr>';
        		    		    									$('table.table-open>tbody').append(html);
        		    		    									//渲染
        		    		    									detailsRender(count); //明细信息每行自定义渲染事件
        		    		    									inputRender();//input框自定义渲染
        		    		    									form.render('select');
        		    		    									//判断是否禁止修改
        		    		    									if(flag0 == 0){
        		    		    										$('select[name="runproduct_name"]').attr('disabled','disabled');//运营设备名称禁止修改
        		    		    										$('#container'+count).find('#product_name').attr('readonly','readonly');//商品名称禁止修改
        		    		    										$('#buy_quantity'+count).attr('readonly','readonly');//数量禁止修改
        		    		    									}
        		    		    									//保存明细信息当前行的商品名称input框值
        		    		    									currentProductValues[count] = item.details_string5;
        		    		    								});
        		    		                                }
        		    		                            });
        		    		    					}
        		    		    				});
            		    					}
            		    				});
                					}
                				});
            				}
            			});
                        $('input[name="apply_reason"]').val(res.data.currency_string7);//申请事由
                        var cangkuName = res.data.currency_string8; //仓库名称
            			var cangkuId = res.data.currency_string9; //仓库编号
            			currentCangkuId = cangkuId;
                        //过程二第一级 - 获取仓库
                        $.ajax({
            				url:'System/selectCangKu.action',
            				type:'post',
            				dataType:'JSON',
            				success:function(res){
            	 				var html = '<option value="">请选择仓库</option>';
            					$.each(res.data,function(index,item){
            						html += '<option value="'+item.cWhCode+'" ';
            						if(item.cWhName == cangkuName){html += 'selected';}
            						html += '>'+item.cWhName+'</option>';
            					});
            					$('#cangku').html(html); 
            					form.render('select');
            				}
            			});
                        
                        //判断是否可以修改表单内容
                        var flag0 = 1;//可以修改
                        if(res.msg!=null){//禁止修改
                        	flag0 = 0;//不可以修改
                        	layer.msg(res.msg);
                            //禁用提交按钮
                            $('.button-div button').addClass('layui-btn-disabled');
                            $('.button-div button').attr('disabled','disabled');
                            //禁止修改内容
                            $('input[name="apply_reason"]').attr('disabled','disabled');//申请事由
                            $('select').attr('disabled','disabled');//下拉列表框禁止修改
                            //禁用添加按钮
                            $(".addDetails").unbind("click");
                       }
                    }
				});

			});
		</script> 
	</body>
</html>
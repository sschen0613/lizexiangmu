<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售出库申请表 -->
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
					<th colspan=8 class="table-h">丽泽销售出库申请表</th>
				</tr>
				<tr>
					<th colspan=8 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
					<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
					<td>申请部门</td>
					<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请日期</td>
					<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>合同编号</td>
					<td colspan=2 id="contract" class="container">
						<input id='contract_id' name="contract_id" class="contract-search-box" placeholder="输入关键字查询">
						<div class="list-container" style="display:none;">
		                	<ul></ul>
		            	</div>
					</td>
					<td colspan=2>客户名称</td>
					<td colspan=3><input type="text" id="customer_name" name="customer_name" readonly></td>
				</tr>
				<tr>
		 			<th colspan="8" style="text-align: center;">销售合同付款约定</th> <!--Payment_agreement-->
		 		</tr>
				<tr class="contract">
					<th colspan=2>合同条款名称</th>
					<th colspan=6>合同条款内容</th>
				</tr>
				<tr>
					<td>合同金额</td>
					<td><input type="text" id="contract_amount" name="contract_amount" readonly></td>
					<td>实际收款</td>
					<td colspan=2><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
					<td>欠款金额</td>
					<td colspan=2><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
				</tr>
				<tr>
					<td>期初合同已收款</td>
					<td colspan=7><input type="text" id="moneyBegin" name="moneyBegin" readonly></td>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan=7><input type="text" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></td>
				</tr>
				<tr>
					<td>仓库</td>
					<td colspan=7><select name="cangku" id="cangku" lay-filter="cangku" data-cknumber="" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<th colspan=8 style="text-align:center;">明细信息</th>
				</tr>
				<tr>
					<td>存货编码</td>
					<td>商品名称</td>
					<td>规格型号</td>
					<td>单位</td>
					<td>数量</td>
					<td>库存数量</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
				<tr class="details">
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
					<td><input type="text" name="inventory_quantity" readonly></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<%--<tr>
		 			<td colspan=8 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>--%>
	 			<tr>
	 				<th colspan=8></th>
				</tr>
		 	</thead>
		</table>
		<div class="form-notes">
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
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;//请购单号
					var contract_id = data.field.contract_id;//合同编号
					var customer_name = data.field.customer_name;//客户名称
					//var customer_Id = $("#contract_id").attr("data-cusCode");//客户id
					//var Payment_agreement = data.field.Payment_agreement;//销售合同付款约定
					var apply_reason = data.field.apply_reason;//申请事由
					var contract_amount = Number(data.field.contract_amount);//合同金额
					var actual_receipt = Number(data.field.actual_receipt);//实际收款
					var outstanding_receipt = Number(data.field.outstanding_receipt);//欠款金额
                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额
                    var cWhCode = data.field.cangku;//仓库ID
					var cWhName = $('#cangku').find('option:selected').text();//仓库名称

                    var currency_type = 13;
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();

                        var iPerTaxRate = Number($(item).find('input[name="product_name"]').attr('data-iTaxRate')); //商品税率
                        var price = Number($(item).find('input[name="product_name"]').attr('data-price')); //单价
                        //税后价格 = (税率/100 + 1 ) *单价
                        var fTaxPrice = (iPerTaxRate/100 + 1) * price;

                        var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var remark = $(item).find('input[name="remark"]').val();

                        //无税总价
                        //总金额 = 价格 * 数量
                        var fMoney = price * buy_quantity;
                        //含税合计
						var iSum = fTaxPrice * buy_quantity;

						var obj = {
						    'details_string4':inventory_id,
							'details_string5':product_name,
							'details_string6':specifications_models,
							'details_string7':unit,
							'details_money':buy_quantity,
							'details_money2':inventory_quantity,
							'details_money3':iSum,
							'details_money4':price,
							'details_money5':iPerTaxRate,
							'details_money6':fTaxPrice,
							'details_money7':fMoney,
							'details_string11':remark
						};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
							'currencyDetails':JSON.stringify(currentDetails),
							'currency_type':currency_type,
							'currency_number':buy_number,
							'currency_string3':contract_id,
							'currency_string4':customer,
							'currency_string11':customer_name,
							'currency_string7':apply_reason,
							'currency_money':contract_amount,
							'currency_money2':actual_receipt,
                            'currency_string8':cWhName,
                            'currency_string9':cWhCode,
                            'currency_string16':moneyBegin,
							'currency_money3':outstanding_receipt
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
                            $('#myForm').attr("disabled", "disabled");
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
				//过程三 - 合同编号 - 客户名称 - (合同金额+已收金额+欠款金额)+合同条款
				searchProcess_contract($('#contract'));
				//过程二初始化
        		// 一:获取仓库
    			$.ajax({
    				url:'System/selectCangKu.action',
    				type:'post',
    				dataType:'JSON',
    				success:function(res){
    	 				var html = '<option value="">请选择仓库</option>';
    					$.each(res.data,function(index,item){
    						html += '<option value="'+item.cWhCode+'">'+item.cWhName+'</option>';
    					});
    					$('#cangku').html(html); 
    					form.render('select');
    				}
    			});
        		//二:选择仓库,之后就可以选择商品
        		// currentCangkuId //当前选中仓库的id
        		/*form.on('select(cangku)',function(data){
        			//保存当前选中仓库的id
        			currentCangkuId = data.value;//string类型
        			//明细信息重置
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});*/

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="inventory_id" readonly></td>'
				 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
							 +		'<input id="product_name" name="product_name" class="search-box" placeholder="输入关键字查询" lay-verify="required">'
							 +		'<div class="list-container" style="display:none;">'
				             +   		'<ul></ul>'
				             +		'</div>'
							 +	'</td>'
				 			 +	'<td><input type="text" name="specifications_models" readonly></td>'
				 			 +	'<td><input type="text" name="unit" readonly></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="inventory_quantity" readonly></td>'
				 			 +	'<td><input type="text" name="remark"></td>'
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
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
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
        			processProductByCangkuId($demo);
				}
				//客户Id
				var customer;
        		//过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
        		var currentContractId = '';//记录当前合同编号
        		function searchProcess_contract($demo){
        			// 过程二第一级 - 获取合同编号
        			//过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
    				$('.contract-search-box').bind("input propertychange",function(event){
    					var currentKey = $(event.target).val();//搜索框值
    					if(currentKey == ''){
    						$demo.find('.list-container>ul').html('');
    						$demo.find('.list-container').css('display','none');
    					}else{
    			        	$.ajax({
    			        		url:'System/selectAllContract.action',
    			        		type:'post',
    			        		data:{'cName':currentKey},
    			        		dataType:'JSON',
    			        		success:function(res){
    			        			var html = '<li value="" class="list-this">请选择销售合同编号</li>';
    			        			$.each(res.data,function(index,item){
    			        				html += '<li value="'+item.strContractID+'" data-id="'+item.strContractID
    			        				+'" data-name="'+item.cCusName
										+'" data-cusCode="'+item.cCusCode
                                            +'" data-moneyBegin="'+item.cDefine14//期初已收款
    									+'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
    									+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate
    									+'</li>';
    			        			});
    			        			$demo.find('.list-container>ul').html(html);
    			        			$demo.find('.list-container').css('display','block');
    			        			//给合同编号下拉列表框绑定隐藏事件
    			        			hideListContainer_contract('contract');
    			        		}
    			        	});
    					}
    				});
    				//过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
    				//给下拉列表框绑定点击事件
    			    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
    			    	var value = $(this).val();//number类型
    			    	var text = $(this).text();
    			    	var strContractID = $(this).attr('data-id');
    			    	var contractAmount = $(this).attr('data-money');
                        var moneyBegin = $(this).attr('data-moneyBegin');
    			    	var contractName = $(this).attr('data-name');
    			    	customer = "";
    			    	customer = $(this).attr("data-cusCode");
    			      	$('#contract_id').val(strContractID);  //合同编号
    			      	$("#contract_amount").val(contractAmount);//合同金额
                        $('#moneyBegin').val(moneyBegin);//期初已收款金额
    			      	$('#customer_name').val(contractName);//客户名称
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
                							 + 	'<td colspan=2><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
                							 +	'<td colspan=6><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
                							 + '</tr>';
                					$('.contract').after(html);
                					inputRender();//input框自定义渲染
                				});
                			}
                		});

                		//带出合同绑定的商品信息
						$.ajax({
                            url:'System/selectshebei.action',
                            type:'post',
                            data:{"strContractID": strContractID,'type':2},
                            dataType:'JSON',
							success:function (res) {
                                $('.details').remove();
                                n_count = 0;
                                $.each(res.data,function(index,item){
                                    var models = item.规格;  if(models == undefined){models = '无';}
                                    var fAvaQuantity = item.可用量;  if(fAvaQuantity == undefined){fAvaQuantity = 0;}
                                    if (fAvaQuantity == 0) {
                                        layer.msg("库存数量为0,请勿发起出库申请");
                                        $('#myForm').addClass('layui-btn-disabled');
                                        $('#myForm').attr("disabled", "disabled");
                                    };
                                    var unit = item.数量单位;	if(unit == undefined) unit = '无';
                                    var recentPrice = item.无税单价;		if(recentPrice == undefined) recentPrice = 0;
                                    var iTaxRate = item.税率;	if(iTaxRate == undefined) iTaxRate = 0;
                                    var dblQuantity = item.合同数量; 	if(dblQuantity == undefined) dblQuantity = 0;
                                    d_count++;

                                    //查询已发货数量
                                    $.ajax({
                                        url:'System/selectDisQuantity.action',
                                        type:'post',
                                        data:{"strContractID": strContractID,'cInvCode':item.商品编号},
                                        dataType:'JSON',
										success:function (res) {
											var iQuantity = res.data;  if(iQuantity == undefined) iQuantity = 0;
											if(iQuantity < dblQuantity){
                                                var html = '<tr class="details">'
                                                    +	'<td><input type="text" name="inventory_id" value="'+item.商品编号+'" readonly></td>'
                                                    +	'<td><input type="text" name="product_name" value="'+item.商品名称+'" data-iTaxRate="'+iTaxRate+'" data-price="'+recentPrice+'" readonly></td>'
                                                    +	'<td><input type="text" name="specifications_models" value="'+models+'" readonly></td>'
                                                    +	'<td><input type="text" name="unit" value="'+unit+'" readonly></td>'
                                                    +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
                                                    +	'<td><input type="text" name="inventory_quantity" value="'+fAvaQuantity+'" readonly></td>'
                                                    +	'<td><input type="text" name="remark"></td>'
                                                    +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                                    + '</tr>';
                                                $('table.table-open>tbody').append(html);
                                                //渲染
                                                detailsRender(d_count); //明细信息每行自定义渲染事件
                                                inputRender(); //input滑过显示内容详情 - 防止溢出情况
											}
                                        }
									});
                                });
                            }
						});

                        $.ajax({
                            url:'System/selectSODetails.action',
                            type:'post',
                            data:{'strContractID':strContractID},
                            dataType:'JSON',
                            success:function (res) {
                                if (res.data.length == 0) {
                                    layer.msg("销售订单未生成,请勿发起出库申请");
                                    $('#myForm').addClass('layui-btn-disabled');
                                    $('#myForm').attr("disabled", "disabled");
                                }
                            }
                        });

    			        //重置下拉列表框
    					$(this).parent().empty();
    					$demo.find('.list-container').css('display','none');
    					//保存当前选择的合同编号
    					currentContractId = strContractID;
    				});
        		}
        		//给合同编号下拉列表框绑定隐藏事件
        		function hideListContainer_contract(Id){
        			$(document).bind('click', function(e) {  
        			    var e = e || window.event; //浏览器兼容性   
        			    var elem = e.target || e.srcElement;  
        			    while (elem) { //循环判断至跟节点，防止点击的是div子元素   
        			        if (elem.id && elem.id == Id) {  
        			            return;  
        			        }  
        			        elem = elem.parentNode;  
        			    }  
        			    //点击的不是div或其子元素  
        			    $('#'+Id+' .list-container').css('display', 'none');
        			    //没有重新选择,重置合同编号的input框值
        			    $('#'+Id+' input').val(currentContractId);
        			});
        		}

			});
		</script> 
	</body>
</html>
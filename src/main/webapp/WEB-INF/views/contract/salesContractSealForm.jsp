<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售合同盖章申请单 -->
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
		<script src="js/ajaxfileupload.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open"  enctype="multipart/form-data" method="post" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=10 class="table-h">丽泽销售合同盖章申请单</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
		 			<td colspan=2><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=3><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>所属区域</td>
					<td colspan=2><select name="area" id="area" lay-filter="area" class="layui-select" lay-search disabled></select></td>
					<td>客户名称</td>
					<td colspan=2><select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select></td>
					<td>客户编码</td>
					<td colspan=3><input type="text" name="customer_number" id="customer_number" readonly></td>
				</tr>
				<tr>
					<td>备注说明</td>
					<td colspan=9><input type="text" name="remark_illustration" value="无档案的客户名称请填写《客户档案建档申请流程》" readonly></td>
				</tr>
				<tr>
					<td>合同金额</td>
					<td colspan=3><input id="amount" type="text" name="contract_amount" lay-verify="required" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
					<td>合同金额大写</td>
					<td colspan=5><input id="amountCapitals" type="text" name="contract_ChineseAmount" readonly></td>
				</tr>
				<tr>
					<td>付款方式</td>
					<td colspan=9><select name="payment"><option value="1">一次性付款</option><option value="2">阶段付款</option ><option value="3">其他</option></select></td>
				</tr>
				<tr>
					<th colspan="10" style="text-align: center;">收款计划</th>

				</tr>
				<tr>
					<td colspan="2">收款日期</td>
					<td colspan="1">收款比例(%)</td>
					<td colspan="1">收款金额</td>
					<td colspan="1">结算方式</td>
					<td colspan="2">条件</td>
					<td colspan="2">说明</td>
					<td colspan="1">操作</td>
				</tr>
				<tr class="pay_details">
					<td colspan="2"><input type="text" name="payment_time" class="layui-input" id="payment_time1" placeholder="选择时间" autocomplete="off" lay-verify="required"></td>
					<td colspan="1"><input type="text" name="scale" class="layui-input" id="scale1" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" autocomplete="off" lay-verify="required"></td>
					<td colspan="1"><input type="text" name="amountMoney" class="layui-input" id="amountMoney1" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" autocomplete="off" readonly></td>
					<td colspan="1">
						<select name="method" id="method1" class="layui-select" lay-search lay-verify="required">
							<option value="">请选择</option>
							<option value="现金">现金</option>
							<option value="银行转账">银行转账</option>
							<option value="现金支票">现金支票</option>
							<option value="转账支票">转账支票</option>
							<option value="银行承兑">银行承兑</option>
						</select>
					</td>
					<td colspan="2"><input type="text" name="factor" class="layui-input" id="factor1" autocomplete="off"></td>
					<td colspan="2"><input type="text" name="show" class="layui-input" id="show1" autocomplete="off"></td>
					<td class="delete1" colspan="1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
				<tr>
					<td colspan=11 style="text-align: center;" class="addPayDetails"><span class="layui-icon layui-icon-add-1" title="添加收款计划"></span></td>
				</tr>
				<tr>
					<td colspan=4>条款名称</td>
					<td colspan="7">条款内容</td>
                </tr>
				<tr>
					<td colspan=4><input type="text" name="clause_name" lay-verify="required"></td>
					<td colspan=7><input type="text" name="clause_content" lay-verify="required|validateChinese"></td>
                </tr>
                <tr>
                    <td colspan="3">合同签订日期</td>
                    <td colspan="4">合同开始日期</td>
                    <td colspan="4">合同结束日期</td>
                </tr>
                <tr>
					<td colspan=3><input type="text" name="predictGetsum_date" class="layui-input" id="date1" autocomplete="off" placeholder="请选择日期" lay-verify="required"></td>
					<td colspan=4><input type="text" name="contract_start_date" class="layui-input" id="date2" autocomplete="off" placeholder="请选择日期" lay-verify="required"></td>
					<td colspan=4><input type="text" name="contract_end_date" class="layui-input" id="date3" autocomplete="off" placeholder="请选择日期" lay-verify="required"></td>
				</tr>
                <tr>
					<td>其它特殊约定</td>
					<td colspan=10><input type="text" name="special_terms"></td>
				</tr>
				<tr>
					<th colspan=11 style="text-align:center;">明细信息</th>
				</tr>
				<tr>
					<td>存货编码</td>
					<td>货物名称</td>
					<td>型号</td>
					<td>单位</td>
					<td>数量</td>
					<td>单价</td>
					<td>金额</td>
					<td>最低售价</td>
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
					<td><input type="text" id="buy_quantity1" name="buy_quantity" onchange="totalMoney()"  onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td><input type="text" id="unit_price1" name="unit_price" onchange="totalMoney()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td><input type="text" id="sum1" name="sum" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" readonly></td>
					<td><input type="text" name="lsPrice" readonly></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>	
		 	<thead>
		 		<tr>
		 			<td colspan=10 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
				<tr>
					<td colspan=6>合计</td>
					<td colspan=4 id="sumMoney"></td>
				</tr>
				<tr>
					<td>上传图片</td>
					<td><input type="file" id="pics" name="pics" multiple="multiple" lay-verify="required"></td>
				</tr>
		 	</thead>
		</table>
		<div class="form-notes">
			<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称的顺序进行选择</i>
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
			layui.use(['laydate', 'layer', 'table',  'element', 'form','upload'], function(){
				var laydate = layui.laydate //日期
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form
                ,upload = layui.upload;

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
				laydate.render({
					elem: '#date2' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function(value, date, endDate){
				    	// console.log(value); //得到日期生成的值
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#date3').val() != ''){
				    		$('#date3').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');}); 
				    	}
				    }
				});
                laydate.render({
                    elem: '#payment_time1' //指定元素
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });
				laydate.render({
					elem: '#date3' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date2').val() != ''){
				    		$('#date2').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date3').val('');});
				    	}
			        }
				});
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染

				//字数限制
                form.verify({
                    validateChinese: function (value) {
                        if (value.length >100){
                            return "条款内容100字以内";
                        }
                    }
                });

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    $("#area").removeAttr("disabled");
                    var area = $('#area').find('option:selected').text();	//地区
					var customer_number = data.field.customer_number;
                    var customer_name = $('#customer_name').find('option:selected').text();
                    var cCusCode = $('#customer_number').val();
					var remark_illustration = data.field.remark_illustration;//备注说明
					var contract_amount = Number(data.field.contract_amount);
					var contract_ChineseAmount = data.field.contract_ChineseAmount;
					var inspection_report = data.field.inspection_report;//是否包含设备报告
					var payment = data.field.payment;
					var name = data.field.clause_name;
					var condition = data.field.clause_content;
					var predictGetsum_date = data.field.predictGetsum_date;
					var contract_start_date = data.field.contract_start_date;
					var contract_end_date = data.field.contract_end_date;
					var contract_name = data.field.contract_name;
					var special_terms = data.field.special_terms;

					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var unit_price = Number($(item).find('input[name="unit_price"]').val());
						var sum2 = Number($(item).find('input[name="sum"]').val());
                        var lsPrice = Number($(item).find('input[name="lsPrice"]').val());
						var remark = $(item).find('input[name="remark"]').val();

						var obj = {'details_string4':inventory_id,'details_string5':product_name
								,'details_string6':specifications_models,'details_string7':unit,'details_money':quantity
								,'details_money4':unit_price,'details_money7':sum2,'details_money6':lsPrice,'details_string11':remark};
						currentDetails.push(obj);
					});

                    //阶段付款
                    var payDetails = [];
                    $.each($('.pay_details'),function (index,item) {
                        var dtPayDate = $(item).find('input[name="payment_time"]').val();//收款日期
                        var dblPayRatio = $(item).find('input[name="scale"]').val();//收款比例
                        var dblPayCurrency = $(item).find('input[name="amountMoney"]').val();//收款金额
                        var strSettleStyleID = $(item).find('select[name="method"]>option:selected').text();//结算方式
                        var strPayFactor = $(item).find('input[name="factor"]').val(); //条件
                        var strExp = $(item).find('input[name="show"]').val();//说明

                        var obj = {
                            'dtPayDate':dtPayDate,
                            'dblPayRatio':dblPayRatio,
                            'dblPayCurrency':dblPayCurrency,
                            'strSettleStyleID':strSettleStyleID,
                            'strPayFactor':strPayFactor,
                            'strExp':strExp
                        };
                        payDetails.push(obj);
                    });

                    var myForm = new FormData();
                    myForm.set("currency_type",34);
                    myForm.set("currency_string2",area);
                    myForm.set("currency_string5",customer_name);
                    myForm.set("currency_string11",cCusCode);
                    myForm.set("currency_string12",remark_illustration);
                    myForm.set("currency_money",contract_amount);
                    myForm.set("currency_string13",contract_ChineseAmount);
                    myForm.set("currency_int6",payment);
                    myForm.set("currency_string8",name);
                    myForm.set("currency_string9",condition);
                    myForm.set("currency_string7",staffName);
                    myForm.set("currency_date2",predictGetsum_date);
                    myForm.set("currency_date3",contract_start_date);
                    myForm.set("currency_date4",contract_end_date);
                    myForm.set("currency_string14",contract_name);
                    myForm.set("currency_string10",special_terms);
                    myForm.set("currency_string18",cCusDepart);
                    myForm.set("currencyDetails",JSON.stringify(currentDetails));
                    myForm.set("payDetails",JSON.stringify(payDetails));
                    for(let i = 0;i < $("#pics")[0].files.length;i++){
						myForm.append("pics",$("#pics")[0].files[i])
					}

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "POST"
				 		,data : myForm
                        ,contentType: false
                        ,processData: false
                        ,cache:false
				 		,dataType : "JSON"
				 		,beforeSend: function(){
				 		     console.log(myForm.get("pics"));
				 		     console.log(myForm.get("currencyDetails"));
				 			layer.msg('正在提交申请', {
				 				icon: 16
				 				,shade: 0.01
				 			});
				 		}
				 		,success : function(result){
				 			layer.msg(result.msg);
                            $('#myForm').addClass('layui-btn-disabled');
                            $('#myForm').attr("disabled", 'disabled');
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
                var areaid = "${sessionScope.systemStaff.staff_Address }";
				setApplyMessage(staffName,departmentId);
				//过程一:区域 - 客户名称(客户编号) - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
				// 过程一第一级 - 获取所有区域
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
    				var cDCCode = areaid;
    				$.ajax({
    					url:'System/selectUser.action',
    					type:'post',
    					data:{"cDCCode": cDCCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择客户名称</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-dept="'+item.cCusDepart+'">'+item.cCusName+'</option>'
    						});
    						$('#customer_name').html(html);
    						form.render('select');
    					}
    				});
    				// 重置[客户名称]级下面的内容(客户编码 合同编号 金额信息 合同条款 明细信息)
    				$('#customer_number').val('');
        		// 过程一第三级 - 根据客户名称获取销售合同编号 并设置客户编码
         		var cCusPPerson;
                var cCusDepart;
        		form.on('select(customer_name)', function(data){
         			cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');//
                    cCusDepart = $(data.elem).find("option:selected").attr('data-dept');//
         			var cCusCode = data.value;
     				$('#customer_number').val(cCusCode); //客户编码
				});

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
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" onchange="totalMoney()" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required"></td>'
				 			 +	'<td><input type="text" id="unit_price'+d_count+'" name="unit_price" onchange="totalMoney()" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required"></td>'
				 			 +	'<td><input type="text" id="sum'+d_count+'" name="sum" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" readonly></td>'
                        	+	'<td><input type="text" name="lsPrice" readonly></td>'
							+	'<td><input type="text" name="remark"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
				});

                //点击添加收款计划明细按钮
                var p_count = 1;
                $('.addPayDetails').click(function(){
                    p_count++;
                    var html = '<tr class="pay_details">'
                        +	'<td colspan="2"><input type="text" name="payment_time" class="layui-input" id="payment_time'+p_count+'" placeholder="选择时间" lay-verify="required"></td>'
                        +	'<td colspan="1"><input type="text" name="scale" class="layui-input" id="scale'+p_count+'" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" autocomplete="off" lay-verify="required"></td>'
                        +	'<td colspan="1"><input type="text" name="amountMoney" class="layui-input" id="amountMoney'+p_count+'" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" autocomplete="off" readonly></td>'
                        +	'<td colspan="1">'
                        +		'<select name="method" id="method'+p_count+'" class="layui-select" lay-search lay-verify="required">'
                        +			'<option value="">请选择</option>'
                        +			'<option value="现金">现金</option>'
                        +			'<option value="银行转账">银行转账</option>'
                        +			'<option value="现金支票">现金支票</option>'
                        +			'<option value="转账支票">转账支票</option>'
                        +			'<option value="银行承兑">银行承兑</option>'
                        +		'</select>'
                        +	'</td>'
                        +	'<td colspan="2"><input type="text" name="factor" class="layui-input" id="factor'+p_count+'" autocomplete="off"></td>'
                        +	'<td colspan="2"><input type="text" name="show" class="layui-input" id="show'+p_count+'" autocomplete="off"></td>'
                        +	'<td class="delete'+p_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                        +	'</tr>';
                    $('.addPayDetails').parent().before(html);
                    //渲染
                    detailsRender(p_count); //明细信息每行自定义渲染事件
                    laydate.render({
                        elem: '#payment_time'+p_count //指定元素
                        ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                    });
                    inputRender();//input框自定义渲染
                    form.render();
                });

				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    getSum($('#buy_quantity'+index),$('#unit_price'+index),$('#sum'+index)); //限制数量为数字，单价为数字(小数点后保留两位)，且同时获取金额
                    getSum1($('#scale'+index),$('#amount'),$('#amountMoney'+index));
                }
				//行删除事件
				function deleteItem($demo){
					deleteDetailsItem1($demo);
				}
				//过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
                    processProductSale($demo);
        		}
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}

				//金额自动翻译成大写且金额保留两位小数
                inputLimitAmount($("#amount"),$('#amountCapitals'));

			});
			function totalMoney(){
			    var sum = 0;
            	$.each($('.details'),function(index,item){
            	    sum += Number($(item).find('input[name="sum"]').val());
				});
            	$('#sumMoney').text(sum);
            }

		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运维合同变更（减免）申请单 -->
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
					<th colspan=7 class="table-h">丽泽运维合同变更（减免）申请单</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>所属区域</td>
					<td colspan=1><select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select></td>
					<td>客户名称</td>
					<td colspan=1><select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select></td>
					<td>客户编码</td>
					<td colspan=2><input type="text" name="customer_number" id="customer_number" readonly></td>
				</tr>
				<tr>
					<td>合同编号</td>
					<td colspan=6><select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>合同名称</td>
					<td colspan=2><input type="text" id="contract_name" name="contract_name" readonly></td>
					<td>合同类型</td>
					<td colspan=3><select name="contract_versons"><option value="1">运维</option><option value="2">BO</option><option value="3">其他</option></select></td>
				</tr>
				<tr>
					<td>合同总金额</td>
					<td colspan=1><input type="text" id="contract_amount" name="contract_amount" readonly></td>
					<td>已收金额</td>
					<td colspan=1><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
					<td>未收金额</td>
					<td colspan=2><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
				</tr>
				<tr>
					<td>逾期欠款金额</td>
					<td><input type="text" id="overdue_amount" name="overdue_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
					<td>申请减免金额</td>
					<td><input type="text" id="applyReduction_amount" name="applyReduction_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
					<td>批准减免金额</td>
					<td colspan=2><input type="text" id="ratifyReduction_amount" name="ratifyReduction_amount" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
				</tr>
				<tr>
					<td>合同期间</td>
					<td colspan=6>
						<div class="layui-inline time-ranges">
							<input type="text" name="start_time" class="layui-input" id="start_time" placeholder="选择开始时间" autocomplete="off">
							&emsp;-&emsp;
							<input type="text" name="end_time" class="layui-input" id="end_time" placeholder="选择结束时间" autocomplete="off">
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="7" style="text-align: center;">减免依据</th>
				</tr>
				<tr>
					<td>减免说明</td>
					<td colspan=6><input type="text" name="subtract_explain"></td>
				</tr>
				<tr>
					<td>设备编码</td>
					<td>设备名称</td>
					<td>停产天数</td>
					<td>停产期间</td>
					<td>上传天数</td>
					<td>上传期间</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="product_id" readonly></td>
					<td><select name="product_name" class="layui-select" lay-search lay-verify="required"></select></td>
					<td><input id="stop_days1" type="text" name="stop_days" readonly></td>
					<td>
						<div class="layui-inline time-ranges">
							<input type="text" name="start_stop" class="layui-input" id="start_stop1" placeholder="选择开始时间" autocomplete="off">&nbsp;-&nbsp;<input type="text" name="end_stop" class="layui-input" id="end_stop1" placeholder="选择结束时间" autocomplete="off">
						</div>
					</td>
					<td><input id="up_days1" type="text" name="up_days" readonly></td>
					<td>
						<div class="layui-inline time-ranges">
							<input type="text" name="start_up" class="layui-input" id="start_up1" placeholder="选择开始时间" autocomplete="off">&nbsp;-&nbsp;<input type="text" name="end_up" class="layui-input" id="end_up1" placeholder="选择结束时间" autocomplete="off">
						</div>
					</td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>	
		 	<thead>
		 		<tr>
		 			<td colspan=7 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=7></th>
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
				//合同期间
				laydate.render({
					elem: '#start_time' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
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
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#start_time').val() != ''){
				    		$('#start_time').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#end_time').val('');});
				    	}
			        }
				});
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var area = data.field.area;
					var customer_number = data.field.customer_number;
					var customer_name = data.field.customer_name;
					var contract_versons = data.field.contract_versons;
					var contract_number = data.field.contract_number;
					var contract_name = data.field.contract_name;
					var contract_amount = Number(data.field.contract_amount);
					var actual_receipt = Number(data.field.actual_receipt);
					var outstanding_receipt = Number(data.field.outstanding_receipt);
					var overdue_amount = Number(data.field.overdue_amount);
					var applyReduction_amount = Number(data.field.applyReduction_amount);
					var ratifyReduction_amount = Number(data.field.ratifyReduction_amount);
					//(contract_date)
					var subtract_explain = data.field.subtract_explain;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var product_id = $(item).find('input[name="product_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var start_stop = $(item).find('input[name="start_stop"]').val();
						var end_stop = $(item).find('input[name="end_stop"]').val();
						var stop_days = $(item).find('input[name="stop_days"]').val();
						var start_up = $(item).find('input[name="start_up"]').val();
						var end_up = $(item).find('input[name="end_up"]').val();
						var up_days = $(item).find('input[name="up_days"]').val();
						
						var obj = {'product_id':product_id,'product_name':product_name,'start_stop':start_stop,'end_stop':end_stop
								,'stop_days':stop_days,'start_up':start_up,'end_up':end_up,'up_days':up_days};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : ""
				 		,type : "post"
				 		,data : {'currentDetails':currentDetails}
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
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
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
                        form.render('select');
                    }
                });
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
    				// 重置[客户名称]级下面的内容(客户编码 合同编号 合同名称 金额信息 合同条款 明细信息)
    				$('#customer_number').val('');
					$('#contract_id').siblings().remove();
					$('#contract_id').html('');
					$('#contract_name').val('');
					$('#contract_amount').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
// 					$('.contract-details').remove();
// 					$($('.details')[0]).siblings('.details').remove();
// 					$('.details').find('input').val('');
// 					$('.details').find('select[name="runproduct_name"]').html('');
// 					$('.details').find('select[name="runproduct_name"]').siblings().remove();
// 					form.render();
// 					//当前明细信息每一行的商品名称input框值重置 
// 					currentProductValues = [];
        		});
        		// 过程一第三级 - 根据客户名称获取销售合同编号 并设置客户编码
        		var cCusPPerson;
        		form.on('select(customer_name)', function(data){
        			cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');
    				var cCusCode = data.value;
    				$('#customer_number').val(cCusCode); //客户编码
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
    				//重置[合同编号]级下面的内容(合同名称 金额信息 合同条款 明细信息)
    				$('#contract_name').val('');
    				$('#contract_amount').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
// 					$('.contract-details').remove();
// 					$($('.details')[0]).siblings('.details').remove();
// 					$('.details').find('input').val('');
// 					$('.details').find('select[name="runproduct_name"]').html('');
// 					$('.details').find('select[name="runproduct_name"]').siblings().remove();
// 					form.render();
// 					//当前明细信息每一行的商品名称input框值重置 
// 					currentProductValues = [];
        		});
        		// 过程一第四级 - 根据销售合同编号设置合同金额+合同名称 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)
//         		var runproduct_name_html = ''; //运营设备下拉列表
//         		var contract_price = 0;	//合同条款带出的价格
//         		var contract_type = 1;	//设置合同类型
        		var strContractID = '';//保存合同编号
    			form.on('select(contract_id)', function(data){
    				strContractID = data.value;//合同编号
    				var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
    				$("#contract_amount").val(contractAmount);//合同金额
    				$("#contract_name").val($(data.elem).find("option:selected").attr('data-name'));//合同名称
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
//     				//重置合同条款
//     				$('.contract-details').remove();
//     				//重置合同条款带出的价格
//     				contract_price = 0;
//             		//查询合同条款
//             		$.ajax({
//             			url:'System/selectContractAll.action',
//             			type:'post',
//             			data:{'strContractID':strContractID},
//             			dataType:'JSON',
//             			success:function(res){
//             				$.each(res.data,function(index,item){
//             					contract_price = Math.max(item.cDefine26,contract_price); //number类型
//             					var html = '<tr class="contract-details">'
//             							 + 	'<td colspan=4><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
//             							 +	'<td colspan=9><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
//             							 + '</tr>';
//             					$('.contract').after(html);
//             					inputRender();//input框自定义渲染
//             				});
//             			}
//             		});
//             		//获取运营设备(附带运营设备编码和设备运营期间)
//     				$.ajax({
//     					url:'System/selectshebei.action',
//     					type:'post',
//     					data:{"strContractID": strContractID,'type':contract_type},
//     					dataType:'JSON',
//     					success:function(res){
//     						var html = '<option value="">请选择运营设备</option>';
//     						$.each(res.data,function(index,item){
//     							var quantity = 0;
//     							if(item.iQuantity != undefined)
//     								quantity = item.iQuantity;
//     							var std = '无';
//     							if(item.cinvStd != undefined)
//     								std = item.cinvStd;
//     							html += '<option value="'+item.商品编号+'" data-EndDate="'+item.结束时间+'" data-StartDate="'
//     							+item.开始时间+'">'+item.商品名称+'</option>';
//     						});
//     						runproduct_name_html = html;
//     						$.each($('.details'),function(index,item){
//     							$(item).find('select[name="runproduct_name"]').html(html);
//     							form.render('select'); 
//     						});
//     					}
//     				});
//             		//明细信息重置,重置[运营设备]级下面的内容
//             		$($('.details')[0]).siblings('.details').remove();
// 					$('.details').find('input').val('');
// 					form.render();
// 					//当前明细信息每一行的商品名称input框值重置 
// 					currentProductValues = [];
    			});
				
                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="product_id" readonly></td>'
				 			 +	'<td><select name="product_name" class="layui-select" lay-search lay-verify="required"></select></td>'
				 			 +	'<td><input id="stop_days'+d_count+'" type="text" name="stop_days" readonly></td>'
				 			 +	'<td>'
				 			 +		'<div class="layui-inline time-ranges">'
							 +			'<input type="text" name="start_stop" class="layui-input" id="start_stop'+d_count+'" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_stop" class="layui-input" id="end_stop'+d_count+'" placeholder="选择结束时间">'
							 +		'</div>'
				 			 +  '</td>'
				 			 +	'<td><input id="up_days'+d_count+'" type="text" name="up_days" readonly></td>'
				 			 +	'<td>'
				 			 +		'<div class="layui-inline time-ranges">'
							 +			'<input type="text" name="start_up" class="layui-input" id="start_up'+d_count+'" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_up" class="layui-input" id="end_up'+d_count+'" placeholder="选择结束时间">'
							 +		'</div>'
				 			 +  '</td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
				 	$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
					form.render();
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				    dateRender('start_stop'+index,'end_stop'+index,'stop_days'+index);//停产期间渲染
				    dateRender('start_up'+index,'end_up'+index,'up_days'+index);//上传期间渲染
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
				//日期范围渲染 并 计算间隔天数
              	function dateRender(id1,id2,dayId){
              		// 开始日期
    				laydate.render({
    					elem: '#'+id1 //指定元素
    			        ,done: function(value, date, endDate){
    				    	//开始日选好后，判断结束日期是否合法
    				    	if($('#'+id2).val() != ''){
    				    		$('#'+id2).val() > value ? $('#'+dayId).val(getDays1(value,$('#'+id2).val())) : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#'+id1).val('');$('#'+dayId).val('');});
    				    	}
    				    }
    				});
              		// 结束日期
    				laydate.render({
    					elem: '#'+id2 //指定元素
    			        ,done: function (value, date, endDate) {
    				    	//结束日选好后，判断开始日期是否合法
    				    	if($('#'+id1).val() != ''){
    				    		$('#'+id1).val() < value ? $('#'+dayId).val(getDays1($('#'+id1).val(),value)) : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#'+id2).val('');$('#'+dayId).val('');});
    				    	}
    			        }
    				});
              	}
                //监听金额输入框只允许输入数字(小数点后保留两位)
				inputLimitAmount0($('#overdue_amount'));//逾期欠款金额
				inputLimitAmount0($('#applyReduction_amount'));//申请减免金额
				inputLimitAmount0($('#ratifyReduction_amount'));//批准减免金额
				
			});
		</script>
	</body>
</html>
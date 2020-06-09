<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运营服务合同变更申请-手机端 -->
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
				<h2 class="">丽泽运维合同变更（减免）申请单</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'contract/mOperationServiceContractChangeList.action';">查看申请记录</li>
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
						<label class="layui-form-label">客户编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="customer_number" id="customer_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同编码 :</label>
						<div class="layui-input-block">
							<select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同名称 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_name" name="contract_name" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同类型 :</label>
						<div class="layui-input-block">
							<select name="contract_versons"><option value="1">运维</option><option value="2">BO</option><option value="3">其他</option></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同总金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount" name="contract_amount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">已收金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">未收金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">逾期欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="overdue_amount" name="overdue_amount" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请减免金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="applyReduction_amount" name="applyReduction_amount" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">批准减免金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="ratifyReduction_amount" name="ratifyReduction_amount" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同期间 :</label>
						<div class="layui-input-block time-ranges">
							<input type="text" name="start_time" class="layui-input" id="start_time" placeholder="选择开始时间" autocomplete="off">
							&emsp;-&emsp;
							<input type="text" name="end_time" class="layui-input" id="end_time" placeholder="选择结束时间" autocomplete="off">
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">减免说明 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="subtract_explain"></textarea>
						</div>
					</div>
					<!-- 明细信息 -->
					<div class="layui-btn layui-btn-normal layui-btn-xs addDetails">
						<i class="layui-icon layui-icon-add-1" title="点击添加明细信息"></i>点击添加明细信息
					</div>
					<div class="apply-detail-container">
						<div class="apply-detail">
							<div class="details-title details-title1">明细信息#1<span class="layui-icon layui-icon-up"></span></div>
							<div class="details">
								<div class="layui-form-item">
									<label class="layui-form-label">设备编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="product_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备名称 :</label>
									<div class="layui-input-block">
										<select name="product_name" class="layui-select"></select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">停产天数 :</label>
									<div class="layui-input-block">
										<input type="text" id="stop_days1" name="stop_days" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">停产期间 :</label>
									<div class="layui-input-block time-ranges">
										<input type="text" name="start_stop" class="layui-input" id="start_stop1" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_stop" class="layui-input" id="end_stop1" placeholder="选择结束时间">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">上传天数 :</label>
									<div class="layui-input-block">
										<input type="text" id="up_days1" name="up_days" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">上传期间 :</label>
									<div class="layui-input-block time-ranges">
										<input type="text" name="start_up" class="layui-input" id="start_up1" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_up" class="layui-input" id="end_up1" placeholder="选择结束时间">
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
                //执行laydate实例
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
                detailsRender(1); //明细信息第一行自定义渲染事件
                
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
                });
                // 过程一第四级 - 根据销售合同编号设置合同金额+合同名称 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)

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
                    +        '<label class="layui-form-label">设备编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="inventory_id" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">设备名称 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<select name="product_name" class="layui-select"></select>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">停产天数 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input id="stop_days'+d_count+'" type="text" name="stop_days" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">停产期间 :</label>'
                    +        '<div class="layui-input-block time-ranges">'
                    +          '<input type="text" name="start_stop" class="layui-input" id="start_stop'+d_count+'" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_stop" class="layui-input" id="end_stop'+d_count+'" placeholder="选择结束时间">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">上传天数 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input id="up_days'+d_count+'" type="text" name="up_days" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">上传期间 :</label>'
                    +        '<div class="layui-input-block time-ranges">'
                    +          '<input type="text" name="start_up" class="layui-input" id="start_up'+d_count+'" placeholder="选择开始时间">&nbsp;-&nbsp;<input type="text" name="end_up" class="layui-input" id="end_up'+d_count+'" placeholder="选择结束时间">'
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
                  form.render();
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    //searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                    dateRender('start_stop'+index,'end_stop'+index,'stop_days'+index);//停产期间渲染
				    dateRender('start_up'+index,'end_up'+index,'up_days'+index);//上传期间渲染
                }
                //行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
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
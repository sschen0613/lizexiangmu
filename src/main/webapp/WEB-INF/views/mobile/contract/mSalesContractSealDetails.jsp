<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售合同盖章申请详情-手机端 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/mobile.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/iconfont.js"></script>
		<script src="js/approval_button.js?v="+Math.random()></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="container-approval">
			<h2 class="title-page">
	        	<svg class="alSvgIcon" aria-hidden="true">
	            	<use xlink:href="#icon-contract"></use>
	        	</svg>
	        	丽泽销售合同盖章申请详情
			</h2>
			<div class="content">
				
			</div>
		</div>
		
		<script>
		</script>
		<script type="text/javascript">
            layui.use(['form','element','layer','laydate', 'table' ],function(){
                var form = layui.form
                ,element = layui.element
                ,layer = layui.layer
                ,laydate = layui.laydate
                ,table = layui.table;  
                
                //获取传递过来的值
                var approverState = '${param.approverState}'; //审批状态
                
                var currency_number = '${param.currency_number}'; //编号
                var staff_name = '${param.staff_name}'; //申请人
                var department_name = '${param.department_name}'; //申请部门
                var currency_date = '${param.currency_date}'; //申请日期

                var currency_date2 = '${param.currency_date2}';
                var currency_string2 = '${param.currency_string2}'; //区域
				var currency_string3 = '${param.currency_string3}'; //区域
                var currency_string5 = '${param.currency_string5}'; //区域
                var currency_string7 = '${param.currency_string7}'; //申请事由
                var currency_string8 = '${param.currency_string8}'; //申请事由
                var currency_string9 = '${param.currency_string9}'; //申请事由
                var currency_string10 = '${param.currency_string10}'; //申请事由
                var currency_string11 = '${param.currency_string11}'; //申请事由
                var currency_string12 = '${param.currency_string12}'; //申请事由
                var currency_string13 = '${param.currency_string13}';
                var currency_string14 = '${param.currency_string14}';//申请事由
                var currency_money = '${param.currency_money}'; //合同金额
               // var currency_int2 = '${param.currency_int2}'; //已收金额
                var currency_int6 = '${param.currency_int6}'; //已收金额

                
                var currency_id = '${param.currency_id}';
    			var approvalOpinion_type = '${param.approvalOpinion_type}';
    			var approval_id = '${param.approval_id}';
    			var staffid = '${sessionScope.systemStaff.dingding_staffid }';
    			var current_approvalCount = '${param.current_approvalCount}';
    			var approver_count = '${param.approver_count}';
    			//获取进度条百分比
    			var number = Number(current_approvalCount)/Number(approver_count);
    			var rate = Math.floor(number*100)+'%';
    			
    			//页面内容初始化
    			$.ajax({
    				url:'Currency/selectCurrencyApprover.action',
    				type:'post',
    				data:{'currency_id':currency_id},
    				dataType:'JSON',
    				beforeSend: function(){
    					layer.load(1);
    		 		},
    				success:function(res){
    					layer.closeAll('loading');
    					var html = '';
						html += '<div class="content-list style">'
							 +		'<form>'
							 +			'<div>'
							 +				'<label class="">申请人 :</label>'
							 +				'<input type="text" name="currency_applicant" id="staffName" value="'+staff_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">申请部门 :</label>'
							 +				'<input type="text" name="department_Id" id="department" value="'+department_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">申请日期 :</label>'
							 +				'<input type="text" name="currency_date" id="date" value="'+currency_date+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">客户编码 :</label>'
							 +				'<input type="text" name="customer_number" value="'+currency_string11+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">客户名称 :</label>'
							 +				'<input type="text" name="customer_name" value="'+currency_string5+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">所属区域 :</label>'
							 +				'<input type="text" id="area" name="area" value="'+currency_string2+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">备注说明 :</label>'
							 +				'<textarea type="text" name="remark_illustration" value="'+currency_string12+'" class="layui-textarea" readonly>无档案的客户名称请填写《客户档案建档申请流程》</textarea>'
							 +			'</div>'
								+			'<div>'
								+				'<label class="">合同类型 :</label>'
								+				'<input type="text" name="contractType" value="'+currency_string3+'" class="layui-input" readonly>'
								+			'</div>'
							 +			'<div>'
							 +				'<label class="">合同金额 :</label>'
							 +				'<input type="text" name="contract_amount" value="'+currency_money+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width: 40%;">合同金额大写 :</label>'
							 +				'<input type="text" name="contract_ChineseAmount" value="'+currency_string13+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">付款方式 :</label>'
							 +				'<input type="text" name="payment" value="'+(currency_int6==1?"一次性付款":currency_int6==2?"阶段付款":"其他")+'" class="layui-input" readonly>'
							 +			'</div>'
                             +			'<div><label class="label-title">收款计划 </label></div>'
                             +			'<div class="pay-detail-container">'
                            			//收款计划
                             +			'</div>'
							 +			'<div>'
							 +				'<label class="">名称 :</label>'
							 +				'<input type="text" name="name" value="'+currency_string8+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">条款内容 :</label>'
							 +				'<input type="text" name="condition" value="'+currency_string9+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width: 40%;">签订日期 :</label>'
							 +				'<input type="text" name="predictGetsum_date" value="'+currency_date2+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width: 40%;">其它特殊约定 :</label>'
							 +				'<textarea type="text" name="special_terms"  class="layui-textarea" readonly>'+currency_string10+'</textarea>'
							 +			'</div>'
							 +			'<div><label class="label-title">明细信息 </label></div>'
							 +			'<div class="approval-detail-container">'
											//明细信息
							 +			'</div>'
                             +			'<div><label class="label-title">文件信息 </label></div>'
                             +			'<div class="picture-detail-container">'
                            				//图片
                             +			'</div>'
							 + 			'<div class="approval-progress">'
							 +				'<label class="">审批进度 :</label>'
							 +				'<div class="layui-progress layui-progress-big" lay-filter="progress_bar" lay-showPercent="true">'
							 +					'<div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>'
							 +				'</div>'
							 +			'</div>'
							 +			'<div><label class="label-title">进度详情 :</label></div>'
							 +			'<div class="approval-progress_details">';
						html +=				'<table id="details" lay-filter="details"></table>';
						html +=			'</div>'
							 +			'<div class="button">'
							 +				'<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="revokeagree">撤回</button>'
							 +			'</div>'
							 +		'</form>'
							 +	'</div>';
						$('.content').append(html);
						//获取明细信息
						$.ajax({
							url:'Currency/selectCurrencyDetails.action?currency_id='+currency_id,
							type:'post',
							data:{},
							dataType:'JSON',
							success:function(res){
								var html0 = '';
								$.each(res.data,function(index,item){
									html0+=	'<div class="approval-detail">'
							  		 	 +		'<div class="details-title details-title'+(index+1)+'">#'+(index+1)+'</div>'
							  		 	 +		'<div class="details">'
							 		 	 +			'<div>'
									 	 +				'<label class="">存货编码 :</label> '
							 		 	 +				'<input type="text" name="product_id" value="'+item.details_string4+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">货物名称 :</label>'
							 		 	 +				'<input id="product_name" name="product_name" value="'+item.details_string5+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">型号 :</label>'
							 		 	 +				'<input type="text" name="specifications_models" value="'+item.details_string6+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">单位 :</label>'
							 		 	 +				'<input type="text" name="unit" value="'+item.details_string7+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">数量 :</label>'
							 		 	 +				'<input type="text" name="buy_quantity" value="'+item.details_money+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">单价 :</label>'
							 		 	 +				'<input type="text" name="unit_price" value="'+item.details_money4+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">金额 :</label>'
							 		 	 +				'<input type="text" name="sum2" value="'+item.details_money7+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">最低售价 :</label>'
                                        +				'<input type="text" name="sum2" value="'+item.details_money6+'" class="layui-input" readonly>'
                                        +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">备注 :</label>'
							 		 	 +				'<input type="text" name="remark" value="'+item.details_string11+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +		'</div>'
							 		 	 +	'</div>';
								});
								$('.approval-detail-container').html(html0);
							}
						});

                        //获取收款计划
                        $.ajax({
                            url:'Currency/selectPaymentPlan.action?currency_id='+currency_id,
                            type:'post',
                            data:{},
                            dataType:'JSON',
                            success:function(res){
                                var html0 = '';
                                $.each(res.data,function(index,item){
                                    html0+=	'<div class="approval-detail" style="width: 100%">'
                                        +		'<div class="details-title details-title'+(index+1)+'">#'+(index+1)+'</div>'
                                        +		'<div class="details">'
                                        +			'<div>'
                                        +				'<label class="">收款日期 :</label>'
                                        +				'<input type="text" name="dtPayDate" value="'+Format(item.dtPayDate,"yyyy-MM-dd")+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">收款比例 :</label>'
                                        +				'<input type="text" name="dblPayRatio" value="'+item.dblPayRatio+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">收款金额 :</label>'
                                        +				'<input type="text" name="dblPayCurrency" value="'+item.dblPayCurrency+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">结算方式 :</label>'
                                        +				'<input type="text" name="strSettleStyleID" value="'+item.strSettleStyleID+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">条件 :</label>'
                                        +				'<input type="text" name="strPayFactor" value="'+item.strPayFactor+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">说明 :</label>'
                                        +				'<input type="text" name="strExp" value="'+item.strExp+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +		'</div>'
                                        +	'</div>';
                                });
                                $('.pay-detail-container').html(html0);
                            }
                        });

                        //获取合同图片
                        $.ajax({
                            url:'Currency/selectContractPicture.action?currency_id='+currency_id,
                            type:'post',
                            data:{},
                            dataType:'JSON',
                            success:function(res){
                                var html1 = '';
                                $.each(res.data,function(index,item){
                                    html1+=	'<div class="picture-detail" style="width: 100%">'
                                        +		'<div class="details-title details-title'+(index+1)+'">#'+(index+1)+'</div>'
                                        +		'<div class="details">'
                                        +			'<div>'
										+				'&nbsp;&nbsp;<a href="'+item.coverpath+'" download="'+item.picture+'"><span style="color: #8b211e">点此查看文件</span></a>'
										//+				'<img src="'+item.coverpath+'" style="display: block;height: auto;max-width: 100%;">'
                                        +			'</div>'
                                        +		'</div>'
                                        +	'</div>';
                                });
                                $('.picture-detail-container').html(html1);
                            }
                        });

						//渲染进度条
						element.render('progress');
						//更新进度条
						updateProgress();
						//执行一个table实例
		                table.render({
		                	elem: '#details'
		                  	,url: 'Currency/selectApprovalOpinion.action?approvalOpinion_type='+approvalOpinion_type+"&approval_id="+currency_id //数据接口
		                  	,cols: [[ //表头
                                {field: 'approval_state', title: '审批组', minWidth: 80}
                                ,{field: 'approver_name', title: '审批人', minWidth: 80}
								,{field: 'approvalOpinion_result', title: '审批意见', minWidth: 100}
		                  	]]
		                });
						switch(approverState){
							case 'revoke':
								$('.content-list').addClass('style3');
								$('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
								break;
							case 'reject':
								$('.content-list').addClass('style2');
								$('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
								break;
							case 'adopt':
								$('.content-list').addClass('style1');
								$('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
								break;
							case 'waitting':
								//撤回按钮绑定点击事件
								$('#revokeagree').click(function(){
                                    layer.confirm('确认撤回申请？', function(index){
                                        //向服务端发送撤回指令
                                        $.ajax({
                                            url:'Currency/recallCurrencyApply.action',
                                            type:'post',
                                            data:{'currency_id':currency_id},
                                            dataType:'JSON',
                                            success:function(result){
                                                $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                                                parent.$('.iframe-return-type').val('2');//给父页面传值,表示已撤回
                                                layer.close(index);
                                                layer.msg(result.msg);
                                            }
                                        });
                                    });
								});
								break;
						}
						
    				}
    			});
                
                //操作
                //改变进度条
				function updateProgress(){
					setTimeout(function(){
						element.progress('progress_bar',rate);
					}, 500);
				}
                
            });
		</script>
	</body>
</html>
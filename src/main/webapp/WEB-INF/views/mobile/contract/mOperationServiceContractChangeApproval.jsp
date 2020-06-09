<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运营服务合同变更审批明细-手机端 -->
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
		<script src="js/approval_button.js"></script>
	</head>
	<body>
		<div class="container-approval">
			<h2 class="title-page">
	        	<svg class="alSvgIcon" aria-hidden="true">
	            	<use xlink:href="#icon-contract"></use>
	        	</svg>
	        	丽泽运营服务合同变更审批详情
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
                var currency_string2 = '${param.currency_string2}'; //区域
                var currency_money = '${param.currency_money}'; //合同金额
                var currency_money2 = '${param.currency_money2}'; //已收金额
                var currency_money3 = '${param.currency_money3}'; //欠款金额
                var currency_string7 = '${param.currency_string7}'; //申请事由
                
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
							 +				'<input type="text" name="customer_number" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">客户名称 :</label>'
							 +				'<input type="text" name="customer_name" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">所属区域 :</label>'
							 +				'<input type="text" id="area" name="area" value="'+currency_string2+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同编码 :</label>'
							 +				'<input type="text" name="contract_id" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同名称 :</label>'
							 +				'<input type="text" name="contract_name" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同类型 :</label>'
							 +				'<input type="text" name="contract_versons" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width:40%;">逾期欠款金额 :</label>'
							 +				'<input type="text" name="overdue_amount" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width:40%;">申请减免金额 :</label>'
							 +				'<input type="text" name="applyReduction_amount" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="" style="width:40%;">批准减免金额 :</label>'
							 +				'<input type="text" name="ratifyReduction_amount" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同期间 :</label>'
							 +				'<textarea name="time-ranges" value="" class="layui-textarea" readonly></textarea>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">减免说明 :</label>'
							 +				'<textarea type="text" name="subtract_explain" value="" class="layui-textarea" readonly></textarea>'
							 +			'</div>'
							 +			'<div><label class="label-title">明细信息 </label></div>'
							 +			'<div class="approval-detail-container">'
											//明细信息
							 +			'</div>'
							 +			'<div class="approval-opinion">'
							 +				'<label class="">审批意见 :</label>'
							 +				'<textarea id="approval_opinion" class="layui-textarea" placeholder="请填写审批意见"></textarea>'
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
							 +				'<button type="button" class="layui-btn layui-btn-sm" id="agree">同意</button>'
							 +				'<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="disagree">拒绝</button>'
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
									 	 +				'<label class="" style="width: 40%;">设备编码 :</label> '
							 		 	 +				'<input type="text" name="product_id" value="'+item.details_string4+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">设备名称 :</label>'
							 		 	 +				'<input id="product_name" name="product_name" value="'+item.details_string5+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">停产天数 :</label>'
							 		 	 +				'<input type="text" name="stop_days" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">停产期间 :</label>'
							 		 	 +				'<input type="text" name="time-ranges1" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">上传天数 :</label>'
							 		 	 +				'<input type="text" name="up_days" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">上传期间 :</label>'
							 		 	 +				'<input type="text" name="time-ranges2" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +		'</div>'
							 		 	 +	'</div>';
								});
								$('.approval-detail-container').html(html0);
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
		                		{field: 'approver_name', title: '审批人', minWidth: 80}
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

                                $.ajax({
                                    url:"Currency/Approval.action",
                                    type:'post',
                                    data:{
                                        "currency_string":staffid,
                                        "currency_type":approval_id,
                                        "currency_id":currency_id
                                    },
                                    dataType:'JSON',
                                    success:function(res){
                                        if (res.msg == "success"){
                                            $('.content-list').addClass('style1');
                                            $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                                        }
                                    }
                                });
                                //审批按钮绑定点击事件
								var dataAjax = {"currency_string":staffid,"currency_type":approval_id,"currency_id":currency_id};
								buttonClick('Currency/approvalCurrencyApply.action','Currency/approvalCurrencyApply.action',dataAjax);
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
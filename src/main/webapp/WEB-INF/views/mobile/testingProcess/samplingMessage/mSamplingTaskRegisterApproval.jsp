<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务登记审批明细-手机端 -->
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
	</head>
	<body>
		<div class="container-approval">
			<h2 class="title-page">
	        	<svg class="alSvgIcon" aria-hidden="true">
	            	<use xlink:href="#icon-testingProcess"></use>
	        	</svg>
	        	采样任务登记审批详情
			</h2>
			<div class="content">
				
			</div>
		</div>
		
		<script type="text/javascript">
            layui.use(['form','element','layer','laydate','table' ],function(){
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
                var currency_date2 = '${param.currency_date2}'; //期望到货日期
                
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
							 +				'<label class="">采样单号 :</label>'
							 +				'<input type="text" id="buy_number" name="buy_number" value="'+currency_number+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">说明 :</label>'
							 +				'<textarea id="illustration" name="illustration" class="layui-textarea" value="" readonly>用于信泽有限公司现场科办理采样登记表单</textarea>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">项目名称 :</label>'
							 +				'<input type="text" name="program_name" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">联系人 :</label>'
							 +				'<input type="text" name="contact_person" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">联系电话 :</label>'
							 +				'<input type="text" name="contact_phone" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">委托单位地址 :</label>'
							 +				'<input type="text" name="entrust_adress" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">委托单位名称 :</label>'
							 +				'<input type="text" name="entrust_name" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">样品名称 :</label>'
							 +				'<input type="text" name="specimen_name" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">任务下达时间 :</label>'
							 +				'<input type="text" name="date1" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">检测类型 :</label>'
							 +				'<input type="text" name="type" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">要求完成时间 :</label>'
							 +				'<input type="text" name="date2" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">执行标准 :</label>'
							 +				'<input type="text" name="standard" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div><label class="label-title">明细信息 </label></div>'
							 +			'<div class="approval-detail-container">'
											//明细信息
							 +			'</div>'
								+			'<div class="approval-opinion">'
								+				'<label class="">审批意见 :</label>'
								+				'<select class="layui-select" name="ifAgree" id="ifAgree">'
								+				'<option value="">请选择</option>'
								+				'<option value="同意">同意</option>'
								+				'<option value="拒绝">拒绝</option>'
								+				'</select>'
								+				'<label class="" style="padding-right: 30%">&nbsp;</label>'
								+			'</div>'
								+			'<div class="approval-opinion">'
								+				'<label class="">备注 :</label>'
								+				'<textarea id="approval_opinion" class="layui-textarea"></textarea>'
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
							 +				'<button type="button" class="layui-btn layui-btn-sm" id="agree">审批</button>'
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
									 	 +				'<label class="">检测点位 :</label> '
							 		 	 +				'<input type="text" name="detection_site" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">检测项目 :</label>'
							 		 	 +				'<input type="text" name="detection_program" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">方法依据 :</label>'
							 		 	 +				'<input type="text" name="according" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">检测频次 :</label>'
							 		 	 +				'<input type="text" name="detection_frequency" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">检测天数 :</label>'
							 		 	 +				'<input type="text" name="detection_days" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">应采样数量 :</label>'
							 		 	 +				'<input type="text" name="should_number" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">已采样数量 :</label>'
							 		 	 +				'<input type="text" name="already_number" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">当天采样数量 :</label>'
							 		 	 +				'<input type="text" name="thatday_number" value="" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">备注 :</label>'
							 		 	 +				'<textarea name="remark" value="" class="layui-textarea" readonly></textarea>'
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
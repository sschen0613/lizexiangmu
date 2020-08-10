<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--报告流转及盖章审批明细-手机端 -->
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
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="container-approval">
			<h2 class="title-page">
	        	<svg class="alSvgIcon" aria-hidden="true">
	            	<use xlink:href="#icon-testingProcess"></use>
	        	</svg>
	        	报告流转及盖章审批详情
			</h2>
			<div class="content">
				
			</div>
		</div>
		
		<script>
		</script>
		<script type="text/javascript">
            layui.use(['form','element','layer','laydate','table' ],function(){
                var form = layui.form
                ,element = layui.element
                ,layer = layui.layer
                ,laydate = layui.laydate
                ,table = layui.table;  
                
                //获取传递过来的值
                //获取传递过来的值
                var approverState; //审批状态

                var currency_id = '${param.currency_id}';
                var approvalOpinion_type = 50;
                var approval_id = 50;
                var staffid = '${sessionScope.systemStaff.dingding_staffid }';
                var dingStaffid = '${param.dingStaffid}';
                var current_approvalCount;
                var approver_count;
                var rate;
    			
    			//页面内容初始化
    			$.ajax({
    				url:'Currency/selectCurrencyApprover.action',
    				type:'post',
    				data:{
                        'currency_id':currency_id,
                        "currency_string":dingStaffid,
                        "currency_type":50
					},
    				dataType:'JSON',
    				beforeSend: function(){
    					layer.load(1);
    		 		},
    				success:function(res){

                        var item = res.data[0];

                        //判断审批状态
                        var state;
                        //审批撤回
                        if(item.approver_state == -100){state = 'revoke';}
                        //未通过
                        else if(item.approver_state == -300){state = 'reject';}
                        //审批通过
                        else if(item.approver_count == item.current_approvalCount && item.approver_state == 0){state = 'adopt';}
                        //审批未处理
                        else{state = 'waitting';}
                        approverState = state;
                        current_approvalCount = item.current_approvalCount;
                        approver_count = item.approver_count;

                        //获取进度条百分比
                        var number = Number(current_approvalCount)/Number(approver_count);
                        rate = Math.floor(number*100)+'%';

    					layer.closeAll('loading');
    					var html = '';

                        var source = item.currency_int2;
                        if(source==2){
                            source='丽泽';
                        }else {
                            source='信泽';
                        }

						html += '<div class="content-list style">'
							 +		'<form>'
							 +			'<div>'
							 +				'<label class="">单据单号 :</label>'
							 +				'<input type="text" id="buy_number" name="buy_number" value="'+item.currency_number+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">申请人 :</label>'
							 +				'<input type="text" name="currency_applicant" id="staffName" value="'+item.staff_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">申请部门 :</label>'
							 +				'<input type="text" name="department_Id" id="department" value="'+item.department_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">申请日期 :</label>'
							 +				'<input type="text" name="currency_date" id="date" value="'+Format(item.currency_date,"yyyy-MM-dd")+'" class="layui-input" readonly>'
							 +			'</div>'
                            +			'<div>'
                            +				'<label class="">申请来源 :</label>'
                            +				'<input type="text" name="source" value="'+source+'" class="layui-input" readonly>'
                            +			'</div>'
								+			'<div>'
								+				'<label class="">报表编码 :</label>'
								+				'<input type="text" name="code" value="'+item.currency_string11+'" class="layui-input" readonly>'
								+			'</div>'
							 +			'<div>'
							 +				'<label class="">合同编号 :</label>'
							 +				'<input type="text" id="contract_id" name="contract_id" value="'+item.currency_string3+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同名称 :</label>'
							 +				'<input type="text" id="customer_name" name="customer_name" value="'+item.currency_string4+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同签订日期 :</label>'
							 +				'<input type="text" id="contract_date" name="contract_date" value="'+Format(item.currency_date2,"yyyy-MM-dd")+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同金额 :</label>'
							 +				'<input type="text" id="contract_amount" name="contract_amount" value="'+item.currency_money+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">已收金额 :</label>'
							 +				'<input type="text" id="actual_receipt" name="actual_receipt" value="'+item.currency_money2+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">欠款金额 :</label>'
							 +				'<input type="text" id="outstanding_receipt" name="outstanding_receipt" value="'+item.currency_money3+'" class="layui-input" readonly>'
							 +			'</div>'
                             +			'<div>'
                             +				'<label class="">合同状况 :</label>'
                             +				'<input type="text" id="state" name="state" value="'+item.currency_string10+'" class="layui-input" readonly>'
                             +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同条款 :</label>'
							 +				'<textarea id="contract" name="contract" class="layui-textarea" readonly>【合同条款名称】：《'+item.currency_string8+'》【 合同条款内容】：'+item.currency_string9+'</textarea>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">备注 :</label>'
							 +				'<textarea type="text" name="remark" class="layui-textarea" readonly>'+item.currency_string7+'</textarea>'
							 +			'</div>'
                             +			'<div><label class="label-title">合同检测内容 </label></div>'
                             +			'<div class="test-detail-container">'
                            				//检测内容
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
									 	 +				'<label class="">单位名称 :</label> '
							 		 	 +				'<input type="text" name="unit_name" value="'+item.details_string2+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">申请类型 :</label>'
							 		 	 +				'<input type="text" name="unit_type" value="'+item.details_string3+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">报告编号 :</label>'
							 		 	 +				'<input type="text" name="report_id" value="'+item.details_string4+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +			'<div>'
							 		 	 +				'<label class="">报告份数 :</label>'
							 		 	 +				'<input type="text" name="report_number" value="'+item.details_int2+'" class="layui-input" readonly>'
							 		 	 +			'</div>'
							 		 	 +		'</div>'
							 		 	 +	'</div>';
								});
								$('.approval-detail-container').html(html0);
							}
						});

						//检测内容
                        $.ajax({
                            url:'Currency/selectProgramDetailsByContract.action?currency_id='+currency_id,
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
                                        +				'<label class="">检测内容 :</label> '
                                        +				'<input type="text" name="strName" value="'+item.strName+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">金额 :</label>'
                                        +				'<input type="text" name="dblSum" value="'+item.dblSum+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +		'</div>'
                                        +	'</div>';
                                });
                                $('.test-detail-container').html(html0);
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
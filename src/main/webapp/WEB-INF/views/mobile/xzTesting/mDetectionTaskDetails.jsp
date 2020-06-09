<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测业务下发申请详情-手机端 -->
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
	            	<use xlink:href="#icon-xzTesting"></use>
	        	</svg>
	        	检测业务下发申请详情
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
                var currency_string3 = '${param.currency_string3}'; //区域
                var currency_string4 = '${param.currency_string4}'; //区域
                var currency_string5 = '${param.currency_string5}'; //区域
                var currency_string7 = '${param.currency_string7}'; //区域
                var currency_string8 = '${param.currency_string8}'; //区域

                var source = '${param.currency_int2}';
                if(source==2){
                    source='丽泽';
                }else {
                    source='信泽';
                }
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
							 +				'<label class="">下发部门 :</label>'
							 +				'<input type="text" name="issued_department" id="department" value="'+department_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">下发人 :</label>'
							 +				'<input type="text" name="issued_person" id="staffName" value="'+staff_name+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">下发日期 :</label>'
							 +				'<input type="text" name="issued_date" id="date" value="'+currency_date+'" class="layui-input" readonly>'
							 +			'</div>'
                             +			'<div>'
                             +				'<label class="">下发来源 :</label>'
                             +				'<input type="text" name="source" value="'+source+'" class="layui-input" readonly>'
                             +			'</div>'
							 +			'<div>'
							 +				'<label class="">委托单位 :</label>'
							 +				'<input type="text" name="client_department" value="'+currency_string3+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">合同编号 :</label>'
							 +				'<input type="text" name="contract_number" value="'+currency_string4+'" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">样品来源 :</label>'
							 +				'<input type="text" name="specimen_source" value="'+currency_string2+'" class="layui-input" readonly>'
							 +			'</div>'
							/* +			'<div>'
							 +				'<label class="">实施部门 :</label>'
							 +				'<input type="text" name="implement_department" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">实施人 :</label>'
							 +				'<input type="text" name="implement_person" value="" class="layui-input" readonly>'
							 +			'</div>'
							 +			'<div>'
							 +				'<label class="">接收日期 :</label>'
							 +				'<input type="text" name="get_date" value="" class="layui-input" readonly>'
							 +			'</div>'*/
							 +			'<div>'
							 +				'<label class="">任务内容 :</label>'
							 +				'<input type="text" name="task_definition" value="'+currency_string5+'" class="layui-input" readonly>'
							 +			'</div>'
                             +			'<div>'
                             +				'<label class="">报表编码 :</label>'
                             +				'<input type="text" name="code" value="'+currency_string8+'" class="layui-input" readonly>'
                             +			'</div>'
							 +			'<div>'
							 +				'<label class="">备注 :</label>'
							 +				'<textarea name="remark" readonly>'+currency_string7+'</textarea>'
							 +			'</div>'
							 +			'<div class="approval-detail-container">'
											//明细信息
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
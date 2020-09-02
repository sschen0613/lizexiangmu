<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运营服务合同盖章审批明细-手机端 -->
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
	            	<use xlink:href="#icon-contract"></use>
	        	</svg>
	        	丽泽运营服务合同盖章审批详情
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
                var approverState; //审批状态

                
                var currency_id = '${param.currency_id}';
    			var approvalOpinion_type = 35;
    			var approval_id = 35;
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
                        "currency_type":35
					},
    				dataType:'JSON',
    				beforeSend: function(){
    					layer.load(1);
    		 		},
    				success:function(res){
                        var item = res.data[0];
    					layer.closeAll('loading');
    					var html = '';
						html += '<div class="content-list style">'
							 +		'<form>'
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
                            +				'<label class="">客户编码 :</label>'
                            +				'<input type="text" name="customer_number" value="'+item.currency_string11+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="">客户名称 :</label>'
                            +				'<input type="text" name="customer_name" value="'+item.currency_string5+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="">所属区域 :</label>'
                            +				'<input type="text" id="area" name="area" value="'+item.currency_string2+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="">备注说明 :</label>'
                            +				'<textarea type="text" name="remark_illustration" value="'+item.currency_string12+'" class="layui-textarea" readonly>无档案的客户名称请填写《客户档案建档申请流程》</textarea>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="">合同期间 :</label>'
                            +				'<textarea name="time-ranges" value="" class="layui-textarea" readonly>'+item.currency_string14+'</textarea>'
                            +			'</div>'
								+			'<div>'
								+				'<label class="">合同类型 :</label>'
								+				'<input type="text" name="contractType" value="'+item.currency_string3+'" class="layui-input" readonly>'
								+			'</div>'
                            +			'<div>'
                            +				'<label class="">合同金额 :</label>'
                            +				'<input type="text" name="contract_amount" value="'+item.currency_money6+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="" style="width: 40%;">合同金额大写 :</label>'
                            +				'<input type="text" name="contract_ChineseAmount" value="'+item.currency_string13+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="">付款方式 :</label>'
                            +				'<input type="text" name="payment" value="'+(item.currency_int6==1 ? "一次性付款" : item.currency_int6==2 ? "阶段付款" : "其他")+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div><label class="label-title">收款计划 </label></div>'
                            +			'<div class="pay-detail-container">'
                            			//收款计划
                            +			'</div>'
                            /*+			'<div>'
                            +				'<label class="">条款名称 :</label>'
                            +				'<input type="text" name="name" value="'+item.currency_string8+'" class="layui-input" readonly>'
                            +			'</div>'*/
                            +			'<div>'
                            +				'<label class="">合同付款约定:</label>'
                            +				'<input type="text" name="condition" value="'+item.currency_string9+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="" style="width: 40%;">签订日期 :</label>'
                            +				'<input type="text" name="predictGetsum_date" value="'+Format(item.currency_date2,"yyyy-MM-dd")+'" class="layui-input" readonly>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="" style="width: 40%;">配件特殊约定 :</label>'
                            +				'<textarea type="text" name="partsSpecial_terms"  class="layui-textarea" readonly>'+item.currency_string+'</textarea>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="" style="width: 40%;">检测比对约定 :</label>'
                            +				'<textarea type="text" name="detection_icrms"  class="layui-textarea" readonly>'+item.currency_string15+'</textarea>'
                            +			'</div>'
                            +			'<div>'
                            +				'<label class="" style="width: 40%;">其它特殊约定 :</label>'
                            +				'<textarea type="text" name="special_terms" class="layui-textarea" readonly>'+item.currency_string10+'</textarea>'
                            +			'</div>'
                            +			'<div><label class="label-title">明细信息 </label></div>'
                            +			'<div class="approval-detail-container">'
                            				//明细信息
                            +			'</div>'
                            +			'<div><label class="label-title">图片信息 </label></div>'
                            +			'<div class="picture-detail-container">'
                            				//图片
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
                        //渲染进度条
                        element.render('progress');
                        //更新进度条
                        updateProgress();
                        //执行一个table实例
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
                                        +				'<label class="" style="width: 40%;">运营设备编码 :</label> '
                                        +				'<input type="text" name="product_id" value="'+item.details_string4+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">运营设备 :</label>'
                                        +				'<input id="product_name" name="product_name" value="'+item.details_string5+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="">型号 :</label>'
                                        +				'<input type="text" name="specifications_models" value="'+item.details_string6+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="" style="width: 56%;">设备运营开始日期 :</label>'
                                        +				'<input type="text" name="start_equipment" value="'+item.details_string3+'" class="layui-input" readonly>'
                                        +			'</div>'
                                        +			'<div>'
                                        +				'<label class="" style="width: 56%;">设备运营结束日期 :</label>'
                                        +				'<input type="text" name="end_equipment" value="'+item.details_string13+'" class="layui-input" readonly>'
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
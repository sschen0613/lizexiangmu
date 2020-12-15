<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 报告流转及盖章审批列表-手机端 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" href="css/mobile.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
<!-- 		<script type="text/javascript" src="js/iconfont.js"></script> -->
	</head>
	<body>
		<div class="approval-list">
			<div class="approval-list-title">
				<a href="mobile/view/Mindex.action?currentTab=approval" class="layui-icon layui-icon-left"></a>
				<h2 class="">报告流转及盖章列表</h2>
			</div>
			<div class="approval-list-content">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					<div class="layui-tab-content" style="height:100%;">
				    	<div class="layui-tab-item waitting layui-show">
				    		<ul id="waitting_demo">
				    			<!-- 待审批 -->
				    		</ul>
				    	</div>
					</div>
				</div> 
			</div>
			<div id="toTop" class="layui-icon return-top" onclick="returnToTop()"></div>
			<input type="text" class="iframe-return-type" value="0" style="display:none;">
		</div>
		
		<script type="text/javascript">
            layui.use(['form','element','layer','laydate','flow' ],function(){
                var form = layui.form
                ,element = layui.element
                ,layer = layui.layer
                ,laydate = layui.laydate
                ,flow = layui.flow; //流加载
                
                //保存页面信息
                var A_List = {
                	'waitting':[{'count':0,'name':'waitting'}]
                };
                //UNIT //每页加载数量(in funtion_tool.js)
                
                //数据初始化
                var currency_type = 43;
    			var staffid ="${sessionScope.systemStaff.dingding_staffid }";
    			$.ajax({
    				url:'Currency/selectCurrencyList.action?currency_type='+ currency_type+"&currency_int4=1",
    				type:'post',
    				dataType:'JSON',
    				beforeSend: function(){
    					layer.load(1);
    		 		},
    				success:function(res){
    					layer.closeAll('loading');
    					$.each(res.data,function(index,item){
    						state = 'waitting';
    						var moveState = "未流转";
    						if (item.currency_int5 == 1){
    							moveState = "已流转";
							}
    						var html = '';
    						html += '<li>'
    				    		 +		'<h2>【合同编号 :'+item.currency_string18+'】</h2>'
    				    		 +		'<i>项目名称 : '+item.currency_string2+'</i>'
    				    		 +		'<i>流转状态 : '+moveState+'</i>'
    				    		 +		'<a href="testingProcess/reportMoveStamp/mReportMoveStamp.action?currency_id='+item.currency_id
                                +		'&dingStaffid='+staffid+'&contract_id='+item.currency_string18+'&code='+item.currency_string7
    				    				 +'&approverState='+state+'" id="'+item.currency_string18+'" onclick="approvalDetails(this);return false;">'
    				    		 +			'发起流转'
    				    		 +			'<span class="layui-icon layui-icon-right"></span>'
    				    		 +		'</a>'
    				    		 +	'</li>';

    				    		A_List.waitting[A_List.waitting.length] = html;
    				    		A_List.waitting[0].count++;
    					});
    				},
    				complete: function(){
    					//没有内容,显示图标
    					$.each(A_List,function(index,item){
    						if(item[0].count == 0){
    							$('.'+item[0].name).addClass('approval-none');						
    						}
    					});
    					if(A_List.waitting[0].count > 0){
    						//审批未处理流加载初始化
        					flow.load({
        	                	elem: '#waitting_demo' //流加载容器
        	                	,isAuto: true //自动加载
        	                	,end: '没有更多审批信息了' //底部信息
        	                    ,done: function(page, next){ //执行下一页的回调
        	                      	//模拟数据插入
        							setTimeout(function(){
        	                        	var lis = [];
        	                        	for(var i = 1; i <= UNIT; i++){
        	                          		lis.push(A_List.waitting[UNIT*(page-1)+i]);
        	                        	}
        	                        	//执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
        	                        	//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
        	                        	next(lis.join(''), page < A_List.waitting[0].count/UNIT);
        							}, 500);
        	                	}
        					});	
    					}
    				}
    			});
    			//查看详情点击事件
    			window.approvalDetails = function(e){
    				//合同是否生效
    				var contract_id = $(e).attr('id');
					$.ajax({
						url:'System/selectXZContractById.action',
						type:'post',
						data:{"strContractID": contract_id},
						dataType:'JSON',
						success:function(res){
							if (res.data.iStatus != 1){
								layer.msg("该合同还未生效，不能流转");
								return false;
							}
						}
					});
    				var action = $(e).attr('href');
    				layer.open({
    					type: 1,
    					title: false,
    					closeBtn: 1,
    					//shadeClose: true,
    					area: ['93%','96%'],
    					content: '<iframe src="'+action+'" class="approval-details-iframe"></iframe>',
    					end: function(index, layero){
    						//点击同意
    						if($('.iframe-return-type').val() == '1'){
    							//内容添加到已通过
    							var html = '<li>'+$(e).closest('li').html()+'</li>';
    							html = html.replace('waitting','adopt');
    							var index1 = html.indexOf('id="a') + 5;
    							var index2 = html.indexOf('" onclick');
    							var id0 = Number(html.substring(index1,index2));//获取要插入的li的a标签的id
    							for(var i = 1;i < A_List.adopt.length;i++){
    								var n1 = A_List.adopt[i].indexOf('id="') + 5;
    								var n2 = A_List.adopt[i].indexOf('" onclick');
    								var id = Number(A_List.adopt[i].substring(n1,n2));//获取已有的li的a标签的id
    								//将li插入正确的位置
    								if(id0 < id){
    									A_List.adopt.splice(i,0,html);
    									break;
    								}
    							}
    							//从待审批移除
    							//从流加载数组删除记录
    							for(var i = 1;i < A_List.waitting.length;i++){
    								//console.log(id0);
    								var key = A_List.waitting[i].indexOf('id="a'+html.substring(index1,index2)+'"');
    								if(key != -1){
    									A_List.waitting.splice(i,1);
    									//移除DOM对象
    	    							$(e).closest('li').remove();
    									break;
    								}
    							}
    						}
    						//点击拒绝
    						else if($('.iframe-return-type').val() == '-1'){
    							//内容添加到未通过
    							var html = '<li>'+$(e).closest('li').html()+'</li>';
    							html = html.replace('waitting','reject');
    							var index1 = html.indexOf('id="a') + 5;
    							var index2 = html.indexOf('" onclick');
    							var id0 = Number(html.substring(index1,index2));//获取要插入的li的a标签的id
    							for(var i = 1;i < A_List.reject.length;i++){
    								var n1 = A_List.reject[i].indexOf('id="') + 5;
    								var n2 = A_List.reject[i].indexOf('" onclick');
    								var id = Number(A_List.reject[i].substring(n1,n2));//获取已有的li的a标签的id
    								//将li插入正确的位置
    								if(id0 < id){
    									A_List.reject.splice(i,0,html);
    									break;
    								}
    							}
    							//从待审批移除
    							//从流加载数组删除记录
    							for(var i = 1;i < A_List.waitting.length;i++){
    								//console.log(id0);
    								var key = A_List.waitting[i].indexOf('id="a'+html.substring(index1,index2)+'"');
    								if(key != -1){
    									A_List.waitting.splice(i,1);
    									//移除DOM对象
    	    							$(e).closest('li').remove();
    									break;
    								}
    							}
    						}
    						$('.iframe-return-type').val('0');//重置,表示弹出层无操作
    					}
					});
    			}
                
            });
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 出差登记审批列表-手机端 -->
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
				<h2 class="">出差登记审批</h2>
				<span class="menu layui-icon layui-icon-more">
					<div class="sub-menu">
						<ul>
							<li>全部通过</li>
							<li>全部驳回</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="approval-list-content">
				<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					<ul class="layui-tab-title">
				  		<li class="layui-this">待审批</li>
				    	<li>已通过</li>
				    	<li>未通过</li>
				    	<li>撤回</li>
					</ul>
					<div class="layui-tab-content" style="height:100%;">
				    	<div class="layui-tab-item waitting layui-show">
				    		<ul id="waitting_demo">
				    			<!-- 待审批 -->
				    		</ul>
				    	</div>
				    	<div class="layui-tab-item adopt">
				    		<ul id="adopt_demo">
								<!-- 已通过 -->
				    		</ul>
				    	</div>
				    	<div class="layui-tab-item reject">
				    		<ul id="reject_demo">
				    			<!-- 未通过 -->
				    		</ul>
				    	</div>
				    	<div class="layui-tab-item revoke">
				    		<ul id="revoke_demo">
				    			<!-- 已撤回 -->
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
                	'waitting':[{'count':0,'name':'waitting'}],
                	'adopt':[{'count':0,'name':'adopt'}],
                	'reject':[{'count':0,'name':'reject'}],
                	'revoke':[{'count':0,'name':'revoke'}]
                };
                //UNIT //每页加载数量(in funtion_tool.js)
                
                //数据初始化
                var currency_type = 65;
    			var staffid ="${sessionScope.systemStaff.dingding_staffid }";
    			$.ajax({
    				url:'Currency/selectCurrencyApprover.action?currency_type='+ currency_type+"&currency_string="+staffid,
    				type:'post',
    				dataType:'JSON',
    				beforeSend: function(){
    					layer.load(1);
    		 		},
    				success:function(res){
    					layer.closeAll('loading');
    					$.each(res.data,function(index,item){
    						var state;
    						//判断审批状态
    						//审批撤回
    				    	if(item.approver_state == -100){state = 'revoke';}
    				    	//未通过
    				    	else if(item.approver_state == -300){state = 'reject';}
    						//审批通过
    						else if(item.approver_count == item.current_approvalCount && item.approver_state == 0){state = 'adopt';}
    				    	//审批未处理
    				    	else{state = 'waitting';}
    						var html = '';
    						html += '<li>'
    				    		 +		'<h2>【'+Format(item.currency_date,"yyyy-MM-dd")+'】发起申请</h2>'
    				    		 +		'<i>申请人 : '+item.staff_name+'</i>'
    				    		 +		'<i>申请部门 : '+item.department_name+'</i>'
    				    		 +		'<a href="office/mTravelRegistrationApproval.action?currency_id='+item.currency_id
    				    		 +		'&dingStaffid='+staffid
    				    				 +'&approverState='+state+'" id="a'+index+'" onclick="approvalDetails(this);return false;">'
    				    		 +			'查看详情'
    				    		 +			'<span class="layui-icon layui-icon-right"></span>'
    				    		 +		'</a>'
    				    		 +	'</li>';
    						//判断审批状态,保存页面信息
    						//审批撤回
    				    	if(item.approver_state == -100){
    				    		A_List.revoke[A_List.revoke.length] = html;
    				    		A_List.revoke[0].count++;
    				    	}
    				    	//未通过
    				    	else if(item.approver_state == -300){
    				    		A_List.reject[A_List.reject.length] = html;
    				    		A_List.reject[0].count++;
    				    	}
    						//审批通过
    						else if(item.approver_count == item.current_approvalCount && item.approver_state == 0){
    							A_List.adopt[A_List.adopt.length] = html;
    				    		A_List.adopt[0].count++;
        					}
    				    	//审批未处理
    				    	else{
    				    		A_List.waitting[A_List.waitting.length] = html;
    				    		A_List.waitting[0].count++;
    				    	}
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
    			//操作
    			//菜单滑入滑出
//     			$('.menu').click(function(){
//     				$('.sub-menu').slideToggle();
//     			});
    			//监听选项卡切换
    			element.on('tab(docDemoTabBrief)', function(data){
    				//console.log(this); //当前Tab标题所在的原始DOM元素
    				//console.log(data.index); //得到当前Tab的所在下标
    				//console.log(data.elem); //得到当前的Tab大容器
    				if(data.index == 0 && A_List.waitting[0].count > 0){
    					$('#waitting_demo').html('');
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
    				}else if(data.index == 1 && A_List.adopt[0].count > 0){
    					$('#adopt_demo').html('');
    					//审批通过流加载初始化
    					flow.load({
    	                	elem: '#adopt_demo' //流加载容器
    	                	,isAuto: true //自动加载
    	                	,end: '没有更多审批信息了' //底部信息
    	                    ,done: function(page, next){ //执行下一页的回调
    	                      	//模拟数据插入
    							setTimeout(function(){
    	                        	var lis = [];
    	                        	for(var i = 1; i <= UNIT; i++){
    	                          		lis.push(A_List.adopt[UNIT*(page-1)+i]);
    	                        	}
    	                        	//执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
    	                        	//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
    	                        	next(lis.join(''), page < A_List.adopt[0].count/UNIT);
    							}, 500);
    	                	}
    					});
    				}else if(data.index == 2 && A_List.reject[0].count > 0){
    					$('#reject_demo').html('');
    					//审批未通过流加载初始化
    					flow.load({
    	                	elem: '#reject_demo' //流加载容器
    	                	,isAuto: true //自动加载
    	                	,end: '没有更多审批信息了' //底部信息
    	                    ,done: function(page, next){ //执行下一页的回调
    	                      	//模拟数据插入
    							setTimeout(function(){
    	                        	var lis = [];
    	                        	for(var i = 1; i <= UNIT; i++){
    	                          		lis.push(A_List.reject[UNIT*(page-1)+i]);
    	                        	}
    	                        	//执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
    	                        	//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
    	                        	next(lis.join(''), page < A_List.reject[0].count/UNIT);
    							}, 500);
    	                	}
    					});
    				}else if(data.index == 3 && A_List.revoke[0].count > 0){
    					$('#revoke_demo').html('');
    					//审批撤回流加载初始化
    					flow.load({
    	                	elem: '#revoke_demo' //流加载容器
    	                	,isAuto: true //自动加载
    	                	,end: '没有更多审批信息了' //底部信息
    	                    ,done: function(page, next){ //执行下一页的回调
    	                      	//模拟数据插入
    							setTimeout(function(){
    	                        	var lis = [];
    	                        	for(var i = 1; i <= UNIT; i++){
    	                          		lis.push(A_List.revoke[UNIT*(page-1)+i]);
    	                        	}
    	                        	//执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
    	                        	//pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
    	                        	next(lis.join(''), page < A_List.revoke[0].count/UNIT);
    							}, 500);
    	                	}
    					});
    				}
				});
    			//查看详情点击事件
    			window.approvalDetails = function(e){
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/progress_open_revise.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div class="layui-progress layui-progress-big" lay-filter="progress_bar" lay-showPercent="true">
		    <div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>
		</div>

		<table id="tab" lay-filter="table"></table>

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
				var current_approvalCount = ${param.current_approvalCount};
				var approver_count = ${param.approver_count};
				var currency_id = ${param.currency_id};
				var approvalOpinion_type = ${param.approvalOpinion_type};
				//表单更新渲染
				form.render();
				form.render('select');
				//执行一个laydate实例
				laydate.render({
					elem: '#date' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				//获取进度条百分比
				var number = current_approvalCount/approver_count;
				var rate = Math.floor(number*100)+'%';
				setTimeout(function(){ 
					element.progress('progress_bar', rate);
				}, 400);

				//创建table实例					
				table.render({
					elem: '#tab'
					,url: 'Currency/selectApprovalOpinion.action?approvalOpinion_type='+approvalOpinion_type+"&approval_id="+currency_id //数据接口
					,page: true //开启分页
			    	,title: '审批详情'
					,cols: [[ //表头
                        {field: 'approval_state', title: '审批组', minWidth: 80}
                        ,{field: 'approver_name', title: '审批人', minWidth: 80}
						,{field: 'approvalOpinion_result', title: '审批意见'}
						,{field: 'approval_date', title: '审批时间', templet:'<div>{{ Format0(d.approval_date,"yyyy-MM-dd HH:mm:ss")}}</div>'}
					]]
				});

			});
		</script> 
	</body>
</html>
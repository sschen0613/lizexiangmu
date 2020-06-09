<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 审批管理   -->
<link rel="stylesheet" href="../css/search_revise.css"> 
<link rel="stylesheet" href="../layui/css/layui.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/form_top_revise.css"> -->
<link rel="stylesheet" type="text/css" href="../css/table.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script> 
 
<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">设置</a>
</script>
<script type="text/javascript">
	layui.use(['laydate', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
		var laydate = layui.laydate //日期
		,laypage = layui.laypage //分页
		,layer = layui.layer //弹层
		,table = layui.table //表格
		,element = layui.element //元素操作
		,form = layui.form
		,layedit = layui.layedit;
  

		//重新渲染   针对select下拉列表不显示的情况
		form.render('select');
  
		//监听Tab切换
		element.on('tab(demo)', function(data){
    		layer.msg('切换了：'+ this.innerHTML);
		});
  
		//执行一个 table 实例
		table.render({
			elem: '#test'
			,url: '../Approval/getApprovalList.action' //数据接口
			//,page: true //开启分页
			,id:'tab'
			,cols: [[ //表头
      			{field: 'approval_id', title: 'ID', width:80, sort: true}
      			,{field: 'approval_name', title: '审批流名称', width:250}
      			,{fixed: 'right', title:'操作', width:210, align:'center', toolbar: '#barDemo'}    
			]]
		});
		//监听工具条
		table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值
			var tr = obj.tr; //获得当前行 tr 的DOM对象
   
			if(layEvent === 'edit'){
				layer.open({
    	    		type: 2,
    	    		title :'审批设置',
    	    		shade: 0.8,
    	    		shadeClose:true,
    	        	maxmin: true,
    	        	closeBtn: 1,
    	    		area: ['600px', '500px'],
    	    		offset: '50px',
    	    		content: '../Approval/approvalCompanyList.action?approval_id='+data.approval_id, 
    	        	end: function () {
    	        		table.reload("tab" ,{});
    	          	}
    	    	});
			} else if(layEvent === 'noDetail'){
				layer.msg("请到旁边的设置中进行添加抄送人");
			}
		});

	});
</script>
    
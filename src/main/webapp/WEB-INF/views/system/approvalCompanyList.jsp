<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/form_top_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<!-- 审批管理 设置 -->
<form class="layui-form form-top">
	<div class="layui-form-item">
	  <div class="layui-inline">
	    <label class="layui-form-label label-revise">公司名称 :</label>
	    <div class="layui-input-inline">
	      <input name="company_Name" lay-verify="" autocomplete="" placeholder="请输入公司名称" class="layui-input input-revise">
	    </div>
	  </div>
	  <div class="layui-inline">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm button-revise">
              	检索
            </button>
      </div> 
	</div>
</form>    
<table class="layui-hide" id="test" lay-filter="demo" lay-size="sm"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="updatefacilities">设定</a>
	<a class="layui-btn layui-btn-xs" lay-event="edit">设置抄送人</a>
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
		var approval_id = ${param.approval_id};
	  
		//监听搜索提交按钮
		form.on('submit(search)', function(data){
	  		//console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  		//console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  		var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value}
	  
			//重载表格
      		table.reload("tab" ,{
				where : {"company_Name" :data2.company_Name},
      		});
	  		return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
  
		//监听Tab切换
		element.on('tab(demo)', function(data){
			layer.msg('切换了：'+ this.innerHTML);
		});
  
		//执行一个 table 实例
		table.render({
   	 		elem: '#test'
    		,id:'tab'
    		,url: '../Company/getCompany.action' //数据接口
    		,page: true //开启分页
			,cols: [[ //表头
      			{field: 'company_id', title: 'ID', sort: true}
      			,{field: 'company_name', title: '公司名称'}
      			,{fixed: 'right', align:'center', toolbar: '#barDemo'}
			]]
		});
  
		//监听工具条
		table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
			,layEvent = obj.event; //获得 lay-event 对应的值
			var tr = obj.tr; //获得当前行 tr 的DOM对象
   
			if(layEvent === 'detail'){
      			layer.msg('查看操作');
			} else if(layEvent === 'del'){

			} else if(layEvent === 'edit'){
	    		layer.open({
	    			type: 2,
	    			title :'设置抄送人',
	    			shade: 0.8,
	    			shadeClose:true,
	       			//maxmin: true,
	        		closeBtn: 1,
	        		fixed: true,
	        		move: false,
	    			area: ['90%', '90%'],
	    			content: '../Approval/setCopyPerson.action?approval_id='+approval_id+'&company_id='+data.company_id, 
	        		end: function () {
	        			table.reload("tab" ,{});
	          		}
	    		});
			} else if(layEvent === 'updatefacilities'){
				layer.open({
					type: 2,
	    			title :'默认审批人',
	    			shade: 0.8,
	    			shadeClose:true,
	       	 		//maxmin: true,
	        		closeBtn: 1,
	        		fixed: true,
	        		move: false,
	    			area: ['90%', '90%'],
	    			content: '../Approval/setupAllocationApproverView.action?company_id='+data.company_id+'&approval_id='+approval_id, 
	        		end: function () {
	        			table.reload("tab" ,{});
	          		}
	    		});
    		}
		});

	});
</script>
    
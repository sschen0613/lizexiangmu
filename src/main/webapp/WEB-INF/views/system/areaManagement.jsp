<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
    
<!-- 职员列表 -->
<!-- <link rel="stylesheet" href="../css/search_revise.css">  -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="../css/form_top_revise.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script> 
<form class="layui-form form-top">
	<div class="layui-form-item">
		<div class="layui-inline">
	    	<label class="layui-form-label label-revise">姓名 :</label>
	    	<div class="layui-input-inline">
	      		<input name="staff_Name" lay-verify="" autocomplete="" placeholder="请输入姓名" class="layui-input input-revise">
	    	</div>
		</div>
		<div class="layui-inline">
        	<button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm button-revise">
              	检索
            </button>
		</div> 
	</div>
</form>  
<table class="layui-hide" id="test" lay-filter="test" lay-size="sm"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">未管理区域</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">已管理区域</a>
</script>

<script type="text/javascript">
	layui.use(['laypage', 'layer', 'table',  'element','form'], function(){
  		var laypage = layui.laypage //分页
  		,layer = layui.layer //弹层
  		,table = layui.table //表格
  		,element = layui.element //元素操作
  		,form = layui.form;
  
  		//重新渲染   针对select下拉列表不显示的情况
  		form.render('select');
  
  		//监听搜索提交按钮
  		form.on('submit(search)', function(data){
	  		//console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	 	 	//console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  		var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value}
	  
			//重载表格
      		table.reload("tab" ,{
      			page: true,
				where : {
					"staff_Name" :data2.staff_Name,"company_Id" :data2.company_Id
					,"position_Id" :data2.position_Id, "department_Id" :data2.department_Id
					,"staff_State" :data2.staff_State
				},
      		});
	  
	  		return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
  		form.on('select(company)', function(data){
	  		var cid = data.value;
	  		if(cid == ""){
	  			//选择了"请选择公司"查询出所有部门
			 	$.ajax({
					url : "../Department/getDepartment.action",
					type : "post",
					dataType : "JSON",
					success : function(res){
						var html ="<option value=''>请选择部门</option>";
						$.each(res.data, function(index, item){
							html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
							
						});
						$("#department").html(html);
						form.render('select');
					}
				}); 
	  		}else{
	  			//选择了一个公司查询这个公司下的部门
			 	$.ajax({
					url : "../Department/getDepartment.action",
					type : "post",
					data : {"company_Id" :cid},
					dataType : "JSON",
					success : function(res){
					var html ="<option value=''>请选择部门</option>";
						$.each(res.data, function(index, item){
							html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
						});
						$("#department").html(html);
						form.render('select');
					}
				}); 
	  		}
	  		/* var html = "<option value='0'>请先选择公司</option>";
	  		$("#Erji").html(html);
	  		form.render('select'); */
	  	
		});
  		
  
  		//执行一个 table 实例
  		table.render({
			elem: '#test'
			,url: '../Staff/selectStaff.action' //数据接口
			,page: true //开启分页
			,toolbar: true
			,title: '用户数据表'
			,id:"tab"
			,cols: [[ //表头
				//{type: 'checkbox', fixed: 'left'}
				{field: 'stname', title: '姓名', width: 100}
				,{field: 'department_name', title: '所属部门', width:200}
				,{field: 'company_name', title: '所属公司', width:300}
				,{fixed: 'right', title:'操作', width:300, align:'center', toolbar: '#barDemo'}
			]]
		});
		//监听工具条
		table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
			var data = obj.data //获得当前行数据
    		var layEvent = obj.event; //获得 lay-event 对应的值
    		var tr = obj.tr; //获得当前行 tr 的DOM对象
   
    		if(layEvent === 'detail'){
      			layer.msg('查看操作');
    		} else if(layEvent === 'del'){
	    		layer.open({
	    			type: 2,
	    			title :'已管理区域',
	    			shade: 0.8,
	    			shadeClose:true,
	        		maxmin: true,
	        		closeBtn: 1,
	    			area: ['800px', '80%'],
	    			content: '../system/AreaManagementForm.action?stid='+data.stid, 
	        		end: function () {
	        			table.reload("tab" ,{});
	          		}
	    		});
    		} else if(layEvent === 'edit'){
				layer.open({
		    		type: 2,
		    		title :'未管理区域',
		    		shade: 0.8,
		    		shadeClose:true,
		        	maxmin: true,
		        	closeBtn: 1,
		    		area: ['800px', '80%'],
		    		content: '../system/noAreaManagementForm.action?stid='+data.stid,
		        	end: function () {
		        		//console.log(data.stid),
		        		table.reload("tab" ,{});
		          	}
		    	});
   			}
		});
		//头工具栏事件
		table.on('toolbar(test)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
		    	case 'batchdel':
		    		break;
		   		case 'add':
					break;
		   		case 'tongbu':
		    		//加载层-默认风格
		    	  	layer.load();
		    	  	//同步钉钉人员
			        $.ajax({
			        	url : "../Staff/updateDingStaff.action",
			        	type : "post",
			        	data : {"staffids" : staffids},
			        	traditional : true,
			        	dataType : "JSON",
			        	success : function (res){
			        		layer.closeAll('loading');
			        		layer.msg(res.msg);
			              	table.reload("tab" ,{
			              	});
			        	}
			        	
			        });
		    };
		});
		
	});
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//Format("2016-10-04 8:9:4.423","yyyy-MM-dd hh:mm:ss.S") ==> 2016-10-04 08:09:04.423   
//Format("1507353913000","yyyy-M-d h:m:s.S")      ==> 2017-10-7 13:25:13.0  
function Format(datetime) {
	var date1 = datetime;
	var unixTimestamp = new Date(date1) ;
	commonTime = unixTimestamp.toLocaleString();
return commonTime;
}
</script>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<form class="layui-form">
	<div class="layui-form-item" style="padding-top:10px;">
		 <div class="layui-inline">
			<label class="layui-form-label searchintop_label_revise">角色:</label>
			<div class="layui-input-inline">
			     <select id="dingrole" name="approver_id" lay-filter="dingrole" lay-search class="searchintop_select_revise">
			  </select>
			</div>
		 </div>
		  <div class="layui-inline ">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm searchintop_button_revise">
              	添加
            </button>
	      </div> 
		</div>
	  <div class="layui-form-item" id="addadmin" style="padding-top:10px;">

		</div>
</form>  
<table class="layui-hide" id="test" lay-filter="demo" lay-data="{url:'/test/table/demo1.json', id:'demo'}" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="del">移除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add">批量移除</button>
  </div>
</script>

<script type="text/javascript">
var approval_id = ${param.approval_id};
if (approval_id == 7){
	  html="<div class=\"layui-inline\">"
			+"	<label class=\"layui-form-label searchintop_label_revise\">主管:</label>"
			+"	<div class=\"layui-input-inline\">"
			+"		<select id=\"dingrole\" name=\"role_type\" lay-filter=\"zhuguan\" lay-search class=\"searchintop_select_revise\">"
			+"			<option value=''>请选择</option>"
			+"			<option value='2'>直接主管</option>"
			+"			<option value='3'>二级主管</option>"
			+"		</select>"
			+"	</div>"
			+"</div>"
			+"<div class=\"layui-inline\">"
			+"   <button lay-submit=\"\" lay-filter=\"search2\" type=\"submit\" class=\"layui-btn layui-btn-sm layui-btn-warm searchintop_button_revise\">"
			+" 	  添加</button>"
			+"</div> "
			$("#addadmin").html(html);
}

layui.use(['laydate', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  ,layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,element = layui.element //元素操作
	  ,form = layui.form
	  ,layedit = layui.layedit;
	//监听行双击事件
	  table.on('rowDouble(demo)', function(obj){
		  console.log(obj.tr) //得到当前行元素对象
		  console.log(obj.data) //得到当前行数据
		  //obj.del(); //删除当前行
		  //obj.update(fields) //修改当前行数据
		  var data = obj.data
		  ,approval_id = data.approval_id
		  ,role_type = data.role_type
		  ,approver_id = data.approver_id;
		  
		  layer.msg("1");
		    layer.open({
		    	type: 2,
		    	title :'抄送人',
		    	shade: 0.8,
		    	shadeClose:true,
		        maxmin: true,
		        closeBtn: 1,
		    	area: ['80%', '80%'],
		    	content: '../Approval/setApprovalStaffView.action?approval_id='+data.approval_id+"&role_type="+role_type+"&approver_id="+approver_id, 
		        end: function () {
		        	table.reload("tab" ,{
		        	});
		          }
		    });
	  });
	  //监听单元格编辑
	  table.on('edit(demo)', function(obj){
	    var role_priority = obj.value //得到修改后的值
	    ,data = obj.data //得到所在行所有键值
	    ,field = obj.field; //得到字段
	    var approver_name = data.approver_name
	    	,approver_id = data.approver_id
	    	,approval_id = data.approval_id
	    	,role_type = data.role_type;
	    
	    
 	        $.ajax({
	        	url : "../Approval/updatePriority.action",
	        	type : "post",
	        	data : {"role_priority": role_priority, "approver_id":approver_id, "approval_id": approval_id,"role_type":role_type},
	        	dataType : "JSON",
	        	success : function (result){
	        		layer.msg(result.msg);
	        		if(result.code > 0){
	        			layer.msg('[ID: '+ data.approver_name +'] ' + field + ' 字段更改为：'+ value);
	        		}else{
	        			layer.msg(reuslt.msg);
	        		}
					//重载表格
			      	table.reload("tab" ,{
						
			      	}); 
	        	}
	        	
	        }); 
	    
	  });
	  var approver_name = null;
	  form.on('select(dingrole)', function(data){
		  approver_name = data.elem[data.elem.selectedIndex].text;

	  })
	  var name = null;
	  form.on('select(zhuguan)', function(data){
		  name = data.elem[data.elem.selectedIndex].text;

	  })
  		//监听添加提交按钮
	  form.on('submit(search)', function(data3){
		 if(approver_name == null){
			 layer.msg("请先进行选择");
		 }else{
			  var data2 = data3.field;
			  var approver_id = data2.approver_id;
			  var approval_id = ${param.approval_id};
	 	        $.ajax({
		        	url : "../Approval/addDingRole.action",
		        	type : "post",
		        	data : {"approver_name": approver_name, "approver_id":approver_id, "approval_id": approval_id},
		        	dataType : "JSON",
		        	success : function (result){
		        		layer.msg(result.msg);
						//重载表格
				      	table.reload("tab" ,{
							
				      	}); 
		        	}
		        	
		        });
		 }
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
		//监听添加提交按钮
	  form.on('submit(search2)', function(data3){
		 if(name == null){
			 layer.msg("请先进行选择");
		 }else{
			  var data2 = data3.field;
			  var role_type = data2.role_type;
			  var approval_id = ${param.approval_id};
	 	        $.ajax({
		        	url : "../Approval/addDingAdmin.action",
		        	type : "post",
		        	data : {"approver_name": name, "approval_id": approval_id, "role_type":role_type},
		        	dataType : "JSON",
		        	success : function (result){
		        		layer.msg(result.msg);
						//重载表格
				      	table.reload("tab" ,{
							
				      	}); 
		        	}
		        	
		        });
		 }
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	
	  //查询钉钉所有角色
	    $.ajax({
	  	url : "../Approval/selectDingRole.action",
	  	type : "post",
	  	dataType : "JSON",
	  	success : function (list){
			 var html ="<option value=''>请选择</option>";
			 $.each(list, function(index, item){
				 $.each(item.roles, function(index, item){
					html += "<option value='"+item.id+"'>"+item.name+"</option>";
				 })
			 });
			 $("#dingrole").html(html);
			 form.render('select');
	  	}
	  });
	  
  var id = ${param.approval_id};
  var approval_id = ${param.approval_id};
  
  
 if (approval_id == 7){
	  //执行一个 table 实例
	  table.render({
	    elem: '#test'
	    //,height: 332
	    ,url: '../Approval/selectApprovalRole.action?id='+id //数据接口
	    ,page: false //开启分页
	    ,id:'tab'
	    ,cols: [[ //表头
	      {field: 'approver_id', title: 'ID', width:120, sort: true, fixed: 'left'}
	      ,{field: 'approver_name', title: '角色名称', width:100}
	      ,{field: 'role_priority', title: '审批顺序', width:100, edit: 'text'}
	      ,{field: 'role_state', title: '审批方式', width:100, sort: true}
	      ,{fixed: 'right',minWidth: 150, align:'center', width:120, toolbar: '#barDemo'} 
	      ]]
	  });
  }else{
	  
	  //执行一个 table 实例
	  table.render({
	    elem: '#test'
	    //,height: 332
	    ,url: '../Approval/selectApprovalRole.action?id='+id //数据接口
	    ,page: false //开启分页
	    ,id:'tab'
	    ,cols: [[ //表头
	      {field: 'approver_id', title: 'ID', width:160, sort: true, fixed: 'left'}
	      ,{field: 'approver_name', title: '角色名称', width:160}
	      ,{fixed: 'right',minWidth: 150, width:250, align:'center', width:160, toolbar: '#barDemo'} 
	      ]]
	  });
  }  

  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    var tr = obj.tr; //获得当前行 tr 的DOM对象
   
    if(layEvent === 'detail'){
      layer.msg('查看操作');
    } else if(layEvent === 'del'){
      layer.confirm('确认删除', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
        var approver_id = data.approver_id;
        var approval_id = ${param.approval_id};
        var role_type = data.role_type;
        $.ajax({
        	url : "../Approval/deleteDingRole.action",
        	type : "post",
        	data : {"approver_id" : approver_id, "approval_id":approval_id,"role_type":role_type},
        	dataType : "JSON",
        	success : function (result){
        		layer.msg(result.msg);
        	}
        	
        });

        
      });
    }
  });
  
});

</script>
    
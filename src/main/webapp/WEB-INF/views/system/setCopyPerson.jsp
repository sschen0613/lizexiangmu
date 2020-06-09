<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!-- 审批管理 设置 设置抄送人-->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/form_system_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<form class="layui-form form-approval-persion">
	<div class="layui-form-item">
		 <div class="layui-inline">
			<label class="layui-form-label">抄送人:</label>
			<div class="layui-input-inline">
			     <select id="dingrole" name="copy_person" lay-filter="dingrole" lay-search class="">
			  </select>
			</div>
		 </div>
		  <div class="layui-inline">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
              	添加
            </button>
	      </div> 
		</div>
</form>  
<table class="layui-hide" id="test" lay-filter="demo" lay-size="sm"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">移除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-danger layui-btn-xs add" lay-event="add">批量移除</button>
  </div>
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
	  var copy_name = null;
	  var company_id = ${param.company_id };
	  form.on('select(dingrole)', function(data){
		  copy_name = data.elem[data.elem.selectedIndex].text;
	  })
  		//监听添加提交按钮
	  form.on('submit(search)', function(data3){
		 if(copy_name == null){
			 layer.msg("请先进行选择");
		 }else{
			  var data2 = data3.field;
			  var copy_person = data2.copy_person;
			  var approval_id = ${param.approval_id};
	 	        $.ajax({
		        	url : "../Approval/addCopyPerson.action",
		        	type : "post",
		        	data : {"copy_name": copy_name, "approval_id": approval_id, "copy_person":copy_person, "company_id":company_id},
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
	
		//获取所有员工
	  $.ajax({
		url : "../Staff/selectStaff.action",
		type : "post",
		dataType : "JSON",
		success : function (list){
			 var html ="<option value=''>请选择</option>";
			 $.each(list.data, function(index, item){
				html += "<option value='"+item.dingding_staffid+"'>"+item.stname+"</option>";
					
			 });
			 $("#dingrole").html(html);
			 form.render('select');
		}
	});
	  
  var id = ${param.approval_id};
  //执行一个 table 实例
  table.render({
    elem: '#test'
    //,height: 332
    ,url: '../Approval/selectCopyPerson.action?id='+id+'&company_id='+company_id //数据接口
    ,page: false //开启分页
    ,id:'tab'
    ,cols: [[ //表头
      {field: 'id', title: 'ID', sort: true, fixed: 'left'}
      ,{field: 'copy_name', title: '抄送人名称'}
      ,{fixed: 'right',  title: '操作', align:'center', toolbar: '#barDemo'} 
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
      layer.confirm('确认删除', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
        var id = data.id;
        var approval_id = ${param.approval_id};
        $.ajax({
        	url : "../Approval/deleteCopyPerson.action",
        	type : "post",
        	data : {"id" : id},
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
    
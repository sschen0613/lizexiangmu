<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 角色管理   -->
<!-- <link rel="stylesheet" href="../css/search_revise.css"> -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="../css/form_top_revise.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>  
<form class="layui-form form-top" style="margin-top:10px;">
	<div class="layui-form-item">
	<div class="layui-inline searchintop_inline">
	    <label class="layui-form-label label-revise searchintop_label_revise">职位名称 :</label>
	    <div class="layui-input-inline">
	      <input name="position_Name" lay-verify="" autocomplete="" placeholder="请输入职位名称" class="layui-input input-revise searchintop_input_revise">
	    </div>
	  </div>
	  <div class="layui-inline ">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm button-revise searchintop_button_revise">
              	检索
            </button>
      </div> 
	</div>
</form>  
<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="yesDetail">已拥有菜单</a>
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="noDetail">未拥有菜单</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add">添加</button>
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
//监听搜索提交按钮
  form.on('submit(search)', function(data){
	  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value}
	  
		//重载表格
      	table.reload("tab" ,{
			where : {"position_Name" :data2.position_Name},
      	});
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
  

//重新渲染   针对select下拉列表不显示的情况
  form.render('select');
  
  //监听Tab切换
  element.on('tab(demo)', function(data){
    layer.msg('切换了：'+ this.innerHTML);
    console.log(data);
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    //,height: 332
    ,url: '../Position/seletePosition.action' //数据接口
    ,page: true //开启分页
    ,toolbar:'#toolbarDemo'
    ,id:'tab'
    ,cols: [[ //表头
      {field: 'position_id', title: 'ID', width:80, sort: true}
      ,{field: 'position_name', title: '角色', width:300}
      ,{fixed: 'right',title:'操作', width: 400, align:'center', toolbar: '#barDemo'}    
      ]]
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    var tr = obj.tr; //获得当前行 tr 的DOM对象
   
    if(layEvent === 'yesDetail'){
	    layer.open({
	    	type: 2,
	    	title :'已拥有菜单',
	    	shade: 0.8,
	    	shadeClose:true,
	        maxmin: true,
			offset: '100',
	        closeBtn: 1,
	    	area: ['800px', '80%'],
	    	content: '../PowerMenu/yesMenuAdminList.action?position_Id='+data.position_id, 
	        end: function () {
	        	table.reload("tab" ,{
	        	});
	          }
	    });
    } else if(layEvent === 'noDetail'){
	    layer.open({
	    	type: 2,
	    	title :'未拥有菜单',
	    	shade: 0.8,
	    	shadeClose:true,
	        maxmin: true,
			offset: '100',
	        closeBtn: 1,
	    	area: ['800px', '80%'],
	    	content: '../PowerMenu/noMenuAdminList.action?position_Id='+data.position_id, 
	        end: function () {
	        	table.reload("tab" ,{
	        	});
	          }
	    });
    } else if(layEvent === 'del'){
      layer.confirm('确认删除',{offset: '100'}, function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
        var id = data.position_id;
        
        $.ajax({
        	url : "../Position/deletePosition2.action",
        	type : "post",
        	data : {"id" : id},
        	dataType : "JSON",
        	success : function (result){
        		layer.msg(result.msg);
        	}
        	
        });

        
      });
    } else if(layEvent === 'edit'){
	    layer.open({
	    	type: 2,
	    	title :'修改职位信息',
	    	shade: 0.8,
	    	shadeClose:true,
	        maxmin: true,
			offset: '100',
	        closeBtn: 1,
	    	area: ['800px', '80%'],
	    	content: '../Position/updatePositionList.action?position_Id='+data.position_id+'&position_name='+data.position_name
	    			+'&position_power='+data.position_power+'&position_details='+data.position_details+'&position_storage='+data.position_storage, 
	        end: function () {
	        	table.reload("tab" ,{
	        	});
	          }
	    });
    }
  });
  
  //头工具栏事件
  table.on('toolbar(demo)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'add':
    	  layer.open({
  	    	type: 2,
  	    	title :'添加新职位',
  	    	shade: 0.8,
  	    	shadeClose:true,
  	        maxmin: true,
			  offset: '100',
  	        closeBtn: 1,
  	    	area: ['800px', '80%'],
  	    	content: '../Position/addPositionList.action"',
  	        end: function () {
  	        	
  	        	table.reload("tab" ,{
  	        	});
  	          },
  	      });
      break;
    };
  });

});

</script>
    
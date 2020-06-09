<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>  
<!-- 角色管理 已拥有菜单  -->
<link rel="stylesheet" href="../css/search_revise.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/search_revise.css">  
<form class="layui-form">
	<div class="layui-form-item" style="padding-top:10px;">
		  <div class="layui-inline searchintop_inline">
		    <label class="layui-form-label searchintop_label_revise">菜单名</label>
		    <div class="layui-input-inline">
		      <input name="menu_Name" lay-verify="" autocomplete="" class="layui-input searchintop_input_revise">
		    </div>
		  </div>
		  <div class="layui-inline ">
	            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm searchintop_button_revise">
	              	检索
	            </button>
	      </div> 
		</div>
</form>  
<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="del">移除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add">批量移除</button>
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
	  var data2 = data.field; //当前容器的全部表单字段，名值对形式：{name: value}
	  var position_id = ${param.position_Id};
		//重载表格
      	table.reload("tab" ,{
      		where : {"menu_Name" :data2.menu_Name, "menu_Priority": position_id},
      	});
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
  
  var position_id = ${param.position_Id};
  console.log(position_id);
  //执行一个 table 实例
  table.render({
    elem: '#test'
    //,height: 332
    ,url: '../PowerMenu/selectYesMenu.action?menu_Priority='+position_id //数据接口
    ,toolbar:'#toolbarDemo'
    ,id:'tab'
    ,cols: [[ //表头
    	{type: 'checkbox', fixed: 'left'}
      ,{field: 'administrate_id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'menu_name', title: '菜单名称', width:160}
      ,{fixed: 'right',minWidth: 250, width:250, align:'center', toolbar: '#barDemo'}    
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
      //layer.confirm('确认删除', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        //layer.close(index);
        //向服务端发送删除指令
        var id = data.administrate_id;
        $.ajax({
        	url : "../PowerMenuallot/deleteMenuallot.action",
        	type : "post",
        	data : {"id" : id},
        	dataType : "JSON",
        	success : function (result){
        		layer.msg(result.msg);
        	}
        	
        });


      //});
    } else if(layEvent === 'edit'){

    }
  });
  
  //头工具栏事件
  table.on('toolbar(demo)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'add':
          var data = checkStatus.data;
          //layer.alert(JSON.stringify(data.stid));
          
          var administrate_ids = new Array();
          
      	$.each(data, function(index, item){
      		administrate_ids.push(item.administrate_id);
      	});
               $.ajax({
              	url : "../ProwMenuallot/deleteMenuallots.action",
              	type : "post",
              	data : {"ids" : administrate_ids},
              	traditional : true,
              	dataType : "JSON",
              	success : function (result){
              		layer.msg(result.msg);
              	}
              	
              }); 
         	table.reload("tab" ,{
         	});
      break;
    };
  });

});

</script>
    
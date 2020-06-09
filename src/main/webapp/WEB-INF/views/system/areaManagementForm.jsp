<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>  
<!-- 区域管理 拥有菜单  -->
<link rel="stylesheet" href="../css/search_revise.css"> 
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<link rel="stylesheet" href="css/search_revise.css">  
<form class="layui-form">
	<div class="layui-form-item" style="padding-top:10px;">
		  <div class="layui-inline searchintop_inline">
		    <label class="layui-form-label searchintop_label_revise">区域名</label>
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
  <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
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
	  var stid = ${param.stid};
//监听搜索提交按钮
  form.on('submit(search)', function(data){
	  console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
	  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
	  var data2 = data.field; //当前容器的全部表单字段，名值对形式：{name: value}
		//重载表格
      	table.reload("tab" ,{
      		where : {"stid" :data2.stid},
      	});
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    //,height: 332
    ,url: '../System/getAlready.action' //数据接口
    ,toolbar:'#toolbarDemo'
    ,id:'tab'
    ,where:{'staff_id':stid}
    ,cols: [[ //表头
    	{type: 'checkbox', fixed: 'left'}
      ,{field: 'cDCCode', title: '区域编码', width:80, sort: true, fixed: 'left'}
      ,{field: 'cDCName', title: '区域名称', width:160}
      ,{fixed: 'right',minWidth: 250, width:250, align:'center', toolbar: '#barDemo'}    
      ]]
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    var tr = obj.tr; //获得当前行 tr 的DOM对象
    console.log(data);
    if(layEvent === 'detail'){
      layer.msg('查看操作');
    } else if(layEvent === 'del'){
        obj.del(); //删除对应行（tr）的DOM结构
        //向服务端发送删除指令
        var id = data.id;
        console.log(id);
        $.ajax({
        	url : "../System/daleteArea.action",
        	type : "post",
        	data : {'id':id},
        	dataType : "JSON",
        	success : function (result){
        		if(result > 0){
        			layer.msg("成功!");
        		}else{
        			layer.msg("失败!");
        		}
        		
        	}
        	
        });

        
    } else if(layEvent === 'edit'){
	    
    }
  });

});

</script>
    
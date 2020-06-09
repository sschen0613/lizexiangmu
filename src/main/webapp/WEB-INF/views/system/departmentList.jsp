<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 部门管理     -->
<!-- <link rel="stylesheet" href="../css/search_revise.css">   -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="../css/form_top_revise.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script> 
<form class="layui-form form-top" style="margin-top:10px;">
	<div class="layui-form-item">
	<div class="layui-inline searchintop_inline">
	    <label class="layui-form-label label-revise searchintop_label_revise">部门名称 :</label>
	    <div class="layui-input-inline">
	      <input name="department_Name" lay-verify="" autocomplete="" placeholder="请输入部门名称" class="layui-input input-revise searchintop_input_revise">
	    </div>
	  </div>
	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">所属公司 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="company" name="company_Id" lay-filter="company" lay-search class="select-revise searchintop_select_revise">
		      <option value="">请选择公司</option>
		  </select>
		</div>
	  </div>
	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">所属部门 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="department" name="superior_Id" lay-verify="department" lay-search class="select-revise searchintop_select_revise">
		      <option value="">请选择部门</option>
		  </select>
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
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container" id="Temp">
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add" id="add">添加部门</button>
	<button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="tongbu" id="tongbu">同步钉钉部门</button>	
  </div>
</script>

<script type="text/javascript">
var html = '<input type="file" class="inp_file layui-btn layui-btn-xs">';

$("#Temp").append(html);

layui.use(['laydate', 'upload', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  ,layer = layui.layer //弹层
	  ,upload = layui.upload//上传
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
			where : {
				"department_Name" :data2.department_Name,"company_Id" :data2.company_Id
				,"superior_Id" :data2.superior_Id
			},
      	});
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
  
  //获取所有公司信息详情
  $.ajax({
  	url : "../Company/getCompany.action",
  	type : "post",
  	dataType : "JSON",
  	success : function (res){
		 var html ="<option value=''>请选择公司</option>";
		 $.each(res.data, function(index, item){
			html += "<option value='"+item.company_id+"'>"+item.company_name+"</option>";
				
		 });
		 $("#company").html(html);
		 form.render('select');
  	}
  });
  //查询所有部门
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
  
  form.on('select(company)', function(data){
	  	var cid = data.value;
	  		//选择了"请选择公司"查询出所有部门
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
    ,url: '../Department/getDepartment.action' //数据接口
    ,page: true //开启分页
    ,toolbar:'#toolbarDemo'
    ,id:'tab'
    ,cols: [[ //表头
      {field: 'did', title: 'ID', width:80, sort: true}
      ,{field: 'dname', title: '部门', width:120}
      ,{field: 'department_name', title: '上级部门', width: 160, templet:'<div>{{ AS(d.department_name)}}</div>'}
      ,{field: 'company_name', title: '所属公司', width:100} 
      ,{fixed: 'right', title:'操作', width: 165, align:'center', toolbar: '#barDemo'}    
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
        var id = data.did;
        
        $.ajax({
        	url : "../Department/updateDelete.action",
        	type : "post",
        	data : {"department_id" : id},
        	dataType : "JSON",
        	success : function (result){
        		layer.msg(result.msg);
	        	table.reload("tab" ,{
	        	});
        	}
        	
        });

        
      });
    } else if(layEvent === 'edit'){
	    layer.open({
	    	type: 2,
	    	title :'修改部门信息',
	    	shade: 0.8,
	    	shadeClose:true,
	        maxmin: true,
	        closeBtn: 1,
	    	area: ['800px', '80%'],
	    	content: '../system/reviseDepartment.action?dpaid='+data.did+'&dname='+data.dname+'&dingdpid='+data.dingdpid+'&cid='+data.cid, 
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
  	    	title :'添加部门',
  	    	shade: 0.8,
  	    	shadeClose:true,
  	        maxmin: true,
  	        closeBtn: 1,
  	    	area: ['800px', '80%'],
  	    	content: '../system/addDepartmentList.action',
  	        end: function () {
  	        	
  	        	table.reload("tab" ,{
  	        	});
  	          },
  	      });
      break;
      case 'tongbu':
    	  layer.load();
    	  //同步钉钉部门
          $.ajax({
          	url : "../Department/updateDingDepartment.action",
          	type : "post",
          	dataType : "JSON",
          	success : function (result){
          		layer.closeAll('loading');
          		layer.msg(result.msg);
  	        	table.reload("tab" ,{
  	        	});
          	}
          	
          });
    };
  });

//指定允许上传的文件类型
upload.render({
  elem: '#test3'
  ,url: '../Department/uploadExcel.action'
  ,accept: 'file' //普通文件
  ,done: function(res){
    console.log(res)
    layer.msg(res.msg);
    
	table.reload("tab" ,{
	});
  }
});

});

function AS(dpmname) {
	var departmentname = '无';
	if (dpmname != undefined){
		return dpmname;
	}else{
		
		return departmentname;
	}
}
</script>
    
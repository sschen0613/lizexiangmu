<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 角色管理 添加 弹出框 -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise position_form_revise">
		  <div class="layui-form-item">
		    <label class="layui-form-label">职位名称：</label>
		    <div class="layui-input-block">
		      <input placeholder="请输入职位名称" type="text" name="position_Name"  autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">查看职员权限：</label>
		    <div class="layui-input-block">
		      <select id="position_details" name="position_details">
		      		<option value="1">查看所有员工</option>
		      		<option value="4">查看所属公司员工</option>
		      		<option value="2">查看所属部门员工</option>
		      		<option value="3">无权查看</option>
		      </select>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">办公设施管理权限：</label>
		    <div class="layui-input-block">
		      <select id="position_power" name="position_power">
		      		<option value="1">管理所有办公设施</option>
		      		<option value="2">管理当前公司办公设施</option>
		      		<option value="3">无权管理(默认)</option>
		      </select>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">仓库管理权限：</label>
		    <div class="layui-input-block">
		      <select id="position_storage" name="position_storage">
		      		<option value="1">查看所有基础信息</option>
		      		<option value="2">查看当前公司基础信息</option>
		      		<option value="3">无权管理(默认)</option>
		      </select>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="submission" type="submit">提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>   
    </form> 

<script type="text/javascript">
layui.use(['laydate', 'layedit','laypage', 'layer', 'table', 'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  ,layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,element = layui.element //元素操作
	  ,form = layui.form
	  ,layedit = layui.layedit;
		form.on('submit(submission)', function(data){
			console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
				,position_Name = data2.position_Name
				,position_details = data2.position_details
				,position_storage = data2.position_storage
				,position_power = data2.position_power;
		 	$.ajax({
		 		url : "../Position/addPosition.action"
		 		,type : "post"
		 		,data : {"position_Name" :position_Name, "position_Power":position_power, "position_details":position_details, "position_storage":position_storage}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				layer.msg(result.msg);
		 		}
		 });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
	
});
</script>
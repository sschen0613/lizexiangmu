<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 部门管理 编辑 弹出框 -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise">
		  <div class="layui-form-item">
		    <label class="layui-form-label">名称</label>
		    <div class="layui-input-block">
				<input type="hidden" id="id" name="id" value="${param.id}">
		      <input placeholder="请输入名称" type="text" value="${param.name}" name="name"  autocomplete="off" class="layui-input">
		    </div>
		  </div>
		<div class="layui-form-item">
			<label class="layui-form-label">单位</label>
			<div class="layui-input-block">
				<input placeholder="请输入单位" type="text" value="${param.unit}" name="unit"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-block">
				<input placeholder="请输入价格" type="text" value="${param.price}" name="price"  autocomplete="off" class="layui-input">
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
				,id = data2.id
				,name = data2.name
				,unit = data2.unit
				,price = data2.price;
		 	$.ajax({
		 		url : "../office/addOfficeSupplies.action"
		 		,type : "post"
		 		,data : {"id" :id, "name" :name, "unit" :unit, "price" :price}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				parent.layer.close(parent.layer.getFrameIndex(window.name));
		 		}
		 });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
});
</script>
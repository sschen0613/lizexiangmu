<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!--  集团管理 编辑 弹出框  -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise">
		  <div class="layui-form-item">
		    <label class="layui-form-label">公司名称</label>
		    <div class="layui-input-block">
		      <input type="text" name="company_Name" value="${param.company_name }" autocomplete="off" class="layui-input">
		    </div>
		  </div> 
		  <div class="layui-form-item">
		    <label class="layui-form-label">公司编码</label>
		    <div class="layui-input-block"> 
		      <input type="text" name="company_Code" value="${param.company_code }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">公司状况</label>
		    <div class="layui-input-block"> 
		      <input type="text" name="company_Situation" value="${param.company_Situation }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">公司负责人</label>
		    <div class="layui-input-block">
		      <input type="text" name="company_Manager" value="${param.company_manager }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">联系电话</label>
		    <div class="layui-input-block">
		      <input type="text" name="company_Phone" value="${param.company_phone }" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">公司地址</label>
		    <div class="layui-input-block">
		      <input type="text" name="company_Address" value="${param.company_address }" autocomplete="off" class="layui-input">
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
				,company_Name = data2.company_Name
				,company_Situation = data2.company_Situation
				,company_Manager = data2.company_Manager
				,company_Phone = data2.company_Phone
				,company_Code = data2.company_Code
				,company_Address = data2.company_Address
				,company_Id = ${param.company_id};
		 	$.ajax({
		 		url : "../Company/updateCompany.action"
		 		,type : "post"
		 		,data : {"company_Name" :company_Name, "company_Situation" :company_Situation,"company_Phone" :company_Phone
		 				,"company_Manager" :company_Manager, "company_Address" :company_Address, "company_Id": company_Id,"company_Code":company_Code}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				layer.msg(result.msg);
		 		}
		 });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
});
</script>
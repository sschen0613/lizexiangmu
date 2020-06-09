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
		    <label class="layui-form-label">部门名称</label>
		    <div class="layui-input-block">
		      <input placeholder="请输入部门名称" type="text" value="${param.dname }" name="department_Name"  autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属公司</label>
		    <div class="layui-input-block">
		      <select id="company" lay-filter="company" name="company_Id">
		      </select>
		    </div>
  		  </div>
  		  <div class="layui-form-item">
		    <label class="layui-form-label">上级部门</label>
		    <div class="layui-input-block">
		      <select id="department" name="superior_Id" lay-filter="">
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
	  console.log("日志信息");
	  var cid = ${param.cid };
	  var dingdpid = ${param.dingdpid };
		form.on('submit(submission)', function(data){
			console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
				,superior_Id = data2.superior_Id
				,department_Name = data2.department_Name
				,company_Id = data2.company_Id
				,department_Id = ${param.dpaid };
		 	$.ajax({
		 		url : "../Department/updateDepartment.action"
		 		,type : "post"
		 		,data : {"department_Name" :department_Name, "superior_Id" :superior_Id, "department_Id" :department_Id, "company_Id" :company_Id}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				layer.msg(result.msg);
		 		}
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
				if(cid == item.company_id){
					html += "<option value='"+item.company_id+" 'selected = 'selected'>"+item.company_name+"</option>";
				}else{
					html += "<option value='"+item.company_id+"'>"+item.company_name+"</option>";
				}	
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
					if(dingdpid == item.dingdepmid){
						html += "<option value='"+item.dingdepmid+"'selected = 'selected'>"+item.dname+"</option>";
					}else{
						html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
					}
				});
				$("#department").html(html);
				form.render('select');
			}
		}); 
	  
	  form.on('select(company)', function(data){
		  		//选择了"请选择公司"查询出所有部门
				 $.ajax({
						url : "../Department/getDepartment.action",
						type : "post",
						data : {"company_Id": data.value},
						dataType : "JSON",
						success : function(res){
							var html ="<option value=''>请选择部门</option>";
							$.each(res.data, function(index, item){
								html += "<option value='"+item.did+"'>"+item.dname+"</option>";
								
							});
							$("#department").html(html);
							form.render('select');
						}
					}); 
		  	
		});
	  
	
});
</script>
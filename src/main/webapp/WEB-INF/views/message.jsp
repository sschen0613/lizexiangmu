<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!--  -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<form class="layui-form form_revise">
	<div class="layui-form-item">
	    <label class="layui-form-label">密码 :</label>
	    <div class="layui-input-block">
	      <input type="password" id="pass" name="password" requiredplaceholder="请输入密码" autocomplete="off" class="layui-input">
	    </div>
	</div>
	<div class="layui-form-item">
		<label for="L_pass" class="layui-form-label">确认密码 :</label>
		<div class="layui-input-block">
			<input type="password" id="repass" name="password2" required autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="updatePassw" type="submit">提交</button>
	      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    </div>
	 </div>  
</form>
<script>
	
</script>
<script type="text/javascript">
	layui.use([ 'form', 'laydate', 'element', 'layer'],function() {
		var form = layui.form,
		laydate = layui.laydate, 
		element = layui.element, 
		layer = layui.layer;
		
		//自定义验证规则
		form.verify({ 
			pass:[
			    /^[\S]{6,12}$/
			    ,'密码必须6到12位，且不能出现空格'
			]
			
		});
		
		form.on('submit(updatePassw)', function(data){
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
			,password = data2.password
			,password2 = data2.password2
			,staff_Id = ${sessionScope.systemStaff.staff_Id };
				if(password == password2){
				 	$.ajax({
				 		url : "../system/updatePassword.action"
				 		,type : "post"
				 		,data : {"staff_Password" :password,"staff_Id": staff_Id}
				 		,dataType : "JSON"
				 		,success : function(result){
				 				layer.msg(result.msg);
								parent.location.href = "/Staff/logout.action";
				 		}
				  });
				}else {
					layer.msg("两次输入的密码不相同")
				}
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
		
	});
</script>
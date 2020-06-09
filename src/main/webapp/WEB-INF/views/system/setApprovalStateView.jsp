<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 部门管理 添加 弹出框 -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise">
		  <div class="layui-form-item">
		    <label class="layui-form-label"></label>
		    <label class="layui-form-item">设置审批方式</label>
		    <div class="layui-input-block">
			    <div class="layui-form-item">
				      <input lay-verify="required"  type="radio" name="role_state" value="1" title="(默认)或签*多人多角色审批其中一人审批通过或拒绝,审批流程结束">
			    </div>
			    <div class="layui-form-item">
				      <input lay-verify="required"  type="radio" name="role_state" value="2" 
				      title="会签*多人多角色审批所有审批人都通过,审批流程结束,有一人拒绝审批流程结束">
			    </div>
			    <div class="layui-form-item">
			    </div>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="submission" type="submit">提交</button>
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
				,role_state = data2.role_state
				,approver_role_id = ${param.approver_role_id};
		 	$.ajax({
		 		url : "../Approval/updateApprovalStaff.action"
		 		,type : "post"
		 		,data : {"role_state" :role_state, "approver_role_id":approver_role_id}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				layer.msg(result.msg);
		 		}
		 });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
	
});
</script>
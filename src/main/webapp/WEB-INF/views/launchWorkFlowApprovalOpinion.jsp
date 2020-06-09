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
	    <div class="layui-input-block">
	      <textarea name="approvalOpinion" placeholder="请填写审批意见" class="layui-textarea"></textarea>
	    </div>
	</div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="agree" type="submit">同意</button>
	      <button class="layui-btn layui-btn-primary" id="myForm" lay-submit="" lay-filter="refuse" type="submit">拒绝</button>
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
		
		var approval_id = '${param.approval_id}';
		
		var currency_id = ${param.currency_id};
		
		 var staffid ="${sessionScope.systemStaff.dingding_staffid }";
		
		//查询审批管理信息
		 $.ajax({
				url : "../Approval/selectManage.action",
				type : "post",
				data : {"approval_id":approval_id},
				dataType : "JSON",
				success : function(res){
					data2 = res.data;
				}
			}); 
		
		form.on('submit(agree)', function(data){//通过
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
			 
			$.ajax({
			 		url : "../Currency/conditionsApprovalAll.action"
			 		,type : "post"
			 		,data : {"approvalOpinion":data2.approvalOpinion,"currency_string":staffid,"currency_type":approval_id,"approver_state":1,"currency_id":currency_id}
			 		,dataType : "JSON"
			 		,success : function(result){
			 				layer.msg(result.msg);
			 		}
			  });
			
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		}); 
		
		form.on('submit(refuse)', function(data){//拒绝
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
			
			 	
			$.ajax({
			 		url : "../Currency/approvalCurrencyApply.action"
			 		,type : "post"
			 		,data : {"approvalOpinion":data2.approvalOpinion,"currency_string":staffid,"currency_type":approval_id,"approver_state":-300,"currency_id":currency_id}
			 		,dataType : "JSON"
			 		,success : function(result){
			 				layer.msg(result.msg);
			 		}
			  });
			
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
</script>
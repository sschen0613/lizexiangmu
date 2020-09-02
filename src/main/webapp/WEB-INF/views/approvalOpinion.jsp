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
			<select  id='ifAgree' name="ifAgree" lay-verify="required">
				<option value="">请选择</option>
				<option value="同意">同意</option>
				<option value="拒绝">拒绝</option>
			</select>
	    </div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<textarea name="approvalOpinion" placeholder="备注" class="layui-textarea"></textarea>
		</div>
	</div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="agree" type="submit">审批</button>
	      <%--<button class="layui-btn layui-btn-primary" id="myForm1" lay-submit="" lay-filter="refuse" type="submit">拒绝</button>--%>
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

		 //获取职位
		var position = "${sessionScope.systemStaff.position_Id}";
		 //判断是否是销售请购并且是不是采购主管审批
		 if (approval_id == 9 && position == 62){
			var html = '<div class="layui-form-item">'
					 +		'<div class="layui-input-block">'
                 	 +			'<input type="radio" name="delivery_type" value="直发企业" title="直发企业" checked>'
             		 +			'<input type="radio" name="delivery_type" value="单位入库" title="单位入库">'
                 	 +		'</div>'
                 	 +	'</div>';
			$('.layui-textarea').parent().parent().after(html);
			form.render();
		 }
		
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
			var data2 = data.field ;//当前容器的全部表单字段，名值对形式：{name: value

            $('#myForm').addClass('layui-btn-disabled');
            $('#myForm').attr("disabled",'disabled');
            $('#myForm1').addClass('layui-btn-disabled');
            $('#myForm1').attr("disabled",'disabled');

            var ifAgree = data2.ifAgree;
            var approver_state = 1;
            if (ifAgree == "拒绝"){
				approver_state = -300;
			}
            var approvalOpinion = ifAgree+"。"+data2.approvalOpinion;

			$.ajax({
			 		url : "../Currency/approvalCurrencyApply.action"
			 		,type : "post"
			 		,data : {"approvalOpinion":approvalOpinion,"currency_string":staffid,"currency_type":approval_id,"approver_state":approver_state,"currency_id":currency_id}
			 		,dataType : "JSON"
			 		,success : function(result){
						layer.msg(result.msg);

						if (ifAgree == "同意"){
							if (result.msg == '操作成功' && approval_id == 9 && position == 62){
								var delivery_type = data.field.delivery_type;
								$.ajax({
									url : "../Currency/launchWork.action"
									,type : "post"
									,data : {"currency_id":currency_id,"currency_string":delivery_type}
									,dataType : "JSON"
									,success:function (result) {
										layer.msg(result.msg);
									}
								});
							}
						}
			 		}
			  });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		}); 

	});
</script>
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
	      <textarea name="approvalOpinion" placeholder="请填写审批意见" class="layui-textarea" lay-verify="required"></textarea>
	    </div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<select id="messageMan" name="messageMan" lay-verify="" lay-search class="select-revise">
			</select>
		</div>
	</div>
	<div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="agree" type="submit">同意</button>
	      <button class="layui-btn layui-btn-primary" id="myForm1" lay-submit="" lay-filter="refuse" type="submit">拒绝</button>
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

        //检索栏数据初始化
        //查询所有部门
        $.ajax({
            url : "../Staff/selectStaffTr.action",
            type : "post",
            data : {},
            dataType : "JSON",
            success : function(res){
                var html = '<option value="">请选择通知人</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.dingding_staffid+'">'+item.stname+'</option>';
                    //html += '<option value="203719292837623745">陈书生</option>';
                });
                $('#messageMan').html(html);
                form.render('select');
            }
        });

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

			var messageMan = $('#messageMan').find('option:selected').val();//被通知人钉钉id
            var messageManName = $('#messageMan').find('option:selected').text();//被通知人名称
			if (messageMan == "" || messageMan == null){
			    layer.msg("请选择通知人");
			    return false;
			}else {
                //更新通知人，并发送钉钉消息
                $.ajax({
                    url : "../Currency/sendMessage69.action",
                    type : "post",
                    data : {"currency_type":approval_id,"currency_id":currency_id,"currency_string17":messageMan,"currency_string18":messageManName},
                    dataType : "JSON",
                    success : function(res){

                    }
                });
            }

            $('#myForm').addClass('layui-btn-disabled');
            $('#myForm').attr("disabled",'disabled');
            $('#myForm1').addClass('layui-btn-disabled');
            $('#myForm1').attr("disabled",'disabled');

			$.ajax({
			 		url : "../Currency/approvalCurrencyApply.action"
			 		,type : "post"
			 		,data : {"approvalOpinion":data2.approvalOpinion,"currency_string":staffid,"currency_type":approval_id,"approver_state":1,"currency_id":currency_id}
			 		,dataType : "JSON"
			 		,success : function(result){
						layer.msg(result.msg);

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
			  });

			
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		}); 
		
		form.on('submit(refuse)', function(data){//拒绝
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
            $('#myForm').addClass('layui-btn-disabled');
            $('#myForm').attr("disabled",'disabled');
            $('#myForm1').addClass('layui-btn-disabled');
            $('#myForm1').attr("disabled",'disabled');
			 	
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
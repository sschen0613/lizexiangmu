//手机端审批详情页
//审批按钮绑定点击事件		data:{ 审批状态(approver_state) + 填写的审批意见  +  需要传送的通用的页面加载时获取的数据( data) }
function buttonClick(action1,action2,data){
//	console.log(data);
	//同意
	$('#agree').click(function(e){
		var approvalOpinion = $('.approval-opinion>textarea').val();	//审批意见
		if(approvalOpinion == '') {layer.msg('审批意见不能为空');return;}
		layer.confirm('确认通过审批？',function(index){
			$.ajax({
				url:action1,
				type:'post',
				data:{"approver_state":1,'approvalOpinion':approvalOpinion,"currency_string":data.currency_string
					,"currency_type":data.currency_type,"currency_id":data.currency_id},
				dataType:'JSON',
				beforeSend: function(){
		 			layer.msg('正在提交审批', {
		 				icon: 16
		 				,shade: 0.01
		 			});
		 		},
				success:function(result){
					layer.msg(result.msg);
					$(e.target).closest('.content-list').addClass('style1');
					$(e.target).parent().find('button').addClass('layui-btn-disabled').attr('disabled',true);
					parent.$('.iframe-return-type').val('1');//给父页面传值,表示已进行审批且同意
				}
			});
            if (data.currency_type == 9 && data.position == 62){
                var delivery_type = $("input[name='delivery_type']:checked").val();
                $.ajax({
                    url : "Currency/launchWork.action"
                    ,type : "post"
                    ,data : {"currency_id":data.currency_id,"currency_string":delivery_type}
                    ,dataType : "JSON"
                    ,success:function (result) {
                        layer.msg(result.msg);
                    }
                });
            }
			layer.close(index);
		});
		return false;
	});
	//拒绝
	$('#disagree').click(function(e){
		var approvalOpinion = $('.approval-opinion>textarea').val();	//审批意见
		if(approvalOpinion == '') {layer.msg('审批意见不能为空');return;}
		layer.confirm('确认拒绝审批？',function(index){
			$.ajax({
				url:action2,
				type:'post',
				data:{"approver_state":-300,'approvalOpinion':approvalOpinion,"currency_string":data.currency_string
					,"currency_type":data.currency_type,"currency_id":data.currency_id},
				dataType:'JSON',
				beforeSend: function(){
		 			layer.msg('正在提交审批', {
		 				icon: 16
		 				,shade: 0.01
		 			});
		 		},
				success:function(result){
					layer.msg(result.msg);
					$(e.target).closest('.content-list').addClass('style2');
					$(e.target).parent().find('button').addClass('layui-btn-disabled').attr('disabled',true);
					parent.$('.iframe-return-type').val('-1');//给父页面传值,表示已进行审批且拒绝
				}
			});
			layer.close(index);
		});
		return false;
	});
}
//手机端审批详情页
//审批按钮绑定点击事件		data:{ 审批状态(approver_state) + 填写的审批意见  +  需要传送的通用的页面加载时获取的数据( data) }
function buttonClick(action1,action2,data){
//	console.log(data);
	//同意
	$('#agree').click(function(e){
		var ifAgree = $('.approval-opinion>select').val();	//审批意见
		var approvalOpinion = ifAgree+"。"+$('.approval-opinion>textarea').val();	//备注
		if(ifAgree == '') {layer.msg('请选择审批意见');return;}
		var approver_state = 1;
		if (ifAgree == "拒绝"){
			approver_state = -300;
		}
		layer.confirm('确认审批？',function(index){
			$.ajax({
				url:action1,
				type:'post',
				data:{"approver_state":approver_state,'approvalOpinion':approvalOpinion,"currency_string":data.currency_string
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
            if (ifAgree == "同意" && data.currency_type == 9 && data.position == 62){
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

			if (ifAgree == "同意" && data.currency_type == 43){
				var messageMan = $('#messageMan').find('option:selected').val();//被通知人钉钉id
				$.ajax({
					url : "Currency/sendMessage43.action",
					type : "post",
					data : {"currency_id":data.currency_id,"currency_string17":messageMan},
					dataType : "JSON",
					success : function(res){
					}
				});
			}
			layer.close(index);
		});
		return false;
	});
}
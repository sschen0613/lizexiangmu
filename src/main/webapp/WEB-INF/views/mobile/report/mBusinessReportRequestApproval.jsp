<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人报备审批明细-手机端 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/mobile.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/iconfont.js"></script>
    <script src="js/approval_button.js?v="+Math.random()></script>
    <script src="js/function_tool.js"></script>
</head>
<body>
<div class="container-approval">
    <h2 class="title-page">
        <svg class="alSvgIcon" aria-hidden="true">
            <use xlink:href="#icon-office"></use>
        </svg>
        天人报备添加合同信息
    </h2>
    <div class="content">

    </div>
</div>

<script>
</script>
<script type="text/javascript">
    layui.use(['form','element','layer','laydate', 'table' ],function(){
        var form = layui.form
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
            ,table = layui.table;

        //获取传递过来的值
        var approverState; //审批状态

        var currency_id = '${param.currency_id}';
        var approvalOpinion_type = 69;
        var approval_id = 69;
        var staffid = '${sessionScope.systemStaff.dingding_staffid }';
        var dingStaffid = '${param.dingStaffid}';
        var current_approvalCount;
        var approver_count;
        var rate;

        //页面内容初始化
        $.ajax({
            url:'Currency/selectCurrencyApprover.action',
            type:'post',
            data:{
                'currency_id':currency_id,
                "currency_string":dingStaffid,
                "currency_type":69
            },
            dataType:'JSON',
            beforeSend: function(){
                layer.load(1);
            },
            success:function(res){
                var item = res.data[0];
                layer.closeAll('loading');
                var html = '';
                html += '<div class="content-list style">'
                    +		'<form>'
                    +			'<div>'
                    +				'<label class="">流水号 :</label>'
                    +				'<input type="text" id="buy_number" name="buy_number" value="'+item.currency_number+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请人 :</label>'
                    +				'<input type="text" name="currency_applicant" id="staffName" value="'+item.staff_name+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请部门 :</label>'
                    +				'<input type="text" name="department_Id" id="department" value="'+item.department_name+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请日期 :</label>'
                    +				'<input type="text" name="currency_date" id="date" value="'+Format(item.currency_date,"yyyy-MM-dd")+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务类型 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string2+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">单位名称 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string3+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">项目（产品）名称 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string4+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务（产品）规模 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string5+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务需求时间 :</label>'
                    +				'<input type="text" name="workovertime_start" value="'+Format(item.currency_date2,"yyyy-MM-dd")+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务所在区域 :</label>'
                    +				'<input type="text" name="workovertime_date" value="'+item.currency_string7+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">联系人 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string8+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">联系电话 :</label>'
                    +				'<input type="text" name="leave_type" value="'+item.currency_string9+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div class="approval-detail-container">'
                    //明细信息
                    +			'</div>'
                    +			'<div class="approval-opinion">'
                    +				'<label class="">审批意见 :</label>'
                    +				'<textarea id="approval_opinion" class="layui-textarea" placeholder="请填写审批意见"></textarea>'
                    +			'</div>'
                    +			'<div class="">'
                    +				'<label class="">通知责任人 :</label>'
                    +				'<select id="messageMan" name="messageMan" lay-verify="" lay-search class="layui-select"></select>'
                    +				'<label class="" style="padding-right: 30%">&nbsp;</label>'
                    +			'</div>'
                    + 			'<div class="approval-progress">'
                    +				'<label class="">审批进度 :</label>'
                    +				'<div class="layui-progress layui-progress-big" lay-filter="progress_bar" lay-showPercent="true">'
                    +					'<div class="layui-progress-bar layui-bg-blue" lay-percent="0%"></div>'
                    +				'</div>'
                    +			'</div>'
                    +			'<div><label class="label-title">进度详情 :</label></div>'
                    +			'<div class="approval-progress_details">';
                html +=				'<table id="details" lay-filter="details"></table>';
                html +=			'</div>'
                    +			'<div class="button">'
                    +				'<button type="button" class="layui-btn layui-btn-sm" id="agree">同意</button>'
                    +				'<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="disagree">拒绝</button>'
                    +			'</div>'
                    +		'</form>'
                    +	'</div>';
                $('.content').append(html);

                $.ajax({
                    url : "Staff/selectStaffTr.action",
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

                //判断审批状态
                var state;
                //审批撤回
                if(item.approver_state == -100){state = 'revoke';}
                //未通过
                else if(item.approver_state == -300){state = 'reject';}
                //审批通过
                else if(item.approver_count == item.current_approvalCount && item.approver_state == 0){state = 'adopt';}
                //审批未处理
                else{state = 'waitting';}
                approverState = state;
                current_approvalCount = item.current_approvalCount;
                approver_count = item.approver_count;
                //获取进度条百分比
                var number = Number(current_approvalCount)/Number(approver_count);
                rate = Math.floor(number*100)+'%';
                //渲染进度条
                element.render('progress');
                //更新进度条
                updateProgress();
                //执行一个table实例
                table.render({
                    elem: '#details'
                    ,url: 'Currency/selectApprovalOpinion.action?approvalOpinion_type='+approvalOpinion_type+"&approval_id="+currency_id //数据接口
                    ,cols: [[ //表头
                        {field: 'approval_state', title: '审批组', minWidth: 80}
                        ,{field: 'approver_name', title: '审批人', minWidth: 80}
                        ,{field: 'approvalOpinion_result', title: '审批意见', minWidth: 100}
                    ]]
                });
                switch(approverState){
                    case 'revoke':
                        $('.content-list').addClass('style3');
                        $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                        break;
                    case 'reject':
                        $('.content-list').addClass('style2');
                        $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                        break;
                    case 'adopt':
                        $('.content-list').addClass('style1');
                        $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                        break;
                    case 'waitting':

                        $.ajax({
                            url:"Currency/Approval.action",
                            type:'post',
                            data:{
                                "currency_string":staffid,
                                "currency_type":approval_id,
                                "currency_id":currency_id
                            },
                            dataType:'JSON',
                            success:function(res){
                                if (res.msg == "success"){
                                    $('.content-list').addClass('style1');
                                    $('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                                }
                            }
                        });

                        $('#agree').click(function(e){
                            var approvalOpinion = $('.approval-opinion>textarea').val();	//审批意见
                            if(approvalOpinion == '') {layer.msg('审批意见不能为空');return;}

                            var messageMan = $('#messageMan').find('option:selected').val();//被通知人钉钉id
                            var messageManName = $('#messageMan').find('option:selected').text();//被通知人名称
                            if (messageMan == "" || messageMan == null){
                                layer.msg("请选择通知人");
                                return false;
                            }
                            layer.confirm('确认通过审批？',function(index){
                                $.ajax({
                                    url:'Currency/approvalCurrencyApply.action',
                                    type:'post',
                                    data:{"approver_state":1,'approvalOpinion':approvalOpinion,"currency_string":staffid
                                        ,"currency_type":approval_id,"currency_id":currency_id},
                                    dataType:'JSON',
                                    beforeSend: function(){
                                        layer.msg('正在提交审批', {
                                            icon: 16
                                            ,shade: 0.01
                                        });
                                    },
                                    success:function(result){
                                        //更新通知人，并发送钉钉消息
                                        $.ajax({
                                            url : "Currency/sendMessage69.action",
                                            type : "post",
                                            data : {"currency_type":approval_id,"currency_id":currency_id,"currency_string17":messageMan,"currency_string18":messageManName},
                                            dataType : "JSON",
                                            success : function(res){
                                            }
                                        });
                                        layer.msg(result.msg);
                                        $(e.target).closest('.content-list').addClass('style1');
                                        $(e.target).parent().find('button').addClass('layui-btn-disabled').attr('disabled',true);
                                        parent.$('.iframe-return-type').val('1');//给父页面传值,表示已进行审批且同意
                                    }
                                });
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
                                    url:'Currency/approvalCurrencyApply.action',
                                    type:'post',
                                    data:{"approver_state":-300,'approvalOpinion':approvalOpinion,"currency_string":staffid
                                        ,"currency_type":approval_id,"currency_id":currency_id},
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




                        $('#agree').click(function(){


                                buttonClick('Currency/approvalCurrencyApply.action','Currency/approvalCurrencyApply.action',dataAjax);


                        });
                        break;
                }

            }
        });

        //操作
        //改变进度条
        function updateProgress(){
            setTimeout(function(){
                element.progress('progress_bar',rate);
            }, 500);
        }

    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人报备申请详情-手机端 -->
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
    <script src="js/approval_button.js"></script>
</head>
<body>
<div class="container-approval">
    <h2 class="title-page">
        <svg class="alSvgIcon" aria-hidden="true">
            <use xlink:href="#icon-office"></use>
        </svg>
        天人报备申请详情
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
        var approverState = '${param.approverState}'; //审批状态

        var currency_number = '${param.currency_number}'; //编号
        var staff_name = '${param.staff_name}'; //申请人
        var department_name = '${param.department_name}'; //申请部门
        var currency_date = '${param.currency_date}'; //申请日期

        var currency_string2 = '${param.currency_string2}'; //业务类型
        var currency_string3 = '${param.currency_string3}'; //单位名称
        var currency_string4 = '${param.currency_string4}'; //项目（产品）名称
        var currency_string5 = '${param.currency_string5}'; //业务（产品）规模
        var currency_date2 = '${param.currency_date2}';     //业务需求时间
        var currency_date3 = '${param.currency_date3}';     //合同签订时间
        var currency_string7 = '${param.currency_string7}'; //业务所在区域
        var currency_string8 = '${param.currency_string8}'; //联系人
        var currency_string9 = '${param.currency_string9}'; //联系电话
        var currency_string10 = '${param.currency_string10}'; //合同是否签订 0未签 1已签 2终止报备

        var currency_id = '${param.currency_id}';
        var approvalOpinion_type = '${param.approvalOpinion_type}';
        var approval_id = '${param.approval_id}';
        var staffid = '${sessionScope.systemStaff.dingding_staffid }';
        var current_approvalCount = '${param.current_approvalCount}';
        var approver_count = '${param.approver_count}';
        //获取进度条百分比
        var number = Number(current_approvalCount)/Number(approver_count);
        var rate = Math.floor(number*100)+'%';

        //页面内容初始化
        $.ajax({
            url:'Currency/selectCurrencyApprover.action',
            type:'post',
            data:{'currency_id':currency_id},
            dataType:'JSON',
            beforeSend: function(){
                layer.load(1);
            },
            success:function(res){
                layer.closeAll('loading');
                var html = '';
                html += '<div class="content-list style">'
                    +		'<form>'
                    +			'<div>'
                    +				'<label class="">流水号 :</label>'
                    +				'<input type="text" id="buy_number" name="buy_number" value="'+currency_number+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请人 :</label>'
                    +				'<input type="text" name="currency_applicant" id="staffName" value="'+staff_name+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请部门 :</label>'
                    +				'<input type="text" name="department_Id" id="department" value="'+department_name+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">申请日期 :</label>'
                    +				'<input type="text" name="currency_date" id="date" value="'+currency_date+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务类型 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string2+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">单位名称 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string3+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">项目（产品）名称 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string4+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务（产品）规模 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string5+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务需求时间 :</label>'
                    +				'<input type="text" name="workovertime_start" value="'+currency_date2+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">业务所在区域 :</label>'
                    +				'<input type="text" name="workovertime_date" value="'+currency_string7+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">联系人 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string8+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div>'
                    +				'<label class="">联系电话 :</label>'
                    +				'<input type="text" name="leave_type" value="'+currency_string9+'" class="layui-input" readonly>'
                    +			'</div>'
                    +			'<div id="date">'
                    +				'<label class="">合同签订时间 :</label>'
                    +				'<input type="text" id="contract_date" name="contract_date" value="'+currency_date3+'" class="layui-input">'
                    +			'</div>'
                    +			'<div id="reason">'
                    +				'<label class="">合同未签原因 :</label>'
                    +				'<input type="text" id="contract_reason" name="contract_reason" class="layui-input">'
                    +			'</div>'
                    +			'<div class="button">'
                    +				'<button type="button" class="layui-btn layui-btn-sm" id="addContractDate">添加合同签订时间</button>'
                    +				'<button type="button" class="layui-btn layui-btn-sm" id="addContractReason">添加合同未签原因</button>'
                    +				'<button type="button" class="layui-btn layui-btn-sm" id="remind">提醒负责人</button>'
                    +				'<button type="button" class="layui-btn layui-btn-sm" id="endReport">终止报备</button>'
                    +			'</div>'
                    +		'</form>'
                    +	'</div>';
                $('.content').append(html);

                if(currency_string10 == 2 || staffid == '0847572503855936'){//已终止报备或者当前登录人是曹静，则隐藏添加合同按钮
                    //$('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                    //$('#revokeagree').addClass('layui-btn-disabled').attr('disabled',true);
                    $("#addContractDate").hide();
                    $("#addContractReason").hide();
                    $("#remind").hide();

                    $("#date").hide();
                    $("#reason").hide();
                }else if(currency_string10 == 1){//已经签订合同
                    $("#reason").hide();
                    $("#addContractReason").hide();
                    $("#addContractDate").hide();

                    $("#remind").hide();
                    $("#endReport").hide();
                }else if (staffid != '0847572503855936'){
                    $("#remind").hide();
                    $("#endReport").hide();
                }
                switch(approverState){
                    case 'adopt':
                        $('.content-list').addClass('style1');
                        //$('.content-list').find('button').addClass('layui-btn-disabled').attr('disabled',true);
                        $('#revokeagree').addClass('layui-btn-disabled').attr('disabled',true);
                        break;
                }

                laydate.render({
                    elem: '#contract_date' //指定元素
                    ,done: function(value, date, endDate){
                        // console.log(value); //得到日期生成的值
                    }
                });

                $('#addContractDate').click(function(){

                    var contract_date = $('#contract_date').val();

                    if (contract_date == "" || contract_date == null){
                        layer.msg("请选择签订时间");
                        return false;
                    }else {
                        //更新通知人，并发送钉钉消息
                        $.ajax({
                            url : "../Currency/sendMessage69.action",
                            type : "post",
                            data : {"currency_type":approval_id,"currency_id":currency_id,"currency_date3":contract_date,"currency_string10":1},
                            dataType : "JSON",
                            success : function(res){
                                layer.msg("提交成功");
                            }
                        });
                    }
                });

                $('#addContractReason').click(function(){

                    var contract_reason = $('#contract_reason').val();

                    if (contract_reason == "" || contract_reason == null){
                        layer.msg("请填写合同未签订原因");
                        return false;
                    }else {
                        //更新通知人，并发送钉钉消息
                        $.ajax({
                            url : "../Currency/sendMessage69.action",
                            type : "post",
                            data : {"currency_type":approval_id,"currency_id":currency_id,"currency_string6":contract_reason,"currency_string10":0},
                            dataType : "JSON",
                            success : function(res){
                                layer.msg("提交成功");
                            }
                        });
                    }
                });

                $('#remind').click(function(){
                    //提醒负责人
                    $.ajax({
                        url : "../Currency/sendMessage69.action",
                        type : "post",
                        data : {"currency_type":approval_id,"currency_id":currency_id,"currency_string10":3},
                        dataType : "JSON",
                        success : function(res){
                            layer.msg("提交成功");
                        }
                    });

                });

                $('#endReport').click(function(){
                    //更新通知人，并发送钉钉消息
                    $.ajax({
                        url : "../Currency/sendMessage69.action",
                        type : "post",
                        data : {"currency_type":approval_id,"currency_id":currency_id,"currency_string10":2},
                        dataType : "JSON",
                        success : function(res){
                            layer.msg("提交成功");
                        }
                    });

                });
            }
        });

    });
</script>
</body>
</html>
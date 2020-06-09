<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--报表详情-手机端 -->
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
            <use xlink:href="#icon-xzTesting"></use>
        </svg>
        流程详情
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

        var currency_date = '${param.currency_date}'; //下发时间
        //var notice = '${param.notice}'; //区域

        var register = '${param.register}'; //区域
        var registerTime = '${param.registerTime}'; //区域

        var handover = '${param.handover}'; //区域
        var handoverTime = '${param.handoverTime}'; //区域

        var testing = '${param.testing}'; //区域
        var testTime = '${param.testTime}'; //区域

        var report = '${param.report}'; //区域
        var reportTime = '${param.reportTime}'; //区域

        //var finance = '${param.finance}'; //区域
        //var financeTime = '${param.financeTime}'; //区域


        var currency_id = '${param.currency_id}';
        //页面内容初始化

        //layer.closeAll('loading');
        var html = '';
        html += '<div class="content-list style">'
            +		'<form>'
            +			'<div class="approval-progress_details">'
            +				'<table class="layui-table" lay-filter="details">'
            +                    '<colgroup>'
            +                       '<col width="100">'
            +                       '<col width="100">'
            +                       '<col>'
            +                    '</colgroup>'
            +                    '<thead>'
            +                       '<tr>'
            +                           '<th>科室</th>'
            +                           '<th>进度</th>'
            +                           '<th>到达时间</th>'
            +                       '</tr>'
            +                    '</thead>'
            +                    '<tbody>'
            +                       '<tr>'
            +                           '<td>业务科</td>'
            +                           '<td>下发完成</td>'
            +                           '<td>'+currency_date+'</td>'
            +                       '</tr>'
            +                       '<tr>'
            +                           '<td>现场科采样</td>'
            +                           '<td>'+register+'</td>'
            +                           '<td>'+registerTime+'</td>'
            +                       '</tr>'
            +                       '<tr>'
            +                           '<td>质控科交接</td>'
            +                           '<td>'+handover+'</td>'
            +                           '<td>'+handoverTime+'</td>'
            +                       '</tr>'
            +                       '<tr>'
            +                           '<td>检测科检测</td>'
            +                           '<td>'+testing+'</td>'
            +                           '<td>'+testTime+'</td>'
            +                       '</tr>'
            +                       '<tr>'
            +                           '<td>质控科报告</td>'
            +                           '<td>'+report+'</td>'
            +                           '<td>'+reportTime+'</td>'
            +                       '</tr>'
            +                       /*'<tr>'
            +                           '<td>财务科盖章</td>'
            +                           '<td>'+finance+'</td>'
            +                           '<td>'+financeTime+'</td>'
            +                       '</tr>'*/
            +                    '</tbody>'
            +               '</table>'
            +			'</div>'
            +		'</form>'
            +	'</div>';
        $('.content').append(html);

    });
</script>
</body>
</html>
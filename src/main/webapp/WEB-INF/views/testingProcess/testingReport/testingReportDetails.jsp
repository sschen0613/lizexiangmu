<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 通知列表页 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
    <link rel="stylesheet" type="text/css" href="css/table.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/function_tool.js"></script>
    <script src="layui_exts/excel.js"></script>
</head>
<body>


<table class="layui-hide" id="test1" lay-filter="test1"></table>

<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer','table', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,table = layui.table //表格
            ,element = layui.element
            ,layer = layui.layer; //元素操作

        var currency_id = ${param.currency_id};	//number类型

        //执行一个 table 实例
        table.render({
            elem: '#test1'
            ,url: 'Xinze/selectCurrencyDetailsReport.action?details_int4='+currency_id //数据接口
            ,page: false
            ,title: '报告记录表'
            ,totalRow: true
            ,cols: [[ //表头
                {fixed: 'left', field: 'details_string', title: '报告编码', minWidth: 120}
                ,{field: 'details_string2', title: '报告类型', minWidth: 100}
                ,{field: 'details_string4', title: '业务员', minWidth: 100}
                ,{field: 'details_date', title: '完成时间', minWidth:120, sort: true, templet:'<div>{{ Format0(d.details_date,"yyyy-MM-dd HH:ss:mm")}}</div>'}
            ]]
        });


    });
</script>
</body>
</html>
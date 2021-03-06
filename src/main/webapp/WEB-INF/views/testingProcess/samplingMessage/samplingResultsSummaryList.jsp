<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样结果汇总表 -->
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
</head>
<body>
<form class="layui-form form-top" action="">
    <div class="layui-form-item">
       <%-- <div class="layui-inline">
            <label class="layui-form-label label-revise">任务下达人 :</label>
            <div class="layui-input-block">
                <input type="text" name="applicant" required  lay-verify="" placeholder="请输入任务下达人" autocomplete="off" class="layui-input input-revise">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label label-revise">审批人 :</label>
            <div class="layui-input-block select-revise">
                <select id="department" name="department" lay-verify="" lay-search class="select-revise">
                    <option value="">请选择审批人</option>
                </select>
            </div>
        </div>--%>
        <div class="layui-inline">
            <label class="layui-form-label label-revise">开始日期 :</label>
            <div class="layui-input-block">
                <input name="currency_date2" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="请选择任务下达日期">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label label-revise">结束日期 :</label>
            <div class="layui-input-block">
                <input name="currency_date3" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="请选择任务下达日期">
            </div>
        </div>
        <div class="layui-inline">
            <button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
                检索
            </button>
        </div>
    </div>
</form>

<table id="tab" lay-filter="table"></table>

<%--<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-xs" lay-event="look">结果汇总表</button>
    </div>
</script>--%>
<!-- 		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
</script>
<script>
    //一般直接写在一个js文件中
    layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element //元素操作
            ,form = layui.form
            ,layedit = layui.layedit;

        //表单更新渲染
        form.render();
        form.render('select');

        //创建table实例
        var tableInner = table.render({
            elem: '#tab'
            ,url: 'Xinze/selectApplicantCurrency.action?currency_type=48&currency_int=3' //数据接口
            ,page: true //开启分页
            ,toolbar: true
            ,title: '采样结果汇总'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'currency_number', title: '采样单号', minWidth:200, sort:true}
                ,{field: 'currency_string2', title: '项目名称', minWidth:150}
                ,{field: 'currency_string3', title: '联系人', minWidth:80}
                ,{field: 'currency_string4', title: '联系电话', minWidth:100}
                ,{field: 'currency_string5', title: '委托单位地址', minWidth:200}
                ,{field: 'currency_string10', title: '委托单位名称', minWidth:120}
                ,{field: 'currency_string7', title: '样品名称', minWidth:100}
                ,{field: 'currency_date2', title: '采样完成时间', minWidth:120, sort: true, templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
                ,{field: 'currency_string8', title: '检测类型', minWidth:100}
                ,{field: 'currency_date3', title: '协议完成时间', minWidth:120, sort: true, templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
                ,{field: 'currency_string9', title: '执行标准', minWidth:200}
                //,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:100}
            ]]
        });

        //监听工具条
        table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看明细
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '查看明细',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: 'Xinze/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
                });
            }
        });

    });
</script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<link rel="stylesheet" href="../css/search_revise.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/function_tool.js"></script>

<h3 style="text-align: center">标的信息</h3>
<table class="layui-hide" id="test" lay-filter="test"></table>

<h3 style="text-align: center">收款计划</h3>
<table class="layui-hide" id="test1" lay-filter="test1"></table>

<h3 style="text-align: center">已收款记录</h3>
<table class="layui-hide" id="test2" lay-filter="test2"></table>

<h3 style="text-align: center">合同条款</h3>
<table class="layui-hide" id="test3" lay-filter="test3"></table>

<h3 style="text-align: center">大事记</h3>
<table class="layui-hide" id="test4" lay-filter="test4"></table>

<script type="text/html" id="barDemo">

</script>

<script type="text/html" id="toolbarDemo">

</script>

<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'table', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,table = layui.table //表格
            ,element = layui.element; //元素操作

        var strContractID = location.search;

        table.render({
            elem: '#test'
            ,url: 'selectContractItem.action'+strContractID //数据接口
            ,page: false
            ,title: '合同内容'
            ,totalRow: true
            ,cols: [[ //表头
                {fixed: 'left', field: 'strCode', title: '标的编码', minWidth: 100}
                ,{field: 'strName', title: '标的名称', minWidth: 80}
                ,{field: 'dblQuantity', title: '数量', minWidth: 80}
                ,{field: 'dblTaxRatio', title: '税率', minWidth: 80}
                ,{field: 'dblUntaxPrice', title: '无税原币单价', minWidth: 80}
                ,{field: 'dblPrice', title: '含税原币单价', minWidth: 80}
                ,{field: 'dblUntaxSum', title: '无税原币金额', minWidth: 80}
                ,{field: 'dblSum', title: '含税原币金额', minWidth: 80}
            ]]
        });

        table.render({
            elem: '#test1'
            ,url: 'selectPayment.action'+strContractID //数据接口
            ,page: false
            ,title: '收款计划'
            ,totalRow: true
            ,cols: [[ //表头
                { fixed: 'left', field: 'dtPayDate', title: '收款日期', templet:'<div>{{ subDate(d.dtPayDate)}}</div>'}
                ,{field: 'dblPayRatio', title: '收款比例(%)', minWidth: 100}
                ,{field: 'dblPayCurrency', title: '收款金额', minWidth: 50}
                ,{field: 'strSettleStyleID', title: '结算方式', minWidth: 50}
                ,{field: 'strPayFactor', title: '条件', minWidth: 100}
                ,{field: 'strExp', title: '说明', minWidth: 100}
            ]]
        });

        table.render({
            elem: '#test2'
            ,url: 'selectReceive.action'+strContractID //数据接口
            ,page: false
            ,title: '收款记录'
            ,totalRow: true
            ,cols: [[ //表头
                { fixed: 'left', field: 'dVouchDate', title: '单据日期', minWidth: 100, sort: true, templet:'<div>{{ Format(d.dVouchDate,"yyyy-MM-dd")}}</div>'}
                ,{field: 'iAmount', title: '本币金额', minWidth: 100}
                ,{field: 'iAmount_f', title: '原币金额', minWidth: 50}
                ,{field: 'iRAmount', title: '本币余额', minWidth: 50}
                ,{field: 'iRAmount_f', title: '原币余额', minWidth: 100}
            ]]
        });

        table.render({
            elem: '#test3'
            ,url: '../System/selectContractAll.action'+strContractID //数据接口
            ,page: false
            ,title: '合同条款'
            ,totalRow: true
            ,cols: [[ //表头
                { fixed: 'left', field: 'strName', title: '条款名称', minWidth: 100}
                ,{field: 'strMemo', title: '条款内容', minWidth: 100}
                ,{field: 'cDefine26', title: '限额', minWidth: 50}
            ]]
        });

        table.render({
            elem: '#test4'
            ,url: 'selectContractMemo.action'+strContractID //数据接口
            ,page: false
            ,title: '合同条款'
            ,totalRow: true
            ,cols: [[ //表头
                { fixed: 'left', field: 'strMemorabiliaID', title: '大事记编码', minWidth: 100}
                ,{field: 'strMemorabilia', title: '大事记内容', minWidth: 100}
            ]]
        });



    });
</script>
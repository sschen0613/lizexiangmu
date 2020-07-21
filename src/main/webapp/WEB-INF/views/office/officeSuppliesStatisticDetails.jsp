<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!--审批详情页 -->
<link rel="stylesheet" href="../css/search_revise.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/function_tool.js"></script>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer','table', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,table = layui.table //表格
            ,element = layui.element
            ,layer = layui.layer; //元素操作

        var currency_department = ${param.currency_department};	//number类型
        var currency_type = Number('${param.currency_type}'); //string类型
        console.log(${param.currency_date2});
        var currency_date2 = "";
        if ((${param.currency_date2}) !=1){
            currency_date2 = ${param.currency_date2};	//number类型
        }

        var currency_date3 = "";
        if ((${param.currency_date3}) != 2){
            currency_date3 = ${param.currency_date3};	//number类型
        }//number类型

        table.render({
            elem: '#test'
            ,url: 'selectOfficeSuppliesAmountListByDep.action?currency_type='+currency_type+'&currency_department='+currency_department
                +'&currency_date2='+currency_date2+'&currency_date3='+currency_date3
            ,page: false
            ,title: '用户数据表'
            ,totalRow: true
            ,cols: [[ //表头
                {fixed: 'left', field: 'details_string4', title: '编码', minWidth: 80},
                {field: 'details_string5', title: '物品名称', minWidth: 100}
                //,{field: 'details_string6', title: '规格型号', minWidth: 100}
                ,{field: 'details_string7', title: '单位', minWidth: 80}
                ,{field: 'details_money', title: '数量', minWidth: 80}
                ,{field: 'details_money2', title: '单价', minWidth: 80}
                ,{field: 'details_money3', title: '金额', minWidth: 100}
            ]]
        });
    });
</script>
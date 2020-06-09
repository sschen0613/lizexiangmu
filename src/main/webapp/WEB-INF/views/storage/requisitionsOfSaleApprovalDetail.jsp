<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 销售请购打印 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/print_revise.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jQuery.print.js"></script>
    <script src="js/function_tool.js"></script>
    <script src="js/form_init.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
<div id="content" class="content">
    <div class="sign"><i id="number"></i></div>
    <div class="title"><h2>销售请购申请详情<i id="number0"></i></h2></div>
    <table border="1" class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
        </colgroup>
        <tbody>
        <tr>
            <td>申请人</td>
            <td id="staff_name"></td>
            <td>申请部门</td>
            <td id="department" colspan="2"></td>
            <td>申请日期</td>
            <td id="date" colspan="2"></td>
        </tr>
        <tr>
            <td>区域</td>
            <td id="area"></td>
            <td>合同编号</td>
            <td id="contract_id" colspan="2"></td>
            <td>期望到货日期</td>
            <td id="expectedDelivery_date" colspan="2"></td>
        </tr>
        <tr>
            <td>客户名称</td>
            <td id="customer_name" colspan="8"></td>
        </tr>
        <tr>
            <td>合同总额</td>
            <td id="contract_amount" colspan="2"></td>
            <td>已收款</td>
            <td id="actual_receipt"></td>
            <td>未收款</td>
            <td id="outstanding_receipt" colspan="2"></td>
        </tr>
        <tr>
            <td colspan="2">期初合同已收款</td>
            <td id="moneyBegin" colspan="6"></td>
        </tr>
        <tr>
            <td colspan="8">合同付款约定</td>
        </tr>
        <tr class="contract">
            <td colspan="2">合同条款名称</td>
            <td colspan="6">合同条款内容</td>
        </tr>
        <tr>
            <td colspan="8">商品详情</td>
        </tr>
        <tr class="details">
            <td>商品名称</td>
            <%--<td>存货编码</td>--%>
            <td>规格型号</td>
            <td>单位</td>
            <td>合同数量</td>
            <td>请购数量</td>
            <td>库存数量</td>
            <td name="recent_price">参考成本</td>
            <td name="recent_price">最低售价</td>
            <td name="recent_price">销售单价</td>
        </tr>
        <tr>
            <td colspan="8">审批详情</td>
        </tr>
        <tr>
            <td colspan="2">审批组</td>
            <td colspan="1">审批人</td>
            <td colspan="3">审批意见</td>
            <td colspan="2">审批时间</td>
        </tr>
        </tbody>
    </table>

</div>
<%--<div class="bottom">
    <button class="layui-btn" onclick="print()">
        <i class="layui-icon layui-icon-fonts-clear"></i> 打印
    </button>
</div>--%>
<script>
    var currency_id = '${param.currency_id}';
    var currency_type = '${param.currency_type}';
    var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息
    $.ajax({
        url:'Currency/selectCurrency.action',
        type:'post',
        data:{"currency_id":currency_id,"currency_type":currency_type},
        dataType:'JSON',
        success:function(res){
            $("#staff_name").text(res.data[0].staff_name);
            $("#department").text(res.data[0].department_name);
            $("#date").text(Format(res.data[0].currency_date,"yyyy-MM-dd"));
            $("#area").text(res.data[0].currency_string2);
            $("#contract_id").text(res.data[0].currency_string3);
            $("#expectedDelivery_date").text(Format(res.data[0].currency_date2,"yyyy-MM-dd"));
            $("#customer_name").text(res.data[0].currency_string7);
            $("#contract_amount").text(res.data[0].currency_money);
            $("#moneyBegin").text(res.data[0].currency_string16);

            var number = res.data[0].currency_string3;//合同编号
            var contractAmount = res.data[0].currency_money;//合同金额
            var acceptAmount = 0;
            var owingAmount = 0;
            //查询合同收款计划
            $.ajax({
                url: 'System/selectReceivables.action',
                type: 'post',
                data: {'strContractID': number},
                dataType: 'JSON',
                success: function (result) {
                    $.each(result.data, function (index, item) {
                        acceptAmount += Number(item.dblPayCurrency);
                    });
                    owingAmount = contractAmount - acceptAmount;//欠款金额
                    $("#actual_receipt").text(acceptAmount);
                    $("#outstanding_receipt").text(owingAmount);
                }
            });

        }
    });

    $.ajax({
        url: 'System/selectContractAll1.action',
        type: 'post',
        data: {'currency_id': currency_id},
        dataType: 'JSON',
        success: function (res) {
            $.each(res.data, function (index, item) {
                var html = '<tr>';
                html += '<td colspan="2">'+item.strName+'</td>'
                    +	'<td colspan="6">'+item.strMemo+'</td>'
                    +	'</tr>';
                $('.contract').after(html);

            });
        }
    });

    $.ajax({
        url:'Currency/selectCurrencyDetails.action',
        type:'post',
        data:{
            "currency_id":currency_id
        },
        dataType:'JSON',
        success:function(res){
            $.each(res.data,function (index,item) {
                /*var specifications_models = '';
                if (item.details_string6 != undefined){
                    specifications_models = item.details_string6;
                }*/

                var html = '<tr>';
                html += '<td>'+item.details_string5+'</td>'
                    /*+	'<td>'+item.details_string4+'</td>'*/
                    +	'<td>'+item.details_string6+'</td>'
                    +	'<td>'+item.details_string7+'</td>'
                    +	'<td>'+item.details_money2+'</td>'
                    +	'<td>'+item.details_money+'</td>'
                    +	'<td>'+item.details_money3+'</td>';
                if (position_Id != 5 && position_Id != 23 && position_Id != 34 && position_Id != 41 && position_Id != 29){
                    html += '<td name="recent_price"></td>'
                        +   '<td name="recent_price"></td>'
                        +   '<td name="recent_price"></td>'
                        +	'</tr>';
                }else{
                    html += '<td name="recent_price">'+item.details_string8+'</td>'
                        +   '<td name="recent_price">'+item.details_string10+'</td>'
                        +   '<td name="recent_price">'+item.details_string9+'</td>'
                        +	'</tr>';
                }

                $('.details').after(html);
            });
        }
    });

    $.ajax({
        url:'Currency/selectApprovalOpinion.action',
        type:'post',
        data:{
            "approval_id":currency_id,
            "approvalOpinion_type":currency_type
        },
        dataType:'JSON',
        success:function(res){
            $.each(res.data,function (index,item) {
                var approver_name = '';
                if (item.approver_name != undefined){
                    approver_name = item.approver_name;
                }
                var approvalOpinion_result = '';
                if (item.approvalOpinion_result != undefined){
                    approvalOpinion_result = item.approvalOpinion_result;
                }

                var html = '<tr>';
                html += '<td colspan="2">'+item.approval_state+'</td>'
                    +	'<td colspan="1">'+approver_name+'</td>'
                    +	'<td colspan="3">'+approvalOpinion_result+'</td>'
                    +	'<td colspan="2">'+Format0(item.approval_date,"yyyy-MM-dd HH:mm:ss")+'</td>'
                    +	'</tr>';
                $('.layui-table>tbody').append(html);
            });
        }
    });

</script>
<script language="javascript">
</script>
</body>
</html>
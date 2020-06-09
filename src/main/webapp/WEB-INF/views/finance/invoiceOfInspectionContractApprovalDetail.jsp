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
    <div class="title"><h2>丽泽公司运营合同发票开具审批详情<i id="number0"></i></h2></div>
    <table border="1" class="layui-table">
        <colgroup>
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
            <td id="department"></td>
            <td>申请日期</td>
            <td id="date"></td>
        </tr>
        <tr>
            <td>区域</td>
            <td id="area" colspan="2"></td>
            <td>客户名称</td>
            <td id="customer_name" colspan="2"></td>
        </tr>
        <tr>
            <td>合同编号</td>
            <td id="contract_id"></td>
        </tr>
        <tr>
            <td>开票名称</td>
            <td id="invoice_name" colspan="5"></td>
        </tr>
        <tr>
            <td>税号（社会统一信用码）</td>
            <td id="tax_number" colspan="5"></td>
        </tr>
        <tr>
            <td>地址</td>
            <td id="site" colspan="2"></td>
            <td>电话</td>
            <td id="telephone" colspan="2"></td>
        </tr>
        <tr>
            <td>开户行</td>
            <td id="bank" colspan="2"></td>
            <td>账号</td>
            <td id="account" colspan="2"></td>
        </tr>
        <tr>
            <td colspan="6">合同付款约定</td>
        </tr>
        <tr class="contract">
            <td>合同条款名称</td>
            <td colspan="5">合同条款内容</td>
        </tr>
        <tr>
            <td>合同总金额</td>
            <td id="contract_amount"></td>
            <td>实际收款</td>
            <td id="actual_receipt"></td>
            <td>欠款金额</td>
            <td id="outstanding_receipt"></td>
        </tr>
        <tr>
            <td>已开票金额</td>
            <td id="alreadyInvoice_amount"></td>
            <td>申请开票金额</td>
            <td id="applyInvoice_amount"></td>
            <td>发票类型</td>
            <td id="invoice_type"></td>
        </tr>
        <tr>
            <td>期初合同已收款</td>
            <td colspan="2" id="moneyBegin"></td>
            <td>期初合同已开票</td>
            <td colspan="2" id="invoiceBegin"></td>
        </tr>
        <tr>
            <td>开票事由</td>
            <td colspan=5 id="invoice_reason"></td>
        </tr>
        <tr>
            <th colspan=6 style="text-align: center;">核对开票信息</th>
        </tr>
        <tr>
            <td>开票信息是否一致</td>
            <td colspan=5 id="choose"></td>
        </tr>
        <tr>
            <td colspan="6">审批详情</td>
        </tr>
        <tr>
            <td>审批组</td>
            <td>审批人</td>
            <td colspan="3">审批意见</td>
            <td>审批时间</td>
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
            $("#customer_name").text(res.data[0].currency_string3);

            $("#contract_id").text(res.data[0].currency_string4);
            $("#invoice_name").text(res.data[0].currency_string5);
            $("#tax_number").text(res.data[0].currency_string7);

            $("#site").text(res.data[0].currency_string8);
            $("#telephone").text(res.data[0].currency_string9);

            $("#bank").text(res.data[0].currency_string10);
            $("#account").text(res.data[0].currency_string11);

            $("#alreadyInvoice_amount").text(res.data[0].currency_string12);
            $("#applyInvoice_amount").text(res.data[0].currency_string13);
            $("#invoice_type").text(res.data[0].currency_int5==1?"普通发票":"专用发票");

            $("#moneyBegin").text(res.data[0].currency_string16);
            $("#invoiceBegin").text(res.data[0].currency_string15);

            $("#invoice_reason").text(res.data[0].currency_string14);

            $("#choose").text(res.data[0].currency_int6==1?"是":"否");

            var number = res.data[0].currency_string4;//合同编号
            var contractAmount = res.data[0].currency_money;//合同金额
            $("#contract_amount").text(contractAmount);
            var acceptAmount = 0;
            var owingAmount = 0;
            //查询合同收款计划
            $.ajax({
                url: 'System/selectXZReceivables.action',
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
        url: 'System/selectXZContractAll.action',
        type: 'post',
        data: {'currency_id': currency_id},
        dataType: 'JSON',
        success: function (res) {
            $.each(res.data, function (index, item) {
                var html = '<tr>';
                html += '<td>'+item.strName+'</td>'
                    +	'<td colspan="5">'+item.strMemo+'</td>'
                    +	'</tr>';
                $('.contract').after(html);

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
                html += '<td>'+item.approval_state+'</td>'
                    +	'<td>'+approver_name+'</td>'
                    +	'<td colspan="3">'+approvalOpinion_result+'</td>'
                    +	'<td>'+Format0(item.approval_date,"yyyy-MM-dd HH:mm:ss")+'</td>'
                    +	'</tr>';
                $('.layui-table>tbody').append(html);
            });
        }
    });

</script>
</body>
</html>
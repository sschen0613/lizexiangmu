<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽技术服务合同变更申请详情 -->
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
    <style type="text/css">
        img{cursor: pointer;}
        #pic{position: absolute; display: none;}
        #pic1{ width: 400px; height: 300px; border-radius: 5px; -webkit-box-shadow: 5px 5px 5px 5px hsla(0,0%,5%,1.00); box-shadow: 5px 5px 5px 0px hsla(0,0%,5%,0.3); }
    </style>
</head>
<body>
<div id="content" class="content">
    <div class="sign"><i id="number"></i></div>
    <div class="title">
        <h2>信泽技术服务合同变更申请详情<</h2>
    </div>
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
            <col width="100">
            <col width="100">
        </colgroup>
        <tbody>
        <tr>
            <td>申请人</td>
            <td id="staff_name" colspan=2></td>
            <td>申请部门</td>
            <td id="department" colspan="2"></td>
            <td>申请日期</td>
            <td id="date" colspan="3"></td>
        </tr>
        <tr>
            <td>区域</td>
            <td id="area_name" colspan="4"></td>
            <td>客户名称</td>
            <td id="customer_name" colspan="4"></td>
        </tr>
        <tr>
            <td>合同编号</td>
            <td id="contract_id" colspan="10"></td>
        </tr>
        <tr>
            <td>合同签订日期</td>
            <td id="strContractOrderDate" colspan="10"></td>
        </tr>
        <tr>
            <td>合同开始日期</td>
            <td id="strContractStartDate" colspan="4"></td>
            <td>合同结束日期</td>
            <td id="strContractEndDate" colspan="4"></td>
        </tr>
        <tr>
            <td>合同开始日期变更</td>
            <td id="strContractStartDateChange" colspan="4"></td>
            <td>合同结束日期变更</td>
            <td id="strContractEndDateChange" colspan="4"></td>
        </tr>
        <tr>
            <td>合同总额</td>
            <td id="contract_amount" colspan="4"></td>
            <td>合同总额变更</td>
            <td id="contract_amount_change" colspan="4"></td>
        </tr>
        <tr>
            <td colspan="2">变更说明</td>
            <td id="strContractDesc" colspan="8"></td>
        </tr>
        <tr>
            <td colspan="10">合同付款约定</td>
        </tr>
        <tr class="contract">
            <th colspan=2>合同条款名称</th>
            <th colspan=2>合同条款名称变更</th>
            <th colspan=3>合同条款内容</th>
            <th colspan=3>合同条款内容变更</th>
        </tr>
        <tr>
            <td colspan="10">商品详情</td>
        </tr>
        <tr class="details">
            <td>项目编码</td>
            <td>项目名称</td>
            <td colspan="2">内容描述</td>
            <td>内容描述变更</td>
            <td>数量</td>
            <td>数量变更</td>
            <td>含税原币单价</td>
            <td>含税原币单价变更</td>
            <td>含税原币金额</td>
        </tr>
        <tr class="pics1">>
            <td colspan="10">原合同</td>
        </tr>
        <tr class="pics2">>
            <td colspan="10">变更合同</td>
        </tr>
        <tr>
            <td colspan="10">审批详情</td>
        </tr>
        <tr>
            <td colspan="2">审批组</td>
            <td colspan="2">审批人</td>
            <td colspan="3">审批意见</td>
            <td colspan="3">审批时间</td>
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

    $(function(){
        $(".imgA").hover(function(){
            $(this).append("<p id='pic'><img src='"+this.href+"' id='pic1'></p>");
            $(".imgA").mousemove(function(e){
                $("#pic").css({
                    "top":(e.pageY+10)+"px",
                    "left":(e.pageX+20)+"px"
                }).fadeIn("fast");
                // $("#pic").fadeIn("fast");
            });
        },function(){
            $("#pic").remove();
        });
    });

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
            $("#area_name").text(res.data[0].currency_string2);
            $("#customer_name").text(res.data[0].currency_string3);
            $("#contract_id").text(res.data[0].currency_string7);
            $("#strContractDesc").text(res.data[0].currency_string8);
            $("#strContractOrderDate").text(res.data[0].currency_string9);
            $("#strContractStartDate").text(res.data[0].currency_string4);
            $("#strContractEndDate").text(res.data[0].currency_string5);
            $("#strContractStartDateChange").text(Format(res.data[0].currency_date2,"yyyy-MM-dd"));
            $("#strContractEndDateChange").text(Format(res.data[0].currency_date3,"yyyy-MM-dd"));
            $("#contract_amount").text(res.data[0].currency_money);
            $("#contract_amount_change").text(res.data[0].currency_money2);
        }
    });

    //获取收款计划
    $.ajax({
        url:'Currency/selectPaymentPlan.action?currency_id='+currency_id,
        type:'post',
        data:{},
        dataType:'JSON',
        success:function(res){
            $.each(res.data, function (index, item) {
                var html = '<tr>';
                html += '<td colspan="2">'+item.strSettleStyleID+'</td>'
                    +	'<td colspan="2">'+item.string+'</td>'
                    +	'<td colspan="3">'+item.strPayFactor+'</td>'
                    +	'<td colspan="3">'+item.string2+'</td>'
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
                var html = '<tr>';
                html += '<td>'+item.details_string4+'</td>'
                    +   '<td>'+item.details_string5+'</td>'
                    +	'<td colspan="2">'+item.details_string6+'</td>'
                    +	'<td>'+item.details_string7+'</td>'
                    +	'<td>'+item.details_money+'</td>'
                    +	'<td>'+item.details_money2+'</td>'
                    +	'<td>'+item.details_money3+'</td>'
                    +	'<td>'+item.details_money4+'</td>'
                    +	'<td>'+item.details_money5+'</td>'
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
                    +	'<td colspan="2">'+approver_name+'</td>'
                    +	'<td colspan="3">'+approvalOpinion_result+'</td>'
                    +	'<td colspan="3">'+Format0(item.approval_date,"yyyy-MM-dd HH:mm:ss")+'</td>'
                    +	'</tr>';
                $('.layui-table>tbody').append(html);
            });
        }
    });

    //获取收款计划
    $.ajax({
        url:'Currency/selectContractPicture.action?currency_id='+currency_id,
        type:'post',
        data:{},
        dataType:'JSON',
        success:function(res){
            var html1 = '<tr>';
            var html2 = '<tr>';
            var picNum1 = 0;
            var picNum2 = 0;
            $.each(res.data, function (index, item) {
                if (item.string == "1"){
                    picNum1++;
                    if (picNum1 % 10 != 0){//
                        html1 += '<td><a class="imgA" target="_Blank" href="'+item.coverpath+'"><img src='+item.coverpath+'></a></td>';
                    }else {
                        html1 += '<td><a class="imgA" target="_Blank" href="'+item.coverpath+'"><img src='+item.coverpath+'></a></td></tr><tr>';
                    }
                }else if(item.string == "2"){
                    picNum2++;
                    if (picNum2 % 10 != 0){//
                        html2 += '<td><a class="imgA" target="_Blank" href="'+item.coverpath+'"><img src='+item.coverpath+'></a></td>';
                    }else {
                        html2 += '<td><a class="imgA" target="_Blank" href="'+item.coverpath+'"><img src='+item.coverpath+'></a></td></tr><tr>';
                    }
                }
            });
            html1 += '</tr>';
            html2 += '</tr>';
            $('.pics1').after(html1);
            $('.pics2').after(html2);
        }
    });


</script>
</body>
</html>
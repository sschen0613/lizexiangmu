<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 业务招待打印 -->
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
			<div class="title"><h2>业务招待详情<i id="number0"></i></h2></div>
			<table border="1" class="layui-table">
				<colgroup>
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="100">
					<col width="100">
					<col width="100">
				</colgroup>
				<tbody>
					<tr>
						<td>申请人</td>
						<td id="staff_name" colspan=2></td>
						<td>申请部门</td>
						<td id="department" colspan=2></td>
					</tr>
					<tr>
						<td>申请日期</td>
						<td id="date" colspan=2></td>
						<td>客人单位</td>
						<td id="unit" colspan=2></td>
					</tr>
					<tr>
						<td>客人人数</td>
						<td id="acount" colspan=2></td>
						<td>陪同人</td>
						<td id="person" colspan=2></td>
					</tr>
					<tr>
						<td>招待事由</td>
						<td id="reason" colspan=5></td>
					</tr>
					<tr>
						<td>申请金额</td>
						<td id="money" colspan=2></td>
						<td>金额大写</td>
						<td id="moneyUp" colspan=2></td>
					</tr>
					<tr>
						<td colspan="6">审批详情</td>
					</tr>
					<tr>
						<td colspan="2">审批组</td>
						<td colspan="1">审批人</td>
						<td colspan="3">审批意见</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="bottom">
			<button class="layui-btn" onclick="print()">
				<i class="layui-icon layui-icon-fonts-clear"></i> 打印
			</button>
		</div>
		<script>
			var currency_id = '${param.currency_id}';
			var currency_type = '${param.currency_type}';
			$.ajax({
				url:'Currency/selectCurrency.action',
				type:'post',
				data:{"currency_id":currency_id,"currency_type":currency_type},
				dataType:'JSON',
				success:function(res){
					$("#staff_name").text(res.data[0].staff_name);
					$("#department").text(res.data[0].department_name);
					$("#date").text(Format(res.data[0].currency_date,"yyyy-MM-dd"));
					$("#unit").text(res.data[0].currency_string4);
					$("#acount").text(res.data[0].currency_int6);
					$("#person").text(res.data[0].currency_string8);
					$("#reason").text(res.data[0].currency_string7);
					$("#money").text(res.data[0].currency_money6);
					$("#moneyUp").text(res.data[0].currency_string5);
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
                            +	'</tr>';
                        $('.layui-table>tbody').append(html);
                    });
                }
            });

		</script>
		<script language="javascript">
			// 打印页面内容
			var basePath = "<%=basePath%>";
			function print(){
				$("#content").print(basePath,{});
		    }
		</script>
	</body>
</html>
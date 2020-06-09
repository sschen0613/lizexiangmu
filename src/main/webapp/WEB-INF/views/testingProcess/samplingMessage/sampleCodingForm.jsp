<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 样品编码表 -->
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
	</head>
	<body>
		<div id="content" class="content">
			<div class="sign">（ 控制编号：Q/XZJC-ZL-089 ）</div>
			<div class="title"><h2>样品编码表</h2></div>
			<table border="1" class="layui-table">
				<colgroup>
					<col width="80">
				    <col width="150">
				    <col width="200">
				    <col width="200">
				    <col width="200">
				    <col width="250">
				</colgroup>
				<tbody>
					<tr>
						<td colspan=2>委托单位</td>
						<td id="company"></td>
						<td>样品名称</td>
						<td id="sample" colspan=2></td>
					</tr>
					<tr>
						<td>序号</td>
						<td>采样日期</td>
						<td>采样点位</td>
						<td>样品编码</td>
						<td>检测项目</td>
						<td>备注</td>
					</tr>
				</tbody>
			</table>
			<div class="notes">
				<i>编号人：</i><i id="persion">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;&emsp;
				<i>日期：</i><i id="date">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
		</div>
		<div class="bottom">
			<button class="layui-btn" onclick="print()">
				<i class="layui-icon layui-icon-fonts-clear"></i> 打印
			</button>
		</div>
		<script>
			var currency_id = '${param.currency_id}';
			$.ajax({
				url:'Xinze/selectCurrencyApply.action',
				type:'post',
				data:{"currency_id":currency_id},
				dataType:'JSON',
				success:function(res){
					//$('#number').text('（ 控制编号：'+1+' ）');//控制编号
					$('#company').text(res.data.currency_string10); //委托单位
					$('#sample').text(res.data.currency_string2); //样品名称
					$('#persion').text(); //编号人
					$('#date').text(); //日期
					var html = '';
					$.ajax({
                        url : "Xinze/selectCurrencyDetails1.action"
                        ,type : "post"
                        ,data : {"currency_id":currency_id}
                        ,dataType : "JSON"
                        ,success:function (res) {
                            $.each(res.data,function(index,item){
                                html += '<tr>'
                                    +		'<td>'+(index+1)+'</td>'
                                    +		'<td>'+Format(item.details_date2,'yyyy-MM-dd')+'</td>'
                                    +		'<td>'+item.details_string+'</td>'
                                    +		'<td>'+item.code+'</td>'
                                    +		'<td>'+item.details_string2+'</td>'
                                    +		'<td>'+item.details_string6+'</td>'
                                    +	'</tr>';
                            });
                            $('#content>table>tbody').append(html);
						}
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
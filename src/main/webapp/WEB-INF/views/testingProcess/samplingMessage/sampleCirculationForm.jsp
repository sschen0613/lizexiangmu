<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 样品流转单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/print_revise.css">
		<script src="js/jquery-3.1.1.min.js"></script>
		<script type="text/javascript" src="js/jQuery.print.js"></script>
		<script src="layui/layui.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<div id="content" class="content">
			<div class="sign">（ 控制编号：Q/XZJC-ZL-090 ）</div>
			<div class="title"><h2>样&emsp;品&emsp;流&emsp;转&emsp;单</h2></div>
			<form class="layui-form">
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
						<td>采样日期</td>
						<td id="sampling_date"></td>
						<td>要求完成日期</td>
						<td id="required_date" colspan=3></td>
					</tr>
					<tr>
						<td>样品名称</td>
						<td id="sample_name"></td>
						<td>样品数量</td>
						<td id="sample_number" colspan=3></td>
					</tr>
					<tr>
						<td>样品编码</td>
						<td>保存方法</td>
						<td>检测项目</td>
						<td>检测人</td>
						<td>检测日期</td>
						<td>样品处理</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<td>备注</td>
						<td id="remark" colspan=5 style="text-align:left;"></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="notes" style="text-align:left;">
				<i>送检人员：</i><i id="persion1">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>领样人员：</i><i id="persion2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>样品保管员：</i><i id="persion3">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
			<div class="notes" style="text-align:left;">
				<i>送检日期：</i><i id="date1">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>领样日期：</i><i id="date2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>日&emsp;&emsp;&emsp;期：</i><i id="date3">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
		</div>
		<div class="bottom">
			<button class="layui-btn" onclick="print()">
				<i class="layui-icon layui-icon-fonts-clear"></i> 打印
			</button>
		</div>
		
		<script>
		//一般直接写在一个js文件中
			layui.use(['table', 'form'], function(){
				var table = layui.table //表格
				,form = layui.form;
				
				var currency_id = '${param.currency_id}';
				$.ajax({
					url:'Xinze/selectCurrencyApply.action',
					type:'post',
					data:{"currency_id":currency_id},
					dataType:'JSON',
					success:function(res){
						//$('#number').text('（ 控制编号：'+1+' ）');//控制编号
						$('#sampling_date').text(Format(res.data.currency_date,'yyyy-MM-dd')); //采样日期
						$('#required_date').text(Format(res.data.currency_date3,'yyyy-MM-dd')); //要求完成日期
						$('#sample_name').text(res.data.currency_string2); //样品名称

						$('#remark').text("采样容器：   G---玻璃  P---塑料 保存方法：  "); //备注
						var html = '', count = 1;
                        $.ajax({
                            url : "Xinze/selectCurrencyDetails1.action"
                            ,type : "post"
                            ,data : {"currency_id":currency_id}
                            ,dataType : "JSON"
                            ,success:function (res) {
							$.each(res.data,function(index,item){
								if(index == 0){
									html += '<tr>'
										 +		'<td>'+item.code+'</td>'
										 +		'<td></td>'
										 +		'<td>'+item.details_string2+'</td>'
										 +		'<td></td>'
										 +		'<td></td>'
										 +		'<td rowspan=1 class="checkbox">'
										 +			'<i>留样</i><input type="checkbox" name="sample_handing" value="留样" lay-skin="primary"><br/>'
										 +			'<i>处置</i><input type="checkbox" name="sample_handing" value="处置" lay-skin="primary"><br/>'
										 +			'<i>退样</i><input type="checkbox" name="sample_handing" value="退样" lay-skin="primary"><br/>'
										 +			'<i>其他</i><input type="checkbox" name="sample_handing" value="其他" lay-skin="primary">'
										 +		'</td>'
										 +	'</tr>';
								}else{
									html += '<tr>'
										 +		'<td>'+item.code+'</td>'
										 +		'<td></td>'
										 +		'<td>'+item.details_string2+'</td>'
										 +		'<td></td>'
										 +		'<td></td>'
										 +	'</tr>';
									count++;
								}
							});
							$('#content table>tbody:eq(0)').append(html);
							$('td.checkbox').attr('rowspan',count);
                            }
                        });

                    }
				});
				form.render('checkbox');
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
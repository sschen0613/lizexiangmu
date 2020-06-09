<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务通知单打印 -->
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
			<div class="sign">（ 控制编号：Q/XZJC-ZL-104 ）<i style="float: right">第&nbsp;&nbsp;页&nbsp;共&nbsp;&nbsp;页</i></div>
			<hr />
			<div class="title"><h2>采样任务通知单（  编号：  <i id="specimen_name"></i>  ）</h2></div>
			<div class="notes0">
				<i>任务下达时间：</i><i id="date1"></i>&emsp;&emsp;
				<i style="float: right" id="date2"></i>&emsp;
			</div>
			<table border="1" class="layui-table">
				<colgroup>
					<col width="50">
				    <col width="50">
				    <col width="100">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>项目名称</td>
						<td id="project_name" colspan=2></td>
						<td>项目地址</td>
						<td id="project_adress" colspan=3></td>
					</tr>
					<tr>
						<td>现场联系人</td>
						<td id="contact_person" colspan=2></td>
						<td>联系电话</td>
						<td id="contact_phone" colspan=3></td>
					</tr>
					<tr>
						<td>执行标准</td>
						<td id="standard" colspan=6></td>
					</tr>
					<tr>
						<td>检测点位</td>
						<td>检测项目</td>
						<td colspan=3>方法依据</td>
						<td>检测频次</td>
						<td>备注</td>
					</tr>
				</tbody>
			</table>
			<div class="notes" style="text-align:left;">
				<i>采样人员：</i><i id="persion1">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>采样日期：</i><i id="date3">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
			<div class="notes" style="text-align:left;">
				<i>客户确认签名：</i><i id="persion2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
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
					$('#date1').text(Format(res.data.currency_date,'yyyy-MM-dd'));//任务下达时间
					$('#date2').text("要求完成时间："+Format(res.data.currency_date2,'yyyy-MM-dd'));//要求完成时间
                    $("#project_name").text(res.data.currency_string2);
                    $("#contact_person").text(res.data.currency_string3);
                    $("#contact_phone").text(res.data.currency_string4);
                    $("#project_adress").text(res.data.currency_string5);
                    $("#standard").text(res.data.currency_string9);
                    $("#specimen_name").text(res.data.currency_string7);
					var currentClass = '', currentRow = 1;
                    $.ajax({
                        url: "Xinze/selectCurrencyDetails.action"
                        , type: "post"
                        , data: {"currency_id": currency_id}
                        , dataType: "JSON"
                        , success: function (res) {
                            $.each(res.data,function (index,item) {
                                var html = '<tr>';
                                //合并单元格
                                if(currentClass != item.details_string){
                                    html +=	'<td rowspan=1>'+item.details_string+'</td>';
                                    currentClass = item.details_string;
                                    currentRow = 1;
                                }else{
                                    $('#content>table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(++currentRow));
                                }
								  html += 	'<td>'+item.processName+'</td>'
										+	'<td colspan=3>'+item.methodBasis+'</td>'
										+	'<td><input type="text" style="border: none;width: 100px" value="'+item.details_int3+'次/天,'+item.details_int4+'天"></td>'
								   		+	'<td>'+item.details_string6+'</td>'
										+'</tr>';
									$('#content>table>tbody').append(html);
                            });
                        }
                    });

                   /* $.each(res.data,function(index,item){
                        var html = '<tr>';
                        //合并单元格
                        if(currentClass != item.检测点位){
                        	html +=	'<td rowspan=1>'+item.检测点位+'</td>';
                        	currentClass = item.检测点位;
                        	currentRow = 1;
                        }else{
                        	$('#content>table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(++currentRow));
                        }
                        html +=		'<td>'+item.检测点位+'</td>'
                             +		'<td>'+item.检测项目+'</td>'
                             +		'<td colspan=3>'+item.方法依据+'</td>'
                             +		'<td>'+item.检测频次+'</td>'
                             +		'<td>'+item.备注+'</td>'
                             +	'</tr>';
                        $('#content>table>tbody').append(html);
                    });*/
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
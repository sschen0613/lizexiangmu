<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测报告管理 明细信息 -->
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
			<div class="sign"><i id="number"></i></div>
			<div class="title"><h2>检测报告管理</h2></div>
			<div class="subtitle"><h2>一、基本信息</h2></div>
			<table border="1" class="layui-table message-table">
				<colgroup>
					<col width="50">
				    <col width="100">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>委托单位</td>
						<td id="company"></td>
						<td>委托单位地址</td>
						<td id="adress" colspan=2></td>
					</tr>
					<tr>
						<td>委托人</td>
						<td id="client"></td>
						<td>联系电话</td>
						<td id="phone" colspan=2></td>
					</tr>
					<tr>
						<td>样品来源</td>
						<td id="source"></td>
						<td>检测目的</td>
						<td id="purpose" colspan=2></td>
					</tr>
					<tr>
						<td>采样日期</td>
						<td id="sampling_date" colspan=4></td>
					</tr>
					<tr>
						<td>分析日期</td>
						<td id="analysis_date" colspan=4></td>
					</tr>
					<tr>
						<td>样品状态</td>
						<td id="state" colspan=4></td>
					</tr>
					<tr>
						<td>检测点位</td>
						<td colspan=3>检测项目</td>
						<td>检测频次</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="subtitle"><h2>二、检测技术规范依据</h2></div>
			<table border="1" class="layui-table standard-table">
				<colgroup>
					<col width="50">
				    <col width="50">
				    <col width="150">
				    <col width="80">
				    <col width="30">
				    <col width="30">
				</colgroup>
				<tbody>
					<tr>
						<td>检测类别</td>
						<td>检测项目</td>
						<td>检测方法</td>
						<td>方法依据</td>
						<td>检出限</td>
						<td>单位</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="subtitle"><h2>三、检测仪器</h2></div>
			<table border="1" class="layui-table testing-instrument-table">
				<colgroup>
					<col width="200">
				    <col width="100">
				    <col width="100">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>仪器设备名称</td>
						<td>仪器设备编号</td>
						<td>检定/校准有效日期</td>
						<td>备注</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="subtitle"><h2>四、检测期间参数统计表</h2></div>
			<div class="threetitle"><h2>4.1 废水采样期间参数统计表</h2></div>
			<table border="1" class="layui-table statistics1-table">
				<colgroup>
					<col width="80">
				    <col width="80">
				    <col width="80">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>采样点位</td>
						<td>采样日期</td>
						<td>采样时间</td>
						<td>流速（m/s）</td>
						<td>截面积（m&sup2;）</td>
						<td>流量（m&sup3;/h）</td>
						<td>pH（无量纲）</td>
						<td>水温（&#8451;）</td>
						<td>颜色</td>
						<td>气味</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div class="threetitle"><h2>4.2 有组织检测期间参数统计表</h2></div>
			<table border="1" class="layui-table statistics2-table">
				<colgroup>
					<col width="100">
				    <col width="80">
				    <col width="80">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="100">
				</colgroup>
				<tbody>
					<tr>
						<td>检测点位</td>
						<td>检测日期</td>
						<td>检测时间</td>
						<td>温度（&#8451;）</td>
						<td>流速（m/s）</td>
						<td>标干流量（m&sup3;/h）</td>
						<td>排气筒参数</td>
					</tr>
				</tbody>
			</table>
			<div class="threetitle"><h2>4.3 无组织检测期间参数统计表</h2></div>
			<table border="1" class="layui-table statistics3-table">
				<colgroup>
					<col width="80">
				    <col width="80">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>检测日期</td>
						<td>监测时间</td>
						<td>风向</td>
						<td>风速（m/s）</td>
						<td>气压（KPa）</td>
						<td>气温（&#8451;）</td>
						<td>湿度（&#37;）</td>
						<td>云量</td>
					</tr>
				</tbody>
			</table>
			<div class="subtitle"><h2>五、检测结果</h2></div>
			<div class="threetitle"><h2>5.1 废水检测结果</h2></div>
			<table border="1" class="layui-table result1-table">
				
			</table>
			<div class="threetitle"><h2>5.2 有组织废气检测结果</h2></div>
			<table border="1" class="layui-table result2-table">
				<colgroup>
					<col width="80">
				    <col width="80">
				    <col width="80">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				    <col width="50">
				</colgroup>
				<tbody>
					<tr>
						<td>检测点位</td>
						<td>检测项目</td>
						<td>采样时间</td>
						<td>实测浓度（mg/m&sup3;）</td>
						<td>平均浓度（mg/m&sup3;）</td>
						<td>折算浓度（mg/m&sup3;）</td>
						<td>排放速率（kg/h）</td>
					</tr>
				</tbody>
			</table>
			<div class="threetitle"><h2>5.3 厂界无组织废气检测结果</h2></div>
			<div class="fourtitle"><h2>5.3.1 厂界无组织废气检测结果（一）</h2></div>
			<table border="1" class="layui-table result3-1-table">
				
			</table>
			<div class="fourtitle"><h2>5.3.2 厂界无组织废气检测结果（二）</h2></div>
			<table border="1" class="layui-table result3-2-table">
				
			</table>
			<div class="threetitle"><h2>5.4 厂界噪声检测结果</h2></div>
			<table border="1" class="layui-table result4-table">
				
			</table>
			<div style="text-align:center;font-size:24px;padding-bottom:5px;font-weight:bolder;">
				<i>编制人：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>审核人：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>签发人：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
			<div style="text-align:center;font-size:24px;padding-bottom:5px;font-weight:bolder;">
				<i>日&emsp;期：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>日&emsp;期：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
				<i>日&emsp;期：</i><i>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</i>&emsp;
			</div>
			<div style="text-align:center;font-size:14px;padding:5px 0;">
				<i>*** 报告结束 ***</i>
			</div>
		</div>
		<div class="bottom">
			<button class="layui-btn" onclick="print()">
				<i class="layui-icon layui-icon-fonts-clear"></i> 打印
			</button>
		</div>
		<script>
			var currency_id = '${param.currency_id}';
			var currency_type = '${param.currency_type}';
			// 表格一 :基本信息
			$.ajax({
				url:'',
				type:'post',
				data:{"currency_id":currency_id},
				dataType:'JSON',
				success:function(res){
					$('#company').text(); //委托单位
					$('#adress').text(); //委托单位地址
					$('#client').text(); //委托人
					$('#phone').text(); //联系电话
					$('#source').text(); //样品来源
					$('#purpose').text(); //检测目的
					$('#sampling_date').text(); //采样日期
					$('#analysis_date').text(); //分析日期
					$('#state').text(); //样品状态
					$.ajax({
                        url : ""
                        ,type : "post"
                        ,data : {}
                        ,dataType : "JSON"
                        ,success:function (res) {
                        	var html = '';
                            $.each(res.data,function(index,item){
                                html += '<tr>'
                                    +		'<td>'+item.检测点位+'</td>'
                                    +		'<td colspan=3>'+item.检测项目+'</td>'
                                    +		'<td>'+item.检测频次+'</td>'
                                    +	'</tr>';
                            });
                            $('#content>table.message-table>tbody').append(html);
						}
					});
				}
			});
			// 表格二:检测技术规范依据
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var currentClass = '', currentRow = 1;
                    $.each(res.data,function(index,item){
                        var html = '<tr>';
                        //合并单元格
                        if(currentClass != item.检测类别){
                        	html +=	'<td rowspan=1>'+item.检测类别+'</td>';
                        	currentClass = item.检测类别;
                        	currentRow = 1;
                        }else{
                        	$('#content>table.standard-table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(++currentRow));
                        }
                        html +=		'<td>'+item.检测项目+'</td>'
                             +		'<td>'+item.检测方法+'</td>'
                             +		'<td>'+item.方法依据+'</td>'
                             +		'<td>'+item.检出限+'</td>'
                             +		'<td>'+item.单位+'</td>'
                             +	'</tr>';
                        $('#content>table.standard-table>tbody').append(html);
                    });
				}
			});
			//表格三：检测仪器
			$.ajax({
				url:'',
				type:'post',
				data:{"currency_id":currency_id},
				dataType:'JSON',
				success:function(res){
					$.ajax({
                        url : ""
                        ,type : "post"
                        ,data : {}
                        ,dataType : "JSON"
                        ,success:function (res) {
                        	var html = '';
                            $.each(res.data,function(index,item){
                                html += '<tr>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +	'</tr>';
                            });
                            $('#content>table.testing-instrument-table>tbody').append(html);
						}
					});
				}
			});
			//表格四：检测期间参数统计表
			//4.1
			$.ajax({
				url:'',
				type:'post',
				data:{"currency_id":currency_id},
				dataType:'JSON',
				success:function(res){
					$.ajax({
                        url : ""
                        ,type : "post"
                        ,data : {}
                        ,dataType : "JSON"
                        ,success:function (res) {
                        	var html = '';
                            $.each(res.data,function(index,item){
                                html += '<tr>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +	'</tr>';
                            });
                            $('#content>table.statistics1-table>tbody').append(html);
						}
					});
				}
			});
			//4.2
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var currentClass = '', currentRow = 1;
                    $.each(res.data,function(index,item){
                        var html = '<tr>';
                        //合并单元格
                        if(currentClass != item.检测点位){
                        	html +=	'<td rowspan=1>'+item.检测点位+'</td>'
	                        	 +		'<td rowspan=1>'+item.检测日期+'</td>'
	                             +		'<td>'+item.检测时间+'</td>'
	                             +		'<td>'+item.温度+'</td>'
	                             +		'<td>'+item.流速+'</td>'
	                             +		'<td>'+item.标干流量+'</td>'
	                             +		'<td>'+item.排气筒参数+'</td>'
	                             +	'</tr>';
                        	currentClass = item.检测点位;
                        	currentRow = 1;
                        }else{
                        	currentRow++;
                        	$('#content>table.statistics2-table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(currentRow));
                        	$('#content>table.statistics2-table>tbody>tr').eq(-currentRow).find('td').eq(1).attr('rowspan',(currentRow));
                        	$('#content>table.statistics2-table>tbody>tr').eq(-currentRow).find('td').eq(6).attr('rowspan',(currentRow));
                        	html +=		'<td>'+item.检测时间+'</td>'
	                             +		'<td>'+item.温度+'</td>'
	                             +		'<td>'+item.流速+'</td>'
	                             +		'<td>'+item.标干流量+'</td>'
	                             +	'</tr>';
                        }
                        $('#content>table.statistics2-table>tbody').append(html);
                    });
				}
			});
			//4.3
			$.ajax({
				url:'',
				type:'post',
				data:{"currency_id":currency_id},
				dataType:'JSON',
				success:function(res){
					$.ajax({
                        url : ""
                        ,type : "post"
                        ,data : {}
                        ,dataType : "JSON"
                        ,success:function (res) {
                        	var html = '';
                            $.each(res.data,function(index,item){
                                html += '<tr>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +		'<td>'+item.+'</td>'
                                    +	'</tr>';
                            });
                            $('#content>table.statistics3-table>tbody').append(html);
						}
					});
				}
			});
			// 表格五:检测结果
			// 5.1:废水检测结果
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var html = '';
                	var currentPoint = '', currentRow = 1;
                	var num = res.检测结果个数+1;//获取每行检测结果个数
                	var sum = 0;//计算结果平均值
                	html += '<colgroup>'
		            	 +		'<col width="100">'
		            	 +	    '<col width="100">';
		            for(var i=0;i<num;i++){
		            	html += '<col width="50">';
		            }	 
		            html +=	'</colgroup>'
		            	 +	'<tbody>'
		            	 +		'<tr>'
		            	 +			'<td rowspan=2>检测点位</td>'
		            	 +			'<td rowspan=2>检测项目</td>'
		            	 +			'<td colspan='+num+'>检测结果（mg/L）</td>'
		            	 +		'</tr>'
		            	 +		'<tr>';
		            for(var i=1;i<=num;i++){
		            	html +=		'<td>'+i+'</td>';
		            }
		            html +=			'<td>平均值</td>'
		            	 +		'</tr>';
		            $('#content>table.result1-table>tbody').append(html);html = 0;
		            $.each(res.data,function(index,item){
		            	html +=	'<tr>';
		            	//合并单元格
		                if(currentPoint != item.检测点位){
		                   	html +=	'<td rowspan=1>'+item.检测点位+'</td>';
		                   	currentPoint = item.检测点位;
		                   	currentRow = 1;
		                }else{
		                	$('#content>table.result1-table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(++currentRow));
		                } 
				        html +=		'<td>'+item.检测项目+'</td>';
				        $.each(data,function(index0,item0){
				        	html +=	'<td>'+item0.检测结果+'</td>';
				        	sum += Number(item0.检测结果);
				        }); 
						html +=		'<td>'+(sum/num)+'</td>'
				             +	'</tr>';
						$('#content>table.result1-table>tbody').append(html);html = 0;sum = 0;
		            });
		            html +=		'<tr>'
		            	 +			'<td>结论</td>'
		            	 +			'<td colspan='+(num+1)+'>仅提供数据，不作结论。</td>'
		            	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>备注</td>'
		            	 +			'<td colspan='+(num+1)+'><textarea id="remark" class="layui-textarea"></textarea></td>'
		            	 +		'</tr>'
		            	 +	'</tbody>';
                    $('#content>table.result1-table>tbody').append(html);
				}
			});
			//5.2
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var currentClass = '', currentRow = 1;
                	var count = res.data.length;//数据个数
                    $.each(res.data,function(index,item){
                        var html = '<tr>';
                        if(index == 0){
                        	html += '<td rowspan='+count+'>'+item.检测点位+'</td>'
                        }
                        //合并单元格
                        if(currentClass != item.检测项目){
                        	html +=	'<td rowspan=1>'+item.检测项目+'</td>'
	                        	 +	'<td>'+item.采样时间+'</td>'
	                             +	'<td>'+item.实测浓度+'</td>'
	                             +	'<td>'+item.平均浓度+'</td>'
	                             +	'<td>'+item.折算浓度+'</td>'
	                             +	'<td>'+item.排放速率+'</td>'
	                             + '</tr>';
                        	currentClass = item.检测项目;
                        	currentRow = 1;
                        }else{
                        	currentRow++;
                        	if(index == 0){
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(1).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(4).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(5).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(6).attr('rowspan',(currentRow));
                        	}else{
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(3).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(4).attr('rowspan',(currentRow));
                        		$('#content>table.result2-table>tbody>tr').eq(-currentRow).find('td').eq(5).attr('rowspan',(currentRow));
                        	}
                        	html +=	'<td>'+item.采样时间+'</td>'
	                         	 +	'<td>'+item.实测浓度+'</td>'
                            	 + '</tr>';
                        }
                        $('#content>table.result2-table>tbody').append(html);
                    });
                	html = '<tr>'
                		 +		'<td>结论</td>'
                		 +		'<td colspan=6>仅提供数据，不作结论</td>'
                		 +	'</tr>'
                		 +  '<tr>'
                    	 +		'<td>备注</td>'
                    	 +		'<td colspan=6>'+res.备注+'</td>'
                    	 +	'</tr>';
                	$('#content>table.result2-table>tbody').append(html);
				}
			});
			//5.3
			//5.3.1
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var html = '';
                	var currentPoint = '', currentRow = 1;
                	var num = res.检测结果个数;//获取每行检测结果个数
                	html += '<colgroup>'
		            	 +		'<col width="100">';
		            for(var i=0;i<num;i++){
		            	html += '<col width="80">';
		            }	 
		            html += 	'<col width="100">'
						 +	'</colgroup>'
		            	 +	'<tbody>'
		            	 +		'<tr>'
		            	 +			'<td rowspan=2>检测项目</td>'
		            	 +			'<td colspan='+num+'>检测结果（mg/m&sup3;）</td>'
		            	 +			'<td rowspan=2>限值（mg/m&sup3;）</td>'
		            	 +		'</tr>'
		            	 +		'<tr>';
		            for(var i=1;i<=num/2;i++){
		            	html +=		'<td>'+上风向+i+'</td>';
		            }
		            for(var i=num/2+1;i<=num;i++){
		            	html +=		'<td>'+下风向+i+'</td>';
		            }
		            html +=		'</tr>';
		            $('#content>table.result3-1-table>tbody').append(html);html = 0;
		            $.each(res.data,function(index,item){
		            	html +=	'<tr>'
		                	 +		'<td>'+item.检测项目+'</td>';
				        $.each(data,function(index0,item0){
				        	html +=	'<td>'+item0.检测结果+'</td>';
				        }); 
						html +=		'<td>'+item.限值+'</td>'
				             +	'</tr>';
						$('#content>table.result3-1-table>tbody').append(html);html = 0;
		            });
		            html +=		'<tr>'
	            	 	 +			'<td>点位图</td>'
	            	 	 +			'<td colspan='+num+'><textarea id="bitmap1" class="layui-textarea"></textarea></td>'
	            	 	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>结论</td>'
		            	 +			'<td colspan='+num+'>仅提供数据，不作结论。</td>'
		            	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>备注</td>'
		            	 +			'<td colspan='+num+'><textarea id="remark1" class="layui-textarea"></textarea></td>'
		            	 +		'</tr>'
		            	 +	'</tbody>';
                    $('#content>table.result3-1-table>tbody').append(html);
				}
			});
			//5.3.2
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var html = '';
                	var currentPoint = '', currentRow = 1;
                	var num = res.检测结果个数;//获取每行检测结果个数
                	var sum = 0;//计算结果平均值
                	html += '<colgroup>'
		            	 +		'<col width="100">'
		            	 +	    '<col width="80">';
		            for(var i=0;i<=num;i++){
		            	html += '<col width="50">';
		            }	 
		            html += 	'<col width="80">'
		            	 +	'</colgroup>'
		            	 +	'<tbody>'
		            	 +		'<tr>'
		            	 +			'<td rowspan=2>检测项目</td>'
		            	 +			'<td rowspan=2>检测点位</td>'
		            	 +			'<td colspan='+(num+1)+'>检测结果（mg/m&sup3;）</td>'
		            	 +			'<td rowspan=2>限值（mg/m&sup3;）</td>'
		            	 +		'</tr>'
		            	 +		'<tr>';
		            for(var i=1;i<=num;i++){
		            	html +=		'<td>'+i+'</td>';
		            }
		            html +=			'<td>平均值</td>'
		            	 +		'</tr>';
		            $('#content>table.result3-2-table>tbody').append(html);html = 0;
		            $.each(res.data,function(index,item){
		            	html +=	'<tr>';
		            	//合并单元格
		                if(currentPoint != item.检测项目){
		                   	html +=	'<td rowspan=1>'+item.检测项目+'</td>';
		                }else{
		                	currentRow++;
		                	$('#content>table.result3-2-table>tbody>tr').eq(-currentRow).find('td').eq(0).attr('rowspan',currentRow);
		                } 
				        html +=		'<td>'+item.检测点位+'</td>';
				        $.each(data,function(index0,item0){
				        	html +=	'<td>'+item0.检测结果+'</td>';
				        	sum += Number(item0.检测结果);
				        }); 
						html +=		'<td>'+(sum/num)+'</td>';
						//合并单元格
		                if(currentPoint != item.检测项目){
		                   	html +=	'<td rowspan=1>'+item.限值+'</td>';
		                   	currentPoint = item.检测项目;
		                   	currentRow = 1;
		                }else{
		                	$('#content>table.result3-2-table>tbody>tr').eq(-currentRow).find('td').eq(num+2).attr('rowspan',currentRow);
		                } 
				        html +=	'</tr>';
						$('#content>table.result3-2-table>tbody').append(html);html = 0;sum = 0;
		            });
		            html +=		'<tr>'
	            	 	 +			'<td>点位图</td>'
	            	 	 +			'<td colspan='+num+'><textarea id="bitmap2" class="layui-textarea"></textarea></td>'
	            	 	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>结论</td>'
		            	 +			'<td colspan='+num+'>仅提供数据，不作结论。</td>'
		            	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>备注</td>'
		            	 +			'<td colspan='+num+'><textarea id="remark2" class="layui-textarea"></textarea></td>'
		            	 +		'</tr>'
		            	 +	'</tbody>';
                    $('#content>table.result3-2-table>tbody').append(html);
				}
			});
			//5.4
			$.ajax({
                url : ""
                ,type : "post"
                ,data : {}
                ,dataType : "JSON"
                ,success:function (res) {
                	var html = '';
                	var currentPoint = '', currentRow = 1;
                	var num = res.检测结果个数;//获取每行检测结果个数
                	html += '<colgroup>'
		            	 +		'<col width="100">'
		            	 +	    '<col width="100">'
		            	 +		'<col width="50">'
		            	 +		'<col width="50">'
		            	 +		'<col width="50">'
		            	 +		'<col width="50">'
		            html += 	'<col width="80">'
		            	 +	'</colgroup>'
		            	 +	'<tbody>'
		            	 +		'<tr>'
		            	 +			'<td rowspan=2>检测日期</td>'
		            	 +			'<td rowspan=2>检测项目</td>'
		            	 +			'<td colspan=4>检测结果dB（A）</td>'
		            	 +			'<td rowspan=2>限值dB（A）</td>'
		            	 +		'</tr>'
		            	 +		'<tr>'
		           		 +			'<td>'+南界1#+'</td>'
		           		 +			'<td>'+东界2#+'</td>'
		           		 +			'<td>'+北界3#+'</td>'
		           		 +			'<td>'+西界4#+'</td>'
		            	 +			'<td>限值</td>'
		            	 +		'</tr>';
		            $('#content>table.result4-table>tbody').append(html);html = 0;
		            $.each(res.data,function(index,item){
		            	html +=	'<tr>'
		            		 +		'<td>'+item.检测日期+'</td>'
		            		 +		'<td>'+item.检测项目+'</td>';
				        $.each(data,function(index0,item0){
				        	html +=	'<td>'+item0.检测结果+'</td>';
				        }); 
						html +=		'<td>'+item.限值+'</td>';
							 +	'</tr>';
						$('#content>table.result4-table>tbody').append(html);html = 0;
		            });
		            html +=		'<tr>'
	            	 	 +			'<td>点位图</td>'
	            	 	 +			'<td colspan='+num+'><textarea id="bitmap4" class="layui-textarea"></textarea></td>'
	            	 	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>结论</td>'
		            	 +			'<td colspan='+num+'>仅提供数据，不作结论。</td>'
		            	 +		'</tr>'
		            	 +		'<tr>'
		            	 +			'<td>备注</td>'
		            	 +			'<td colspan='+num+'><textarea id="remark4" class="layui-textarea"></textarea></td>'
		            	 +		'</tr>'
		            	 +	'</tbody>';
                    $('#content>table.result4-table>tbody').append(html);
				}
			});
		</script>
		<script language="javascript">
			// 打印页面内容
			var text = $('#remark').text();
			$('#remark').parent().html(text);
			//5.3.1
			var text = $('#bitmap1').text();
			$('#bitmap1').parent().html(text);
			var text = $('#remark1').text();
			$('#remark1').parent().html(text);
			//5.3.2
			var text = $('#bitmap2').text();
			$('#bitmap2').parent().html(text);
			var text = $('#remark2').text();
			$('#remark2').parent().html(text);
			//5.4
			var text = $('#bitmap4').text();
			$('#bitmap4').parent().html(text);
			var text = $('#remark4').text();
			$('#remark4').parent().html(text);
			
			var basePath = "<%=basePath%>";
			function print(){
				$("#content").print(basePath,{});
		    }
		</script>
	</body>
</html>
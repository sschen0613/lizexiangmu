<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 试剂、标液领取打印 -->
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
		<script src="js/form_init.js"></script>
	</head>
	<body>
	<div id="content" class="content">
		<div class="sign"><i id="number"></i></div>
		<div class="title"><h2>试剂标液打印</h2></div>
		<form class="layui-form">
			<table border="1" class="layui-table">
				<colgroup>
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
				</colgroup>
				<tbody>
				<tr>
					<td>申请部门</td>
					<td id="currency_department"></td>
					<td>申请人</td>
					<td id="currency_person" ></td>
					<td>申请日期</td>
					<td id="currency_date" colspan=4></td>
				</tr>
				<tr>
					<td>申请类型</td>
					<td id="proposer_type"></td>
					<td>需求时间</td>
					<td id="require_date" colspan=4></td>
				</tr>
				<tr>
					<td>序号</td>
					<td>试剂/标液名称</td>
					<td>单位</td>
					<td>数量</td>
					<td>规格型号</td>
					<td>区域</td>
					<td>使用企业</td>
					<td>备注</td>
				</tr>
				</tbody>
			</table>
		</form>

	</div>
	<div class="bottom">
		<button class="layui-btn" onclick="print()">
			<i class="layui-icon layui-icon-fonts-clear"></i> 打印
		</button>
	</div>
		<script>
		//一般直接写在一个js文件中
			layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'], function(){
				var laydate = layui.laydate //日期
				,laypage = layui.laypage //分页
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form
				,layedit = layui.layedit;

				//表单更新渲染
				form.render();
				form.render('select');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' ,//指定元素
					//type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});

				inputRender();//input框自定义渲染
				   

                
    			//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);
				var currency_type = "${param.currency_type}";
				var currency_id = "${param.currency_id}";
				console.log(currency_id);
				console.log(currency_type);
				var i = 0;
				$.ajax({
					url:'Currency/selectReagentGet.action'
					,type:'post'
					,data:{"currency_type":currency_type,"currency_id":currency_id}
					,dataType:'JSON'
					,success:function (res) {
						$("#currency_department").text(res.data[0].department_name);
						$("#currency_person").text(res.data[0].staff_name);
						$("#currency_date").text(Format(res.data[0].currency_date,"yyyy-MM-dd"));
						$("#proposer_type").text(res.data[0].currency_string10);
						$("#require_date").text(Format(res.data[0].currency_date2,"yyyy-MM-dd"));

						$.ajax({
                            url:'Currency/selectCurrencyDetails.action'
                            ,type:'post'
                            ,data:{"currency_id":currency_id}
                            ,dataType:'JSON'
							,success:function (res) {
                                $.each(res.data,function (i,item) {
									i++;
									var remark = '';
									if (item.details_string11 != undefined){
										remark = item.details_string11;
									}
									var specifications_models = '';
                                    if (item.details_string6 != undefined){
                                        specifications_models = item.details_string6;
                                    }
                                    var html = '<tr>'
                                        +        '<td>'+i+'</td>'
                                        +        '<td>'+item.details_string5+'</td>'
                                        +		'<td>'+item.details_string7+'</td>'
                                        +		'<td>'+item.details_money+'</td>'
                                        +		'<td>'+specifications_models+'</td>'
                                        +		'<td>'+item.details_string8+'</td>'
                                        +		'<td>'+item.details_string9+'</td>'
                                        +		'<td>'+remark+'</td>'
                                        +	'</tr>';
                                    $('#content>form>table>tbody').append(html);
									console.log(html)
                                });

                            }
						});
                    }
				});

				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}
				// 第二级 - 根据区域获取使用企业

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
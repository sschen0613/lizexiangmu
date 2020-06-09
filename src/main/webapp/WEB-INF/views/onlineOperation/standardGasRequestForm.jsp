<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 标气申购申请单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan="8" class="table-h">标气申购申请单</th>
				</tr>
				<tr>
	 				<th colspan=8 style="text-align:right">流水号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
					<td>申请人</td>
					<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
					<td>申请部门</td>
					<td colspan=3><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请日期</td>
					<td><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>请购区域</td>
					<td colspan=3><select name="area" id="area" lay-filter="area" class="layui-select" disabled></select></td>
					<td>需求时间</td>
					<td colspan=3><input type="text" id="date1" name="require_date" class="layui-input" placeholder="请选择日期" lay-verify="required"></td>
				</tr>
				<tr>
					<td>区域名称</td>
					<td>企业站点名称</td>
					<td>标气类型</td>
					<td>浓度</td>
					<td>单位</td>
					<td>数量</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><select name="area" id="area1" lay-filter="area1" lay-search lay-verify="required"></select></td>
					<td><input type="text" name="enterprise" lay-verify="required"></td>
					<td><input type="text" name="standard_type" lay-verify="required"></td>
					<td><input type="text" name="potency" lay-verify="required"></td>
					<td><input type="text" name="unit" lay-verify="required" /></td>
					<td><input name="quantity" lay-verify="required" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')"></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
			<thead>
				<tr>
		 			<td colspan=8 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=8></th>
				</tr>
		 	</thead>
		</table>
		<div class="layui-form-item button-div">
			<div class="layui-input-block">
				<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
	        	<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>		
		</form>
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
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				   
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
                    $("#area").removeAttr("disabled");

					var flow_number = data.field.buy_number;//流水号
                    var area = $('#area').find('option:selected').text();	//地区
					var require_date = data.field.require_date;//需要时间


					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var area1 = $(item).find('select[name="area"]>option:selected').text();
						var enterprise = $(item).find('input[name="enterprise"]').val();
						var standard_type = $(item).find('input[name="standard_type"]').val();
						var potency = $(item).find('input[name="potency"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var quantity = Number($(item).find('input[name="quantity"]').val());

                        var remark = $(item).find('input[name="remark"]').val();

                        var obj = {'details_string5':enterprise,'details_string7':unit,'details_money':quantity
								,'details_string8':area1,'details_string9':standard_type,'details_string10':potency,'details_string11':remark};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"//数据接口
				 		,type : "post"
				 		,data : {
				 		     "currency_number":flow_number,
				 		     "currency_date2":require_date,
				 		     "currency_type":55,
				 		     "currency_string10":area,
                             "currencyDetails":JSON.stringify(currentDetails)
						}
				 		,dataType : "JSON"
				 		,beforeSend: function(){
				 			layer.msg('正在提交申请', {
				 				icon: 16
				 				,shade: 0.01
				 			});
				 		}
				 		,success : function(result){
				 			layer.msg(result.msg);
                            $('#myForm').addClass('layui-btn-disabled');
                            $('#myForm').attr("disabled",'disabled');
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});
                
    			//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";

				setApplyMessage(staffName,departmentId);

				// 第一级 - 获取区域
				var area_name_html = '';//保存区域下拉列表框
				$.ajax({
                    url:'System/getRegion.action',
                    type:'post',
                    data:{},
                    dataType:'JSON',
                    success:function(res){
                        var html = '<option value="">请选择区域</option>';
                        $.each(res.data,function(index,item){
                            html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
                        });
                        area_name_html = html;
                        $('#area').html(html);
                        $('#area1').html(html);
                        $('#area').val(areaid);
                        form.render('select');
                    }
                });

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
                        	 +	'<td><select name="area" id="area'+d_count+'" lay-filter="area'+d_count+'" lay-search lay-verify="required">'+area_name_html+'</select></td>'
							 +	'<td><input type="text" name="enterprise" lay-verify="required"></td>'
							 +	'<td><input type="text" name="standard_type" lay-verify="required"></td>'
							 +	'<td><input type="text" name="potency" lay-verify="required"></td>'
							 +	'<td><input type="text" name="unit" lay-verify="required" /></td>'
							 +	'<td><input type="number" name="quantity" lay-verify="required"></td>'
                        	 +	'<td><input type="text" name="remark" ></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					//input框自定义渲染
					inputRender();
					form.render();
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				    //getEnterprise(index);//根据区域获取使用企业
				}
				//行删除事件
                function deleteItem($demo){
                	deleteDetailsItem2($demo);
                }
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}

			});
		</script> 
	</body>
</html>
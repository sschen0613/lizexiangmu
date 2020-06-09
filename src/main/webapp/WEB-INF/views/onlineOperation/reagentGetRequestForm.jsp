<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 试剂、标液领取申请单 -->
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
					<th colspan="9" class="table-h">试剂、标液领取申请单</th>
				</tr>
				<tr>
	 				<th colspan=9 style="text-align:right">流水号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
					<td>申请部门</td>
					<td colspan=4><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请人</td>
					<td colspan=3><input type="text" name="currency_applicant" id="staffName" readonly></td>	 					
		 		</tr>
		 		
				<tr>
					<td>申请类型</td>
					<td colspan=8>
						<input type="radio" name="proposer_type" value="试剂配置" title="试剂配置" checked>
						<input type="radio" name="proposer_type" value="标液配制" title="标液配制">
						<input type="radio" name="proposer_type" value="药品申领" title="药品申领">
					</td>
				</tr>
				<tr>
					<td>申请日期</td>
					<td colspan=3><input type="text" name="currency_date" id="date" readonly></td>
					<td>需求时间</td>
					<td colspan=4><input type="text" id="date1" name="require_date" class="layui-input" placeholder="请选择日期" lay-verify="required"></td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td>领取日期</td> -->
<!-- 					<td colspan=7><input type="text" name="get_date" class="layui-input date-revise" id="date2" placeholder="请选择日期"></td> -->
<!-- 				</tr> -->
		 		<%--<tr>
					<td>领取确认</td>
					<td><input type="text" id='get_affirm' name="get_affirm"></td>
					<td>领取人</td>
					<td><input type="text" id='get_person' name="get_person"></td>
					<td>领取日期</td>
					<td colspan=2><input type="text" name="get_date" class="layui-input date-revise" id="date1" placeholder="请选择日期"></td>
				</tr>--%>
				<tr>
					<td>序号</td>
					<td>试剂/标液名称</td>
					<td>单位</td>
					<td>数量</td>
					<td>规格型号</td>
					<td>区域</td>
					<td>使用企业</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="number" value="1" readonly></td>
					<td><input type="text" name="product_name" lay-verify="required"></td>
					<td><input type="text" name="unit" lay-verify="required"></td>
					<td><input type="text" id="buy_quantity1" name="buy_quantity" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required"></td>
					<td><input type="text" name="specifications_models"></td>
					<td><select name="area" id="area1" lay-filter="area1" lay-search lay-verify="required"></select></td>
					<td><select name="enterprise" id="enterprise1" lay-filter="enterprise1" lay-search lay-verify="required" lay-verify="required"></select></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
			<thead>
				<tr>
		 			<td colspan=9 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=9></th>
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
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var flow_number = data.field.buy_number;//流水号
					var proposer_type = data.field.proposer_type;//申请类型
					var require_date = data.field.require_date;//需要时间
					console.log(require_date);
					//var get_affirm = data.field.get_affirm;//确认领取
					//var get_person = data.field.get_person;//领取人
					//var get_date = data.field.get_date;//领取日期


					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var number = $(item).find('input[name="number"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var area = $(item).find('select[name="area"]>option:selected').text();

                        var enterprise = $(item).find('select[name="enterprise"]>option:selected').text();

                        var remark = $(item).find('input[name="remark"]').val();
                        var specifications_models = $(item).find('input[name="specifications_models"]').val();

                        var obj = {'details_string5':product_name,'details_string7':unit,'details_money':quantity,'details_string6':specifications_models
								,'details_string8':area,'details_string9':enterprise,'details_string11':remark};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"//数据接口
				 		,type : "post"
				 		,data : {
				 		     "currency_number":flow_number,
				 		     "currency_date2":require_date,
				 		     "currency_type":22,
				 		     "currency_string10":proposer_type,
				 		     //"currency_int6":get_affirm,
				 		     //"currency_string8":get_person,
				 		     //"currency_date3":get_date,
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
                        $('#area1').html(html);
                        form.render('select');
                    }
                });

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
				 			 +	'<td><input type="text" name="product_name" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="unit" lay-verify="required"></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")"></td>'
							 +	'<td><input type="text" name="specifications_models"></td>'
				 			 +	'<td><select name="area" id="area'+d_count+'" lay-filter="area'+d_count+'" lay-search lay-verify="required">'+area_name_html+'</select></td>'
				 			 +	'<td><select name="enterprise" id="enterprise'+d_count+'" lay-filter="enterprise'+d_count+'" lay-search lay-verify="required"></select></td>'
							 +  '<td><input type="text" name="remark"></td>'
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
				    getEnterprise(index);//根据区域获取使用企业
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
				// 第二级 - 根据区域获取使用企业
                function getEnterprise(index){
                	form.on('select(area'+index+')', function(data) {
                        var cDCCode = data.value;
                        $.ajax({
                            url: 'System/selectUser.action',
                            type: 'post',
                            data: {"cDCCode": cDCCode},
                            dataType: 'JSON',
                            success: function (res) {
                                var html = '<option value="">请选择使用企业</option>';
                                $.each(res.data, function (index, item) {
                                    html += '<option value="' + item.cCusCode + '" data-cCusPPerson="' + item.cCusPPerson + '">' + item.cCusName + '</option>'
                                });
                                $('#enterprise'+index).html(html);
                                form.render('select');
                            }
                        });
                    });
                }

			});
		</script> 
	</body>
</html>
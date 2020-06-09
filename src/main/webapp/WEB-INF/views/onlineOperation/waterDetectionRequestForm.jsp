<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 技术支持申请表 -->
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
					<th colspan="6" class="table-h">水样检测申请表</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">流水号：<input type="text" id='buy_number' name="buy_number"> </th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
				<tr>
					<td>申请区域</td>
					<td><select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select></td>
					<td>企业名称</td>
					<td colspan="3"><select name="company_name" id="company_name" lay-filter="company_name" class="layui-select" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>采样日期</td>
					<td><input type="text" name="sampling_date" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
					<td>计划检测日期</td>
					<td><input type="text" name="plan_date" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
					<td>计划完成日期</td>
					<td><input type="text" name="plan_accomplishDate" class="layui-input" id="date4" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
				</tr>
		 		<tr>
					<td colspan="3">检测项目</td>
					<td colspan="2">检测数量</td>
					<td>操作</td>	
				</tr>
				<tr class="details">
					<td colspan="3"><select id="detection_item" name="detection_item" lay-search lay-verify="required">
						<option value="">请选择</option>
						<option value="COD">COD</option>
						<option value="氨氮">氨氮</option>
						<option value="总磷">总磷</option>
						<option value="总氮">总氮</option>
						<option value="汞">汞</option>
						<option value="镍">镍</option>
						<option value="悬浮物">悬浮物</option>
						<option value="溶解性总固体">溶解性总固体</option>
						<option value="PH">PH</option>
					</select></td>
					<td colspan="2"><input type="number" id="detection_number" name="detection_number" lay-verify="required"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
			<thead>
				<tr>
		 			<td colspan=6 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=6></th>
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
					type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
                laydate.render({
                    elem: '#date2'
                });
                laydate.render({
                    elem: '#date3'
                });
                laydate.render({
                    elem: '#date4'
                });
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}var area_id = data.field.area;
                    var area_id = data.field.area;													//区域编号
                    var area_name = $('#area').find('option:selected').text();						//区域名称
                    var company_id = data.field.company_name;										//客户编号
                    var company_name = $('#company_name').find('option:selected').text();			//客户名称
                    var sampling_date = data.field.sampling_date; 									//采样日期
                    var plan_date = data.field.plan_date; 											//计划检测日期
                    var plan_accomplishDate = data.field.plan_accomplishDate; 						//计划完成日期
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var detection_item = $(item).find('select[name="detection_item"]').find('option:selected').text();	//检测项目类别
                        var detection_number = $(item).find('input[name="detection_number"]').val();						//检测数量
						var obj = {'details_string2':detection_item,'details_money3':detection_number};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			'currency_type':66,
                            'currency_int':1,//对接入样品管理员下发数据
                            'currency_string2':area_name,
                            'currency_string4':area_id,
                            'currency_string5':company_id,
                            'currency_string7':company_name,
                            'currency_date2':plan_date,
                            'currency_date3':plan_accomplishDate,
                            'currency_date4':sampling_date,//采样日期
				 			'currencyDetails':JSON.stringify(currentDetails)}
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

                // 过程一第一级 - 获取登陆人区域
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
                        $('#area').html(html);
                        form.render('select');
                    }
                });
                // 过程一第二级 - 根据区域获取客户名称
                form.on('select(area)', function(data){
                    var cDCCode = data.value;
                    $.ajax({
                        url:'System/selectUser.action',
                        type:'post',
                        data:{"cDCCode": cDCCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择客户名称</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.cCusCode+'">'+item.cCusName+'</option>'
                            });
                            $('#company_name').html(html);
                            form.render('select');
                        }
                    });
                });
                
                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
							 +	'<td colspan="3"><select id="detection_item" name="detection_item" lay-filter="detection_item" lay-search lay-verify="required">'+
							 		'<option value="">==请选择==</option>' +
							 		'<option value="COD">COD</option>' +
							 		'<option value="氨氮">氨氮</option>' +
							 		'<option value="总磷">总磷</option>' +
							 		'<option value="总氮">总氮</option>' +
							 		'<option value="汞">汞</option>' +
                        	 		'<option value="镍">镍</option>' +
                        	 		'<option value="悬浮物">悬浮物</option>' +
                        	 		'<option value="溶解性总固体">溶解性总固体</option>' +
                        			'<option value="PH">PH</option>' +
							 '</select></td>'
				 			 +	'<td colspan="2"><input type="number" id="detection_number" name="detection_number" lay-verify="required"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
					form.render('select');
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
				//行删除事件
                function deleteItem($demo){
                	deleteDetailsItem1($demo);
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
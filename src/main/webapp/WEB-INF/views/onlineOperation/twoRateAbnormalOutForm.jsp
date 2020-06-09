<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 两率异常剔除申请流程单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" href="formselect/formSelects-v4.css" />
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="formselect/formSelects-v4.min.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan="6" class="table-h">两率异常剔除申请流程单</th>
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
					<td>运维人</td>
					<td><input type="text" id='operation_person' name="operation_person"></td>	
					<td>站点名称</td>
					<td><input type="text" id='site_name' name="site_name"></td>
					<td>剔除项目</td>
	                <td>
						<select id='equipment_type' name="equipment_type" xm-select="selectId" xm-select-skin="default" lay-verify="required">
							<option value="">请选择</option>
							<option value="COD">COD</option>
							<option value="氨氮">氨氮</option>
							<option value="TP">TP</option>
							<option value="TN">TN</option>
							<option value="废水流量计">废水流量计</option>
							<option value="二氧化硫">二氧化硫</option>
							<option value="NOX">NOX</option>
							<option value="颗粒物">颗粒物</option>
							<option value="烟气流量">烟气流量</option>
							<option value="其他">其他</option>
						</select>
					</td>
			    </tr>
				<tr>
					<td>责任部门</td>
					<td colspan="2"><select id='duty_department' name="duty_department" lay-filter="duty_department" lay-search lay-verify="required"></select></td>
					<td>异常时间段</td>
					<td colspan="2">
						<div class="layui-inline time-ranges">
							<input type="text" name="date1" class="layui-input" id="date1" placeholder="选择开始时间" autocomplete="off" lay-verify="required">
							&nbsp;-&nbsp;
							<input type="text" name="date2" class="layui-input" id="date2" placeholder="选择结束时间" autocomplete="off" lay-verify="required">
						</div>
					</td>					
				</tr>
				<tr>
					<td>异常情况描述</td>
					<td colspan="5"><input type="text" id='abnormity_describe' name="abnormity_describe" placeholder="请务必填写异常情况" lay-verify="required"></td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan="5"><input type="text" id='remark' name="remark" placeholder="剔除项目选其他时填写"></td>
				</tr>
			</tbody>
			<thead>
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
                var formSelects = layui.formSelects;
				//表单更新渲染
				form.render();
				form.render('select');
                formSelects.render('selectId');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function(value, date, endDate){
				    	// console.log(value); //得到日期生成的值
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#date2').val() != ''){
				    		$('#date2').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1').val('');}); 
				    	}
				    }
				});
				laydate.render({
					elem: '#date2' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				    	}
			        }
				});
				inputRender();//input框自定义渲染
				    
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var operation_person = data.field.operation_person;
					var site_name = data.field.site_name;
                    var equipment_type = formSelects.value('selectId', 'valStr');						//剔除类型
					var duty_department = $('#duty_department').find('option:selected').text();
					var abnormity_startDate = data.field.date1; //异常时间段
                    var abnormity_endDate = data.field.date2;
					var abnormity_describe = data.field.abnormity_describe;
                    var remark = data.field.remark;
					$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':42,
                            'currency_string3':operation_person,
                            'currency_string4':site_name,
                            'currency_string8':equipment_type,
                            'currency_string9':duty_department,
                            'currency_string5':abnormity_startDate+"到"+abnormity_endDate,
							'currency_string7':abnormity_describe,
                            'currency_string10':remark,
							'currency_date2':abnormity_startDate,
							'currency_date3':abnormity_endDate
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
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

                /*//设备类型
                var equipment_type_name_html = '';//设备类型下拉列表框
                $.ajax({
                    url:'System/selectInvTypeByCode.action',
                    type:'post',
                    data:{"type":"01"},
                    dataType:'JSON',
                    success:function(res){
                        var html = '<option value="">请选择设备类型</option>';
                        $.each(res.data,function(index,item){
                            console.log(item.cInvCName);
                            html += '<option value="'+item.cInvCName+'">'+item.cInvCName+'</option>';
                        });
                        equipment_type_name_html = html;
                        $('#equipment_type').html(html);
                        form.render('select');
                    }
                });*/
                //查询所有部门
                $.ajax({
                    url : "Department/selectDingAllDepartment.action",
                    type : "post",
                    data : {},
                    dataType : "JSON",
                    success : function(res){
                        var html = '<option value="">请选择部门</option>';
                        $.each(res.data,function(index,item){
                            html += '<option value="'+item.ding_depmid+'">'+item.department_Name+'</option>';
                        });
                        $('#duty_department').html(html);
                        form.render('select');
                    }
                });
                //操作
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
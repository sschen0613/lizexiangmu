<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--运维企业技术支持检测任务申请表 -->
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
			<th colspan="6" class="table-h">运维企业技术支持检测任务申请表</th>
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
			<td>区域</td>
			<td><select name="area" id="area" lay-filter="area" lay-search lay-verify="required"></select></td>
			<td>企业名称</td>
			<td><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
			<td>站点名称</td>
			<td><input type="text" id="site_name" name="site_name"></td>
		</tr>
		<tr>
			<td>检测项目</td>
			<td colspan="2">
				<select id="test_project" name="test_project" lay-filter="test_project" lay-search lay-verify="required">
					<option value="">==请选择==</option>
					<option value="SO2、NOx、O2">SO2、NOx、O2</option>
					<option value="颗粒物">颗粒物</option>
					<option value="流速、排放量">流速、排放量</option>
					<option value="烟温">烟温</option>
					<option value="湿度">湿度</option>
					<option value="HCL">HCL</option>
					<option value="CO">CO</option>
					<option value="PH">PH</option>
					<option value="水温">水温</option>
					<option value="流量">流量</option>
					<option value="VOCs">VOCs</option>
				</select>
			</td>
			<td>检测需求日期</td>
			<td colspan="2"><input type="text" name="test_date" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<td>申请原因</td>
			<td colspan="5"><input type="text" name="apply_reason"></td>
		</tr>
		</tbody>
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
            elem: '#date3'
        });
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			var area_id = data.field.area;													//区域编号
			var area_name = $('#area').find('option:selected').text();						//区域名称
			var customer_id = data.field.customer_name;										//站点编号
			var customer_name = $('#customer_name').find('option:selected').text();			//站点名称
			var site_name = data.field.site_name;
			var test_project = data.field.test_project;											//检测项目
            var test_date = data.field.test_date; 											//检测需求日期
            var apply_reason = data.field.apply_reason; 									//申请原因


            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':80,
                    'currency_string2':area_id,
					'currency_string3':area_name,
					'currency_string4':customer_id,
                    'currency_string5':customer_name,
                    'currency_string7':test_project,
					'currency_string8':apply_reason,
					'currency_string9':site_name,
                    'currency_date2':test_date
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
		//地区
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
		form.on('select(area)', function(data) {
			var cDCCode = data.value;
			$.ajax({
				url: 'System/selectUser.action',
				type: 'post',
				data: {"cDCCode": cDCCode},
				dataType: 'JSON',
				success: function (res) {
					var html = '<option value="">请选择站点名称</option>';
					$.each(res.data, function (index, item) {
						html += '<option value="' + item.cCusCode + '" data-cCusPPerson="' + item.cCusPPerson + '">' + item.cCusName + '</option>'
					});
					$('#customer_name').html(html);
					form.render('select');
				}
			});
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
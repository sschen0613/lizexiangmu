<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--运维检测任务申请表 -->
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
			<th colspan="6" class="table-h">技术支持性检测任务申请表</th>
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
			<td>检测内容</td>
			<td>
				<select name="test_content" id="test_content" lay-filter="test_content" class="layui-select" lay-search lay-verify="required">
					<option value="气">气</option>
					<option value="水">水</option>
				</select>
			</td>
			<td>计划检测日期</td>
			<td><input type="text" name="plan_date" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
			<td>计划完成日期</td>
			<td><input type="text" name="plan_accomplishDate" class="layui-input" id="date4" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<td>客户名称</td>
			<td><select name="client_name" id="client_name" lay-filter="client_name" lay-search lay-verify="required"></select></td>
			<td>检测类型</td>
			<td><select id="type" name="type" lay-filter="type" lay-search lay-verify="required">
				<option value="">==请选择==</option>
				<option value="设备校验">设备校验</option>
				<option value="常规检测">常规检测</option>
			</select></td>
			<td>采样类型</td>
			<td><select id="sampleType" name="sampleType" xm-select="selectId" xm-select-skin="default" lay-verify="required">
				<option value="">==请选择==</option>
				<option value="超低有组织废气">超低有组织废气</option>
				<option value="非超低有组织废气">非超低有组织废气</option>
				<option value="PH计">PH计</option>
				<option value="水温计">水温计</option>
				<option value="流量计">流量计</option>
			</select>
			</td>
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
        laydate.render({
            elem: '#date4'
        });
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			var test_content = $('#test_content').find('option:selected').text();
            var plan_date = data.field.plan_date; 											//计划检测日期
            var plan_accomplishDate = data.field.plan_accomplishDate; 						//计划完成日期
            var client_name = $('#client_name').find('option:selected').text();				//客户名称
            var type = $('#type').find('option:selected').text();							//检测类型
            //var sampleType = $('#sampleType').find('option:selected').text();				//采样类型
			var sampleType = formSelects.value('selectId', 'valStr');						//采样类型

            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':41,
                    'currency_int':0,//对接入信泽采样流程
                    'currency_int2':1,//对接入信泽采样流程
                    'currency_string2':client_name,
                    'currency_string5':test_content,
                    'currency_string8':type,
                    'currency_string7':sampleType,
                    'currency_date3':plan_date,
                    'currency_date2':plan_accomplishDate
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
        //客户
        $.ajax({
            url:'System/selectAllUser.action',
            type:'post',
            data:{},
            dataType:'JSON',
            success:function(res){
                var html = '<option value="">请选择客户</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.cCusCode+'">'+item.cCusName+'</option>';
                });
                $('#client_name').html(html);
                form.render('select');
            }
        });
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
                $('#taskGet_department').html(html);
                form.render('select');
            }
        });
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
                        html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'">'+item.cCusName+'</option>'
                    });
                    $('#customer_name').html(html);
                    form.render('select');
                }
            });
            form.render();
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
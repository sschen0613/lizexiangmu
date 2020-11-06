<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测任务表领取 -->
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
	<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
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
				<th colspan=9 class="table-h">逾期处理申请</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>申请科室</td>
			<td colspan=4>
				<select id="apply_dep" name="apply_dep" lay-filter="apply_dep" lay-search lay-verify="required">
					<option value="">==请选择==</option>
					<option value="现场科">现场科</option>
					<option value="检测科">检测科</option>
					<option value="质控科">质控科</option>
				</select>
			</td>
			<td>申请理由</td>
			<td colspan=4><input type="text" id="apply_reason" name="apply_reason" lay-verify="required"></td>
		</tr>
		</tbody>
		<thead>
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

        inputRender();//input框自定义渲染
		var staff_Id ="${sessionScope.systemStaff.staff_Id }";//获取当前登录用户id;
		var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称

        //表单数据初始化
        var currency_id = '${param.currency_id}';

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			var apply_dep =  data.field.apply_dep;//申请科室
            var apply_reason =  data.field.apply_reason;//申请理由

            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                	'currency_type':49,
                	'currency_int':currency_id,//45
					'currency_string2':apply_dep,//报告编码
					'currency_string3':apply_reason,//报告类型
					'currency_string4':staff_Id,
                    'currency_string5':staffName,//当前操作人
                }
                ,dataType : "JSON"
                ,beforeSend: function(){
                    layer.msg('正在确认领取', {
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
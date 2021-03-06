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
				<th colspan=9 class="table-h">报告新增</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>报告编码</td>
			<td colspan=4><input type="text" id="report_code" name="report_code" lay-verify="required"></td>
			<td>报告类型</td>
			<td colspan=4>
				<select id="report_type" name="report_type" lay-filter="report_type" lay-search lay-verify="required">
					<option value="">==请选择==</option>
					<option value="一类">一类</option>
					<option value="二类">二类</option>
					<option value="三类">三类</option>
					<option value="四类">四类</option>
				</select>
			</td>
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
		var currency_string3 = '${param.currency_string3}';//报告编码
		var currency_string4 = '${param.currency_string4}';//报告类型
		initReport(currency_string3,currency_string4);

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			var report_code =  data.field.report_code;//报告编码
            var report_type =  data.field.report_type;//报告类型

            $.ajax({
                url : "Xinze/testingReportAdd.action"
                ,type : "post"
                ,data : {
                	'currency_id':currency_id,
					'details_string':report_code,//报告编码
					'details_string2':report_type,//报告类型
					'details_string3':staff_Id,
                    'details_string4':staffName,//当前操作人
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

        function initReport(report_code,report_type){
        	$("#report_code").val(report_code);
        	var oneArr = ["自行检测","常规检测","扩展报告","室内空气检测","实验室间比对、能力验证、参考结果报告"];
			var twoArr = ["水在线设备比对","水在线设备验收","气在线设备比对","气在线设备验收"];
			var threeArr = ["项目竣工验收"];
			var fourArr = ["环境影响评价","环境现状检测"];

        	if ($.inArray(report_type,oneArr) != -1){
				$("#report_type").find("option[value='一类']").attr("selected",true);
			}
			if ($.inArray(report_type,twoArr) != -1){
				$("#report_type").find("option[value='二类']").attr("selected",true);
			}
			if ($.inArray(report_type,threeArr) != -1){
				$("#report_type").find("option[value='三类']").attr("selected",true);
			}
			if ($.inArray(report_type,fourArr) != -1){
				$("#report_type").find("option[value='四类']").attr("selected",true);
			}
			form.render('select');
		}

    });
</script>
</body>
</html>
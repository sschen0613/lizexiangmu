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
				<th colspan=9 class="table-h">检测任务表</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			<td>检测类型</td>
			<td colspan=4>
				<select id="test_type" name="test_type" lay-filter="test_type" lay-search lay-verify="required">
					<option value="">==请选择==</option>
					<option value="常规检测">常规检测</option>
					<option value="称量检测">称量检测</option>
					<option value="有机、元素检测">有机、元素检测</option>
				</select>
			</td>
			<td>样品数量</td>
			<td colspan=4><input type="text" id="specimen_acount" name="specimen_acount" lay-verify="required"></td>
		</tr>
		<tr>
			<td>检测人</td>
			<td colspan="8">
				<select id="samplePerson" xm-select="selectId" xm-select-skin="default" lay-verify="required">

				</select>
			</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan="8">
				<input type="text" id="remark" name="remark">
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
			<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">领取</button>
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
        // form.render('checkbox');
        // form.render('redio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        /*var nowTime = new Date().valueOf();
        laydate.render({
            elem: '#date3' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            ,min: nowTime
        });*/
        inputRender();//input框自定义渲染

        //表单数据初始化
        //var currency_id = '${param.currency_id}';
        var detailsId = '${param.detailsId}';

        var staff_Id ="${sessionScope.systemStaff.staff_Id }";//获取当前登录用户id;

        //查询检测科人员
        $.ajax({
            url : "Xinze/selectXCStaff.action"
            ,type : "post"
            ,data : {
                'department_id':107655742
            }
            ,dataType : "JSON"
            ,success:function (res) {
                var staffHtml = '<option value="">请选择</option>';
                $.each(res.data,function (index,item) {
                    staffHtml += '<option value="'+item.staff_id+'">'+item.staff_name+'</option>'
                });
                $('#samplePerson').append(staffHtml);
                form.render();
                formSelects.render('selectId');
                var p = [staff_Id];
				formSelects.value('selectId',p);
            }
        });

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
			var test_type =  data.field.test_type;//检测类型等级
            var specimen_acount =  data.field.specimen_acount;//样品数量
            var testPersonId = formSelects.value('selectId', 'valStr');//检测人员
			var testPersonName = formSelects.value('selectId', 'nameStr');//检测人员
			var remark =  data.field.remark;//备注

            $.ajax({
                url : "Xinze/insertLingQuMsg.action"
                ,type : "post"
                ,data : {
					'detailsId':detailsId,
                	//'currency_id':currency_id,
                    'details_string3':staffName,//当前操作人
                    'details_string4':testPersonId,
					'details_string5':testPersonName,
					'details_string7':test_type,
                    'details_int3':specimen_acount,//样品数量
					'details_string6':remark
                    //,'details_money':id
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
        var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
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
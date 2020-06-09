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
		<tr>
			<th colspan=9 style="text-align:right">检测单号：<input type="text" id="number" name="number" readonly> </th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>检测项目</td>
			<td colspan="2"><input type="text" id="detection_program" name="detection_program" readonly></td>
			<td>样品编码</td>
			<td colspan=2><input type="text" id="specimen_number" name="specimen_number" readonly></td>
			<td>样品数量</td>
			<td colspan=2><input type="text" id="specimen_acount" name="specimen_acount" lay-verify="required"></td>
		</tr>
		<tr>
			<td>领样日期</td>
			<td colspan="8"><input name="receive_date" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<td>检测人</td>
			<td colspan="3">
				<select id="samplePerson" xm-select="selectId" xm-select-skin="default" lay-verify="required">

				</select>
			</td>
			<td>检测日期</td>
			<td colspan="4"><input name="testing_date" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<td>检测完成时间</td>
			<td colspan=8><input name="completion_date" type="text" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" readonly></td>
		</tr>
		<tr>
			<td>样品处理方式</td>
			<td colspan=8>
				<select name="processing_method" id="processing_method">
					<option value="留样">留样</option>
					<option value="处置">处置</option>
					<option value="退样">退样</option>
					<option value="其他">其他</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>备注</td>
			<td colspan=8><input type="text" id="remark" name="remark" ></td>
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
            elem: '#date1' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
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
        var currency_id = '${param.currency_id}';
        var currency_details_id = '${param.currency_details_id}';

        var staff_Id ="${sessionScope.systemStaff.staff_Id }";//获取当前登录用户id;
        $.ajax({
            url:'Xinze/selectCurrencyApply.action'
            ,type : "post"
            ,data : {"currency_id":currency_id}
            ,dataType : "JSON"
            ,success : function(result){
                //$("#sample_name").val(result.data.currency_string2);//样品名称
                $("#date3").val(Format(result.data.currency_date3,'yyyy-MM-dd'));//检测完成时间

                $.ajax({
                    url:'Xinze/selectCurrencyDetailById.action'
                    ,type:"post"
                    ,data:{"currency_details_id":currency_details_id}
                    ,dataType:"JSON"
                    ,success:function (res) {
                        console.log(res.data.details_int);
                        if(res.data.details_int !=null){
                            $("button:contains('领取')").addClass('layui-btn-disabled');
                        }
                        $("#detection_program").val(res.data.details_string2);//检测项目
                        $("#specimen_number").val(res.data.details_string);//样品编码
                        $("#specimen_acount").val(res.data.details_money3);//样品数量
                    }
                });
            }

        });

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

                //登录人赋值
                var str = new Array();
                str.push(Number(staff_Id));
                formSelects.value('selectId', str);
            }
        });

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var detection_program =  data.field.detection_program;//检测项目
            //var receive =  data.field.receive;//是否领取
            //var sample_name =  data.field.sample_name;//样品名称
            var specimen_number =  data.field.specimen_number;//样品编码
            var specimen_acount =  data.field.specimen_acount;//样品数量
            //var preservation_method =  data.field.preservation_method;//保存方法
            //var receiver =  data.field.receiver;//领样人
            var receive_date =  data.field.receive_date;//领样日期
            var testing_date =  data.field.testing_date;//检测日期
            var completion_date =  data.field.completion_date;//任务要求完成时间
            var processing_method = data.field.processing_method;//样品处理方式
            var remark =  data.field.remark;//备注

            var testPerson = formSelects.value('selectId', 'valStr');//检测人员

            $.ajax({
                url : "Xinze/insertLingQuMsg.action"
                ,type : "post"
                ,data : {
                    'currency_details_id':currency_details_id,
                    //'details_string7':preservation_method,
                    'details_string11':staffName,
                    'details_string8':receive_date,
                    'details_string12':testPerson,
                    'details_string9':testing_date,
                    'details_int3':specimen_acount,//样品数量
                    'details_string13':processing_method
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
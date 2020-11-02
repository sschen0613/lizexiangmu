<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测任务下发表 -->
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
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
			<th colspan="10" class="table-h">检测任务下发表</th>
		</tr>
		</thead>
		<tbody >
		<tr>
			<td>说明</td>
			<td colspan=9><input type="illustration" name="illustration" value="用于信泽有限公司业务科办理采样业务的下达任务表单" readonly></td>
		</tr>
		<tr>
			<td>下发部门</td>
			<td colspan="2"><input id='department' name="issued_department" class="layui-select" lay-filter="issued_department" lay-verify="required"  readonly/></td>
			<td>下发人</td>
			<td colspan="1"><input type="text" id='staffName' name="issued_person" lay-verify="required" readonly></td>
			<td>下发日期</td>
			<td colspan="4"><input type="text" name="issued_date" class="layui-input" id="date" placeholder="请选择日期" autocomplete="off" lay-verify="required" readonly></td>
		</tr>

		<tr>
			<td>采样任务编码</td>
			<td colspan="4"><input type="text" id="task_code" name="task_code"  autocomplete="off" lay-verify="required" readonly></td>
			<td>检测完成时间</td>
			<td colspan="4"><input name="date2" type="text" class="layui-input" lay-verify="required"></td>
		</tr>

		<tr>
			<th colspan="10" style="text-align: center;">检测任务流转</th>
		</tr>
		<tr>
			<td>序号</td>
			<td colspan="2">样品编码</td>
			<td colspan="4">检测项目</td>
			<td>样品数量</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<tr class="details">
			<td><input type="text" name="number" value="1" readonly></td>
			<td colspan="2"><input type="text" id="sample_code" name="sample_code" lay-verify="required"></td>
			<td colspan="4"><input type="text" id="detection_program" name="detection_program" lay-verify="required"></td>
			<td><input type="number" id="sample_number" name="sample_number" lay-verify="required"></td>
			<td><input type="text" name="remark"></td>
			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		</tr>
		</tbody>
		<thead>
		<tr>
			<td colspan=10 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		</tr>
		<tr>
			<th colspan=10></th>
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
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            ,done: function (value, date, endDate) {
                // console.log(value); //得到日期生成的值
                //结束日选好后，判断开始日期是否合法
                /*if($('#date1').val() != ''){
                    $('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date2').val('');});
                }*/
            }
        });


        //表单数据初始化填写
        var currency_id0 = '${param.currency_id}';//number类型
		var currency_type0 = '${param.currency_type0}';
		var currency_string70 = '';//报表编码
		var currency_number0 = '';//表单编码
		if (currency_type0 == 43){
            currency_string70 = '${param.currency_string7}';
            $("#task_code").val(currency_string70);
        }else{
            currency_number0 = '${param.currency_number}';
            $("#task_code").val(currency_number0);
        }
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var task_code =  data.field.task_code;//业务科下发任务编码
            var date2 =  data.field.date2;//检测完成时间

            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var number = $(item).find('input[name="number"]').val();//序号
                var sample_code = $(item).find('input[name="sample_code"]').val();//样品编码
                var detection_program = $(item).find('input[name="detection_program"]').val();//检测项目
                var sample_number = $(item).find('input[name="sample_number"]').val();//样品数量
                var remark = $(item).find('input[name="remark"]').val();//备注

                var obj = {
                    'details_int2':number,
                    //'details_string':detection_site,
                    'details_string':sample_code,//样品编码
                    'details_string2':detection_program,//检测项目
                    'details_money3':sample_number,//样品数量
                    'details_string6':remark
                };
                currentDetails.push(obj);
            });

            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':45,//暂时定为45=======================================================================================
                    'currency_string17':currency_id0,//对应检测科任务数据id43
                    'currency_string3':task_code,//对应检测科任务编码
                    //'currency_date2':date1,//交接时间
                    'currency_money':date2,//检测完成时间
                    'currency_int':2,//为了检测任务表时可查到该数据
                    'currencyDetails':JSON.stringify(currentDetails)
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
                  /*  $('#tForm').addClass('layui-btn-disabled');
                    $('#tForm').attr("disabled",'disabled');*/
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听重置按钮
        $('#resetForm').click(function(e){
            window.location.reload();
        });

        //数据初始化
        //获取申请人/申请部门/申请日期
        var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
        var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
        setApplyMessage(staffName,departmentId);

        //操作
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = '<tr class="details">'
                +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
				+	'<td colspan="2"><input type="text" id="sample_code'+d_count+'" name="sample_code" lay-verify="required"></td>'
                +	'<td colspan="4"><input type="text" id="detection_program'+d_count+'" name="detection_program" lay-verify="required"></td>'
                +	'<td><input type="number" id="sample_number'+d_count+'" name="sample_number" lay-verify="required"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                +	'</tr>';
            $('table.table-open>tbody').append(html);
            form.render();
            //渲染
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            inputLimitInteger($('#sample_number'+index));//监听检测频次只允许输入整数
            //inputLimitInteger($('#detection_days'+index));//监听检测天数只允许输入整数
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem2($demo);
        }


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
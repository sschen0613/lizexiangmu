<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样结果登记 -->
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
			<th colspan=11 class="table-h">采样结果登记表</th>
		</tr>
		<tr>
			<th colspan=11 style="text-align:right">采样单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>说明</td>
			<td colspan=10><input type="text" name="illustration" value="用于信泽有限公司现场科办理采样登记表单" readonly></td>
		</tr>
		<tr>
			<th colspan="11" style="text-align: center;">基本信息</th>
		</tr>
		<tr>
			<td>项目名称</td>
			<td colspan="3"><input type="text" name="program_name" id="program_name" readonly></td>
			<td>联系人</td>
			<td colspan="2"><input type="text" name="contact_person" id="contact_person" readonly></td>
			<td>联系电话</td>
			<td colspan="3"><input type="text" id="contact_phone" name="contact_phone" readonly></td>
		</tr>
		<tr>
			<td>委托单位地址</td>
			<td colspan=10><input type="text" id="entrust_adress" name="entrust_adress" readonly></td>
		</tr>
		<tr>
			<td>委托单位名称</td>
			<td colspan="4"><input type="text" name="entrust_name" id="entrust_name" readonly></td>
			<td colspan="2">报表编码</td>
			<td colspan="4"><input type="text" name="specimen_name" id="specimen_name" readonly></td>
		</tr>
		<tr>
			<td>采样完成时间</td>
			<td colspan="3"><input name="date1" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" readonly></td>
			<td>检测类型</td>
			<td colspan="2"><input type="text" id="type" name="type" readonly /></td>
			<td>协议完成时间</td>
			<td colspan="3"><input name="date2" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off"  readonly></td>
		</tr>
		<tr>
			<td>执行标准</td>
			<td colspan=10><input type="text" id="standard" name="standard"  readonly></td>
		</tr>
		<tr>
			<th colspan="11" style="text-align: center;">采样任务明细</th>
		</tr>
		<tr>
			<td>序号</td>
			<td>检测点位</td>
			<td>检测项目</td>
			<td>方法依据</td>
			<td>检测频次</td>
			<td>检测天数</td>
			<td>应采样数量</td>
			<td>已采样数量</td>
			<td>备注</td>
		</tr>
		<tr class="details">
			<td><input type="text" name="number" value="1" readonly></td>
			<td><input type="text" name="detection_site" readonly></td>
			<td><input type="text" name="detection_program" readonly></td>
			<td><input type="text" name="according" readonly></td>
			<td><input type="text" id="detection_frequency1" name="detection_frequency" readonly></td>
			<td><input type="text" id="detection_days1" name="detection_days" readonly></td>
			<td><input type="text" id="should_number1" name="should_number"></td>
			<td><input type="text" id="already_number1" name="already_number"></td>
			<td><input type="text" name="remark" readonly></td>
		</tr>
		</tbody>
		<%--<thead>
            <tr>
                <td colspan=11 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
            </tr>
            <tr>
                <th colspan=11></th>
           </tr>
        </thead>--%>
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

        detailsRender(1); //明细信息第一行自定义渲染事件
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var illustration =  data.field.illustration;//说明
            var program_name =  data.field.program_name;//项目名称
            var contact_person =  data.field.contact_person;//联系人
            var contact_phone =  data.field.contact_phone;//联系电话
            var entrust_adress =  data.field.entrust_adress;//委托单位地址
            var entrust_name =  data.field.entrust_name;//委托单位名称
            var specimen_name =  data.field.specimen_name;//样品名称
            var date1 =  data.field.date1;//任务下达时间
            var type =  data.field.type;//检测类型
            var date2 =  data.field.date2;//要求完成时间
            var standard =  data.field.standard;//执行标准



            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var number = $(item).find('input[name="number"]').val();
                var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位

                //检测项目及方法依据明细
                var itemsDetails = [];
                var detectionArray = $(item).find('td.detection_program>.items-details');//检测项目
                var accordingArray = $(item).find('td.according>.items-details');//方法依据
                $.each(detectionArray,function(index0,item0){
                    var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                    var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                    itemsDetails.push({'processName':detection_program,'methodBasis':according});
                });

                var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                var should_number = Number($(item).find('input[name="should_number"]').val());
                var already_number = Number($(item).find('input[name="already_number"]').val());
                var remark = $(item).find('input[name="remark"]').val();
                var obj = {
                    'details_int2':number,
                    'details_string':detection_site,
                    'details_string2':itemsDetails,
                    'details_int3':detection_frequency,
                    'details_int4':detection_days,
                    'details_money2':should_number,
                    'details_money3':already_number,
                    'details_string6':remark,
                };
                currentDetails.push(obj);
            });
            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':48,
                    'currency_id':currency_id,
                    'currency_string':illustration,
                    'currency_string2':program_name,
                    'currency_string3':contact_person,
                    'currency_string4':contact_phone,
                    'currency_string5':entrust_adress,
                    'currency_string10':entrust_name,
                    'currency_string7':specimen_name,
                    'currency_string17':currency_id,
                    'currency_date2':date1,
                    'currency_string8':type,
                    'currency_date3':date2,
                    'currency_string9':standard,
                    'currency_int':3,
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

        var currency_id = '${param.currency_id}';
        $.ajax({
            url : "Xinze/selectCurrencyApply.action"
            ,type : "post"
            ,data : {"currency_id":currency_id}
            ,dataType : "JSON"
            ,success : function(result){
                //layer.msg(result.msg);
                $("#program_name").val(result.data.currency_string2);
                $("#contact_person").val(result.data.currency_string3);
                $("#contact_phone").val(result.data.currency_string4);
                $("#entrust_adress").val(result.data.currency_string5);
                $("#entrust_name").val(result.data.currency_string10);
                $("#specimen_name").val(result.data.currency_string7);
                $("#date1").val(Format(result.data.currency_date2,"yyyy-MM-dd"));
                $("#type").val(result.data.currency_string8);
                $("#date2").val(Format(result.data.currency_date3,"yyyy-MM-dd"));
                $("#standard").val(result.data.currency_string9);

                $.ajax({
                    url : "Currency/selectCurrencyDetails.action"
                    ,type : "post"
                    ,data : {"currency_id":currency_id}
                    ,dataType : "JSON"
                    ,success:function (res) {
                        $('.details').remove();
                        $.each(res.data,function (index,item) {
                            var processHtml1 = '';
                            var processHtml2 = '';
                            $.ajax({
                                url:"Xinze/selectProcessByDetailsId.action"
                                ,type:"post"
                                ,data:{"details_id":item.currency_details_id}
                                ,success:function (res) {
                                    console.log(res);
                                    $.each(res.data,function (i,process) {
                                        processHtml1 +=
                                            '<div class="items-details">'
                                            +			'<input type="text" name="detection_program" value="'+process.processName+'" data-index="1" readonly>'
                                            +	'</div>'
                                        processHtml2+=
                                            '<div class="items-details">'
                                            +			'<input type="text" name="according" value="'+process.methodBasis+'" data-index="1" readonly>'
                                            +		'</div>'
                                    });
                                    console.log(processHtml1);
                                    console.log(processHtml2);
                                    ++d_count;
                                    var alreadyNum = 0;
                                    if(item.details_money3 != null){
                                        alreadyNum = item.details_money3;
                                    }
                                    var html = '<tr class="details">'
                                        +	'<td><input type="text" name="number" value="'+item.details_int2+'" readonly></td>'
                                        +	'<td><input type="text" name="detection_site" value="'+item.details_string+'" readonly></td>'
                                        +	'<td class="items detection_program">'
                                        +       processHtml1
                                        +	'</td>'
                                        +	'<td class="items according">'
                                        +		processHtml2
                                        +	'</td>'
                                        +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" readonly></td>'
                                        +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" readonly></td>'
                                        +	'<td><input type="text" id="should_number'+d_count+'" name="should_number" value="'+item.details_money2+'" readonly></td>'
                                        +	'<td><input type="text" id="already_number'+d_count+'" name="already_number" value="'+alreadyNum+'" readonly></td>'
                                        +	'<td><input type="text" name="remark" value="'+item.details_string6+'" readonly></td>'
                                        +	'</tr>';
                                    $('table.table-open>tbody').append(html);
                                    form.render();
                                }
                            });
                            console.log(processHtml1);
                        });
                    }
                });

            }
        });

        //操作
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = '<tr class="details">'
                +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
                +	'<td><input type="text" name="detection_site"></td>'
                +	'<td><input type="text" name="detection_program"></td>'
                +	'<td><input type="text" name="according"></td>'
                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency"></td>'
                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days"></td>'
                +	'<td><input type="text" id="should_number'+d_count+'" name="should_number"></td>'
                +	'<td><input type="text" id="already_number'+d_count+'" name="already_number"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'</tr>';
            $('table.table-open>tbody').append(html);
            //渲染
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            inputLimitInteger($('#detection_frequency'+index));//监听检测频次只允许输入整数
            inputLimitInteger($('#detection_days'+index));//监听检测天数只允许输入整数
            inputLimitNumber($('#should_number'+index));//监听应采样数量只允许输入数字
            inputLimitNumber($('#already_number'+index));//监听已采样数量只允许输入数字
            inputLimitNumber($('#thatday_number'+index));//监听当天采样数量只允许输入数字
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
        //监听电话输入框输入正确格式
        inputLimitPhone($('#contact_phone'));

    });
</script>
</body>
</html>
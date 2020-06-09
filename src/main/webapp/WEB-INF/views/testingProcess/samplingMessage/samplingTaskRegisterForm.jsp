<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样登记表 -->
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
			<th colspan=14 class="table-h">采样登记表</th>
		</tr>
		<tr>
			<th colspan=14 style="text-align:right">采样单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>说明</td>
			<td colspan=13><input type="text" name="illustration" value="用于信泽有限公司现场科办理采样登记表单" readonly></td>
		</tr>
		<tr>
			<th colspan="14" style="text-align: center;">基本信息</th>
		</tr>
		<tr>
			<td>项目名称</td>
			<td colspan="4"><input type="text" name="program_name" id="program_name" readonly></td>
			<td>采样人员</td>
			<td colspan="3">
				<select id="sample_person" name="sample_person" xm-select="selectId" xm-select-skin="default" lay-verify="required"></select>
			</td>
			<td>报表编码</td>
			<td colspan="4"><input type="text" name="specimen_name" id="specimen_name" readonly></td>
			<%--<td>联系人</td>
            <td colspan="3"><input type="text" name="contact_person" id="contact_person" readonly></td>
            <td>联系电话</td>
            <td colspan="4"><input type="text" id="contact_phone" name="contact_phone" readonly></td>--%>
		</tr>
		<%--<tr>
            <td>委托单位地址</td>
            <td colspan=13><input type="text" id="entrust_adress" name="entrust_adress" readonly></td>
        </tr>--%>
		<tr>
			<%--<td>委托单位名称</td>
            <td colspan="5"><input type="text" name="entrust_name" id="entrust_name" readonly></td>--%>

		</tr>
		<tr>
			<td>采样完成时间</td>
			<td colspan="4"><input name="date1" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" readonly></td>
			<td>检测类型</td>
			<td colspan="3"><input type="text" id="type" name="type" readonly /></td>
			<td>报告完成时间</td>
			<td colspan="4"><input name="date2" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off"  readonly></td>
			<input type="hidden" id="test_content">
		</tr>
		<%--<tr>
            <td>执行标准</td>
            <td colspan=13><input type="text" id="standard" name="standard"  readonly></td>
        </tr>--%>
		<tr>
			<th colspan="15" style="text-align: center;">采样任务明细</th>
		</tr>
		<tr>
			<td>序号</td>
			<td colspan="3">检测项目类别</td>
			<td>点位个数</td>
			<td>检测项目个数</td>
			<%--<td>检测点位</td>--%>
			<%--<td>检测项目</td>--%>
			<%--<td>方法依据</td>
            <td>限值</td>--%>
			<td>检测频次</td>
			<td>检测天数</td>
			<%--<td>应采样数量</td>
            <td>已采样数量</td>--%>
			<td>采样数量</td>
			<%--<td>未交接数量</td>--%>
			<td>备注</td>
			<%--<td>采样种类</td>--%>
			<td>流转</td>
		</tr>
		<tr class="details">
			<td><input type="text" name="number" value="1" readonly></td>
			<td colspan="3"><input type="text" id="program_type" name="program_type" readonly></td>
			<td><input type="number" id="site_number" name="site_number" lay-verify="required" readonly></td>
			<td><input type="number" id="program_number" name="program_number" lay-verify="required" readonly></td>
			<%--<td><input type="text" name="detection_site" readonly></td>--%>
			<%--<td><input type="text" name="detection_program" readonly></td>--%>
			<%--<td><input type="text" name="according" readonly></td>
            <td><input type="text" name="standart" readonly></td>--%>
			<td><input type="text" id="detection_frequency1" name="detection_frequency" readonly></td>
			<td><input type="text" id="detection_days1" name="detection_days" readonly></td>
			<%--<td><input type="text" id="should_number1" name="should_number"></td>
            <td><input type="text" id="already_number1" name="already_number"></td>--%>
			<td><input type="text" id="thatday_number1" name="thatday_number"></td>
			<%--<td><input type="text" id="sal" name="sal"></td>--%>
			<td><input type="text" name="remark"></td>
			<%--<td>
				<select id="sampleType" name="sampleType" lay-search lay-verify="required">
					<option value="">请选择采样种类</option>
					<option value="超低排放">超低排放</option>
					<option value="非超低排放">非超低排放</option>
					<option value="其他检测">其他检测</option>
					<option value="水质采样">水质采样</option>
					<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>
				</select>
			</td>--%>
			<td class="radio">
				<input type="radio" name="circulation" value="1" title="是" checked>
				<input type="radio" name="circulation" value="2" title="否">
			</td>
		</tr>

		</tbody>
		<thead>
		<tr>
			<td>注意</td>
			<td colspan="13"><span style="color: red">采样种类与绩效相关，请谨慎填写。其他检测只能当检测类型为环评现状检测/建设项目竣工验收检测时才能选择</span></td>
		</tr>
		</thead>
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

        var formSelects = layui.formSelects;

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
            //var contact_person =  data.field.contact_person;//联系人
            //var contact_phone =  data.field.contact_phone;//联系电话
            //var entrust_adress =  data.field.entrust_adress;//委托单位地址
            //var entrust_name =  data.field.entrust_name;//委托单位名称
            var specimen_name =  data.field.specimen_name;//样品名称
            var date1 =  data.field.date1;//任务下达时间
            var type =  data.field.type;//检测类型
            var date2 =  data.field.date2;//要求完成时间
			var test_content = $("#test_content").val();//气还是水
            var samplePerson = formSelects.value('selectId', 'valStr');//采样人员
            //var standard =  data.field.standard;//执行标准



            var currentDetails = [];
            $.each($('.details'),function(index,item){
                //var sal = $(item).find('input[name="sal"]').val();
                var number = $(item).find('input[name="number"]').val();

                var program_type = $(item).find('input[name="program_type"]').val();//检测项目类别
                var site_number = $(item).find('input[name="site_number"]').val();//点位个数
                var program_number = $(item).find('input[name="program_number"]').val();//检测项目个数

                //var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位

                /*//检测项目及方法依据明细
                var itemsDetails = [];
                var detectionArray = $(item).find('td.detection_program>.items-details');//检测项目
                var accordingArray = $(item).find('td.according>.items-details');//方法依据
                var standartArray = $(item).find('td.standart>.items-details');//检测标准
                $.each(detectionArray,function(index0,item0){
                    var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                    var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                    var standart = $(standartArray[index0]).find('input[name="standart"]').val();//检测标准
                    itemsDetails.push({'processName':detection_program,'methodBasis':according,'process_string':standart});
                });*/

                var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                /*var should_number = Number($(item).find('input[name="should_number"]').val());
                var already_number = Number($(item).find('input[name="already_number"]').val());*/
                var thatday_number = Number($(item).find('input[name="thatday_number"]').val());
                var remark = $(item).find('input[name="remark"]').val();
                //var sampleType = $(item).find('select[name="sampleType"]>option:selected').text();//检测种类
                var circulation =  $(item).find('input[name^="circulation"]:checked').val();//是否流转
                var obj = {
                    'details_int2':number,
                    /*'details_string':detection_site,*/
                    'details_string':program_type,
                    //'details_string2':itemsDetails,
                    'details_int3':detection_frequency,
                    'details_int4':detection_days,
                    'details_string10':circulation,
                    //'details_money2':should_number,
                    //'details_money3':already_number+thatday_number,
                    'details_money3':program_number,//检测项目个数
                    'details_money5':site_number,//点位个数
                    'details_money4':thatday_number,
                    //'details_string7':sampleType,
                    'details_string6':remark
                    //'details_string13':sampePerson
                    //, 'details_money':sal
                };
                currentDetails.push(obj);
            });
            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':44,
                    //'currency_id':currency_id,
                    'currency_string':illustration,
                    'currency_string2':program_name,
                    //'currency_string3':contact_person,
                    //'currency_string4':contact_phone,
                    'currency_string5':test_content,
                    //'currency_string10':entrust_name,
                    'currency_string7':specimen_name,
                    'currency_date2':date1,
                    'currency_string8':type,
                    'currency_date3':date2,
                    //'currency_string9':standard,
                    'currency_int':1,
                    'currency_string13':samplePerson,//采样人员
                    'currency_string17':currency_id,//每个阶段传入任务通知的id，用户业务跟踪
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

        //查询现场科人员
        $.ajax({
            url : "Xinze/selectXCStaff.action"
            ,type : "post"
            ,data : {
                'department_id':107738747
            }
            ,dataType : "JSON"
            ,success:function (res) {
                var staffHtml = '<option value="">请选择</option>';
                $.each(res.data,function (index,item) {
                    staffHtml += '<option value="'+item.staff_id+'">'+item.staff_name+'</option>'
                })
                $('#sample_person').append(staffHtml);
                form.render();
                formSelects.render('selectId');
            }
        });

        $.ajax({
            url : "Xinze/selectCurrencyApply.action"
            ,type : "post"
            ,data : {"currency_id":currency_id}
            ,dataType : "JSON"
            ,success : function(result){
                //layer.msg(result.msg);
                $("#program_name").val(result.data.currency_string2);
                //$("#contact_person").val(result.data.currency_string3);
                //$("#contact_phone").val(result.data.currency_string4);
                //$("#entrust_adress").val(result.data.currency_string5);
                //$("#entrust_name").val(result.data.currency_string10);
                $("#specimen_name").val(result.data.currency_string7);
                $("#date1").val(Format(result.data.currency_date2,"yyyy-MM-dd"));
                $("#type").val(result.data.currency_string8);
                $("#date2").val(Format(result.data.currency_date3,"yyyy-MM-dd"));
                //$("#standard").val(result.data.currency_string9);
                var currency_type = result.data.currency_type;
                if (currency_type == 41){//丽泽的检测
                    $("#test_content").val(result.data.currency_string5);//气还是水
                    //检测类型：
                    //丽泽 常规检测 设备校验
                    //信泽 常规检测 季度比对
                    var testType = "常规检测";
                    if (result.data.currency_string8 == "设备校验") {
                        testType = "季度比对";
                    }
                    //采样类型
                    //丽泽 超低 非超低
                    //信泽 超低 非超低

                    $('.details').remove();
                    var html = '<tr class="details">'
                        +	'<td><input type="text" name="number" value="'+d_count+'" readonly></td>'
                        +	'<td colspan="3"><input type="text" id="program_type'+d_count+'" name="program_type" value="'+result.data.currency_string7+'" readonly></td>'
                        +	'<td><input type="text" id="site_number'+d_count+'" name="site_number" value="1"></td>'
                        +	'<td><input type="text" id="program_number'+d_count+'" name="program_number" value="1" readonly></td>'
                        +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="1" readonly></td>'
                        +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="1" readonly></td>'
                        +	'<td><input type="text" id="thatday_number'+d_count+'" name="thatday_number" value="1" lay-verify="required"></td>'
                        +	'<td><input type="text" name="remark"></td>'
                       /* +	'<td>'
                        +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
                        +			'<option value="">请选择采样种类</option>'
                        +			'<option value="超低排放">超低排放</option>'
                        +			'<option value="非超低排放">非超低排放</option>'
                        +			'<option value="其他检测">其他检测</option>'
                        +			'<option value="水质采样">水质采样</option>'
                        +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
                        +		'</select>'
                        +	'</td>'*/
                        +	'<td class="radio">'
                        +		'<input type="radio" name="circulation'+d_count+'" value="1" title="是">'
                        +		'<input type="radio" name="circulation'+d_count+'" value="2" title="否" checked>'
                        +	'</td>'
                        +	'</tr>';
                    $('table.table-open>tbody').append(html);

                    //$('#sampleType'+d_count).val(result.data.currency_string7);
                    form.render();
                    formSelects.render('selectId'+d_count);
                } else {//信泽的检测
                    $("#test_content").val("气");//气还是水
                    $.ajax({
                        url : "Currency/selectCurrencyDetails.action"
                        ,type : "post"
                        ,data : {"currency_id":currency_id}
                        ,dataType : "JSON"
                        ,success:function (res) {
                            $('.details').remove();
                            $.each(res.data,function (index,item) {
                                var html = '<tr class="details">'
                                    +	'<td><input type="text" name="number" value="'+item.details_int2+'" readonly></td>'
                                    +	'<td colspan="3"><input type="text" id="program_type'+d_count+'" name="program_type" value="'+item.details_string+'" readonly></td>'
                                    +	'<td><input type="text" id="site_number'+d_count+'" name="site_number" value="'+item.details_money5+'" readonly></td>'
                                    +	'<td><input type="text" id="program_number'+d_count+'" name="program_number" value="'+item.details_money3+'" readonly></td>'
                                    +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" readonly></td>'
                                    +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" readonly></td>'
                                    +	'<td><input type="text" id="thatday_number'+d_count+'" name="thatday_number" lay-verify="required"></td>'
                                    +	'<td><input type="text" name="remark" value="'+item.details_string6+'"></td>'
                                    /*+	'<td>'
                                    +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
                                    +			'<option value="">请选择采样种类</option>'
                                    +			'<option value="超低排放">超低排放</option>'
                                    +			'<option value="非超低排放">非超低排放</option>'
                                    +			'<option value="其他检测">其他检测</option>'
                                    +			'<option value="水质采样">水质采样</option>'
                                    +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
                                    +		'</select>'
                                    +	'</td>'*/
                                    +	'<td class="radio">'
                                    +		'<input type="radio" name="circulation'+d_count+'" value="1" title="是" checked>'
                                    +		'<input type="radio" name="circulation'+d_count+'" value="2" title="否">'
                                    +	'</td>'
                                    +	'</tr>';
                                $('table.table-open>tbody').append(html);
                                form.render();
                                formSelects.render('selectId'+d_count);
                                /*var processHtml1 = '';
                                var processHtml2 = '';
                                var processHtml3 = '';
                                $.ajax({
                                    url:"Xinze/selectProcessByDetailsId.action"
                                    ,type:"post"
                                    ,data:{"details_id":item.currency_details_id}
                                    ,success:function (res) {
                                        $.each(res.data,function (i,process) {
                                            processHtml1 +=
                                                    '<div class="items-details">'
                                                +			'<input type="text" name="detection_program" value="'+process.processName+'" data-index="1" readonly>'
                                                +	'</div>';
                                            processHtml2+=
                                                        '<div class="items-details">'
                                                +			'<input type="text" name="according" value="'+process.methodBasis+'" data-index="1" readonly>'
                                                +		'</div>';
                                            processHtml3+=
                                                        '<div class="items-details">'
                                                +			'<input type="text" name="standart" value="'+process.process_string+'" data-index="1" readonly>'
                                                +		'</div>'
                                        });
                                        ++d_count;
                                        var alreadyNum = 0;
                                        if(item.details_money3 != null){
                                            alreadyNum = item.details_money3;
                                        }
                                        var sal = 0;
                                        if(item.details_money != null){
                                            sal = item.details_money
                                        }

                                        var html = '<tr class="details">'
                                            +	'<td><input type="text" name="number" value="'+item.details_int2+'" readonly></td>'
                                            +	'<td>'
                                            +		'<select id="samplePerson'+d_count+'" xm-select="selectId'+item.details_int2+'" xm-select-skin="default" lay-verify="required">'
                                            +			staffHtml
                                            +		'</select>'
                                            +	'</td>'
                                            +	'<td><input type="text" name="detection_site" value="'+item.details_string+'" readonly></td>'
                                            +	'<td class="items detection_program">'
                                            +       processHtml1
                                            +	'</td>'
                                            +	'<td class="items according">'
                                            +		processHtml2
                                            +	'</td>'
                                            +	'<td class="items standart">'
                                            +		processHtml3
                                            +	'</td>'
                                            +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" readonly></td>'
                                            +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" readonly></td>'
                                            +	'<td><input type="text" id="should_number'+d_count+'" name="should_number" value="'+item.details_money2+'" readonly></td>'
                                            +	'<td><input type="text" id="already_number'+d_count+'" name="already_number" value="'+alreadyNum+'" readonly></td>'
                                            +	'<td><input type="text" id="thatday_number'+d_count+'" name="thatday_number" lay-verify="required"></td>'
                                            +	'<td><input type="text" id="sal'+d_count+'" name="sal" value="'+sal+'"></td>'
                                            +	'<td><input type="text" name="remark" value="'+item.details_string6+'" readonly></td>'
                                            +	'<td>'
                                            +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
                                            +			'<option value="">请选择采样种类</option>'
                                            +			'<option value="超低排放">超低排放</option>'
                                            +			'<option value="非超低排放">非超低排放</option>'
                                            +			'<option value="其他检测">其他检测</option>'
                                            +			'<option value="水质采样">水质采样</option>'
                                            +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
                                            +		'</select>'
                                            +	'</td>'
                                            +	'<td class="radio">'
                                            +		'<input type="radio" name="circulation'+d_count+'" value="1" title="是" checked>'
                                            +		'<input type="radio" name="circulation'+d_count+'" value="2" title="否">'
                                            +	'</td>'
                                            +	'</tr>';
                                        $('table.table-open>tbody').append(html);
                                        if(item.details_string7 != null){
                                            $('#sampleType'+d_count).val(item.details_string7)
                                        }

                                        form.render();
                                        formSelects.render('selectId'+item.details_int2);
                                        var samplePerson = item.details_string13.split(",");
                                        var str = new Array();
                                        samplePerson.forEach(function (value,index,arr) {
                                            var person = Number(value);
                                            str.push(person);
                                        });

                                        if(samplePerson != null){
                                            formSelects.value('selectId'+item.details_int2, str);
                                        }
                                    }
                                });*/
                                d_count++;
                            });
                        }
                    });
                }


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
                +	'<td><input type="text" name="standart"></td>'
                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency"></td>'
                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days"></td>'
                +	'<td><input type="text" id="should_number'+d_count+'" name="should_number"></td>'
                +	'<td><input type="text" id="already_number'+d_count+'" name="already_number"></td>'
                +	'<td><input type="text" id="thatday_number'+d_count+'" name="thatday_number"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'<td>'
                +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
                +			'<option value="">请选择采样种类</option>'
                +			'<option value="超低排放">超低排放</option>'
                +			'<option value="非超低排放">非超低排放</option>'
                +			'<option value="其他检测">其他检测</option>'
                +			'<option value="水质采样">水质采样</option>'
                +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
                +		'</select>'
                +	'</td>'
                +	'<td class="radio">'
                +		'<input type="radio" name="circulation'+d_count+'" value="1" title="是" checked>'
                +		'<input type="radio" name="circulation'+d_count+'" value="2" title="否">'
                +	'</td>'
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测登记表 -->
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
			<th colspan=11 class="table-h">检测登记表</th>
		</tr>
		<tr>
			<th colspan=11 style="text-align:right">编码单号：<input type="text" id="buy_number" name="buy_number" readonly></th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>说明</td>
			<td colspan=10><input type="text" name="illustration" value="用于信泽有限公司检测员办理检测登记表单" readonly></td>
		</tr>
		<tr>
			<th colspan="11" style="text-align: center;">基本信息</th>
		</tr>
		<%--<tr>
            <td>项目名称</td>
            <td colspan="3"><input type="text" name="program_name" id="program_name"></td>
            <td>联系人</td>
            <td colspan="2"><input type="text" name="contact_person" id="contact_person"></td>
            <td>联系电话</td>
            <td colspan="3"><input type="text" id="contact_phone" name="contact_phone"></td>
        </tr>
        <tr>
            <td>委托单位地址</td>
            <td colspan=10><input type="text" id="entrust_adress" name="entrust_adress"></td>
        </tr>
        <tr>
            <td>委托单位名称</td>
            <td colspan="4"><input type="text" name="entrust_name" id="entrust_name"></td>
            <td>报表编码</td>
            <td colspan="5"><input type="text" name="specimen_number" id="specimen_number"></td>
        </tr>--%>
		<tr>
			<td>交接时间</td>
			<td colspan="4"><input name="date1" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" readonly></td>
			<%--<td>检测类型</td>
            <td colspan="2"><input type="text" name="type" id="type" class="layui-input"></td>--%>
			<td>检测完成时间</td>
			<td colspan="5"><input name="date2" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" readonly>
				<input type="hidden" id="limit">
			</td>
		</tr>
		<%--<tr>
            <td>执行标准</td>
            <td colspan=10><input type="text" id="standard" name="standard"></td>
        </tr>--%>
		<tr>
			<th colspan="11" style="text-align: center;">采样任务明细</th>
		</tr>
		<tr>
			<%--<td>序号</td>--%>
			<%--<td>检测点位</td>--%>
			<td>检测项目</td>
			<%--<td>检测标准</td>--%>
			<td>样品编码</td>
			<td>采样日期</td>
			<td>备注</td>
			<%--<td style="display:none;">采样容器</td>--%>
			<td>样品数量</td>
			<td>检测结果</td>
			<td>操作</td>
		</tr>
		<tr class="details">
			<%--<td><input type="text" name="number" value="1" readonly></td>--%>
			<%--<td><input type="text" name="detection_site"></td>--%>
			<td><input type="text" name="detection_program"></td>
			<%--<td><input type="text" name="standart"></td>--%>
			<td><input type="text" name="specimen_number1"></td>
			<td><input type="text" name="specimen_date"></td>
			<td><input type="text" name="remark"></td>
			<%--<td style="display:none;"><input type="text" name="specimen_vessel"></td>--%>
			<td><input type="text" id="specimen_acount1" name="specimen_acount"></td>
			<td><input type="text" name="detection_result" value="/"></td>
			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		</tr>
		<%--<tr class="nidaye">
			<td>数据状态</td>
			<td colspan=5>
				<select name="information" id="information" lay-filter="information" lay-search lay-verify="required">
					<option value="">请选择数据状态</option>
					<option value="正常">正常</option>
					<option value="异常">异常</option>
				</select>
			</td>
			<td>是否超标</td>
			<td colspan=5>
				<select name="oos" id="oos" lay-search lay-verify="required">
					<option value="">请选择</option>
				</select>
			</td>
		</tr>--%>
		</tbody>
		<%--<thead>
            <tr>
                <td colspan=10 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
            </tr>
            <tr>
                <th colspan=10></th>
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

        var currency_id = '${param.currency_id}';
        var currency_details_id = '${param.currency_details_id}';
        var id = '${param.id}';
        console.log(id);
        var process_string = '';
        var noticId = '';
        //查询检测标准
        /*$.ajax({
            url:'Xinze/selectStandart.action'
            ,type:'post'
            ,async : false
            ,data:{'currency_details_id':currency_details_id}
            ,dataType:'JSON'
            ,success:function (res) {
                process_string = res.data;
            }
        });*/

        $.ajax({
            url : "Xinze/selectCurrencyApply.action"
            ,type : "post"
            ,data : {"currency_id":currency_id}
            ,dataType : "JSON"
            ,success : function(result){
                //layer.msg(result.msg);
                noticId = result.data.currency_string17;
                /*$("#program_name").val(result.data.currency_string2);
                $("#contact_person").val(result.data.currency_string3);
                $("#contact_phone").val(result.data.currency_string4);
                $("#entrust_adress").val(result.data.currency_string5);
                $("#entrust_name").val(result.data.currency_string10);
                $("#specimen_number").val(result.data.currency_string7);*/
                $("#date1").val(Format(result.data.currency_date2,"yyyy-MM-dd"));
                //$("#type").val(result.data.currency_string8);
                $("#date2").val(Format(result.data.currency_date3,"yyyy-MM-dd"));
                //$("#standard").val(result.data.currency_string9);
                var currency_date = Format(result.data.currency_date,'yyyy-MM-dd');
                $.ajax({
                    url : "Xinze/selectCurrencyDetailById.action"
                    ,type : "post"
                    ,data : {"currency_details_id":currency_details_id}
                    ,dataType : "JSON"
                    ,success:function (res) {
                        $("#limit").val(res.data.details_money3);
                        $('.details').remove();
                        //$('.nidaye').remove();
                        var html = '<tr class="details">'
                            //+ '<td><input type="text" name="number" value="' + res.data[0].details_int2 + '" readonly></td>'
                            //+ '<td><input type="text" name="detection_site" value="' + res.data[0].details_string + '" readonly></td>'
                            + '<td><input type="text" name="detection_program" value="' + res.data.details_string2 + '" readonly></td>'
                            //+ '<td><input type="text" name="standart" value="' + process_string + '" readonly></td>'
                            + '<td><input type="text" name="specimen_number1" value="'+res.data.details_string+'" readonly></td>'
                            + '<td><input type="text" id="specimen_date' + d_count + '" name="specimen_date" value="' + currency_date + '" readonly></td>'
                            + '<td><input type="text" id="remark' + d_count + '" name="remark" value="' + res.data.details_string6 + '" readonly></td>'
                            //+ '<td style="display:none;"><input type="text" id="specimen_vessel' + d_count + '" name="specimen_vessel" value="'+res.data.details_string4+'" lay-verify="required"></td>'
                            + '<td><input type="text" id="specimen_acount' + d_count + '" name="specimen_acount" value="'+res.data.details_money3+'" lay-verify="required"></td>'
                            + '<td><input type="text" id="detection_result' + d_count + '" value="/" name="detection_result" lay-verify="required"></td>'
                            + '<td class="delete' + d_count + '"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除<tton></td>'
                            + '</tr>'
                            /*+'<tr>'
                            +	'<td>数据状态</td>'
                            +	'<td colspan=4>'
                            +		'<select name="information" id="information" lay-filter="information" lay-search lay-verify="required">'
                            +			'<option value="">请选择数据状态</option>'
                            +			'<option value="正常">正常</option>'
                            +			'<option value="异常">异常</option>'
                            +		'</select>'
                            +	'</td>'
                            +	'<td>是否超标</td>'
                            +	'<td colspan=5>'
                            +		'<select name="oos" id="oos" lay-search lay-verify="required">'
                            +			'<option value="">请选择</option>'
                            +		'</select>'
                            +	'</td>'
                            +'</tr>'*/;
                        $('table.table-open>tbody').append(html);
                        detailsRender(1);
                        form.render('select');

                    }
                });


            }
        });


        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

            var illustration =  data.field.illustration;//说明
            /*var program_name =  data.field.program_name;//项目名称
            var contact_person =  data.field.contact_person;//联系人
            var contact_phone =  data.field.contact_phone;//联系电话
            var entrust_adress =  data.field.entrust_adress;//委托单位地址
            var entrust_name =  data.field.entrust_name;//委托单位名称
            var specimen_number =  data.field.specimen_number;//样品编码*/
            var date1 =  data.field.date1;//交接时间
            //var type =  data.field.type;//检测类型
            var date2 =  data.field.date2;//检测完成时间
            //var standard =  data.field.standard;//执行标准

            var currentDetails = [];

            //var number = data.field.number;
            //var detection_site = data.field.detection_site;//检测点位
            var detection_program = data.field.detection_program;//检测项目
            var specimen_number1 = data.field.specimen_number1;//样品编码
            var specimen_date = data.field.specimen_date;//采样日期
            //var specimen_vessel = data.field.specimen_vessel;//采样容器
            var specimen_acount = data.field.specimen_acount;//采样数量
            var remark = data.field.remark;
            var detection_result = data.field.detection_result;//样品状况
            //var information = data.field.information;
            //var oos =data.field.oos;


            var obj = {
                //'details_int2':number,
                'currency_details_id':currency_details_id,//保留了对应的45的明细id
                //'details_string':detection_site,
                'details_string2':detection_program,
                'details_string3':specimen_number1,
                'details_date2':specimen_date,
                //'details_string4':specimen_vessel,
                'details_string9':detection_result,
                'details_int3':specimen_acount,
                'details_string6':remark,
                //'details_string10':information,
                //'details_string11':oos,
                'details_string12':currency_details_id
            };
            currentDetails.push(obj);

            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':49,
                    'currency_id':currency_id,
                    'currency_string':illustration,
                    //'currency_string2':program_name,
                    //'currency_string3':contact_person,
                    //'currency_string4':contact_phone,
                    //'currency_string5':entrust_adress,
                    //'currency_string10':entrust_name,
                    //'currency_string7':specimen_number,
                    'currency_string17':noticId,
                    'currency_string18':currency_details_id,
                    'currency_date2':date1,
                    //'currency_string8':type,
                    'currency_date3':date2,
                    //'currency_string9':standard,
                    'currency_int':4,
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

        /*form.on('select(information)', function(data){
            var information = data.value;
            if(information == '正常'){
                var html = '<option value="不超标">不超标</option>';
                $("#oos").html(html)
            }else {
                var html ='<option value="">请选择</option>'
                    +	'<option value="超标">超标</option>'
                    +	'<option value="不超标">不超标</option>';
                $("#oos").html(html)
            }
            form.render();
        });*/

        //操作
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = '<tr class="details">'
                +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
                +	'<td><input type="text" name="detection_site"></td>'
                +	'<td><input type="text" name="detection_program"></td>'
                +	'<td><input type="text" name="specimen_number"></td>'
                +	'<td><input type="text" name="specimen_date"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'<td style="display:none;"><input type="text" name="specimen_vessel" value="/"></td>'
                +	'<td><input type="text" id="specimen_acount'+d_count+'" name="specimen_acount"></td>'
                +	'<td><input type="text" name="detection_result" value="/"></td>'
                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                +	'</tr>';
            $('table.table-open>tbody').append(html);
            //渲染
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            //inputLimitNumber($('#specimen_acount'+index)); //监听样品数量只允许输入数字
            inputLimitNumberMax($('#specimen_acount'+index)); //监听样品数量输入数字最大值
            inputLimitMark($('#detection_result'+index));
        }
        //限制文本输入框只允许输入数字(包括小数)
        function inputLimitNumberMax($demo){
            $demo.bind("input propertychange",function(e){
                var limitMax = Number($("#limit").val());//取出允许最大值

                if( (!/^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val())) && $(e.target).val() != ''){
                    layer.msg('请输入正确的数字');
                    $(e.target).val('');
                }else if(Number($(e.target).val()) > limitMax){
                    layer.msg('输入数字大于允许最大值，请重新输入');
                    $(e.target).val('');
				}
            });
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
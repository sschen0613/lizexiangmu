<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 现场科绩效申请单 -->
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
            <th colspan=8 class="table-h">现场科绩效申请单</th>
        </tr>
        <tr>
            <th colspan=8 style="text-align:right">申请单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>申请人</td>
            <td><input type="text" name="currency_applicant" id="staffName" readonly></td>
            <td>申请部门</td>
            <td colspan="2"><input type="text" name="department_Id" id="department" readonly></td>
            <td>申请日期</td>
            <td colspan="2"><input type="text" name="currency_date" id="date" readonly></td>
        </tr>
        <tr>
            <td>采样简述</td>
            <td colspan=7><input type="text" name="description" placeholder="请简述采样任务" lay-verify="required"></td>
        </tr>
        <tr>
            <td>序号</td>
            <td colspan="2">采样人员</td>
            <td>检测类型</td>
            <td>采样类型</td>
            <td>数量</td>
            <td>备注</td>
            <td>操作</td>
        </tr>
        <tr class="details">
            <td><input type="text" name="number" value="1" readonly></td>
            <td  colspan="2">
                <select id="samplePerson1" xm-select="selectId1" xm-select-skin="default" lay-verify="required">

                </select>
            </td>
            <td>
                <select id="sampleType" name="sampleType" lay-search lay-verify="required">
                    <option value="">请选择</option>
                    <option value="1">常规检测</option>
                    <option value="2">在线比对</option>
                </select>
            </td>
            <td>
                <select id="testType" name="testType" lay-search lay-verify="required">
                    <option value="">请选择</option>
                    <option value="1">超低排放</option>
                    <option value="2">非超低排放</option>
                </select>
            </td>
            <td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
            <td><input type="text" name="remark"></td>
            <td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <td colspan=8 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
        </tr>
        <tr>
            <th colspan=8></th>
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
        detailsRender(1); //明细信息每行自定义渲染事件
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var description = data.field.description;//故障描述
            var currency_type = 58;

            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var number = $(item).find('input[name="number"]').val();
                var sampleType = $(item).find('select[name="sampleType"]>option:selected').val();//检测种类
                var testType = $(item).find('select[name="testType"]>option:selected').val();//检测种类
                var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
                var sum = 0;
                var remark = $(item).find('input[name="remark"]').val();
                var personCode = formSelects.value('selectId'+number, 'valStr');//采样人员编码
                var personName = formSelects.value('selectId'+number, 'nameStr');//采样人员名称

                if(sampleType == 1){
                    if (testType == 1){
                        sum = 90*buy_quantity;
                    }else {
                        sum = 80*buy_quantity;
                    }
                }else {
                    if (testType == 1){
                        sum = 100*buy_quantity;
                    }else {
                        sum = 90*buy_quantity;
                    }
                }


                var obj = {'details_int3':sampleType,'details_int4':testType
                    ,'details_money':buy_quantity,'details_money2':sum,'details_string3':personCode,'details_string4':personName,'details_string11':remark};
                currentDetails.push(obj);
            });

            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    "currency_string7":description,
                    "currency_type":currency_type,
                    "currencyDetails":JSON.stringify(currentDetails)
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
        var staff_Id ="${sessionScope.systemStaff.staff_Id }";//获取当前登录用户id;
        setApplyMessage(staffName,departmentId);

        //查询现场科人员
        var html1 = '';
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
                });
                html1 = staffHtml;
                $('#samplePerson1').append(staffHtml);
                form.render();
                formSelects.render('selectId1');
            }
        });
        console.log(html1);

        //操作
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = '<tr class="details">'
                +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
                +	'<td  colspan="2">'
                +		'<select id="samplePerson'+d_count+'" xm-select="selectId'+d_count+'" xm-select-skin="default" lay-verify="required">'
                +			html1
                +		'</select>'
                +	'</td>'
                +	'<td>'
                +        '<select name="sampleType" lay-search lay-verify="required">'
                +           '<option value="">请选择</option>'
                +           '<option value="1">常规检测</option>'
                +           '<option value="2">在线比对</option>'
                +        '</select>'
                +    '</td>'
                +	'<td>'
                +        '<select name="testType" lay-search lay-verify="required">'
                +           '<option value="">请选择</option>'
                +           '<option value="1">超低排放</option>'
                +           '<option value="2">非超低排放</option>'
                +        '</select>'
                +    '</td>'
                +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                +	'</tr>';
            $('table.table-open>tbody').append(html);
            form.render();
            formSelects.render('selectId'+d_count);
            //渲染
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index));  //每一行绑定行删除事件
            inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
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

    });
</script>
</body>
</html>
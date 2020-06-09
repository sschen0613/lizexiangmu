<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人报备申请表 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/form_init.js"></script>
    <script src="js/function_tool.js?v="+Math.random()></script>
</head>
<body>
<h2 class="h-open"></h2>
<form class="layui-form form-open" action="">
    <table class="layui-table table-open">
        <thead>
        <tr>
            <th colspan="6" class="table-h">天人报备申请表</th>
        </tr>
        <tr>
            <th colspan=6 style="text-align:right">流程编号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
        </tr>
        </thead>
        <tbody >
        <tr>
            <th colspan=6 style="text-align:center;">基本信息</th>
        </tr>
        <tr>
            <td>申请人</td>
            <td><input type="text" name="currency_applicant" id="staffName" readonly></td>
            <td>申请部门</td>
            <td><input type="text" name="department_Id" id="department" readonly></td>
            <td>申请日期</td>
            <td><input type="text" name="currency_date" id="date" readonly></td>
        </tr>
        <tr>
            <td>业务类型</td>
            <td>
                <select name="business_type" id="business_type" lay-search class="layui-select" lay-verify="required">
                    <option value="">请选择</option>
                    <option value="咨询类">咨询类</option>
                    <option value="环保托管服务类">环保托管服务类</option>
                    <option value="污染治理工程类">污染治理工程类</option>
                    <option value="污水治理设施运维类">污水治理设施运维类</option>
                    <option value="环境监测类">环境监测类</option>
                    <option value="在线监控类">在线监控类</option>
                    <option value="其它环保设备销售类">其它环保设备销售类</option>
                    <option value="政府招标类">政府招标类</option>
                </select>
            </td>
            <td>单位名称</td>
            <td><input type="text" id="company_name" name="company_name" lay-verify="required"></td>
            <td>项目（产品）名称</td>
            <td><input type="text" id="program_name" name="program_name" lay-verify="required"></td>
        </tr>
        <tr>
            <td>业务（产品）规模</td>
            <td><input type="text" id='business_scale' name="business_scale" lay-verify="required"></td>
            <td>业务需求时间</td>
            <td><input type="text" class="layui-input" id="date1" name="business_time" placeholder="请选择业务需求时间" lay-verify="required"></td>
            <td>业务所在区域</td>
            <td><input type="text" id='business_area' name="business_area" lay-verify="required"></td>
        </tr>
        <tr>
            <td>联系人</td>
            <td><input type="text" id='contact_person' name="contact_person" lay-verify="required"></td>
            <td>联系电话</td>
            <td><input type="text" id='contact_phone' name="contact_phone" lay-verify="required"></td>
        </tr>
        </tbody>
        <thead>
        <tr>
            <th colspan=6></th>
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
            elem: '#date1' //指定元素
            ,done: function(value, date, endDate){

            }
        });
        inputRender();//input框自定义渲染

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var business_type = $('#business_type').find('option:selected').text();                 //业务类型
            var company_name = data.field.company_name;                                             //单位名称
            var program_name = data.field.program_name;                                             //项目名称
            var business_scale = data.field.business_scale;                                         //业务规模
            var business_time = data.field.business_time;                                           //业务需求时间
            var business_area = data.field.business_area;                                           //业务所在区域
            var contact_person = data.field.contact_person;                                         //联系人
            var contact_phone = data.field.contact_phone;                                           //联系电话

            var currency_type = 69;
            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    "currency_type":currency_type,
                    "currency_string2":business_type,
                    "currency_string3":company_name,
                    "currency_string4":program_name,
                    "currency_string5":business_scale,
                    "currency_date2":business_time,
                    "currency_string7":business_area,
                    "currency_string8":contact_person,
                    "currency_string9":contact_phone
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
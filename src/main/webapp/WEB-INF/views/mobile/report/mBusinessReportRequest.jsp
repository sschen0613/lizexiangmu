<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 天人报备申请-手机端 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/mobile.css">
    <link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/iconfont.js"></script>
    <script src="js/form_init.js"></script>
    <script src="js/function_tool.js?v="+Math.random()></script>
</head>
<body>
<div class="container-apply">
    <div class="approval-list-title">
        <a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
        <h2 class="">天人报备申请</h2>
        <span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'report/mBusinessReportRequestList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
    </div>
    <div class="content">
        <form class="layui-form form-apply" action="" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">流水号 :</label>
                <div class="layui-input-block">
                    <input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请人 :</label>
                <div class="layui-input-block">
                    <input type="text" name="currency_applicant" id="staffName" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请部门 :</label>
                <div class="layui-input-block">
                    <input type="text" name="department_Id" id="department" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">申请日期 :</label>
                <div class="layui-input-block">
                    <input type="text" name="currency_date" id="date" class="layui-input" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">业务类型 :</label>
                <div class="layui-input-block">
                    <select class="layui-select" name="business_type" id="business_type" lay-search lay-verify="required">
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
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">单位名称 :</label>
                <div class="layui-input-block">
                    <input type="text" id="company_name" name="company_name" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">项目/产品名称 :</label>
                <div class="layui-input-block">
                    <input type="text" id="program_name" name="program_name" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">业务/产品规模 :</label>
                <div class="layui-input-block">
                    <input type="text" id="business_scale" name="business_scale" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">业务需求时间 :</label>
                <div class="layui-input-block">
                    <input type="text" class="layui-input" id="date1" name="business_time" placeholder="请选择业务需求时间">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">业务所在区域 :</label>
                <div class="layui-input-block">
                    <input type="text" id="business_area" name="business_area" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系人 :</label>
                <div class="layui-input-block">
                    <input type="text" id="contact_person" name="contact_person" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话 :</label>
                <div class="layui-input-block">
                    <input type="text" id="contact_phone" name="contact_phone" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
                    <button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form','element','layer','laydate' ],function(){
        var form = layui.form
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate;

        //表单更新渲染
        form.render();
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            ,done: function(value, date, endDate){
                // console.log(value); //得到日期生成的值
            }
        });

        //监听提交按钮
        form.on('submit(submitForm)', function(data){

            $('#myForm').addClass('layui-btn-disabled');
            $('#myForm').attr("disabled", "disabled");
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
                    "currency_string9":contact_phone,
                    "currency_string10":0   //合同是否签订 0未签 1已签 2终止报备
                }
                ,dataType : "JSON"
                ,success : function(result){
                    if(result){
                        layer.msg("提交成功");
                    }else{
                        layer.msg("提交失败");
                    }
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听重置按钮
        $('#resetForm').click(function(e){
            window.location.reload();
        });

        //表单初始化
        //获取请购单号
        setBuyNumber();
        //获取申请人/申请部门/申请日期
        var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
        var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
        setApplyMessage(staffName,departmentId);

        //操作

        //
        inputLimitPhone($('#contact_phone'));

    });
</script>
</body>
</html>
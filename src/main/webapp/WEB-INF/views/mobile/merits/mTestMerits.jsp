<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测科绩效申请单-手机端 -->
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
    <script src="js/function_tool.js"></script>
</head>
<body>
<div class="container-apply">
    <div class="approval-list-title">
        <a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
        <h2 class="">检测科绩效申请</h2>
        <span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'merits/mTestMeritsList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
    </div>
    <div class="content">
        <form class="layui-form form-apply" action="" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">申请单号 :</label>
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
                <label class="layui-form-label">内容描述 :</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="description" placeholder="请简述检测任务" lay-verify="required"></textarea>
                </div>
            </div>

            <!-- 明细信息 -->
            <div class="layui-btn layui-btn-normal layui-btn-xs addDetails">
                <i class="layui-icon layui-icon-add-1" title="点击添加明细信息"></i>点击添加明细信息
            </div>
            <div class="apply-detail-container">
                <div class="apply-detail">
                    <div class="details-title details-title1">明细信息#1<span class="layui-icon layui-icon-up"></span></div>
                    <div class="details">
                        <div class="layui-form-item">
                            <label class="layui-form-label">检测时间 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="date1" name="test_date" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">企业名称/样品名称/编号 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="name" name="name" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">分析内容 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="content" name="content" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">数量 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">绩效单价 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="price1" name="price" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">绩效金额 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="sum1" name="sum" class="layui-input" readonly>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">备注 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="remark" class="layui-input">
                            </div>
                        </div>
                    </div>
                    <div class="delete delete1">
                        <button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
                    </div>
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

        form.render();
        laydate.render({
            elem: '#date1'
        });
        detailsRender(1); //明细信息第一行自定义渲染事件
        inputRender();

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var description = data.field.description;//故障描述
            var currency_type = 59;

            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var test_date = $(item).find('input[name="test_date"]').val();
                var name = $(item).find('input[name="name"]').val();
                var content = $(item).find('input[name="content"]').val();
                var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
                var price = Number($(item).find('input[name="price"]').val());
                var sum = Number($(item).find('input[name="sum"]').val());
                var remark = $(item).find('input[name="remark"]').val();



                var obj = {'details_date2':test_date,'details_string2':name,'details_string3':content
                    ,'details_money':buy_quantity,'details_money2':price,'details_money3':sum,'details_string11':remark};
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
                    $('#myForm').attr("disabled", "disabled");
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
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = ''
                +  '<div class="apply-detail">'
                +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                +    '<div class="details">'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">检测日期 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" id="date'+d_count+'" name="test_date" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">企业名称/样品名称/编号 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="name" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">分析内容 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="content" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">绩效单价 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" id="price'+d_count+'" name="price" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">绩效金额 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" id="sum'+d_count+'" name="sum" class="layui-input" readonly>'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">备注 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="remark" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +    '</div>'
                +    '<div class="delete delete'+d_count+'">'
                +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                +    '</div>'
                +  '</div>';
            $('.apply-detail-container').append(html);
            //渲染
            laydate.render({
                elem: '#date'+d_count //指定元素
                ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            });
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index));  //每一行绑定行删除事件
            slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
            //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
            getSum2($('#buy_quantity'+index),$('#price'+index),$('#sum'+index));
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem3($demo);
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
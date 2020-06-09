<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 现场科绩效申请单-手机端 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/mobile.css">
    <link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
    <link rel="stylesheet" href="formselect/formSelects-v4.css" />
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/iconfont.js"></script>
    <script src="js/form_init.js"></script>
    <script src="js/function_tool.js"></script>
    <script src="formselect/formSelects-v4.min.js"></script>
</head>
<body>
<div class="container-apply">
    <div class="approval-list-title">
        <a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
        <h2 class="">现场科绩效申请</h2>
        <span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'merits/mSpotMeritsList.action';">查看申请记录</li>
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
                <label class="layui-form-label">采样简述 :</label>
                <div class="layui-input-block">
                    <textarea class="layui-textarea" name="description" placeholder="请简述采样任务" lay-verify="required"></textarea>
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
                            <label class="layui-form-label">序号 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="number" class="layui-input" value="1" readonly>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">采样人员 :</label>
                            <div class="layui-input-block">
                                <select id="samplePerson1"  xm-select="selectId1" xm-select-skin="default" lay-verify="required">

                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">检测类型 :</label>
                            <div class="layui-input-block">
                                <select id="sampleType" name="sampleType" class="layui-select" lay-search lay-verify="required">
                                    <option value="">请选择</option>
                                    <option value="1">常规检测</option>
                                    <option value="2">在线比对</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">采样类型 :</label>
                            <div class="layui-input-block">
                                <select id="testType" name="testType" class="layui-select" lay-search lay-verify="required">
                                    <option value="">请选择</option>
                                    <option value="1">超低排放</option>
                                    <option value="2">非超低排放</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">数量 :</label>
                            <div class="layui-input-block">
                                <input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
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

        var formSelects = layui.formSelects;

        form.render();
        laydate.render({
            elem: '#date1'
        });
        detailsRender(1); //明细信息第一行自定义渲染事件

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

        //操作
        //点击添加明细按钮
        var d_count = 1;
        $('.addDetails').click(function(){
            d_count++;
            var html = ''
                +  '<div class="apply-detail">'
                +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                +    '<div class="details">'
                +       '<div class="layui-form-item">'
                +           '<label class="layui-form-label">序号 :</label>'
                +           '<div class="layui-input-block">'
                +               '<input type="text" name="number" class="layui-input" value="'+d_count+'" readonly>'
                +           '</div>'
                +       '</div>'
                +       '<div class="layui-form-item">'
                +           '<label class="layui-form-label">采样人员 :</label>'
                +           '<div class="layui-input-block">'
                +               '<select id="samplePerson'+d_count+'"  xm-select="selectId1'+d_count+'" xm-select-skin="default" lay-verify="required">'
                +                   html1
                +               '</select>'
                +           '</div>'
                +       '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">检测类型 :</label>'
                +        '<div class="layui-input-block">'
                +          '<select name="sampleType" class="layui-select" lay-search lay-verify="required">'
                +               '<option value="">请选择</option>'
                +               '<option value="1">常规检测</option>'
                +               '<option value="2">在线比对</option>'
                +          '</select>'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">采样类型 :</label>'
                +        '<div class="layui-input-block">'
                +          '<select name="testType" class="layui-select" lay-search lay-verify="required">'
                +               '<option value="">请选择</option>'
                +               '<option value="1">超低排放</option>'
                +               '<option value="2">非超低排放</option>'
                +          '</select>'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
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
            form.render();
            formSelects.render('selectId'+d_count);
            detailsRender(d_count); //明细信息每行自定义渲染事件
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index));  //每一行绑定行删除事件
            slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
            inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem3($demo);
        }
        //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        function searchProcess($demo){
            processProduct($demo);
        }

    });
</script>
</body>
</html>
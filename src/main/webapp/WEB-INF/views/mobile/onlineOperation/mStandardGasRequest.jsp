<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 标气申购申请-手机端 -->
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
        <h2 class="">标气申购申请</h2>
        <span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'onlineOperation/mStandardGasRequestList.action';">查看申请记录</li>
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
                <label class="layui-form-label">请购区域 :</label>
                <div class="layui-input-block">
                    <select name="area" id="area" lay-filter="area" class="layui-select" disabled></select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">需求日期 :</label>
                <div class="layui-input-block">
                    <input type="text" name="require_date" id="date1" class="layui-input">
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
                            <label class="layui-form-label">区域名称 :</label>
                            <div class="layui-input-block">
                                <select name="area" id="area1" lay-filter="area1" lay-search lay-verify="required"></select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">企业站点名称 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="enterprise" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">标气类型 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="standard_type" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">浓度 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="potency" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">单位 :</label>
                            <div class="layui-input-block">
                                <input type="text" name="unit" class="layui-input" lay-verify="required">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">数量 :</label>
                            <div class="layui-input-block">
                                <input type="number" name="quantity" id="quantity" class="layui-input" lay-verify="required">
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

        //表单更新渲染
        form.render();
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            //,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        detailsRender(1); //明细信息第一行自定义渲染事件

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            $("#area").removeAttr("disabled");

            var flow_number = data.field.buy_number;//流水号
            var area = $('#area').find('option:selected').text();	//地区
            var require_date = data.field.require_date;//需要时间

            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var area1 = $(item).find('select[name="area"]>option:selected').text();
                var enterprise = $(item).find('input[name="enterprise"]').val();
                var standard_type = $(item).find('input[name="standard_type"]').val();
                var potency = $(item).find('input[name="potency"]').val();
                var unit = $(item).find('input[name="unit"]').val();
                var quantity = Number($(item).find('input[name="quantity"]').val());

                var remark = $(item).find('input[name="remark"]').val();

                var obj = {'details_string5':enterprise,'details_string7':unit,'details_money':quantity
                    ,'details_string8':area1,'details_string9':standard_type,'details_string10':potency,'details_string11':remark};
                currentDetails.push(obj);
            });

            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    "currency_number":flow_number,
                    "currency_date2":require_date,
                    "currency_type":55,
                    "currency_string10":area,
                    "currencyDetails":JSON.stringify(currentDetails)
                }
                ,dataType : "JSON"
                ,success : function(result){
                    $('#myForm').addClass('layui-btn-disabled');
                    $('#myForm').attr("disabled", "disabled");
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
        var areaid = "${sessionScope.systemStaff.staff_Address }";
        setApplyMessage(staffName,departmentId);
        // 第一级 - 获取区域
        var area_name_html = '';//保存区域下拉列表框
        $.ajax({
            url:'System/getRegion.action',
            type:'post',
            data:{},
            dataType:'JSON',
            success:function(res){
                var html = '<option value="">请选择区域</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
                });
                area_name_html = html;
                $('#area').html(html);
                $('#area1').html(html);
                $('#area').val(areaid);
                form.render('select');
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
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">区域名称 :</label>'
                +        '<div class="layui-input-block">'
                +          '<select name="area" id="area'+d_count+'" lay-filter="area'+d_count+'" lay-search lay-verify="required">'+area_name_html+'</select>'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">企业站点名称 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input name="enterprise" type="text" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">标气类型 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="standard_type" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">浓度 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="potency" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">单位 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="unit" class="layui-input" lay-verify="required">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="number" name="quantity" id="quantity'+d_count+'" class="layui-input" lay-verify="required">'
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
            detailsRender(d_count); //明细信息每行自定义渲染事件
            form.render();
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
            //searchProcess($('.container'+index)); //每一行绑定即时搜索框
            inputLimitNumber($('#quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
           // getEnterprise(index);//根据区域获取使用企业
        }
        function deleteItem($demo){
            deleteDetailsItem3($demo);
        }

    });
</script>
</body>
</html>
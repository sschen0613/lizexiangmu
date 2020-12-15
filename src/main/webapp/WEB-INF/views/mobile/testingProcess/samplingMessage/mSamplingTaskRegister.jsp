<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务登记申请-手机端 -->
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
	<script src="formselect/formSelects-v4.js"></script>
</head>
<body>
<div class="container-apply">
	<div class="approval-list-title">
		<a href="mobile/view/Mindex.action?currentTab=apply" class="layui-icon layui-icon-left"></a>
		<h2 class="">采样任务登记申请</h2>
		<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'testingProcess/samplingMessage/mSamplingTaskRegisterList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
	</div>
	<div class="content">
		<form class="layui-form form-apply" action="" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">项目名称 :</label>
				<div class="layui-input-block">
					<input type="text" name="program_name" id="program_name" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">报表编码 :</label>
				<div class="layui-input-block">
					<input type="text" name="specimen_name" id="specimen_name" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">采样人员 :</label>
				<div class="layui-input-block">
					<select id="sample_person" name="sample_person" xm-select="sample_person" xm-select-skin="default" lay-verify="required"></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">采样完成时间 :</label>
				<div class="layui-input-block">
					<input type="text" name="date1" id="date1" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">检测类型 :</label>
				<div class="layui-input-block">
					<input type="text" name="type" id="type" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">协议完成时间 :</label>
				<div class="layui-input-block">
					<input type="text" name="date2" id="date2" class="layui-input">
					<input type="hidden" name="test_content" id="test_content">
				</div>
			</div>
			<!-- 明细信息 -->
			<div class="layui-btn layui-btn-normal layui-btn-xs addDetails">
				<i class="layui-icon layui-icon-add-1" title="点击添加明细信息"></i>点击添加明细信息
			</div>
			<div class="apply-detail-container">

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

        //表单更新渲染
        form.render();
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            ,done: function(value, date, endDate){
                // console.log(value); //得到日期生成的值
                //开始日选好后，判断结束日期是否合法
                if($('#date2').val() != ''){
                    $('#date2').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1').val('');});
                }
            }
        });
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            ,done: function (value, date, endDate) {
                // console.log(value); //得到日期生成的值
                //结束日选好后，判断开始日期是否合法
                if($('#date1').val() != ''){
                    $('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
                }
            }
        });
        detailsRender(1); //明细信息第一行自定义渲染事件

        //获取跳转的数据id
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
                formSelects.render('sample_person');
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
                if (currency_type == 41) {//丽泽的检测
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
                    var d_count = 0;

                    $('.details').remove();
					d_count++;
					var html = ''
						+  '<div class="apply-detail">'
						+    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
						+    '<div class="details">'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">检测项目类别 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="program_type" value="'+result.data.currency_string7+'" class="layui-input" readonly>'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">点位个数 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="site_number" value="1" class="layui-input">'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">检测项目个数 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="program_number" value="1" class="layui-input" readonly>'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">检测频次 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="detection_frequency" value="1" class="layui-input" readonly>'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">检测天数 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="detection_days" value="1" class="layui-input" readonly>'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+        '<label class="layui-form-label">采样数量 :</label>'
						+        '<div class="layui-input-block">'
						+          '<input type="text" name="thatday_number" value="1" class="layui-input">'
						+        '</div>'
						+      '</div>'
						+      '<div class="layui-form-item">'
						+	     '<label class="layui-form-label">备注 :</label>'
						+		 '<div class="layui-input-block">'
						+		   '<textarea name="remark" class="layui-textarea"></textarea>'
						+	     '</div>'
						+	   '</div>'
						/* +      '<div class="layui-form-item">'
						 +        '<label class="layui-form-label">采样种类 :</label>'
						 +        '<div class="layui-input-block">'
						 +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
						 +			'<option value="">请选择采样种类</option>'
						 +			'<option value="超低排放">超低排放</option>'
						 +			'<option value="非超低排放">非超低排放</option>'
						 +			'<option value="其他检测">其他检测</option>'
						 +			'<option value="水质采样">水质采样</option>'
						 +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
						 +		'</select>'
						 +        '</div>'
						 +      '</div>'*/
						+      '<div class="layui-form-item">'
						+	     '<label class="layui-form-label">流转 :</label>'
						+		 '<div class="layui-input-block">'
						+		'<input type="radio" name="circulation'+d_count+'" value="1" title="是">'
						+		'<input type="radio" name="circulation'+d_count+'" value="2" title="否" checked>'
						+	     '</div>'
						+	   '</div>'
						+    '</div>'
						+    '<div class="delete delete'+d_count+'">'
						+      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
						+    '</div>'
						+  '</div>';
					$('.apply-detail-container').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					form.render();

                }else {
                    $("#test_content").val("气");//气还是水
                    $.ajax({
                        url : "Currency/selectCurrencyDetails.action"
                        ,type : "post"
                        ,data : {"currency_id":currency_id}
                        ,dataType : "JSON"
                        ,success:function (res) {
                            var d_count = 0;

                            $('.details').remove();
                            $.each(res.data,function (index,item) {
                                d_count++;
                                var html = ''
                                    +  '<div class="apply-detail">'
                                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                                    +    '<div class="details">'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">检测项目类别 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="program_type" value="'+item.details_string+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">点位个数 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="site_number" value="'+item.details_money5+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">检测项目个数 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="program_number" value="'+item.details_money3+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">检测频次 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="detection_frequency" value="'+item.details_int3+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">检测天数 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="detection_days" value="'+item.details_int4+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">采样数量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="thatday_number" class="layui-input">'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +	     '<label class="layui-form-label">备注 :</label>'
                                    +		 '<div class="layui-input-block">'
                                    +		   '<textarea name="remark" class="layui-textarea"></textarea>'
                                    +	     '</div>'
                                    +	   '</div>'
                                    /* +      '<div class="layui-form-item">'
                                     +        '<label class="layui-form-label">采样种类 :</label>'
                                     +        '<div class="layui-input-block">'
                                     +		'<select id="sampleType'+d_count+'" name="sampleType" lay-search lay-verify="required">'
                                     +			'<option value="">请选择采样种类</option>'
                                     +			'<option value="超低排放">超低排放</option>'
                                     +			'<option value="非超低排放">非超低排放</option>'
                                     +			'<option value="其他检测">其他检测</option>'
                                     +			'<option value="水质采样">水质采样</option>'
                                     +			'<option value="无组织、土壤、噪声采样">无组织、土壤、噪声采样</option>'
                                     +		'</select>'
                                     +        '</div>'
                                     +      '</div>'*/
                                    +      '<div class="layui-form-item">'
                                    +	     '<label class="layui-form-label">流转 :</label>'
                                    +		 '<div class="layui-input-block">'
                                    +		'<input type="radio" name="circulation'+d_count+'" value="1" title="是" checked>'
                                    +		'<input type="radio" name="circulation'+d_count+'" value="2" title="否">'
                                    +	     '</div>'
                                    +	   '</div>'
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
                        }
                    });
				}
            }
        });


        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}

            var program_name =  data.field.program_name;//项目名称
            var specimen_name =  data.field.specimen_name;//样品名称
            var date1 =  data.field.date1;//任务下达时间
            var type =  data.field.type;//检测类型
            var date2 =  data.field.date2;//要求完成时间
            var samplePerson = formSelects.value('sample_person', 'valStr');//采样人员
            var test_content = $("#test_content").val();;//气还是水
            var currentDetails = [];
            $.each($('.details'),function(index,item){
                var number = $(item).find('input[name="number"]').val();
                var program_type = $(item).find('input[name="program_type"]').val();//检测项目类别
                var site_number = $(item).find('input[name="site_number"]').val();//点位个数
                var program_number = $(item).find('input[name="program_number"]').val();//检测项目个数
                var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                var thatday_number = Number($(item).find('input[name="thatday_number"]').val());
                var remark = $(item).find('input[name="remark"]').val();
                //var sampleType = $(item).find('select[name="sampleType"]>option:selected').text();//检测种类
                var circulation =  $(item).find('input[name^="circulation"]:checked').val();//是否流转
                var obj = {
                    'details_int2':number,
                    'details_string':program_type,
                    'details_int3':detection_frequency,
                    'details_int4':detection_days,
                    'details_string10':circulation,
                    'details_money3':program_number,//检测项目个数
                    'details_money5':site_number,//点位个数
                    'details_money4':thatday_number,
                    //'details_string7':sampleType,
                    'details_string6':remark
                };
                currentDetails.push(obj);
            });

            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    'currency_type':44,
                    'currency_string2':program_name,
                    'currency_string7':specimen_name,
                    'currency_date2':date1,
                    'currency_string8':type,
                    'currency_string5':test_content,
                    'currency_date3':date2,
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
                +        '<label class="layui-form-label">检测点位 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="detection_site" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">检测项目 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="detection_program" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">方法依据 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="according" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">检测频次 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="detection_frequency" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">检测天数 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="detection_days" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">应采样数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="should_number" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">已采样数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="already_number" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +        '<label class="layui-form-label">采样数量 :</label>'
                +        '<div class="layui-input-block">'
                +          '<input type="text" name="thatday_number" class="layui-input">'
                +        '</div>'
                +      '</div>'
                +      '<div class="layui-form-item">'
                +	     '<label class="layui-form-label">备注 :</label>'
                +		 '<div class="layui-input-block">'
                +		   '<textarea name="remark" class="layui-textarea"></textarea>'
                +	     '</div>'
                +	   '</div>'
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
            //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem3($demo);
        }

    });
</script>
</body>
</html>
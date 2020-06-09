<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 两率异常剔除申请-手机端 -->
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
				<h2 class="">两率异常剔除申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'onlineOperation/mTwoRateAbnormalOutList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
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
						<label class="layui-form-label">运维人 :</label>
						<div class="layui-input-block">
							<input type="text" name="operation_person" id="operation_person" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">站点名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="site_name" id="site_name" class="layui-input">
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">剔除项目 :</label>
						<div class="layui-input-block">
							<select id='equipment_type' name="equipment_type" xm-select="selectId" xm-select-skin="default" lay-verify="required">
								<option value="">请选择</option>
								<option value="COD">COD</option>
								<option value="氨氮">氨氮</option>
								<option value="TP">TP</option>
								<option value="TN">TN</option>
								<option value="废水流量计">废水流量计</option>
								<option value="二氧化硫">二氧化硫</option>
								<option value="NOX">NOX</option>
								<option value="颗粒物">颗粒物</option>
								<option value="烟气流量">烟气流量</option>
								<option value="其他">其他</option>
							</select>
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">责任部门 :</label>
						<div class="layui-input-block">
							<select id='duty_department' name="duty_department" lay-filter="duty_department" lay-search lay-verify="required">
								<option value="">请选择</option>
							</select>
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">异常时间段 :</label>
						<div class="layui-input-block time-ranges">
							<input type="text" name="date1" class="layui-input" id="date1" placeholder="选择开始时间">&emsp;-&emsp;
							<input type="text" name="date2" class="layui-input" id="date2" placeholder="选择结束时间">
						</div>
						
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">异常情况描述 :</label>
						<div class="layui-input-block">
							<textarea name="abnormity_describe" placeholder="请输入异常状况" class="layui-textarea"></textarea>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<textarea name="remark" placeholder="剔除项目选其他时填写" class="layui-textarea"></textarea>
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
                //表单更新渲染
				form.render();
                formSelects.render('selectId');
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				laydate.render({
					elem: '#date2' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
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
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				    	}
			        }
				});
                
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var operation_person = data.field.operation_person;
                    var site_name = data.field.site_name;
                    var equipment_type = formSelects.value('selectId', 'valStr');						//剔除类型
                    var duty_department = $('#duty_department').find('option:selected').text();
                    var abnormity_startDate = data.field.date1; //异常时间段
                    var abnormity_endDate = data.field.date2;
                    var abnormity_describe = data.field.abnormity_describe;
                    var remark = data.field.remark;
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':42,
                            'currency_string3':operation_person,
                            'currency_string4':site_name,
                            'currency_string8':equipment_type,
                            'currency_string9':duty_department,
                            'currency_string5':abnormity_startDate+"到"+abnormity_endDate,
                            'currency_string7':abnormity_describe,
                            'currency_string10':remark,
                            'currency_date2':abnormity_startDate,
                            'currency_date3':abnormity_endDate
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
				setApplyMessage(staffName,departmentId);
                /*//设备类型
                var equipment_type_name_html = '';//设备类型下拉列表框
                $.ajax({
                    url:'System/selectInvTypeByCode.action',
                    type:'post',
                    data:{"type":"01"},
                    dataType:'JSON',
                    success:function(res){
                        var html = '<option value="">请选择设备类型</option>';
                        $.each(res.data,function(index,item){
                            console.log(item.cInvCName);
                            html += '<option value="'+item.cInvCName+'">'+item.cInvCName+'</option>';
                        });
                        equipment_type_name_html = html;
                        $('#equipment_type').html(html);
                        form.render('select');
                    }
                });*/
                //查询所有部门
                $.ajax({
                    url : "Department/selectDingAllDepartment.action",
                    type : "post",
                    data : {},
                    dataType : "JSON",
                    success : function(res){
                        var html = '<option value="">请选择部门</option>';
                        $.each(res.data,function(index,item){
                            html += '<option value="'+item.ding_depmid+'">'+item.department_Name+'</option>';
                        });
                        $('#duty_department').html(html);
                        form.render('select');
                    }
                });
            	//操作
                
            	
            });
        </script>
	</body>
</html>
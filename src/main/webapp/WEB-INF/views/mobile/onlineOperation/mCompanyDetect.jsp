<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 运维企业技术支持检测任务申请-手机端 -->
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
				<h2 class="">运维企业技术支持检测任务申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'onlineOperation/mTechnicalSupportDetectionList.action';">查看申请记录</li>
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
						<label class="layui-form-label">区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">企业名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">站点名称 :</label>
						<div class="layui-input-block">
							<input type="text" id="site_name" name="site_name" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">检测项目 :</label>
						<div class="layui-input-block">
							<select name="test_project" id="test_project" lay-filter="test_project" class="layui-select" lay-search lay-verify="required">
								<option value="">==请选择==</option>
								<option value="SO2、NOx、O2">SO2、NOx、O2</option>
								<option value="颗粒物">颗粒物</option>
								<option value="流速、排放量">流速、排放量</option>
								<option value="烟温">烟温</option>
								<option value="湿度">湿度</option>
								<option value="HCL">HCL</option>
								<option value="CO">CO</option>
								<option value="PH">PH</option>
								<option value="水温">水温</option>
								<option value="流量">流量</option>
								<option value="VOCs">VOCs</option>
							</select>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">检测需求日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="test_date" class="layui-input" id="date3">
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">申请原因 :</label>
						<div class="layui-input-block">
							<input type="text" name="apply_reason" class="layui-input">
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
				/*laydate.render({
					elem: '#date1' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});*/
				//执行一个laydate实例
				/*laydate.render({
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
				});*/
				laydate.render({
					elem: '#date3'
				});
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
                    // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                    // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                    // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var area_id = data.field.area;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var customer_id = data.field.customer_name;										//站点编号
					var customer_name = $('#customer_name').find('option:selected').text();			//站点名称
					var site_name = data.field.site_name;
					var test_project = data.field.test_project;											//检测项目
					var test_date = data.field.test_date; 											//检测需求日期
					var apply_reason = data.field.apply_reason; 									//申请原因

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
							'currency_type':80,
							'currency_string2':area_id,
							'currency_string3':area_name,
							'currency_string4':customer_id,
							'currency_string5':customer_name,
							'currency_string7':test_project,
							'currency_string8':apply_reason,
							'currency_string9':site_name,
							'currency_date2':test_date
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

                // 过程一第一级 - 获取登陆人区域
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
                        $('#area').html(html);
                        form.render('select');
                    }
                });

                form.on('select(area)',function (data) {
					var cDCCode = data.value;
					$.ajax({
						url:'System/selectUser.action',
						type:'post',
						data:{"cDCCode": cDCCode},
						dataType:'JSON',
						success:function(res){
							var html = '<option value="">请选择站点名称</option>';
							$.each(res.data,function(index,item){
								html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'">'+item.cCusName+'</option>'
							});
							$('#customer_name').html(html);
							form.render('select');
						}
					});
				});
				// 重置[客户名称]级下面的内容(合同编号 合同条款)
				$('#contract_id').siblings().remove();
				$('#contract_id').html('');
				$('.contract-details').remove();
				form.render();
            });
        </script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 运维检测任务申请-手机端 -->
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
				<h2 class="">运维检测任务申请</h2>
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
						<label class="layui-form-label">检测内容 :</label>
						<div class="layui-input-block">
							<select name="test_content" id="test_content" lay-filter="test_content" class="layui-select" lay-search lay-verify="required">
								<option value="气">气</option>
								<option value="水">水</option>
							</select>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">计划检测日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="plan_date" class="layui-input" id="date3">
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">计划完成时间 :</label>
						<div class="layui-input-block">
							<input type="text" name="plan_accomplishDate" class="layui-input" id="date4">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="client_name" id="client_name" lay-filter="client_name" lay-search lay-verify="required"></select>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">检测类型 :</label>
						<div class="layui-input-block">
							<select id="type" name="type" lay-filter="type" lay-search lay-verify="required">
								<option value="">==请选择==</option>
								<option value="设备校验">设备校验</option>
								<option value="常规检测">常规检测</option>
							</select>
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">采样类型 :</label>
						<div class="layui-input-block">
							<select id="sampleType" name="sampleType" xm-select="selectId" xm-select-skin="default" lay-verify="required">
								<option value="">==请选择==</option>
								<option value="超低有组织废气">超低有组织废气</option>
								<option value="非超低有组织废气">非超低有组织废气</option>
								<option value="PH计">PH计</option>
								<option value="水温计">水温计</option>
								<option value="流量计">流量计</option>
							</select>
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
				laydate.render({
					elem: '#date4'
				});
                
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
                    // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
                    // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
                    // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var test_content = $('#test_content').find('option:selected').text();
                    var plan_date = data.field.plan_date; 											//计划检测日期
                    var plan_accomplishDate = data.field.plan_accomplishDate; 						//计划完成日期
                    var client_name = $('#client_name').find('option:selected').text();				//客户名称
                    var type = $('#type').find('option:selected').text();							//检测类型
                    //var sampleType = $('#sampleType').find('option:selected').text();				//采样类型
                    var sampleType = formSelects.value('selectId', 'valStr');						//采样类型
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':41,
                            'currency_int':0,//对接入信泽采样流程
                            'currency_int2':1,//对接入信泽采样流程
                            'currency_string2':client_name,
                            'currency_string5':test_content,
                            'currency_string8':type,
                            'currency_string7':sampleType,
                            'currency_date3':plan_date,
                            'currency_date2':plan_accomplishDate
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

                //客户
                $.ajax({
                    url:'System/selectAllUser.action',
                    type:'post',
                    data:{},
                    dataType:'JSON',
                    success:function(res){
                        var html = '<option value="">请选择客户</option>';
                        $.each(res.data,function(index,item){
                            html += '<option value="'+item.cCusCode+'">'+item.cCusName+'</option>';
                        });
                        $('#client_name').html(html);
                        form.render('select');
                    }
                });
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
                        $('#taskGet_department').html(html);
                        form.render('select');
                    }
                });
                //过程一:区域 - 客户名称 - 合同编号 - 合同条款
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
                // 过程一第二级 - 根据区域获取客户名称
                form.on('select(area)', function(data){
                    var cDCCode = data.value;
                    $.ajax({
                        url:'System/selectUser.action',
                        type:'post',
                        data:{"cDCCode": cDCCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择客户名称</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'">'+item.cCusName+'</option>'
                            });
                            $('#customer_name').html(html);
                            form.render('select');
                        }
                    });
                    // 重置[客户名称]级下面的内容(合同编号 合同条款)
                    $('#contract_id').siblings().remove();
                    $('#contract_id').html('');
                    $('.contract-details').remove();
                    form.render();
                });
            	
            });
        </script>
	</body>
</html>
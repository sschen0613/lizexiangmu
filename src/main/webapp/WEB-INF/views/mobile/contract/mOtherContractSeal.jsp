<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 业务招待申请-手机端 -->
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
				<h2 class="">其他合同盖章申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'contract/mOtherContractSealList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<%--<div class="layui-form-item">
						<label class="layui-form-label">请购单号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>--%>
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
						<label class="layui-form-label">签约单位 :</label>
						<div class="layui-input-block">
							<input name="company" id="company" class="layui-input" >
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">签约内容 :</label>
						<div class="layui-input-block">
							<input type="text" id="content" name="content" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同总金额 :</label>
						<div class="layui-input-block">
							<input id="contract_amount" type="text" name="contract_amount" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">已收/付金额 :</label>
						<div class="layui-input-block">
							<input id="actual_receipt" type="text" name="actual_receipt" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">未收/付金额 :</label>
						<div class="layui-input-block">
							<input id="outstanding_receipt" type="text" name="outstanding_receipt" class="layui-input" lay-verify="required">
						</div>
					</div>
						<div class="layui-form-item">
							<label class="layui-form-label">备注 :</label>
							<div class="layui-input-block">
								<input id="remark" type="text" name="remark" class="layui-input">
							</div>
						</div>
					<div class="layui-form-item">
						<label class="layui-form-label">上传图片 :</label>
						<div class="layui-input-block">
							<input type="file" id="pics" name="pics" accept="image/*" capture="camera" multiple lay-verify="required">
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
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    //var illustration = data.field.illustration; //说明

                    var content = data.field.content; //签约内容
                    var company = data.field.company; //签约单位

                    var contract_amount = data.field.contract_amount;
                    var actual_receipt = data.field.actual_receipt;
                    var outstanding_receipt = data.field.outstanding_receipt;

					var remark = data.field.remark;//备注

                    var currency_type = 63;

                    var myForm = new FormData();
                    myForm.set("currency_type",currency_type);
                    myForm.set("currencyDate",currencyDate);
                    myForm.set("currency_string2",company);
                    myForm.set("currency_string3",content);
                    myForm.set("currency_string10",contract_amount);
                    myForm.set("currency_string11",actual_receipt);
                    myForm.set("currency_string12",outstanding_receipt);
					myForm.set("currency_string13",remark);

                    for(let i = 0;i < $("#pics")[0].files.length;i++){
                        myForm.append("pics",$("#pics")[0].files[i])
                    }

                    $.ajax({
                        url : "Currency/launchCurrencyApply.action"
                        ,type : "post"
                        ,data : myForm
                        ,contentType: false
                        ,processData: false
                        ,cache:false
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
                
    			//表单初始化
                //获取请购单号
				//setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);
            	
				//操作
                //限制客人人数只允许输入整数
				//inputLimitInteger($('#person_number'));
                //金额自动翻译成大写且金额保留两位小数
                //inputLimitAmount($("#amount"),$('#amountCapitals'));
            });
        </script>
	</body>
</html>
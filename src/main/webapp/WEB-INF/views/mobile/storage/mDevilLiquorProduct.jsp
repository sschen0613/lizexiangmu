<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 废液产生提报-手机端 -->
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
				<h2 class="">废液产生提报</h2>
				<%--<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mOutlibraryOfMaterialClassList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>--%>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 请按照区域 - 企业名称 - 站点名称的顺序进行选择</i>
				</div>
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">提报编号 :</label>
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
						<label class="layui-form-label">县区 :</label>
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
							<select name="site" id="site" lay-filter="site" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">废液类型 :</label>
						<div class="layui-input-block">
							<select name="devilLiquor_type" id="devilLiquor_type" lay-filter="devilLiquor_type" class="layui-select" lay-search lay-verify="required">
								<option value="">请选择</option>
								<option value="COD">COD</option>
								<option value="氨氮">氨氮</option>
								<option value="总磷">总磷</option>
								<option value="总氮">总氮</option>
								<option value="总铬">总铬</option>
								<option value="总砷">总砷</option>
								<option value="总镍">总镍</option>
								<option value="氰化物">氰化物</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">数量 :</label>
						<div class="layui-input-block">
							<input type="text" id="amount" name="amount" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="remark"></textarea>
						</div>
					</div>
					<div class="apply-detail-container">
						<div class="apply-detail">
							<div class="details-title details-title1">编码信息<span class="layui-icon layui-icon-up"></span></div>
							<div class="details">

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
                
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					//console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;											//单号
                    var area_id = data.field.area;													//地区编号
                    var area_name = $('#area').find('option:selected').text();						//区域名称
                    var site_code = data.field.site;												//站点编号
                    var site_name = $('#site').find('option:selected').text();					//站点名称
                    var customer_id = data.field.customer_name;										//企业编号
                    var customer_name = $('#customer_name').find('option:selected').text();			//企业名称
					var devilLiquor_type = data.field.devilLiquor_type;								//类型
                    var amount = data.field.amount;													//数量
                    var remark = data.field.remark;													//备注

                    var codes = $('.code');
					var currencyDetails = [];
					$.each(codes,function(index,item){
                        var code = $(item).val();													//废液编码
                        var obj = {'details_string':code,'details_int':0};
                        currencyDetails.push(obj);
					});
				 	$.ajax({
				 		 url : "Currency/addDevilLiquor.action"
				 		,type : "post"
				 		,data : {"currency_type":78,'currency_number':buy_number
							,"currency_string2": area_id,"currency_string3":area_name
							,"currency_string4": customer_id,"currency_string5": customer_name
							,"currency_string7":site_code ,'currency_string8':site_name
							,"currency_string9":devilLiquor_type,"currency_string10":remark
                            ,"currency_money":amount
                            ,"currencyDetails":JSON.stringify(currencyDetails)}
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
                //var areaid = "${sessionScope.systemStaff.staff_Address }";
				setApplyMessage(staffName,departmentId);
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
				// 过程一第一级 - 获取登陆人区域
				var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
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
    				// 重置[客户名称]级下面的内容(合同编号 金额信息 合同条款 明细信息)
					$('#site').siblings().remove();
					$('#site').html('');
        		});
                // 过程一第三级 - 根据企业名称获取站点
                form.on('select(customer_name)', function(data){
                    var companyCode = data.value;
                    $.ajax({
                        url:'Currency/selectSite.action',
                        type:'post',
                        data:{"companyCode": companyCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择站点</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.siteCode+'">'+item.siteName+'</option>';
                            });
                            $('#site').html(html);
                            form.render('select');
                        }
                    });
                });

				$('#amount').bind("input propertychange",function(e){
					var amount = $('#amount').val();
					var html = '';
					for (var i=1;i<=amount;i++){
						var uuid = formatDateTime() + '0' + i;
						html += '<div class="layui-form-item">'
								+        '<label class="layui-form-label">编码'+i+' :</label>'
								+        '<div class="layui-input-block">'
								+          '<input type="text" class="code" name="code"'+i+' value="'+uuid+'" class="layui-input">'
								+        '</div>';
					}
					$('.details').html('');
					$('.details').append(html);
					form.render();
				});

				inputLimitNumber($('#amount')); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)

				function formatDateTime() {
					var date = new Date();
					var y = date.getFullYear();
					var m = date.getMonth() + 1;
					m = m < 10 ? ('0' + m) : m;
					var d = date.getDate();
					d = d < 10 ? ('0' + d) : d;
					var h = date.getHours();
					var minute = date.getMinutes();
					var second = date.getSeconds();
					return ""+y + m + d + h + minute + second;
				}
            });
        </script>
	</body>
</html>
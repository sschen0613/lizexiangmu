<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 维修入库申请表页面-手机端 -->
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
				<h2 class="">维修入库申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mRepairWarehousingList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 设备名称 - 检测项目的顺序进行选择</i>
				</div>
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">单据编号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">录入人 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_applicant" id="staffName" class="layui-input" readonly>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">录入日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_date" id="date" class="layui-input" readonly>
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">出库类型 :</label>
						<div class="layui-input-block">
							<select name="outgoing_type" id="outgoing_type" lay-filter="outgoing_type" class="layui-select" lay-search lay-verify="required"></select>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">设备名称 :</label>
						<div class="layui-input-block">
							<select id="runproduct_name" name="runproduct_name" lay-filter="runproduct_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">出厂编号 :</label>
						<div class="layui-input-block">
							<input type="text" name="runproduct_id"  class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">规格型号 :</label>
						<div class="layui-input-block">
							<input type="text" name="runproduct_models"  class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">单位 :</label>
						<div class="layui-input-block">
							<input type="text" name="runproduct_unit"  class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">检测项目 :</label>
						<div class="layui-input-block">
							<select id="runproduct_item" name="runproduct_item" lay-filter="runproduct_item" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">检测类型 :</label>
						<div class="layui-input-block">
							<input type="text" name="detection_type"  class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">服务状态 :</label>
						<div class="layui-input-block">
							<input type="text" name="service_state"  class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">仓库 :</label>
						<div class="layui-input-block">
							<select name="cangku" id="cangku" lay-filter="cangku" class="layui-select" data-cknumber="" lay-search lay-verify="required"></select>
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
									<label class="layui-form-label">货品名称 :</label>
									<div id="container1" class="layui-input-block container container1">
										<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询" lay-verify="required">
										<div class="list-container" style="display:none;">
											<ul></ul>
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">规格型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="specifications_models" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">单位 :</label>
									<div class="layui-input-block">
										<input type="text" name="unit" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">出库数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">备注 :</label>
									<div class="layui-input-block">
										<input type="text" name="remark" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">库存数量 :</label>
									<div class="layui-input-block">
										<input type="text" name="storage_quantity" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">货位 :</label>
									<div class="layui-input-block">
										<input type="text" name="storage_site" class="layui-input" readonly>
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
                
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					//console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;											//单据编号
					var area_id = data.field.area;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var customer_id = data.field.customer_name;										//客户编号
					var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
					var currency_applicant = data.field.currency_applicant;							//录入人
					var currency_date = data.field.currency_date;									//录入时间
					var outgoing_type = data.field.outgoing_type;									//出库类型
					var runproduct_number = data.field.runproduct_name;								//设备编号
					var runproduct_name = $('#runproduct_name').find('option:selected').text();		//设备名称
					var runproduct_id = data.field.runproduct_id;									//出厂编号
					var runproduct_models = data.field.runproduct_models;							//规格型号
					var runproduct_unit = data.field.runproduct_unit;								//单位
					var item_id = data.field.runproduct_item;										//检测项目编号
					var item_name = $('#runproduct_item').find('option:selected').text();			//检测项目名称
					var detection_type = data.field.detection_type;									//检测类型
					var service_state = data.field.service_state;									//服务状态
					var cWhName = $('#cangku').find('option:selected').text();						//仓库名称
					var cWhId = data.field.cangku;													//仓库编码
					
					var currencyDetails = [];
					$.each($('.details'),function(index,item){
						var product_name = $(item).find('input[name="product_name"]').val();				//货品名称
						var specifications_models = $(item).find('input[name="specifications_models"]').val(); //规格型号
						var unit = $(item).find('input[name="unit"]').val();								//单位
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());		//出库数量
						var remark = $(item).find('input[name="remark"]').val();							//备注
						var storage_quantity = Number($(item).find('input[name="storage_quantity"]').val());//库存数量
						var storage_site = $(item).find('input[name="storage_site"]').val();				//货位
						
						var obj = { '':product_name
									,"":specifications_models
									,'':unit
									,'':buy_quantity
									,'':remark
									,'':storage_quantity
									,'':storage_site};
						currencyDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : ""
				 		,type : "post"
				 		,data : {'currency_number':buy_number
				 				,"": area_id
				 				,"":area_name
				 			 	,"": customer_id
				 			 	,"currency_type":2
				 			 	,"": currency_applicant
				 			 	,"": currency_date
				 			 	,"":outgoing_type
				 			 	,"":runproduct_number
				 			 	,"":runproduct_id
				 			 	,"":runproduct_models
				 			 	,"":runproduct_unit
				 			 	,"":item_id
				 			 	,"":detection_type
				 			 	,"":service_state
				 			 	,'':cWhName
				 			 	,'':cWhId
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
				setApplyMessage(staffName,departmentId);
				//过程四:区域 - 客户名称 - 设备名称 - 设备其他信息+检测项目 - 检测项目其他信息
				// 过程四第一级 - 获取登陆人区域
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
    			// 过程四第二级 - 根据区域获取客户名称
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
    							html += '<option value="'+item.cCusCode+'">'+item.cCusName+'</option>'
    						});
    						$('#customer_name').html(html);
    						form.render('select');
    					}
    				});
					// 重置[客户名称]级下面的内容(设备名称 设备信息 检测项目 检测项目信息 明细信息)
    				$('#runproduct_name').siblings().remove();
					$('#runproduct_name').html('');
					$('input[name="runproduct_id"]').val('');
					$('input[name="runproduct_models"]').val('');
					$('input[name="runproduct_unit"]').val('');
					$('#runproduct_item').siblings().remove();
					$('#runproduct_item').html('');
					$('input[name="detection_type"]').val('');
					$('input[name="service_state"]').val('');
					//明细信息进行局部重新加载
					//$(".apply-detail-container").load(location.href+" .apply-detail"); 
					//setTimeout(function(){
					//	detailsRender(1); //明细信息第一行自定义渲染事件
					//},1000);
					//form.render();
					//明细信息序号重置
					//n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					//currentProductValues = [];
        		});
        		// 过程四第三级 - 根据客户名称获取设备名称
                form.on('select(customer_name)', function(data){
                    var cCusCode = data.value;
                    //获取设备名称(附带设备名称其他信息)
    				$.ajax({
    					url:'',
    					type:'post',
    					data:{},
    					dataType:'JSON',
    					success:function(res){
    						var html = '<option value="">请选择设备名称</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.商品编号+'" data-models="'+item.规格型号
    							+'" data-unit="'+item.单位+'">'+item.商品名称+'</option>';
    						});
    						$('#runproduct_name').html(html);
    					}
    				});
                    // 重置[客户名称]级下面的内容(设备信息 检测项目 检测项目信息 明细信息)
					$('input[name="runproduct_id"]').val('');
					$('input[name="runproduct_models"]').val('');
					$('input[name="runproduct_unit"]').val('');
					$('#runproduct_item').siblings().remove();
					$('#runproduct_item').html('');
					$('input[name="detection_type"]').val('');
					$('input[name="service_state"]').val('');
					//明细信息进行局部重新加载
					//$(".apply-detail-container").load(location.href+" .apply-detail"); 
					//setTimeout(function(){
					//	detailsRender(1); //明细信息第一行自定义渲染事件
					//},1000);
					//form.render();
					//明细信息序号重置
					//n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					//currentProductValues = [];
                });
                // 过程四第四级 - 根据设备名称设置设备其他信息 及 获取检测项目
                form.on('select(runproduct_name)',function(data){
        			var id = data.value;
        			var models = $(data.elem).find("option:selected").attr('data-models');
        			var unit = $(data.elem).find("option:selected").attr('data-unit');
        			$('input[name="runproduct_id"]').val(id);
        			$('input[name="runproduct_models"]').val(models);
        			$('input[name="runproduct_unit"]').val(unit);
        			//获取检测项目(附带检测项目其他信息)
    				$.ajax({
    					url:'',
    					type:'post',
    					data:{},
    					dataType:'JSON',
    					success:function(res){
    						var html = '<option value="">请选择检测项目</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.检测项目编号+'" data-type="'+item.检测类型
    							+'" data-state="'+item.服务状态+'">'+item.检测项目+'</option>';
    						});
    						$('#runproduct_item').html(html);
    					}
    				});
    				// 重置[客户名称]级下面的内容(检测项目信息 明细信息)
					$('input[name="detection_type"]').val('');
					$('input[name="service_state"]').val('');
					//明细信息进行局部重新加载
					//$(".apply-detail-container").load(location.href+" .apply-detail"); 
					//setTimeout(function(){
					//	detailsRender(1); //明细信息第一行自定义渲染事件
					//},1000);
					//form.render();
					//明细信息序号重置
					//n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					//currentProductValues = [];
        		});
                // 过程四第五级 - 根据检测项目获取检测项目其他信息
        		form.on('select(runproduct_item)',function(data){
        			var detectionType = $(data.elem).find("option:selected").attr('data-type');
        			var serviceState = $(data.elem).find("option:selected").attr('data-state');
        			$('input[name="detection_type"]').val(detectionType);
        			$('input[name="service_state"]').val(serviceState);
        			
        			// 重置[客户名称]级下面的内容( 明细信息)
					//$($('.details')[0]).siblings('.details').remove();
					//$('.details').find('input').val('');
					//form.render();
					//当前明细信息每一行的商品名称input框值重置 
					//currentProductValues = [];
        		});
        		//过程二:仓库 - 商品 - 商品其它信息
        		// 一:获取仓库
    			$.ajax({
    				url:'System/selectCangKu.action',
    				type:'post',
    				dataType:'JSON',
    				success:function(res){
    	 				var html = '<option value="">请选择仓库</option>';
    					$.each(res.data,function(index,item){
    						html += '<option value="'+item.cWhCode+'">'+item.cWhName+'</option>';
    					});
    					$('#cangku').html(html); 
    					form.render('select');
    				}
    			});
        		
                //操作
                //点击添加明细按钮
                var d_count = 1;
                $('.addDetails').click(function(){
                  d_count++;
                  n_count++;
                  var html = ''
                    +  '<div class="apply-detail">'
                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+n_count+'<span class="layui-icon layui-icon-up"></span></div>'
                    +    '<div class="details">'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">货品名称 :</label>'
                    +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
                    +          '<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询" lay-verify="required">'
                    +          '<div class="list-container" style="display:none;">'
                    +            '<ul></ul>'
                    +          '</div>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">规格型号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specifications_models" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">单位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="unit" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">出库数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">备注 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="remark" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">库存数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="storage_quantity" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">货位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="storage_site" class="layui-input" readonly>'
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
                    searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                //行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct1($demo);
        		}
                
            });
        </script>
	</body>
</html>
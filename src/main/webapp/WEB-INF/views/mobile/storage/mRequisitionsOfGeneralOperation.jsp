<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 普通运营请购申请-手机端 -->
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
				<h2 class="">普通运营请购申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mRequisitionsOfGeneralOperationList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号的顺序进行选择</i>
				</div>
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">请购单号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">说明 :</label>
						<div class="layui-input-block">
							<textarea name="illustration" id="illustration" class="layui-textarea" readonly>用于丽泽公司运营合同、BO合同</textarea>
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
						<label class="layui-form-label">区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required" disabled></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
		 			<%--<div class="layui-form-item">
						<label class="layui-form-label">出库类型 :</label>
						<div class="layui-input-block">
							<select name="out_type" class="layui-select"><option value="1">BO设备出库</option><option value="2">运营出库</option></select>
						</div>
					</div>--%>
					<div class="layui-form-item">
						<label class="layui-form-label">申请类型 :</label>
						<div class="layui-input-block">
							<select name="applyType" id="applyType" class="layui-select" lay-search lay-verify="required">
								<option value="">请选择申请类型</option>
								<option value="1" selected>普通请购</option>
								<option value="2">维修入库</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">货品流转编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="productNumber" id="productNumber" class="layui-input" placeholder="申请类型为维修入库时请输入货品编码" autocomplete="off" disabled>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">销售合同编号 :</label>
						<div class="layui-input-block">
							<select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">合同条款 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="contract" readonly></textarea>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">运营合同起止时间 :</label>
						<div class="layui-input-block">
							<input type="text" name="start_time" class="layui-input" id="start_time" readonly>
							&emsp;-&emsp;
							<input type="text" name="end_time" class="layui-input" id="end_time" readonly>
						</div>
 					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">期望到货日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="expectedDelivery_date" id="date1" class="layui-input" placeholder="请选择日期" autocomplete="off">
						</div>
 					</div>
					<div class="layui-form-item" style="display: none">
						<label class="layui-form-label">合同金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount" name="contract_amount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item" style="display: none">
						<label class="layui-form-label">实际已收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item" style="display: none">
						<label class="layui-form-label">欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item" style="display: none">
						<label class="layui-form-label">期初合同已收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="moneyBegin" name="moneyBegin" class="layui-input" readonly>
						</div>
					</div>
					<div class="apply-detail-container">
						<div class="apply-detail">
							<div class="details-title details-title1">明细信息#1<span class="layui-icon layui-icon-up"></span></div>
							<div class="details">
								<div class="layui-form-item">
									<label class="layui-form-label">运营设备编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="runproduct_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">运营设备名称 :</label>
									<div class="layui-input-block">
										<input type="text" name="runproduct_name" class="layui-input" readonly>
									</div>
								</div>
								<%--<div class="layui-form-item">
									<label class="layui-form-label">运营设备开始日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="start_time" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">运营设备结束日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="over_time" class="layui-input" readonly>
									</div>
								</div>--%>
								<div class="layui-form-item">
									<label class="layui-form-label">存货编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="inventory_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">商品名称 :</label>
									<div id="container1" class="layui-input-block container container1">
										<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询">
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
									<label class="layui-form-label">请购数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">库存数量 :</label>
									<div class="layui-input-block">
										<input type="text" name="inventory_quantity" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item" style="display: none">
									<label class="layui-form-label">物品报价 :</label>
									<div class="layui-input-block">
										<input type="text" name="item_offer" class="layui-input">
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
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });
                /*//运营合同起止时间
				laydate.render({
					elem: '#start_time' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function(value, date, endDate){
				    	// console.log(value); //得到日期生成的值
				    	//开始日选好后，判断结束日期是否合法
				    	if($('#end_time').val() != ''){
				    		$('#end_time').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#start_time').val('');});
				    	}
				    }
				});
				laydate.render({
					elem: '#end_time' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#start_time').val() != ''){
				    		$('#start_time').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#end_time').val('');});
				    	}
			        }
				});*/

                //监听申请类型，维修入库添加货品流转编码输入框
                form.on('select(applyType)',function (data) {
                    var applyType = data.value;
                    if(applyType == '2'){
                        $('#productNumber').removeAttr("disabled");
                        $('#productNumber').attr("lay-verify","required");
                    }else {
                        $('#productNumber').attr("disabled",true);
                    }
                });

                var areaid = "${sessionScope.systemStaff.staff_Address }";
				detailsRender(1); //明细信息每行自定义渲染事件
				//过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
                // 第一级 - 获取登录人区域
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
    					$('#area').val(areaid);
    					form.render('select');
    				}
    			});
    			// 第二级 - 根据区域获取客户名称
        		//form.on('select(area)', function(data){
    				var cDCCode = areaid;
    				$.ajax({
    					url:'System/selectUser.action',
    					type:'post',
    					data:{"cDCCode": cDCCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择客户名称</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-cDep="'+item.cCusDepart+'">'+item.cCusName+'</option>'
    						});
    						$('#customer_name').html(html);
    						form.render('select');
    					}
    				});
    				// 重置[客户名称]级下面的内容(合同编号 金额信息 合同条款 明细信息)
					$('#contract_id').siblings().remove();
					$('#contract_id').html('');
					$('#contract_amount').val('');
                	$('#moneyBegin').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('textarea[name="contract"]').val('');
					//明细信息进行局部重新加载
					$(".apply-detail-container").load(location.href+" .apply-detail"); 
					setTimeout(function(){
						detailsRender(1); //明细信息第一行自定义渲染事件
					},1000);
					form.render();
					//明细信息序号重置
					n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		//});
        		// 第三级 - 根据客户名称获取销售合同编号
                var cCusPPerson = '';//保存业务员编码
                var cCusDepart = '';//保存业务员部门
        		form.on('select(customer_name)', function(data){
    				var cCusCode = data.value;
                    cCusPPerson = $("#customer_name").find('option:selected').attr('data-cCusPPerson');
                    cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
    				$.ajax({
    					url:'System/selectContract.action',
    					type:'post',
    					data:{"cCusCode": cCusCode},
    					dataType:'JSON',
    					success:function(res){
    		 				var html = '<option value="">请选择销售合同编号</option>';
    						$.each(res.data,function(index,item){
    							html += '<option value="'+item.strContractID+'" data-name="'+item.strContractName+'" data-moneyBegin="'+item.cDefine14+'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
    							+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
    						});
    						$('#contract_id').html(html);
    						form.render('select');
    					}
    				});
    				//重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
    				$('#contract_amount').val('');
                    $('#moneyBegin').val('');
					$('#actual_receipt').val('');
					$('#outstanding_receipt').val('');
					$('textarea[name="contract"]').val('');
					//明细信息进行局部重新加载
					$(".apply-detail-container").load(location.href+" .apply-detail"); 
					setTimeout(function(){
						detailsRender(1); //明细信息第一行自定义渲染事件
					},1000);
					form.render();
					//明细信息序号重置
					n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});
        		// 第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)
                form.on('select(contract_id)', function(data){
                    var strContractID = data.value;//合同编号

                    $.ajax({
                        url:'System/selectContractById.action',
                        type:'post',
                        data:{'strContractID':strContractID},
                        dataType:'JSON',
                        success:function(result){
                            var contract = result.data;
                            //合同起止时间
                            $('#start_time').val(contract.strContractStartDate);//
                            $('#end_time').val(contract.strContractEndDate);//
                        }
                    });

                    var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
                    $("#contract_amount").val(contractAmount);//合同金额

                    var moneyBegin =  $(data.elem).find("option:selected").attr('data-moneyBegin');
                    $("#moneyBegin").val(moneyBegin == "undefined"?"无":moneyBegin);//期初合同已收款金额

                    //查询合同收款计划
                    $.ajax({
                        url:'System/selectReceivables.action',
                        type:'post',
                        data:{'strContractID':strContractID},
                        dataType:'JSON',
                        success:function(result){
                            var acceptAmount = 0;
                            $.each(result.data,function(index,item){
                                acceptAmount += Number(item.dblPayCurrency);
                            });
                            $('#actual_receipt').val(acceptAmount);//已收金额
                            $('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
                        }
                    });
                    //重置合同条款
                    $('.contract-details').remove();
                    //查询合同条款
                    $.ajax({
                        url:'System/selectContractAll.action',
                        type:'post',
                        data:{'strContractID':strContractID},
                        dataType:'JSON',
                        success:function(res){
                        	var value = '';
            				$.each(res.data,function(index,item){
            					value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
            				});
            				$('textarea[name="contract"]').val(value);
                        }
                    });
                    //获取运营设备(附带运营设备编码和设备运营期间)
                    $.ajax({
                        url:'System/selectshebei.action',
                        type:'post',
                        data:{"strContractID": strContractID},
                        dataType:'JSON',
                        success:function(res){
                            $('.apply-detail').remove();
                            var n_count = 0, d_count = 0, models = '无';
                            $.each(res.data,function(index,item){
                                n_count++;d_count++;
                                if(item.规格 != undefined){models = item.规格;}
                                var html = ''
                                    +  '<div class="apply-detail">'
                                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+n_count+'<span class="layui-icon layui-icon-up"></span></div>'
                                    +    '<div class="details">'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">运营设备编码 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="runproduct_id" value="'+item.商品编号+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">运营设备名称 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="runproduct_name" value="'+item.商品名称+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">设备运营开始期间 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="start_date" value="'+item.开始时间+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">设备运营结束时间 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="over_time" value="'+item.结束时间+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">存货编码 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="inventory_id" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">商品名称 :</label>'
                                    +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
                                    +          '<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询">'
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
                                    +        '<label class="layui-form-label">请购数量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" lay-verify="required">'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">库存数量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="inventory_quantity" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                				    +      '<div class="layui-form-item" style="display: none">'
                				    +        '<label class="layui-form-label">物品报价 :</label>'
                				    +        '<div class="layui-input-block">'
                				    +          '<input type="text" name="item_offer" class="layui-input" >'
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
                            });
                        }
                    });
                });
              
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    $("#area").removeAttr("disabled");
					var buy_number = data.field.buy_number;
					var area_id = data.field.area;													//区域编号
					var date = data.field.date;													//区域编号
					var area_name = $('#area').find('option:selected').text();						//区域名称
					var customer_id = data.field.customer_name;										//客户编号
					var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
					//var out_type = data.field.out_type;
					var contract_id = data.field.contract_id;										//合同编号
					var contract_name = $('#contract_id').find('option:selected').attr('data-name'); //合同名称
					//var payment_agreement = data.field.payment_agreement;
					//运营合同起止时间//beginning_endingtime
					var start_time = data.field.start_time;
					var end_time = data.field.end_time;
					var expectedDelivery_date = data.field.expectedDelivery_date;
					var contract_amount = Number(data.field.contract_amount);
					var actual_receipt = Number(data.field.actual_receipt);
					var outstanding_receipt = Number(data.field.outstanding_receipt);

                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额

                    var applyType = $('#applyType').find('option:selected').val();//申请类型
                    var productNumber = data.field.productNumber;//货品流转编码
					
					var currencyDetails = [];
					$.each($('.details'),function(index,item){
						var number = $(item).find('input[name="number"]').val(); //序号
						var runproduct_id = $(item).find('input[name="runproduct_id"]').val(); //运营设备编码
						var runproduct_name = $(item).find('input[name="runproduct_name"]').val();  //运营设备名称
						/*var start_time = $(item).find('input[name="start_time"]').val();
						var over_time = $(item).find('input[name="over_time"]').val();*/
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var item_offer = Number($(item).find('input[name="item_offer"]').val());

						var obj = {'details_string':runproduct_id,
								'details_string2':runproduct_name,
								/*'details_date2':start_time,
								'details_date3':over_time,*/
								'details_string4':inventory_id,
								'details_string5':product_name,
								'details_string6':specifications_models,
								'details_string7':unit,
								'details_money':buy_quantity,
								'details_money3':inventory_quantity,
								'details_money4':item_offer};
                        currencyDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
				 			'currency_number':buy_number,
				 			'currency_int':area_id,
				 			'currency_string2':area_name,
				 			'currency_string4':customer_id,
				 			'currency_string7':customer_name,
				 			'currency_int2':2,
                            'currency_int3':applyType,
				 			'currency_string3':contract_id,
				 			//'currency_string5':contract_name,
                            'currency_string9':productNumber,
				 			//'currency_date':date,
				 			//'currency_date2':beginning_endingtime,
				 			'currency_date2':start_time,
                            'currency_date4':end_time,
				 			'currency_date3':expectedDelivery_date,
				 			'currency_money':contract_amount,
				 			'currency_money2':actual_receipt,
				 			'currency_money3':outstanding_receipt,
				 			'currency_money6':1000,
				 			'currency_type':10,
                            'currency_string5':cCusPPerson,
                            'currency_string11':cCusDepart,
                            'currency_string16':moneyBegin,
				 			'currencyDetails':JSON.stringify(currencyDetails)}
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
                
    			//表单数据初始化
				//获取请购单号
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

                //操作
                //点击添加明细按钮
            /*    var n_count = 1, d_count = 1;
                $('.addDetails').click(function(){
                  d_count++;
                  n_count++;
                  var html = ''
                    +  '<div class="apply-detail">'
                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+n_count+'<span class="layui-icon layui-icon-up"></span></div>'
                    +    '<div class="details">'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">运营设备编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="number" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">运营设备名称 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<select name="runproduct_name" lay-filter="runproduct_name" class="layui-select" lay-search>'+runproduct_name_html+'</select>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">设备运营开始期间 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="start_date" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                      +      '<div class="layui-form-item">'
                      +        '<label class="layui-form-label">设备运营结束时间 :</label>'
                      +        '<div class="layui-input-block">'
                      +          '<input type="text" name="over_time" class="layui-input" readonly="">'
                      +        '</div>'
                      +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">存货编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="inventory_id" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">商品名称 :</label>'
                    +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
                    +          '<input id="product_name" name="product_name" class="layui-input search-box" placeholder="输入关键字查询">'
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
                    +        '<label class="layui-form-label">请购数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="buy_quantity" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">库存数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="inventory_quantity" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
				    +      '<div class="layui-form-item">'
				    +        '<label class="layui-form-label">物品报价 :</label>'
				    +        '<div class="layui-input-block">'
				    +          '<input type="text" name="item_offer" class="layui-input">'
				    +        '</div>'
				    +      '</div>'

                    +    '</div>'
                    +    '<div class="delete delete'+d_count+'">'
                    +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                    +    '</div>'
                    +  '</div>';
                  $('.apply-detail-container').append(html);
                  //每一行绑定行删除事件
                  deleteItem($('.delete'+d_count));
                  //每一行绑定滑动事件
                  detailsToggle($('.details-title'+d_count));
                  //每一行绑定即时搜索框
                  searchProcess($('.container'+d_count));
                  //渲染
                  form.render('select');
                });*/
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
				//行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
                    processProductSale($demo);
				}
                
                
            });
        </script>
	</body>
</html>
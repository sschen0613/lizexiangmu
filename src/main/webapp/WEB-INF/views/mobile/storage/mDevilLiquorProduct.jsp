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
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mOutlibraryOfMaterialClassList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
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
							<select name="site_name" id="site_name" lay-filter="site_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">废液类型 :</label>
						<div class="layui-input-block">
							<select name="devilLiquor_type" id="devilLiquor_type" lay-filter="devilLiquor_type" class="layui-select" lay-search lay-verify="required">

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
							<textarea class="layui-textarea" name="remark"  lay-verify="required"></textarea>
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
									<label class="layui-form-label">运营设备编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="runproduct_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">运营设备 :</label>
									<div class="layui-input-block">
										<select name="runproduct_name" lay-filter="runproduct_name" class="layui-select" lay-search lay-verify="required"></select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备运营期间 :</label>
									<div class="layui-input-block">
										<input type="text" name="runproduct_dates" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">存货编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="inventory_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">商品名称 :</label>
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
									<label class="layui-form-label">申请数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="buy_quantity1" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">可用量 :</label>
									<div class="layui-input-block">
										<input type="text" name="fAvaQuantity" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item" style="display:none;">
									<label class="layui-form-label">近期商品价格 :</label>
									<div class="layui-input-block">
										<input type="text" name="recent_price" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item" style="display: none">
									<label class="layui-form-label">货架编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="huojia" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item" style="display: none">
									<label class="layui-form-label">货架货物数量 :</label>
									<div class="layui-input-block">
										<input type="text" name="huojiahuowu" class="layui-input" readonly>
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
					var buy_number = data.field.buy_number;											//单号
                    var area_id = data.field.area;													//区域编号
                    var area_name = $('#area').find('option:selected').text();						//区域名称
                    var contract_id = data.field.contract_id;										//合同编号
                    var contract_name = $('#contract_id').find('option:selected').attr('data-name');//合同名称
                    var customer_id = data.field.customer_name;										//客户编号
                    var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
                    //var currency_applicant = data.field.currency_applicant;						//申请人
                    //var department_Id = data.field.department_Id;									//申请部门
                    //var currency_date = data.field.currency_date;									//申请时间
                    var contract_amount = data.field.contract_amount;								//合同总金额
                    var actual_receipt = data.field.actual_receipt;									//已收金额
                    var outstanding_receipt = data.field.outstanding_receipt;						//欠款金额
                    var moneyBegin = data.field.moneyBegin;											//客户付款已收款金额
                    var apply_reason = data.field.apply_reason;										//申请事由
                    var cWhName = $('#cangku').find('option:selected').text();						//仓库名称
                    var cWhId = data.field.cangku;													//仓库编码

                    var details = $('.details');
                    var price = 0, flag = 1, currencyDetails = [];
					$.each(details,function(index,item){
                        var runproduct_id = $(item).find('input[name="runproduct_id"]').val();						//运营设备编码
                        var runproduct_name = $(item).find('select[name="runproduct_name"]>option:selected').text();	//运营设备名称
                        var runproduct_dates = $(item).find('input[name="runproduct_dates"]').val();	//运营期间
                        var inventory_id = $(item).find('input[name="inventory_id"]').val();			//存货编码
                        var product_name = $(item).find('input[name="product_name"]').val();			//存货名称
                        var specifications_models = $(item).find('input[name="specifications_models"]').val(); //规格型号
                        var unit = $(item).find('input[name="unit"]').val();								//单位
                        var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());		//申请数量
                        var fAvaQuantity = Number($(item).find('input[name="fAvaQuantity"]').val());		//可用量
                        var recent_price = Number($(item).find('input[name="recent_price"]').val());		//最近日期商品价格
                        var cPosCode = $(item).find('input[name="huojia"]').val();							//货架编码
                        var cWhCode = Number($(item).find('input[name="huojiahuowu"]').val());				//货架货物数量

                        price += buy_quantity * recent_price ;
                        //价格判断是否符合要求
                        if(recent_price > contract_price){
                            flag = 0; //价格大于合同条款规定价格
                            return;
                        }
                        var obj = {'details_string':runproduct_id,'details_string2':runproduct_name,'details_string3':runproduct_dates
                            ,'details_string4':inventory_id,'details_string5':product_name,"details_string6":specifications_models
                            ,'details_string7':unit,'details_money':buy_quantity,'details_money2':fAvaQuantity
                            ,'details_string10':cPosCode,'details_money3':cWhCode};
                        currencyDetails.push(obj);
					});
					//价格判断不符合要求,表单不提交
					if(flag == 0){
						layer.msg('商品单价大于合同条款限额('+contract_price+'元),请发起销售流程');
						return false;
					}
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {'currency_number':buy_number ,"currency_int": area_id,"currency_string2":area_name ,"currency_string3": contract_id
                            ,"currency_string4": customer_id,"currency_type":2,"currency_string5":cCusPPerson,"currency_string10":customer_name
                            ,"currency_money":contract_amount,"currency_money2":actual_receipt,"currency_money3":outstanding_receipt
                            ,"currency_string7":apply_reason ,'currency_string8':cWhName,'currency_string9':cWhId,'currency_string16':moneyBegin
                            ,"currencyDetails":JSON.stringify(currencyDetails),'currency_money6':price}
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
        		});
                // 过程一第三级 - 根据客户名称获取销售合同编号
                var cCusPPerson;
                form.on('select(customer_name)', function(data){
                    cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');
                    var cCusCode = data.value;
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
        		// 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款 / 获取运营设备(附带运营设备编码和设备运营期间)
        		var runproduct_name_html = ''; //运营设备下拉列表
        		var contract_price = 0;	//合同条款带出的价格
        		var contract_type = 1;	//设置合同类型
    			form.on('select(contract_id)', function(data){
					//重置之前内容
    				//明细信息重置,重置[运营设备]级下面的内容
            		//明细信息进行局部重新加载
					$(".apply-detail-container").load(location.href+" .apply-detail"); 
					setTimeout(function(){
						detailsRender(1); //明细信息第一行自定义渲染事件
						form.render();
					},1000);
					//明细信息序号重置
					n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
					
					//获取新内容
    				var strContractID = data.value; //合同编号
    				var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
    				$("#contract_amount").val(contractAmount); //合同金额

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
    				//重置合同条款带出的价格
    				contract_price = 0;
            		//查询合同条款
            		$.ajax({
            			url:'System/selectContractAll.action',
            			type:'post',
            			data:{'strContractID':strContractID},
            			dataType:'JSON',
            			success:function(res){
            				var value = '';
            				$.each(res.data,function(index,item){
            					contract_price = Math.max(item.cDefine26,contract_price); //number类型
            					value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
            				});
            				$('textarea[name="contract"]').val(value);
            			}
            		});
            		//获取运营设备(附带运营设备编码和设备运营期间)
    				$.ajax({
    					url:'System/selectshebei.action',
    					type:'post',
    					data:{"strContractID": strContractID,'type':contract_type},
    					dataType:'JSON',
    					success:function(res){
    						var html = '<option value="">请选择运营设备</option>';
    						$.each(res.data,function(index,item){
    							var quantity = 0;
    							if(item.iQuantity != undefined)
    								quantity = item.iQuantity;
    							var std = '无';
    							if(item.cinvStd != undefined)
    								std = item.cinvStd;
    							html += '<option value="'+item.商品编号+'" data-EndDate="'+item.结束时间+'" data-StartDate="'
    							+item.开始时间+'">'+item.商品名称+'</option>';
    						});
    						runproduct_name_html = html;
    						$('select[name="runproduct_name"]').html(html);
    						form.render('select');
    					}
    				});
    			});
        		// 过程一第五级 - 根据运营设备设置运营设备编码和设备运营期间
        		form.on('select(runproduct_name)',function(data){
        			//判断明细信息中是否已存在相同项
			    	if( ! judgeItems($(data.elem).closest('.details'),$(data.elem).closest('.details').find('input[name="product_name"]').val(),data.value) ){
			    		$(data.elem).closest('.details').find('input[name="runproduct_id"]').val('');
	        			$(data.elem).closest('.details').find('input[name="runproduct_dates"]').val('');
			    		$(data.elem).html(runproduct_name_html);
						form.render('select');
			    		return;
			    	}
        			var cInvCode = data.value;
        			var StartDate = $(data.elem).find("option:selected").attr('data-StartDate');
        			var EndDate = $(data.elem).find("option:selected").attr('data-EndDate');
        			var period = StartDate +" - "+EndDate;
        			$(data.elem).closest('.details').find('input[name="runproduct_id"]').val(cInvCode);
        			$(data.elem).closest('.details').find('input[name="runproduct_dates"]').val(period);
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
        		//二:选择仓库,之后就可以选择商品
        		form.on('select(cangku)',function(data){
        			//保存当前选中仓库的id
        			currentCangkuId = data.value;//string类型
        			//明细信息重置
					//明细信息进行局部重新加载
					$(".apply-detail-container").load(location.href+" .apply-detail"); 
					setTimeout(function(){
						$('.details').find('select[name="runproduct_name"]').html(runproduct_name_html);
						detailsRender(1); //明细信息第一行自定义渲染事件
						form.render();
					},1000);
					//明细信息序号重置
					n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
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
                    +        '<label class="layui-form-label">运营设备编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="runproduct_id" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">运营设备 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<select name="runproduct_name" lay-filter="runproduct_name" class="layui-select" lay-search lay-verify="required">'+runproduct_name_html+'</select>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">设备运营期间 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="runproduct_dates" class="layui-input" readonly>'
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
                    +        '<label class="layui-form-label">申请数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">可用量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="fAvaQuantity" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item" style="display:none;">'
                    +        '<label class="layui-form-label">近期商品价格 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="recent_price" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item" style="display: none">'
                    +        '<label class="layui-form-label">货架编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="huojia" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item" style="display: none">'
                    +        '<label class="layui-form-label">货架货物数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="huojiahuowu" class="layui-input" readonly>'
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
                    // 过程二第一级 - 获取商品名称
                    //即时监听搜索框,形成商品列表下拉列表框(附带其它内容)
                    $demo.find('.search-box').bind("input propertychange",function(event){
                        var currentKey = $(event.target).val();//搜索框值
                        if(currentKey == '' || currentCangkuId == ''){
                            if(currentCangkuId == '') layer.msg('请先选择仓库');
                            $demo.find('.list-container>ul').html('');
                            $demo.find('.list-container').css('display','none');
                        }else{
                            $.ajax({
                                url:'System/selectTarget3.action',
                                type:'post',
                                data:{'cInvName':currentKey,'cWhCode':currentCangkuId},
                                dataType:'JSON',
                                success:function(res){
                                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                                    $.each(res.data,function(index,item){
                                        var models = item.规格型号;
                                        if(models == undefined) models = '无';
                                        var recentPrice = item.单价;
                                        if(recentPrice == undefined) recentPrice = 0;
                                        var fAvaQuantity = 0;
                                        if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                                        var hjnumber = item.货位编码;
                                        if(hjnumber == undefined) hjnumber = '无';
                                        var hjcount = item.货架货物数量;
                                        if(hjcount == undefined) hjcount = 0;
                                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
                                            +models+'" data-unit="'+item.单位名称+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cangku="'
                                            +item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'
                                            +hjcount+'" data-recentPrice="'+recentPrice+'">'+item.存货名称+'</li>';
                                    });
                                    $demo.find('.list-container>ul').html(html);
                                    $demo.find('.list-container').css('display','block');
                                    //给下拉列表框绑定隐藏事件
                                    hideListContainer($demo.attr('id'));
                                }
                            });
                        }
                    });
                    //过程二第二级 - 根据商品名称设置其它内容
                    //给下拉列表框绑定点击事件
                    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                        //判断明细信息中是否已存在相同项
                        if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
                        var value = $(this).val();//number类型
                        var text = $(this).text();

                        var product_name = $(this).attr('data-name');//货物名称
                        var fAvaQuantity = $(this).attr('data-fAvaQuantity');//货物数量
                        var product_id = $(this).attr('data-id');//货物名称
                        var count = 0;
                        /*$.ajax({
                            url: 'Currency/getProductCount.action',
                            type: 'post',
                            data: {'product_id': product_id},
                            dataType: 'JSON',
                            async:false,
                            success: function (res) {
								if (res.data != null){
                                    count = res.data;
								}
                            }
                        });*/
                        if (fAvaQuantity - count < 1){
                            layer.msg(product_name+"的可出库数量为0，无法进行出库");
                            return;
                        }

                        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id'));
                        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name'));
                        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models'));
                        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit'));
                        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity'));
                        $(this).closest('.details').find('input[name="recent_price"]').val($(this).attr('data-recentPrice'));
                        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber'));
                        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount'));
                        //保存明细信息当前行的商品名称input框值
                        var n = Number( $demo.attr('id').replace('container','') );
                        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
                        //重置下拉列表框
                        $(this).parent().empty();
                        $demo.find('.list-container').css('display','none');

                    });
                }
                
            });
        </script>
	</body>
</html>
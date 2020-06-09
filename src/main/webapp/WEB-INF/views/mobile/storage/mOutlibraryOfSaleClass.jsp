<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售类出库申请-手机端 -->
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
				<h2 class="">丽泽销售类出库申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mOutlibraryOfSaleClassList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 添加商品前请先确定仓库</i>
				</div>
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">请购单号 :</label>
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
						<label class="layui-form-label">合同编号 :</label>
						<div id="contract" class="layui-input-block container">
							<input id='contract_id' name="contract_id" class="layui-input contract-search-box" placeholder="输入关键字查询">
							<div class="list-container" style="display:none;">
								<ul></ul>
							</div>
						</div>						
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同名称 :</label>
						<div class="layui-input-block">
							<input type="text" id="customer_name" name="customer_name" class="layui-input" readonly>
							<input type="hidden" id="customer" name="customer">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同付款约定 :</label>
						<div class="layui-input-block">
							<textarea name="contract" class="layui-textarea" readonly></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="contract_amount" name="contract_amount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">实际收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">欠款金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">期初合同已收款 :</label>
						<div class="layui-input-block">
							<input type="text" id="moneyBegin" name="moneyBegin" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">申请事由 :</label>
						<div class="layui-input-block">
							<textarea type="text" class="layui-textarea" name="apply_reason" placeholder="请务必填写申请事由" lay-verify="required"></textarea>
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
							<div class="details-title details-title1">明细信息#0<span class="layui-icon layui-icon-up"></span></div>
							<div class="details">
								<div class="layui-form-item">
									<label class="layui-form-label">存货编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="inventory_id" class="layui-input" readonly="">
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
									<label class="layui-form-label">数量 :</label>
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

                form.render();
                laydate.render({
                    elem: '#date1'
                });
                detailsRender(1); //明细信息第一行自定义渲染事件
                
                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var buy_number = data.field.buy_number;//请购单号
                    var contract_id = data.field.contract_id;//合同编号
                    var customer_name = data.field.customer_name;//客户名称
                    var apply_reason = data.field.apply_reason;//申请事由
                    var contract_amount = Number(data.field.contract_amount);//合同金额
                    var actual_receipt = Number(data.field.actual_receipt);//实际收款
                    var outstanding_receipt = Number(data.field.outstanding_receipt);//欠款金额
                    var moneyBegin = data.field.moneyBegin;//客户付款已收款金额
                    var cWhCode = data.field.cangku;//仓库ID
                    var cWhName = $('#cangku').find('option:selected').text();//仓库名称
                    var customer = data.field.customer;//客户编号
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();

                        var iPerTaxRate = Number($(item).find('input[name="product_name"]').attr('data-iTaxRate')); //商品税率
                        var price = Number($(item).find('input[name="product_name"]').attr('data-price')); //单价
                        //税后价格 = (税率/100 + 1 ) *单价
                        var fTaxPrice = (iPerTaxRate/100 + 1) * price;

						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var remark = $(item).find('input[name="remark"]').val();

                        //无税总价
                        //总金额 = 价格 * 数量
                        var fMoney = price * buy_quantity;
                        //含税合计
                        var iSum = fTaxPrice * buy_quantity;

						var obj = {
						    'details_string4':inventory_id,
                            'details_string5':product_name,
                            'details_string6':specifications_models,
                            'details_string7':unit,
                            'details_money':buy_quantity,
                            'details_money2':inventory_quantity,
                            'details_money3':iSum,
                            'details_money4':price,
                            'details_money5':iPerTaxRate,
                            'details_money6':fTaxPrice,
                            'details_money7':fMoney,
                            'details_string11':remark
						};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':13,
                            'currency_number':buy_number,
                            'currency_string3':contract_id,
                            'currency_string4':customer,
                            'currency_string11':customer_name,
                            'currency_string7':apply_reason,
                            'currency_money':contract_amount,
                            'currency_money2':actual_receipt,
                            'currency_string8':cWhName,
                            'currency_string9':cWhCode,
                            'currency_money3':outstanding_receipt,
                            'currency_string16':moneyBegin,
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
				var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
				//过程三 - 合同编号 - 合同名称+合同签订日期+(合同金额+已收金额+欠款金额)+合同条款
				searchProcessOfContract($('#contract'),2,6,function(){});
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
        		/*//二:选择仓库,之后就可以选择商品
        		form.on('select(cangku)',function(data){
        			//保存当前选中仓库的id
        			currentCangkuId = data.value;//string类型
        			//明细信息重置
					//明细信息进行局部重新加载
					$(".apply-detail-container").load(location.href+" .apply-detail"); 
					setTimeout(function(){
						detailsRender(1); //明细信息第一行自定义渲染事件
					},1000);
					//明细信息序号重置
					n_count = 1;
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});*/

                $('#contract').find(".list-container>ul").on("click","li",function () {
                    var strContractID = $(this).attr('data-id');
                    $('.apply-detail').remove();
                    //带出合同绑定的商品信息
                    $.ajax({
                        url:'System/selectshebei.action',
                        type:'post',
                        data:{"strContractID": strContractID,'type':2},
                        dataType:'JSON',
                        success:function (res) {
                            $('.details').remove();
                            var d_count = 1;
                            $.each(res.data,function(index,item){
                                var models = item.规格;  if(models == undefined){models = '无';}
                                var fAvaQuantity = item.可用量;  if(fAvaQuantity == undefined){fAvaQuantity = 0;}
                                var unit = item.数量单位;	if(unit == undefined) unit = '无';
                                var recentPrice = item.无税单价;		if(recentPrice == undefined) recentPrice = 0;
                                var iTaxRate = item.税率;	if(iTaxRate == undefined) iTaxRate = 0;
                                var dblQuantity = item.合同数量; 	if(dblQuantity == undefined) dblQuantity = 0;
                                ++d_count;

                                //查询已发货数量
                                $.ajax({
                                    url:'System/selectDisQuantity.action',
                                    type:'post',
                                    data:{"strContractID": strContractID,'cInvCode':item.商品编号},
                                    dataType:'JSON',
                                    success:function (res) {
                                        var iQuantity = res.data;  if(iQuantity == undefined) iQuantity = 0;
                                        if(iQuantity < dblQuantity){
                                            var html = '<div class="apply-detail">'
                                                +    '<div class="details-title details-title'+d_count+'">明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span></div>'
                                                +    '<div class="details">'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">存货编码 :</label>'
                                                +        '<div class="layui-input-block">'
                                                +          '<input type="text" name="inventory_id" value="'+item.商品编号+'" class="layui-input" readonly>'
                                                +        '</div>'
                                                +      '</div>'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">商品名称 :</label>'
                                                +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
                                                +          '<input id="product_name" name="product_name" value="'+item.商品名称+'" data-iTaxRate="'+iTaxRate+'" data-price="'+recentPrice+'" class="layui-input" readonly>'
                                                +        '</div>'
                                                +      '</div>'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">规格型号 :</label>'
                                                +        '<div class="layui-input-block">'
                                                +          '<input type="text" name="specifications_models" value="'+models+'" class="layui-input" readonly>'
                                                +        '</div>'
                                                +      '</div>'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">单位 :</label>'
                                                +        '<div class="layui-input-block">'
                                                +          '<input type="text" name="unit" value="'+unit+'" class="layui-input" readonly>'
                                                +        '</div>'
                                                +      '</div>'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">数量 :</label>'
                                                +        '<div class="layui-input-block">'
                                                +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
                                                +        '</div>'
                                                +      '</div>'
                                                +      '<div class="layui-form-item">'
                                                +        '<label class="layui-form-label">库存数量 :</label>'
                                                +        '<div class="layui-input-block">'
                                                +          '<input type="text" name="inventory_quantity" value="'+fAvaQuantity+'" class="layui-input" readonly>'
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
                                            //渲染
                                            form.render();
                                        }
                                    }
                                });
                            });
                        }
                    });

                    $.ajax({
                        url:'System/selectSODetails.action',
                        type:'post',
                        data:{'strContractID':strContractID},
                        dataType:'JSON',
                        success:function (res) {
                            if (res.data.length == 0) {
                                layer.msg("销售订单未生成,请勿发起出库申请");
                                $('#myForm').addClass('layui-btn-disabled');
                                $('#myForm').attr("disabled", "disabled");
                            }
                        }
                    });
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
                    +        '<label class="layui-form-label">数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">库存数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="inventory_quantity" class="layui-input" readonly>'
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
                  //渲染
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
        			processProductByCangkuId($demo);
				}
                
            });
        </script>
	</body>
</html>
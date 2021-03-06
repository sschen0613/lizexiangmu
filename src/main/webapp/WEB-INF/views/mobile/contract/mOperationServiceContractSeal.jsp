<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运营服务合同盖章申请-手机端 -->
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
				<h2 class="">丽泽运营服务合同盖章申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'contract/mOperationServiceContractSealList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<div class="form-notes">
					<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称的顺序进行选择</i>
				</div>
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
						<label class="layui-form-label">所属区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search disabled></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="customer_number" id="customer_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">备注说明 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="remark_illustration" readonly>无档案的客户名称请填写《客户档案建档申请流程》</textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同期间 :</label>
						<div class="layui-input-block time-ranges">
							<input type="text" name="start_time" class="layui-input" id="start_time" placeholder="选择开始时间" lay-verify="required">&emsp;-&emsp;
							<input type="text" name="end_time" class="layui-input" id="end_time" placeholder="选择结束时间" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同类型 :</label>
						<div class="layui-input-block">
							<select id="contractType" name="contractType" class="layui-select" lay-search lay-verify="required">
								<option value="">请选择</option>
								<option value="制式">制式</option>
								<option value="非制式">非制式</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同金额 :</label>
						<div class="layui-input-block">
							<input type="text" id="amount" name="contract_amount" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同金额大写 :</label>
						<div class="layui-input-block">
							<input type="text" id="amountCapitals" name="contract_ChineseAmount" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">付款方式 :</label>
						<div class="layui-input-block">
							<select name="payment"><option value="1">一次性付款</option><option value="2">阶段付款</option ><option value="3">其他</option></select>
						</div>
					</div>

					<div class="layui-btn layui-btn-normal layui-btn-xs addPayDetails">
						<i class="layui-icon layui-icon-add-1" title="点击添加收款计划"></i>点击添加收款计划
					</div>
					<div class="pay-detail-container">
						<div class="pay-detail">
							<div class="payDetails">
								<div class="layui-form-item">
									<label class="layui-form-label">收款日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="payment_time" id="payment_time1" class="layui-input" lay-verify="required">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">收款比例(%) :</label>
									<div class="layui-input-block">
										<input type="text" name="scale" id="scale1" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" class="layui-input" lay-verify="required">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">收款金额 :</label>
									<div class="layui-input-block">
										<input type="text" name="amountMoney" id="amountMoney1" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" class="layui-input" readonly>
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">结算方式 :</label>
									<div class="layui-input-block">
										<select name="method" class="layui-select" lay-search lay-verify="required">
											<option value="">请选择</option>
											<option value="现金">现金</option>
											<option value="银行转账">银行转账</option>
											<option value="现金支票">现金支票</option>
											<option value="转账支票">转账支票</option>
											<option value="银行承兑">银行承兑</option>
										</select>
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">条件 :</label>
									<div class="layui-input-block">
										<input type="text" name="factor" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label">说明 :</label>
									<div class="layui-input-block">
										<input type="text" name="show" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<div class="layui-input-block paydelete paydelete1">
										<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">合同付款约定 :</label>
						<div class="layui-input-block">
							<input type="hidden" value="合同付款约定" id="name" name="name" class="layui-input" >
							<textarea class="layui-textarea" id="condition" name="condition" lay-verify="required|validateChinese"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">配件限额 :</label>
						<div class="layui-input-block">
							<input type="text" id="clause_money" name="clause_money" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">签订日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="predictGetsum_date" class="layui-input date-revise" id="date1" placeholder="请选择日期" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">配件特殊约定 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="partsSpecial_terms" placeholder="必填" lay-verify="required"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">检测比对约定 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="detection_icrms" placeholder="必填（说明：什么设备/检测项目/几次报告）" lay-verify="required"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">其它特殊约定 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="special_terms"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">上传图片 :</label>
						<div class="layui-input-block">
							<input type="file" id="pics" name="pics" accept="image/*" capture="camera" multiple lay-verify="required">
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
										<input type="text" name="product_id" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">运营设备 :</label>
									<div class="layui-input-block">
										<select name="product_name" id="product_name" lay-filter="product_name" class="layui-select" lay-search lay-verify="required"></select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="specifications_models" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备运营开始日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="start_equipment" class="layui-input" id="start_equipment1" placeholder="选择开始时间" autocomplete="off">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备运营结束日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="end_equipment" class="layui-input" id="end_equipment1" placeholder="选择结束时间" autocomplete="off">
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
									<label class="layui-form-label">单价 :</label>
									<div class="layui-input-block">
										<input type="text" id="unit_price1" name="unit_price" class="layui-input" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" lay-verify="required">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">金额 :</label>
									<div class="layui-input-block">
										<input type="text" id="sum1" name="sum" class="layui-input" readonly>
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
              					<button type="button" class="layui-btn layui-btn-danger layui-btn-xs" style="float: right">删除</button>
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
                //执行laydate实例
                laydate.render({
                    elem: '#date1'
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });

                laydate.render({
                    elem: '#payment_time1' //指定元素
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });

                dateRender('start_time','end_time');
                detailsRender(1); //明细信息第一行自定义渲染事件
                detailsRender1(1); //明细信息第一行自定义渲染事件

                //字数限制
                form.verify({
                    validateChinese: function (value) {
                        if (value.length >100){
                            return "条款内容100字以内";
                        }
                    }
                });

                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    $("#area").removeAttr("disabled");
                    var area = $('#area').find('option:selected').text();

                    var customer_name = $('#customer_name').find('option:selected').text();

                    var remarkone = data.field.remark_illustration;
                    var customer_number = data.field.customer_number;
                    //(contract_date)
					var contractType = data.field.contractType;
                    var contract_amount = Number(data.field.contract_amount);
                    var contract_ChineseAmount = data.field.contract_ChineseAmount;
                    //var contract_versons = data.field.contract_versons;
                    //var contract_number = data.field.contract_number;
                    var payment = data.field.payment;
                    var name = data.field.name;
                    var condition = data.field.condition;
                    var clause_money = data.field.clause_money;//限额
                    //var sum = Number(data.field.sum);
                    var predictGetsum_date = data.field.predictGetsum_date;
                    var partsSpecial_terms = data.field.partsSpecial_terms;
                    var detection_icrms = data.field.detection_icrms;
                    var special_terms = data.field.special_terms;
                    var start_date = data.field.start_time;
                    var end_date = data.field.end_time;
                    var between_date = start_date +" 截止到 "+ end_date;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var product_id = $(item).find('input[name="product_id"]').val();
                        var product_name = $(item).find('select[name="product_name"]>option:selected').text();
                        var cInvCCode = $(item).find('select[name="product_name"]>option:selected').attr('data-cInvCCode');
                        //var brand = $(item).find('input[name="brand"]').val();
                        var specifications_models = $(item).find('input[name="specifications_models"]').val();
                        var start_equipment = $(item).find('input[name="start_equipment"]').val();
                        var end_equipment = $(item).find('input[name="end_equipment"]').val();
                        var unit = $(item).find('input[name="unit"]').val();
                        var quantity = Number($(item).find('input[name="buy_quantity"]').val());
                        var unit_price = Number($(item).find('input[name="unit_price"]').val());
                        var sum2 = Number($(item).find('input[name="sum"]').val());
                        var remark = $(item).find('input[name="remark"]').val();

                        var obj = {'details_string4':product_id,'details_string5':product_name,'details_string6':specifications_models,'details_string8':cInvCCode
                            ,'details_string3':start_equipment,'details_string13':end_equipment,'details_string7':unit,'details_money':quantity,'details_money4':unit_price,'details_money7':sum2,'details_string11':remark};
                        currentDetails.push(obj);
					});

                    //阶段付款
                    var payDetails = [];
                    $.each($('.payDetails'),function (index,item) {
                        var dtPayDate = $(item).find('input[name="payment_time"]').val();//收款日期
                        var dblPayRatio = $(item).find('input[name="scale"]').val();//收款比例
                        var dblPayCurrency = $(item).find('input[name="amountMoney"]').val();//收款金额
                        var strSettleStyleID = $(item).find('select[name="method"]>option:selected').text();//结算方式
                        var strPayFactor = $(item).find('input[name="factor"]').val(); //条件
                        var strExp = $(item).find('input[name="show"]').val();//说明

                        var obj = {
                            'dtPayDate':dtPayDate,
                            'dblPayRatio':dblPayRatio,
                            'dblPayCurrency':dblPayCurrency,
                            'strSettleStyleID':strSettleStyleID,
                            'strPayFactor':strPayFactor,
                            'strExp':strExp
                        };
                        payDetails.push(obj);
                    });

                    var myForm = new FormData();
                    myForm.set("currency_type",35);
                    myForm.set("currency_string2",area);
                    myForm.set("currency_string5",customer_name);
                    myForm.set("currency_string11",customer_number);
                    myForm.set("currency_string12",remarkone);
					myForm.set("currency_string3",contractType);//合同类型
                    myForm.set("currency_money6",contract_amount);
                    myForm.set("currency_money5",clause_money);
                    myForm.set("currency_string13",contract_ChineseAmount);
                    myForm.set("currency_int6",payment);
                    myForm.set("currency_string8",name);
                    myForm.set("currency_string9",condition);
                    myForm.set("currency_string7",staffName);
                    myForm.set("currency_date2",predictGetsum_date);
                    myForm.set("currency_string",partsSpecial_terms);
                    myForm.set("currency_date3",start_date);
                    myForm.set("currency_date4",end_date);
                    myForm.set("currency_string14",between_date);
                    myForm.set("currency_string10",special_terms);
                    myForm.set("currency_string15",detection_icrms);
                    myForm.set("currency_string18",cCusDepart);
                    myForm.set("currencyDetails",JSON.stringify(currentDetails));
                    myForm.set("payDetails",JSON.stringify(payDetails));
                    for(let i = 0;i < $("#pics")[0].files.length;i++){
                        myForm.append("pics",$("#pics")[0].files[i])
                    }
					
				 	$.ajax({
                        url : "Currency/launchCurrencyApply.action"
                        ,type : "post"
                        ,data : myForm
				 		,dataType : "JSON"
                        ,contentType: false
                        ,processData: false
                        ,cache:false
				 		,beforeSend: function(){
				 			layer.msg('正在提交申请', {
				 				icon: 16
				 				,shade: 0.01
				 			});
				 		}
				 		,success : function(result){
				 			layer.msg(result.msg);
                            $('#myForm').addClass('layui-btn-disabled');
                            $('#myForm').attr("disabled","disabled");
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});

                //表单数据初始化
                //获取申请人/申请部门/申请日期
                var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
                var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";
                setApplyMessage(staffName,departmentId);
                //过程一:区域 - 客户名称(客户编号) - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
                // 过程一第一级 - 获取所有区域
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
                // 过程一第二级 - 根据区域获取客户名称
               // form.on('select(area)', function(data){
                    var cDCCode = areaid;
                    $.ajax({
                        url:'System/selectUser.action',
                        type:'post',
                        data:{"cDCCode": cDCCode},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择客户名称</option>';
                            $.each(res.data,function(index,item){
                                html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'"  data-dept="'+item.cCusDepart+'">'+item.cCusName+'</option>'
                            });
                            $('#customer_name').html(html);
                            form.render('select');
                        }
                    });
                    // 重置[客户名称]级下面的内容(客户编码 合同编号 金额信息 合同条款 明细信息)
                    $('#customer_number').val('');
                //});
                // 过程一第三级 - 根据客户名称获取销售合同编号 并设置客户编码
                var cCusPPerson;
                var cCusDepart;
                form.on('select(customer_name)', function(data){
                    cCusPPerson = $(data.elem).find("option:selected").attr('data-cCusPPerson');//
                    cCusDepart = $(data.elem).find("option:selected").attr('data-dept');//
                    var cCusCode = data.value;
                    $('#customer_number').val(cCusCode); //客户编码
                });

                //获取运营设备(附带运营设备编码和设备运营期间)
                var runproduct_name_html = ''; //运营设备下拉列表
                $.ajax({
                    url:'System/selectshebei1.action',
                    type:'post',
                    data:{type:99},
                    dataType:'JSON',
                    success:function(res){
                        var ops = "<option value=''>请选择</option>";
                        console.log(res);
                        $.each(res.data,function (index,shebei) {
                            var price = 0;
                            if (shebei.单价 != undefined){
                                price = shebei.单价
                            }
                            if(shebei.规格 != undefined){
                                ops+="<option value='"+shebei.商品编号+"' data-unit='"+shebei.数量单位+"' data-guige='"+shebei.规格+"' data-price='"+price+"' data-cInvCCode='"+shebei.大类编码+"'>"+shebei.商品名称+"</option>"
                            }else {
                                ops+="<option value='"+shebei.商品编号+"' data-unit='"+shebei.数量单位+"' data-guige='无' data-price='"+price+"' data-cInvCCode='"+shebei.大类编码+"'>"+shebei.商品名称+"</option>"
                            }
                        });
                        $("#product_name").html(ops);
                        runproduct_name_html = ops;
                        form.render('select');
                    }
                });
                form.on('select(product_name)', function(data){
                    var product_id = data.value;
                    var unit = $(data.elem).find("option:selected").attr('data-unit');
                    var guige = $(data.elem).find("option:selected").attr('data-guige');
                    var price = $(data.elem).find("option:selected").attr('data-price');
                    var time1 = $('#start_time').val();
                    var time2 = $('#end_time').val();
                    $(data.elem).closest('.details').find("input[name='product_id']").val(product_id);
                    $(data.elem).closest('.details').find("input[name='unit']").val(unit);
                    $(data.elem).closest('.details').find("input[name='specifications_models']").val(guige);
                    $(data.elem).closest('.details').find("input[name='unit_price']").val(price);
                    $(data.elem).closest('.details').find("input[name='start_equipment']").val(time1);
                    $(data.elem).closest('.details').find("input[name='end_equipment']").val(time2);
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
                    +        '<label class="layui-form-label">运营设备编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="product_id" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">运营设备 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<select name="product_name"  lay-filter="product_name" class="layui-select">'+runproduct_name_html+'</select>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">型号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specifications_models" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">设备运营开始日期 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="start_equipment" class="layui-input" id="start_equipment'+d_count+'" placeholder="选择开始时间" autocomplete="off">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">设备运营结束日期 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="end_equipment" class="layui-input" id="end_equipment'+d_count+'" placeholder="选择结束时间" autocomplete="off">'
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
				    +        '<label class="layui-form-label">单价 :</label>'
				    +        '<div class="layui-input-block">'
				    +          '<input type="text" id="unit_price'+d_count+'" name="unit_price" class="layui-input" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" lay-verify="required">'
				    +        '</div>'
				    +      '</div>'
				    +      '<div class="layui-form-item">'
				    +        '<label class="layui-form-label">金额 :</label>'
				    +        '<div class="layui-input-block">'
				    +          '<input type="text" id="sum'+d_count+'" name="sum" class="layui-input" readonly>'
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
                  form.render();
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                    dateRender('start_equipment'+index,'end_equipment'+index);//设备运营期间渲染
                    getSum($('#buy_quantity'+index),$('#unit_price'+index),$('#sum'+index)); //限制数量为数字，单价为数字(小数点后保留两位)，且同时获取金额
                }

                //点击添加收款计划
                var p_count = 1;
                $('.addPayDetails').click(function(){
                    p_count++;
                    var html = ''
                        +  '<div class="pay-detail">'
                        +    '<div class="payDetails">'
						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">收款日期 :</label>'
						+			'<div class="layui-input-block">'
						+				'<input type="text" name="payment_time" id="payment_time'+p_count+'" class="layui-input" lay-verify="required">'
						+			'</div>'
						+		'</div>'

						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">收款比例(%) :</label>'
						+			'<div class="layui-input-block">'
						+				'<input type="text" name="scale" id="scale'+p_count+'" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" class="layui-input" lay-verify="required">'
						+			'</div>'
						+		'</div>'

						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">收款金额 :</label>'
						+			'<div class="layui-input-block">'
						+				'<input type="text" name="amountMoney" id="amountMoney'+p_count+'" onkeyup="if(isNaN(value))execCommand("undo")" onafterpaste="if(isNaN(value))execCommand("undo")" class="layui-input" readonly>'
						+			'</div>'
						+		'</div>'

						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">结算方式 :</label>'
						+			'<div class="layui-input-block">'
						+				'<select name="method" class="layui-select" lay-search lay-verify="required">'
						+					'<option value="">请选择</option>'
						+					'<option value="现金">现金</option>'
						+					'<option value="银行转账">银行转账</option>'
						+					'<option value="现金支票">现金支票</option>'
						+					'<option value="转账支票">转账支票</option>'
						+					'<option value="银行承兑">银行承兑</option>'
						+				'</select>'
						+			'</div>'
						+		'</div>'

						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">条件 :</label>'
						+			'<div class="layui-input-block">'
						+				'<input type="text" name="factor" class="layui-input">'
						+			'</div>'
						+		'</div>'

						+		'<div class="layui-form-item">'
						+			'<label class="layui-form-label">说明 :</label>'
						+			'<div class="layui-input-block">'
						+				'<input type="text" name="show" class="layui-input">'
						+			'</div>'
						+		'</div>'

                        +		'<div class="layui-form-item">'
                        +			'<div class="layui-input-block paydelete paydelete'+p_count+'">'
                        +				'<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                        +			'</div>'
                        +		'</div>'
                        +    '</div>'
                        +  '</div>';
                    $('.pay-detail-container').append(html);
                    laydate.render({
                        elem: '#payment_time'+p_count //指定元素
                        ,type: 'datetime'
                    });
                    //渲染
                    detailsRender1(p_count); //明细信息每行自定义渲染事件
                    form.render();
                });

                //明细信息每行自定义渲染事件
                function detailsRender1(index){
                    deleteItem1($('.paydelete'+index)); //每一行绑定行删除事件
                    getSum1($('#scale'+index),$('#amount'),$('#amountMoney'+index));
                }

                //行删除事件
                function deleteItem1($demo){
                    $demo.click(function(e){
                        layer.confirm('确认删除该项？',function(index){
                            $(e.target).closest('.pay-detail').remove();
                            layer.close(index);
                        });
                    });
                }

                function deleteItem($demo){
                    deleteDetailsItem3($demo);
                }

                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
        		}
        		//日期范围渲染
              	function dateRender(id1,id2){
              		// 开始日期
    				laydate.render({
    					elem: '#'+id1 //指定元素
    					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
    			        ,done: function(value, date, endDate){
    				    	// console.log(value); //得到日期生成的值
    				    	//开始日选好后，判断结束日期是否合法
    				    	if($('#'+id2).val() != ''){
    				    		$('#'+id2).val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#'+id1).val('');});
    				    	}
    				    }
    				});
              		// 结束日期
    				laydate.render({
    					elem: '#'+id2 //指定元素
    					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
    			        ,done: function (value, date, endDate) {
    			            // console.log(value); //得到日期生成的值
    				    	//结束日选好后，判断开始日期是否合法
    				    	if($('#'+id1).val() != ''){
    				    		$('#'+id1).val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#'+id2).val('');});
    				    	}
    			        }
    				});
              	}

                //金额自动翻译成大写且金额保留两位小数
                inputLimitAmount($("#amount"),$('#amountCapitals'));
                //监听金额输入框只允许输入数字(小数点后保留两位)
                inputLimitAmount0($('#sum'));//金额

            });
        </script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽运营站点变更交接申请-手机端 -->
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
				<h2 class="">丽泽运营站点变更交接申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'onlineOperation/mSiteChangeRequestList.action';">查看申请记录</li>
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
						<label class="layui-form-label">县区 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">区域负责人 :</label>
						<div class="layui-input-block">
							<input type="text" name="area_principal" id="area_principal" class="layui-input" lay-verify="required" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">客户名称 :</label>
						<div class="layui-input-block">
							<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">合同编号 :</label>
						<div class="layui-input-block">
							<select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">在线运维部交接人 :</label>
						<div class="layui-input-block">
							<input type="text" name="heir_person" id="heir_person" class="layui-input" lay-verify="required" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">交接日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="require_date" id="date3" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">申请事由 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="proposer_reason" placeholder="请务必填写申请事由" lay-verify="required"></textarea>
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
									<label class="layui-form-label">变更类型 :</label>
									<div class="layui-input-block">
										<input type="radio" name="change_type1" value="1" title="新增" checked>
										<input type="radio" name="change_type1" value="2" title="终止">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">变更站点名称 :</label>
									<div class="layui-input-block">
										<input type="text" name="change_site" class="layui-inout" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备类型 :</label>
									<div class="layui-input-block">
										<select name="equipment_type" id="equipment_type1" lay-filter="equipment_type" class="layui-select" lay-search>
											<option value="">请选择</option>
											<option value="COD">COD</option>
											<option value="氨氮">氨氮</option>
											<option value="TP">TP</option>
											<option value="TN">TN</option>
											<option value="PH">PH</option>
											<option value="总氰">总氰</option>
											<option value="总镍">总镍</option>
											<option value="总铬">总铬</option>
											<option value="全参数">全参数</option>
											<option value="单烟尘">单烟尘</option>
											<option value="采样器">采样器</option>
											<option value="废水流量计">废水流量计</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">数量 :</label>
									<div class="layui-input-block">
										<input type="text" name="buy_quantity" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">合同起止日期 :</label>
									<div class="layui-input-block time-ranges">
										<input type="text" name="beginnStart_dates" class="layui-input" id="date1_1" placeholder="选择开始时间" readonly>&emsp;-&emsp;
										<input type="text" name="beginnEnd_dates" class="layui-input" id="date2_1" placeholder="选择结束时间" readonly>
									</div>
			 					</div>
			 					<div class="layui-form-item">
									<label class="layui-form-label">设备品牌 :</label>
									<div class="layui-input-block">
										<input type="text" name="equipment_brand" class="layui-input" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">设备型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="equipment_model" class="layui-input">
									</div>
								</div>
								<%--<div class="layui-form-item">
									<label class="layui-form-label">流量计是否运维 :</label>
									<div class="layui-input-block">
										<input type="radio" name="flowmeter_judge1" value="1" title="是" checked>
										<input type="radio" name="flowmeter_judge1" value="2" title="否">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">运维流量计类型 :</label>
									<div class="layui-input-block">
										<input type="text" name="flowmeter_type" class="layui-input" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">流量计品牌 :</label>
									<div class="layui-input-block">
										<input type="text" name="flowmeter_brand" class="layui-input" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">是否间歇性排水 :</label>
									<div class="layui-input-block">
										<input type="radio" name="interval_judge1" value="1" title="是" checked>
										<input type="radio" name="interval_judge1" value="2" title="否">
									</div>
								</div>--%>
								<div class="layui-form-item">
									<label class="layui-form-label">设备责任人 :</label>
									<div class="layui-input-block">
										<input type="text" name="equipment_duty" class="layui-input" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label" style="line-height:18px;">企业(环保)负责人<br/>/环保联系人 :</label>
									<div class="layui-input-block">
										<input type="text" name="enterprise_duty" class="layui-input" />
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">联系方式(电话) :</label>
									<div class="layui-input-block">
										<input type="text" name="phone" class="layui-input">
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

                //表单更新渲染
				form.render();
// 				form.render('select');
// 				form.render('checkbox');
// 				form.render('radio');
				//执行一个laydate实例
				dateRender(1);
				laydate.render({
					elem: '#date3'
				});
				detailsRender(1); //明细信息第一行自定义渲染事件
                
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var area_principal = data.field.area_principal;									//区域负责人
                    var area_id = data.field.area;													//区域编号
                    var area_name = $('#area').find('option:selected').text();						//区域名称
                    var contract_id = data.field.contract_id;										//合同编号
                    var contract_name = $('#contract_id').find('option:selected').attr('data-name');//合同名称
                    var customer_id = data.field.customer_name;										//客户编号
                    var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
                    var heir_person = data.field.heir_person;										//在线运维部交接人
                    var heir_date = data.field.require_date;											//交接日期
                    var apply_reason = data.field.proposer_reason;										//申请事由
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var change_type = $(item).find('input[name^="change_type"]:checked').val(); // 获取name前缀为change_type的单选框的选中项的value值!!!
                        var change_site = $(item).find('input[name="change_site"]').val();
                        var equipment_type = $(item).find('select[name="equipment_type"]>option:selected').text();
                        var quantity = Number($(item).find('input[name="buy_quantity"]').val());
                        //beginnEnd_dates  	//合同起止日期
                        var start_time = $(item).find('input[name="beginnStart_dates"]').val(); //合同开始日期
                        var end_time = $(item).find('input[name="beginnEnd_dates"]').val(); //合同结束日期
                        var equipment_brand = $(item).find('input[name="equipment_brand"]').val();
                        var equipment_model = $(item).find('input[name="equipment_model"]').val();
                        //var flowmeter_judge = $(item).find('input[name^="flowmeter_judge"]:checked').val();
                        //var flowmeter_type = $(item).find('input[name="flowmeter_type"]').val();
                        //var flowmeter_brand = $(item).find('input[name="flowmeter_brand"]').val();
                        //var interval_judge = $(item).find('input[name^="interval_judge"]:checked').val();  // 获取name前缀为interval_judge的单选框的选中项的value值!!!
                        var equipment_duty = $(item).find('input[name="equipment_duty"]').val();
                        var enterprise_duty = $(item).find('input[name="enterprise_duty"]').val();
                        var phone = $(item).find('input[name="phone"]').val();
                        var remark = $(item).find('input[name="remark"]').val();

                        var obj = {'details_int':change_type
                            ,'details_string8':change_site
                            ,'details_string3':equipment_type
                            ,'details_int2':quantity
                            ,'details_date2':start_time
                            ,'details_date3':end_time
                            ,'details_string4':equipment_brand
                            ,'details_string5':equipment_model
                            //,'details_int3':flowmeter_judge
                            //,'details_string6':flowmeter_type
                            //,'details_string7':flowmeter_brand
                            //,'details_int4':interval_judge
                            ,'details_string9':equipment_duty
                            ,'details_string10':enterprise_duty
                            ,'details_string11':phone
                            ,'details_string6':remark
                            ,'details_string12':start_time+"到"+end_time
                        };
                        currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':39,
                            'currency_string2':area_name,
                            'currency_string3':contract_id,
                            'currency_string4':customer_name,
                            'currency_string5':area_principal,
                            'currency_string7':apply_reason,
                            'currency_string8':heir_person,
                            'currency_date2':heir_date,
                            'currencyDetails':JSON.stringify(currentDetails)
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
                //设备类型
                var equipment_type_name_html = '';//设备类型下拉列表框
                /*$.ajax({
                    url:'System/selectInvTypeByCode.action',
                    type:'post',
                    data:{"type":"01"},
                    dataType:'JSON',
                    success:function(res){
                        console.log(res);
                        var html = '<option value="">请选择设备类型</option>';
                        $.each(res.data,function(index,item){
                            console.log(item.cInvCName);
                            html += '<option value="'+item.cInvCName+'">'+item.cInvCName+'</option>';
                        });
                        equipment_type_name_html = html;
                        $('#equipment_type1').html(html);
                        form.render('select');
                    }
                });*/

                //过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
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
                    // 重置[客户名称]级下面的内容(合同编号  明细信息)
                    $('#contract_id').siblings().remove();
                    $('#contract_id').html('');
                    $($('.details')[0]).siblings('.details').remove();
                    $('.details').find('input').not('input[name^="change_type"]').not('input[name^="flowmeter_judge"]').not('input[name^="interval_judge"]').val('');
                    //$('.details').find('select[name="runproduct_name"]').html('');
                   // $('.details').find('select[name="runproduct_name"]').siblings().remove();
                    form.render();
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
                                html += '<option value="'+item.strContractID+'" data-name="'+item.strContractName+'" data-money="'+item.dblTotalCurrency+'" data-startTime="'+item.strContractStartDate+'" data-endTime="'+item.strContractEndDate+'">名称：'+item.strContractName
                                    +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
                            });
                            $('#contract_id').html(html);
                            form.render('select');
                        }
                    });
                    //重置[合同编号]级下面的内容(明细信息)
                    $($('.details')[0]).siblings('.details').remove();
                    $('.details').find('input').not('input[name^="change_type"]').not('input[name^="flowmeter_judge"]').not('input[name^="interval_judge"]').val('');
                   // $('.details').find('select[name="runproduct_name"]').html('');
                    //$('.details').find('select[name="runproduct_name"]').siblings().remove();
                    form.render();
                    //当前明细信息每一行的商品名称input框值重置
                    currentProductValues = [];
                });
                var startTime = '',endTime = '';
                form.on('select(contract_id)',function (data) {
                    //重置之前内容
                    $($('.details')[0]).siblings('.details').remove();
                    $('.details').find('input').not('input[name^="change_type"]').not('input[name^="flowmeter_judge"]').not('input[name^="interval_judge"]').val('');
                    startTime = $(data.elem).find("option:selected").attr('data-startTime');
                    endTime = $(data.elem).find("option:selected").attr('data-endTime');
                    $("#date1_1").val(startTime);
                    $("#date2_1").val(endTime);
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
		            +       '<div class="layui-form-item">'
					+			'<label class="layui-form-label">变更类型 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="radio" name="change_type'+d_count+'" value="1" title="新增" checked>'
					+				'<input type="radio" name="change_type'+d_count+'" value="2" title="终止">'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">变更站点名称 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="change_site" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">设备类型 :</label>'
					+			'<div class="layui-input-block">'
					+				'<select name="equipment_type" id="equipment_type'+d_count+'" lay-filter="equipment_type" class="layui-select" lay-search>'
					+					'<option value="">请选择</option>'
					+					'<option value="COD">COD</option>'
					+					'<option value="氨氮">氨氮</option>'
					+					'<option value="TP">TP</option>'
					+					'<option value="TN">TN</option>'
					+					'<option value="PH">PH</option>'
					+					'<option value="总氰">总氰</option>'
					+					'<option value="总镍">总镍</option>'
					+					'<option value="总铬">总铬</option>'
					+					'<option value="全参数">全参数</option>'
					+					'<option value="单烟尘">单烟尘</option>'
					  +  				'<option value="采样器">采样器</option>'
                      +					'<option value="废水流量计">废水流量计</option>'
					+					'<option value="其他">其他</option>'
					+				'</select>'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">数量 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="buy_quantity" class="layui-input">'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">合同起止日期 :</label>'
					+			'<div class="layui-input-block time-ranges">'
					+				'<input type="text" name="beginnStart_dates" class="layui-input" id="date1_'+d_count+'" value="'+startTime+'" placeholder="选择开始时间" readonly>&emsp;-&emsp;'
					+				'<input type="text" name="beginnEnd_dates" class="layui-input" id="date2_'+d_count+'" value="'+endTime+'" placeholder="选择结束时间" readonly>'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">设备品牌 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="equipment_brand" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">设备型号 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="equipment_model" class="layui-input">'
					+			'</div>'
					+		'</div>'
					/*+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">流量计是否运维 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="radio" name="flowmeter_judge'+d_count+'" value="1" title="是" checked>'
					+				'<input type="radio" name="flowmeter_judge'+d_count+'" value="2" title="否">'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">运维流量计类型 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="flowmeter_type" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">流量计品牌 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input name="flowmeter_brand" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">是否间歇性排水 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="radio" name="interval_judge'+d_count+'" value="1" title="是" checked>'
					+				'<input type="radio" name="interval_judge'+d_count+'" value="2" title="否">'
					+			'</div>'
					+		'</div>'*/
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">设备责任人 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="equipment_duty" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label" style="line-height:18px;">企业(环保)负责人<br/>/环保联系人 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="enterprise_duty" class="layui-input" />'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">联系方式(电话) :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="text" name="phone" class="layui-input">'
					+			'</div>'
					+		'</div>'
                      +		'<div class="layui-form-item">'
                      +			'<label class="layui-form-label">备注 :</label>'
                      +			'<div class="layui-input-block">'
                      +				'<input type="text" name="remark" class="layui-input">'
                      +			'</div>'
                      +		'</div>'
                    +    '</div>'
                    +    '<div class="delete delete'+d_count+'">'
                    +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                    +    '</div>'
                    +  '</div>';
                  $('.apply-detail-container').append(html);
                  //渲染
                  detailsRender(d_count); //明细信息每行自定义渲染事件
                    inputRender();
                    form.render();
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    //searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                    inputLimitPhone($('#phone'+index));//监听电话输入框输入正确格式
                    dateRender(index);//日期范围渲染
                    form.render();
                }
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
				}
                function inputRender(){
                    $('input').mouseover(function(e){
                        e.target.title = e.target.value;
                    });
                }
                //日期范围渲染
                function dateRender(index){
                	laydate.render({
    					elem: '#date1_'+index //指定元素
    			        ,done: function(value, date, endDate){
    				    	// console.log(value); //得到日期生成的值
    				    	//开始日选好后，判断结束日期是否合法
    				    	if($('#date2_'+index).val() != ''){
    				    		$('#date2_'+index).val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date1_'+index).val('');}); 
    				    	}
    				    }
    				});
    				laydate.render({
    					elem: '#date2_'+index //指定元素
    			        ,done: function (value, date, endDate) {
    			            // console.log(value); //得到日期生成的值
    				    	//结束日选好后，判断开始日期是否合法
    				    	if($('#date1_'+index).val() != ''){
    				    		$('#date1_'+index).val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2_'+index).val('');});
    				    	}
    			        }
    				});
                }
            	
            });
        </script>
	</body>
</html>
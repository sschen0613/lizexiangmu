<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 技术支持申请-手机端 -->
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
				<h2 class="">水样检测申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'onlineOperation/mTechnicalSupportRequestList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">流水号 :</label>
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
						<label class="layui-form-label">申请区域 :</label>
						<div class="layui-input-block">
							<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required"></select>
						</div>
 					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">企业名称 :</label>
						<div class="layui-input-block">
							<select name="company_name" id="company_name" lay-filter="company_name" class="layui-select" lay-search lay-verify="required"></select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">采样日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="sampling_date" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">计划检测日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="plan_date" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">计划完成日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="plan_accomplishDate" class="layui-input" id="date4" placeholder="请选择日期" autocomplete="off" lay-verify="required">
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
									<label class="layui-form-label">检测项目 :</label>
									<div class="layui-input-block">
										<select id="detection_item" name="detection_item" lay-search lay-verify="required">
											<option value="">请选择</option>
											<option value="COD">COD</option>
											<option value="氨氮">氨氮</option>
											<option value="总磷">总磷</option>
											<option value="总氮">总氮</option>
											<option value="汞">汞</option>
											<option value="镍">镍</option>
											<option value="悬浮物">悬浮物</option>
											<option value="溶解性总固体">溶解性总固体</option>
											<option value="PH">PH</option>
										</select>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测数量 :</label>
									<div class="layui-input-block">
										<input type="number" id="detection_number" name="detection_number" lay-verify="required">
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
				laydate.render({
					elem: '#date2' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				laydate.render({
					elem: '#date3' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
                laydate.render({
                    elem: '#date4' //指定元素
                    ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
                });
				detailsRender(1); //明细信息第一行自定义渲染事件
                
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var area_id = data.field.area;													//区域编号
                    var area_name = $('#area').find('option:selected').text();						//区域名称
                    var company_id = data.field.company_name;										//客户编号
                    var company_name = $('#company_name').find('option:selected').text();			//客户名称
                    var sampling_date = data.field.sampling_date; 									//采样日期
                    var plan_date = data.field.plan_date; 											//计划检测日期
                    var plan_accomplishDate = data.field.plan_accomplishDate; 						//计划完成日期
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var detection_item = $(item).find('select[name="detection_item"]').find('option:selected').text();	//检测项目类别
                        var detection_number = $(item).find('input[name="detection_number"]').val();						//检测数量
                        var obj = {'details_string2':detection_item,'details_money3':detection_number};
                        currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':66,
                            'currency_int':1,//对接入样品管理员下发数据
                            'currency_string2':area_name,
                            'currency_string4':area_id,
                            'currency_string5':company_id,
                            'currency_string7':company_name,
                            'currency_date2':plan_date,
                            'currency_date3':plan_accomplishDate,
                            'currency_date4':sampling_date,//采样日期
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
                                html += '<option value="'+item.cCusCode+'">'+item.cCusName+'</option>'
                            });
                            $('#company_name').html(html);
                            form.render('select');
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
		            +       '<div class="layui-form-item">'
					+			'<label class="layui-form-label">检测项目 :</label>'
					+			'<div class="layui-input-block">'
					+				'<select name="detection_item" id="detection_item+'+d_count+'" class="layui-select" lay-filter="detection_item" lay-search lay-verify="required">'
					  +					'<option value="">请选择</option>'
					  +					'<option value="COD">COD</option>'
                      +					'<option value="氨氮">氨氮</option>'
                      +					'<option value="总磷">总磷</option>'
                      +					'<option value="总氮">总氮</option>'
                      +					'<option value="汞">汞</option>'
                      +					'<option value="镍">镍</option>'
                      +					'<option value="悬浮物">悬浮物</option>'
                      +					'<option value="溶解性总固体">溶解性总固体</option>'
                      +					'<option value="PH">PH</option>'
					  +				'</select>'
					+			'</div>'
					+		'</div>'
					+		'<div class="layui-form-item">'
					+			'<label class="layui-form-label">检测数量 :</label>'
					+			'<div class="layui-input-block">'
					+				'<input type="number" id="detection_number" name="detection_number" lay-verify="required">'
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
                  form.render('select');
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    //searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
                //过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			processProduct($demo);
				}
            	
            });
        </script>
	</body>
</html>
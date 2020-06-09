<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测登记申请-手机端 -->
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
				<h2 class="">检测报告登记表</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'testingProcess/testingReport/mTestingReportRegisterList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">编码单号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">说明 :</label>
						<div class="layui-input-block">
							<textarea name="illustration" id="illustration" class="layui-textarea" readonly></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">项目名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="program_name" id="program_name" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系人 :</label>
						<div class="layui-input-block">
							<input type="text" name="contact_person" id="contact_person" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">联系电话 :</label>
						<div class="layui-input-block">
							<input type="text" name="contact_phone" id="contact_phone" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">委托单位地址 :</label>
						<div class="layui-input-block">
							<input type="text" name="entrust_adress" id="entrust_adress" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">委托单位名称 :</label>
						<div class="layui-input-block">
							<input type="text" name="entrust_name" id="entrust_name" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">样品编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="specimen_number" id="specimen_number" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">任务下达时间 :</label>
						<div class="layui-input-block">
							<input type="text" name="date1" id="date1" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">检测类型 :</label>
						<div class="layui-input-block">
							<input type="text" name="type" id="type" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">要求完成时间 :</label>
						<div class="layui-input-block">
							<input type="text" name="date2" id="date2" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">执行标准 :</label>
						<div class="layui-input-block">
							<input type="text" name="standard" id="standard" class="layui-input">
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
									<label class="layui-form-label">检测点位 :</label>
									<div class="layui-input-block">
										<input type="text" name="detection_site" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测项目 :</label>
									<div class="layui-input-block">
										<input type="text" name="detection_program" class="layui-input" >
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">样品编码 :</label>
									<div class="layui-input-block">
										<input type="text" name="specimen_number" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">采样日期 :</label>
									<div class="layui-input-block">
										<input type="text" name="specimen_date" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
			 						<label class="layui-form-label">备注 :</label>
									<div class="layui-input-block">
										<textarea name="remark" class="layui-textarea"></textarea>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">采样容器 :</label>
									<div class="layui-input-block">
										<input type="text" name="specimen_vessel" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">样品数量 :</label>
									<div class="layui-input-block">
										<input type="text" name="specimen_acount" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">样品状况 :</label>
									<div class="layui-input-block">
										<input type="text" name="specimen_status" class="layui-input">
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
					elem: '#date1' //指定元素
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
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
					,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				    	}
			        }
				});
				detailsRender(1); //明细信息第一行自定义渲染事件
                
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;
					var illustration = data.field.illustration;
					var expectedDelivery_date = data.field.expectedDelivery_date;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());

						var obj = {'inventory_id':inventory_id,'product_name':product_name
								,'specifications_models':specifications_models,'unit':unit
								,'buy_quantity':buy_quantity,'inventory_quantity':inventory_quantity};
						currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : ""
				 		,type : "post"
				 		,data : {'currentDetails':currentDetails}
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
				//说明
				$('#illustration').val('用于信泽有限公司样品保管员办理样品编码登记表单');
            	
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
                    +        '<label class="layui-form-label">检测点位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="detection_site" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">检测项目 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="detection_program" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">样品编码 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specimen_number" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">采样日期 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="specimen_date" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
			        +      '<div class="layui-form-item">'
					+	     '<label class="layui-form-label">备注 :</label>'
					+		 '<div class="layui-input-block">'
					+		   '<textarea name="remark" class="layui-textarea"></textarea>'
					+	     '</div>'
					+	   '</div>'
					+      '<div class="layui-form-item">'
					+	     '<label class="layui-form-label">采样容器 :</label>'
					+		 '<div class="layui-input-block">'
					+		   '<textarea name="specimen_vessel" class="layui-textarea"></textarea>'
					+	     '</div>'
					+	   '</div>'
					+      '<div class="layui-form-item">'
					+	     '<label class="layui-form-label">样品数量 :</label>'
					+		 '<div class="layui-input-block">'
					+		   '<textarea name="specimen_acount" class="layui-textarea"></textarea>'
					+	     '</div>'
					+	   '</div>'
					+      '<div class="layui-form-item">'
					+	     '<label class="layui-form-label">样品状况 :</label>'
					+		 '<div class="layui-input-block">'
					+		   '<textarea name="specimen_status" class="layui-textarea"></textarea>'
					+	     '</div>'
					+	   '</div>'
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
                    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                //行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
                }
            	
            });
        </script>
	</body>
</html>
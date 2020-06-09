<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务通知申请-手机端 -->
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
				<h2 class="">采样任务通知申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'testingProcess/samplingMessage/mSamplingTaskNoticeList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">采样单号 :</label>
						<div class="layui-input-block">
							<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">说明 :</label>
						<div class="layui-input-block">
							<textarea name="illustration" id="illustration" class="layui-textarea" readonly style="color: red"></textarea>
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
						<label class="layui-form-label">报表编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="specimen_name" id="specimen_name" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">采样方式 :</label>
						<div class="layui-input-block">
							<input type="radio" name="sampleType" value="1" title="采样" checked>
							<input type="radio" name="sampleType" value="2" title="送样">
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
							<select name="type" id="type" class="layui-select">
								<option value="">==请选择类型==</option>
								<option>自行检测</option>
								<option>常规检测</option>
								<option>建设项目竣工验收检测</option>
								<option>环评现状检测</option>
								<option>季度比对检测</option>
								<option>验收比对检测</option>
							</select>
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
									<label class="layui-form-label">序号 :</label>
									<div class="layui-input-block">
										<input type="text" name="number" value="1" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测点位 :</label>
									<div class="layui-input-block">
										<input type="text" name="detection_site" class="layui-input" data-subItems="1">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">点位个数 :</label>
									<div class="layui-input-block">
										<input type="text" name="site_number" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测项目 :</label>
									<div class="layui-input-block detection_program">
										<div class="items-details">
											<input type="text" name="detection_program" class="layui-input" data-index="1" >
											<span id="add" onclick="addItems(this);">&#43;</span>
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">方法依据 :</label>
									<div class="layui-input-block according">
										<div class="items-details">
											<input type="text" name="according" class="layui-input" data-index="1">
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测频次 :</label>
									<div class="layui-input-block">
										<input type="text" name="detection_frequency" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">检测天数 :</label>
									<div class="layui-input-block">
										<input type="text" name="detection_days" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
			 						<label class="layui-form-label">备注 :</label>
									<div class="layui-input-block">
										<textarea name="remark" class="layui-textarea"></textarea>
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
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm" disabled>提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary" disabled>重置</button>
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
                    var illustration =  data.field.illustration;//说明
                    var program_name =  data.field.program_name;//项目名称
                    var contact_person =  data.field.contact_person;//联系人
                    var contact_phone =  data.field.contact_phone;//联系电话
                    var entrust_adress =  data.field.entrust_adress;//委托单位地址
                    var entrust_name =  data.field.entrust_name;//委托单位名称
                    var specimen_name =  data.field.specimen_name;//样品名称
                    var date1 =  data.field.date1;//任务下达时间
                    var type =  $('#type').find('option:selected').text();//检测类型
                    var date2 =  data.field.date2;//要求完成时间
                    var standard =  data.field.standard;//执行标准
                    var sampleType = data.field.sampleType;//采样方式
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
                        var number = $(item).find('input[name="number"]').val();
                        var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位
                        var site_number = $(item).find('input[name="site_number"]').val();//点位数量

                        //检测项目及方法依据明细
                        var itemsDetails = [];
                        var detectionArray = $(item).find('div.detection_program>.items-details');//检测项目
                        var accordingArray = $(item).find('div.according>.items-details');//方法依据
                        $.each(detectionArray,function(index0,item0){
                            var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                            var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                            itemsDetails.push({'processName':detection_program,'methodBasis':according});
                        });

                        var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                        var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                        var remark = $(item).find('input[name="remark"]').val();

                        var obj = {
                            'details_int2':number,
                            'details_string':detection_site,
                            'details_money5':site_number,
                            //'details_string2':detection_program,
                            //'details_string3':according,
                            'details_string2':itemsDetails,
                            'details_int3':detection_frequency,
                            'details_int4':detection_days,
                            'details_string6':remark,
                            'details_money2':site_number*detection_frequency*detection_days
                        };
                        currentDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Xinze/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':43,
                            'currency_string':illustration,
                            'currency_string2':program_name,
                            'currency_string3':contact_person,
                            'currency_string4':contact_phone,
                            'currency_string5':entrust_adress,
                            'currency_string10':entrust_name,
                            'currency_string7':specimen_name,
                            'currency_date2':date1,
                            'currency_string8':type,
                            'currency_date3':date2,
                            'currency_string9':standard,
                            'currency_int':0,
                            'currency_int2':sampleType,
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
				$('#illustration').val('用于信泽有限公司业务科办理采样业务的下达任务表单,请勿在手机端发起申请！！！');
            	
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
				    +        '<label class="layui-form-label">序号 :</label>'
				    +        '<div class="layui-input-block">'
				    +          '<input type="text" name="number" value="'+n_count+'" class="layui-input">'
				    +        '</div>'
				    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">检测点位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="detection_site" class="layui-input" data-subItems="1">'
                    +        '</div>'
                    +      '</div>'
					  +      '<div class="layui-form-item">'
                      +        '<label class="layui-form-label">点位个数 :</label>'
                      +        '<div class="layui-input-block">'
                      +          '<input type="text" name="site_number" class="layui-input">'
                      +        '</div>'
                      +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">检测项目 :</label>'
                    +        '<div class="layui-input-block detection_program">'
					+			'<div class="items-details">'
                    +				'<input type="text" name="detection_program" data-index="1">'
                    +				'<span id="add" onclick="addItems(this);">&#43;</span>'
                    +			'</div>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">方法依据 :</label>'
                    +        '<div class="layui-input-block according">'
                    +			'<div class="items-details">'
                    +				'<input type="text" name="according" data-index="1">'
                    +			'</div>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">检测频次 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="detection_frequency" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">检测天数 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="detection_days" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
			        +      '<div class="layui-form-item">'
					+	     '<label class="layui-form-label">备注 :</label>'
					+		 '<div class="layui-input-block">'
					+		   '<textarea name="remark" class="layui-textarea"></textarea>'
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
                //添加检测项目点击事件
                window.addItems = function(obj){
                    //data-subItems值更新
                    var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                    $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
                    //添加项
                    var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +      '<input type="text" name="detection_program">'
                        +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                        +  '</div>';
                    $(obj).closest('.details').find('div.detection_program').append(html1);
                    var html2 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +		'<input type="text" name="according">'
                        +	'</div>';
                    $(obj).closest('.details').find('div.according').append(html2);
                }
                //移除检测项目点击事件
                window.removeItems = function(obj){
                    layer.confirm('确认移除？',function(index){
                        //data-subItems值更新
                        var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                        $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i-1));
                        //删除项
                        var j = $(obj).closest('.items-details').attr('data-index');
// 						if(j != '1'){
                        $(obj).closest('.details').find('div.according>.items-details[data-index="'+j+'"]').remove();
                        $(obj).closest('.items-details').remove();
// 						}
                        layer.close(index);
                    });
                }
            	
            });
        </script>
	</body>
</html>
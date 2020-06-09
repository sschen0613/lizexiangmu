<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 样品编码登记表 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=11 class="table-h">样品编码登记表</th>
				</tr>
				<tr>
					<th colspan=11 style="text-align:right">编码单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>说明</td>
					<td colspan=10><input type="text" name="illustration" value="用于信泽有限公司样品保管员办理样品编码登记表单" readonly></td>
				</tr>
				<tr>
					<th colspan="11" style="text-align: center;">基本信息</th>
				</tr>
				<tr>
					<td>项目名称</td>
					<td colspan="2"><input type="text" id="program_name" name="program_name" readonly></td>
					<td>联系人</td>
					<td colspan="3"><input type="text" id="contact_person" name="contact_person" readonly></td>
					<td>联系电话</td>
					<td colspan="3"><input type="text" id="contact_phone" name="contact_phone" readonly></td>
				</tr>
				<tr>
					<td>委托单位地址</td>
					<td colspan=10><input type="text" id="entrust_adress" name="entrust_adress" readonly></td>
				</tr>
				<tr>
					<td colspan=2>委托单位名称</td>
					<td colspan="4"><input type="text" id="entrust_name" name="entrust_name" readonly></td>
					<td>报告编码</td>
					<td colspan="4"><input type="text" id="specimen_count" name="specimen_count" readonly></td>
				</tr>
				<tr>
					<td>检测完成时间</td>
					<td colspan="2"><input name="date1" type="text" class="layui-input" lay-verify="required" id="date1" placeholder="请选择日期" autocomplete="off"></td>
					<td>检测类型</td>
					<td colspan="2"><input type="text" id="type" name="type" readonly /></td>
					<td>报告完成时间</td>
					<td colspan="4"><input name="date2" type="text" class="layui-input" lay-verify="required" id="date2" placeholder="请选择日期" autocomplete="off"></td>
				</tr>
				<tr>
					<td>执行标准</td>
					<td colspan=10><input type="text" id="standard" name="standard" readonly></td>
				</tr>
				<tr>
					<th colspan="11" style="text-align: center;">采样任务明细</th>
				</tr>
				<tr>
					<td>序号</td>
					<td>检测点位</td>
					<td>检测项目</td>
					<td>样品编码</td>
					<td>检测标准</td>
					<td>采样日期</td>
					<td>备注</td>
					<td>采样容器</td>
					<td>样品数量</td>
					<td>样品状况</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="number" value="1" readonly></td>
					<td><input type="text" name="detection_site"></td>
					<td class="items detection_program">
						<div class="items-details">
							<input type="text" name="detection_program" data-index="1">
						</div>
					</td>
					<td class="items specimen_number">
						<div class="items-details">
							<input type="text" name="specimen_number" data-index="1">
						</div>
					</td>
					<td class="items standart">
						<div class="items-details">
							<input type="text" name="standart" data-index="1">
						</div>
					</td>
					<td><input type="text" name="specimen_date"></td>
					<td><input type="text" name="remark"></td>
					<td><input type="text" name="specimen_vessel"></td>
					<td><input type="text" name="specimen_acount"></td>
					<td><input type="text" name="specimen_status"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=11 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=11></th>
				</tr>
		 	</thead>
		</table>
		<div class="layui-form-item button-div">
			<div class="layui-input-block">
				<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
	        	<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
		</form>
		<script>
		//一般直接写在一个js文件中
			layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'], function(){
				var laydate = layui.laydate //日期
				,laypage = layui.laypage //分页
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form
				,layedit = layui.layedit;
                var d_count = 0;
				//表单更新渲染
				form.render();
				form.render('select');
				// form.render('checkbox');
				// form.render('redio');
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
				inputRender();//input框自定义渲染
				
				var currency_id = '${param.currency_id}';
				var contractNumber = '';
				var noticeId = '';
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
                    var specimen_count =  data.field.specimen_count;//样品编码
                    var date1 =  data.field.date1;//任务下达时间
                    var type =  data.field.type;//检测类型
                    var date2 =  data.field.date2;//要求完成时间
                    var standard =  data.field.standard;//执行标准


                    var currentDetails = [];
                    $.each($('.details'),function(index,item){
                        //检测项目及方法依据明细
                        var itemsDetails = [];
                        var sampleDetails = [];
                        var detectionArray = $(item).find('td.detection_program>.items-details');//检测项目
                        var sampleArray = $(item).find('td.specimen_number>.items-details');//样品编码
                        var standartArray = $(item).find('td.standart>.items-details');//方法依据
                        $.each(detectionArray,function(index0,item0){
                            var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                            var standart = $(standartArray[index0]).find('input[name="standart"]').val();//检测标准
                            itemsDetails.push({'processName':detection_program,'process_string':standart});
                        });
                        $.each(sampleArray,function(index0,item0){
                            var specimen_number = $(item0).find('input[name="specimen_number"]').val();//检测项目
                            //var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                            sampleDetails.push({'code':specimen_number});
                        });


                        var number = $(item).find('input[name="number"]').val();
                        var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位
                        var detection_program = $(item).find('input[name="detection_program"]').val();//检测项目
                        var specimen_number = $(item).find('input[name="specimen_number"]').val();//样品编码
                        var specimen_date = $(item).find('input[name="specimen_date"]').val();//采样日期
                        var specimen_vessel = $(item).find('input[name="specimen_vessel"]').val();//采样容器
                        var specimen_acount = $(item).find('input[name="specimen_acount"]').val();//采样数量
                        var remark = $(item).find('input[name="remark"]').val();
                        var specimen_status = $(item).find('input[name="specimen_status"]').val();//样品状况


                        var obj = {
                            'details_int2':number,
                            'details_string':detection_site,
                            'details_string2':itemsDetails,
                            'details_string3':sampleDetails,
                            'details_date2':specimen_date,
                            'details_string4':specimen_vessel,
                            'details_string5':specimen_status,
                            'details_int3':specimen_acount,
                            'details_string6':remark,
                        };
                        currentDetails.push(obj);
                    });
				 	$.ajax({
				 		 url : "Xinze/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':45,
                            'currency_id':currency_id,
                            'currency_string':illustration,
                            'currency_string2':program_name,
                            'currency_string3':contact_person,
                            'currency_string4':contact_phone,
                            'currency_string5':entrust_adress,
                            'currency_string10':entrust_name,
                            'currency_string7':specimen_count,
                            'currency_date2':date1,
                            'currency_string8':type,
                            'currency_date3':date2,
                            'currency_string9':standard,
                            'currency_int':2,
                            'currency_string18':contractNumber,
                            'currency_string17':noticeId,
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
                            $('#myForm').attr("disabled",'disabled');
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
				var sum = 0;
				setBuyNumber();
                var currency_id = '${param.currency_id}';
                var currency_date = '';
                $.ajax({
                    url : "Xinze/selectCurrencyApply.action"
                    ,type : "post"
                    ,data : {"currency_id":currency_id}
                    ,dataType : "JSON"
                    ,success : function(result){
                        //layer.msg(result.msg);
						contractNumber = result.data.currency_string18;
                        noticeId = result.data.currency_string17;
						if (noticeId == null){
						    noticeId = currency_id;
						}
                        $("#program_name").val(result.data.currency_string2);
                        $("#contact_person").val(result.data.currency_string3);
                        $("#contact_phone").val(result.data.currency_string4);
                        $("#entrust_adress").val(result.data.currency_string5);
                        $("#entrust_name").val(result.data.currency_string10);
                        $("#specimen_count").val(result.data.currency_string7);
                       // $("#date1").val(Format(result.data.currency_date2,"yyyy-MM-dd"));
                        $("#type").val(result.data.currency_string8);
                        //$("#date2").val(Format(result.data.currency_date3,"yyyy-MM-dd"));
                        $("#standard").val(result.data.currency_string9);
						currency_date = Format(result.data.currency_date,'yyyy-MM-dd');
                        $.ajax({
                            url : "Currency/selectCurrencyDetails.action?currency_int2=-1"
                            ,type : "post"
                            ,data : {"currency_id":currency_id}
                            ,dataType : "JSON"
                            ,success:function (res) {
                                $('.details').remove();
                                $.each(res.data,function (index,item) {
                                    sum ++;
                                    console.log(item.details_money2);
                                    var processHtml1 = '';
                                    var processHtml2 = '';
                                    var processHtml3 = '';
                                    //var many = item.details_money;
									var many = 1;
                                    $.ajax({
                                        url:"Xinze/selectProcessByDetailsId.action"
                                        ,type:"post"
                                        ,data:{"details_id":item.currency_details_id}
                                        ,success:function (res) {

                                            $.each(res.data,function (i,process) {
                                                processHtml1 +=
                                                    '<div class="items-details">'
                                                    +			'<input type="text" name="detection_program" value="'+process.processName+'" data-index="1">'
                                                    +	'</div>';
                                                processHtml3+=
                                                    '<div class="items-details">'
                                                    +			'<input type="text" name="standart" value="'+process.process_string+'" data-index="1" readonly>'
                                                    +		'</div>'
                                            });
                                            for(var i=0;i<many;i++){
                                                if(i == 0){
                                                    processHtml2 +=
                                                        '<div class="items-details">'
                                                        +			'<input type="text" name="specimen_number"  data-index="1" >'
                                                        +           '<span id="minus" onclick="addItems(this);">&#43;</span>'
                                                        +	'</div>'
												}else {
                                                    processHtml2 +=
                                                        '<div class="items-details">'
                                                        +			'<input type="text" name="specimen_number"  data-index="1" >'
                                                        +           '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                                                        +	'</div>'
												}

											}
                                            console.log(processHtml1);
                                            ++d_count;
                                            var html = '<tr class="details">'
                                                +	'<td><input type="text" name="number" value="'+item.details_int2+'" readonly></td>'
                                                +	'<td><input type="text" name="detection_site" value="'+item.details_string+'" readonly></td>'
                                                +	'<td class="items detection_program">'
                                                +	 processHtml1
												+    '</td>'
                                                +	'<td class="items specimen_number">'
                                                +	 processHtml2
                                                +    '</td>'
                                                +	'<td class="items standart">'
                                                +	 processHtml3
                                                +    '</td>'
                                                +	'<td><input type="text"  name="specimen_date" value="'+currency_date+'" readonly></td>'
                                                +	'<td><input type="text" id="remark'+d_count+'" name="remark" value="'+item.details_string6+'" readonly></td>'
                                                +	'<td><input type="text" id="specimen_vessel'+d_count+'" name="specimen_vessel" lay-verify="required"></td>'
                                                +	'<td><input type="text" id="specimen_acount'+d_count+'" name="specimen_acount" lay-verify="required"></td>'
                                                +	'<td><input type="text" id="specimen_status'+d_count+'" name="specimen_status" lay-verify="required"></td>'
                                                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除<tton></td>'
                                                +	'</tr>';
                                            $('table.table-open>tbody').append(html);
                                            //渲染
                                            detailsRender(d_count); //明细信息每行自定义渲染事件
                                        }
                                    });


                                });
                            }

                        });

                    }
                });
                //移除检测项目点击事件
                window.removeItems = function(obj){
                    layer.confirm('确认移除？',function(index){
                        //data-subItems值更新
                       // var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                       // $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i-1));
                        //删除项
                        var j = $(obj).closest('.items-details').attr('data-index');
// 						if(j != '1'){
                        $(obj).closest('.details').find('td.specimen_number>.items-details[data-index="'+j+'"]').remove();
                        //$(obj).closest('.details').find('td.standart>.items-details[data-index="'+j+'"]').remove();
                        $(obj).closest('.items-details').remove();
// 						}
                        layer.close(index);
                    });
                }
                //添加检测项目点击事件
                window.addItems = function(obj){
                    //data-subItems值更新
                    var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                    //$(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
                    //添加项
                    var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +      '<input type="text" name="specimen_number">'
                        +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                        +  '</div>';
                    $(obj).closest('.details').find('td.specimen_number').append(html1);

                }

                //操作
                //点击添加明细按钮

				$('.addDetails').click(function(){
				    sum = sum + 1;
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="number" value="'+sum+'" readonly></td>'
				 			 +	'<td><input type="text" name="detection_site" data-subItems="1"></td>'
							 +	'<td class="items detection_program">'
							 +		'<div class="items-details">'
							 +			'<input type="text" name="detection_program" data-index="1">'
							 +			'<span id="add" onclick="addItems1(this);">&#43;</span>'
							 +		'</div>'
							 +	'</td>'
							+	'<td class="items specimen_number">'
							+		'<div class="items-details">'
							+			'<input type="text" name="specimen_number" data-index="1">'
							+			'<span id="add" onclick="addItems2(this);">&#43;</span>'
							+		'</div>'
							+	'</td>'
							+	'<td class="items standart">'
							+		'<div class="items-details">'
							+			'<input type="text" name="standart" data-index="1">'
							+		'</div>'
							+	'</td>'
				 			 +	'<td><input type="text" name="specimen_date" value="'+currency_date+'"></td>'
				 			 +	'<td><input type="text" name="remark"></td>'
				 			 +	'<td><input type="text" name="specimen_vessel"></td>'
				 			 +	'<td><input type="text" name="specimen_acount"></td>'
				 			 +	'<td><input type="text" name="specimen_status"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
				});

                window.addItems1 = function(obj){
                    //data-subItems值更新
                    var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                    $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
                    //添加项
                    var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +      '<input type="text" name="detection_program">'
                        +      '<span id="minus" onclick="removeItems1(this);">&minus;</span>'
                        +  '</div>';
                    $(obj).closest('.details').find('td.detection_program').append(html1);
                    var html3 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +		'<input type="text" name="standart">'
                        +	'</div>';
                    $(obj).closest('.details').find('td.standart').append(html3);

                }
                window.addItems2 = function(obj){
                    //data-subItems值更新
                    var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                    //$(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
                    //添加项
                    var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +      '<input type="text" name="specimen_number">'
                        +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                        +  '</div>';
                    $(obj).closest('.details').find('td.specimen_number').append(html1);

                }
                window.removeItems1 = function(obj){
                    layer.confirm('确认移除？',function(index){
                        //data-subItems值更新
                        var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                        $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i-1));
                        //删除项
                        var j = $(obj).closest('.items-details').attr('data-index');
// 						if(j != '1'){
                       // $(obj).closest('.details').find('td.detection_program>.items-details[data-index="'+j+'"]').remove();
                        $(obj).closest('.details').find('td.standart>.items-details[data-index="'+j+'"]').remove();
                        $(obj).closest('.items-details').remove();
// 						}
                        layer.close(index);
                    });
                }
                window.removeItems = function(obj){
                    layer.confirm('确认移除？',function(index){
                        //删除项
                        var j = $(obj).closest('.items-details').attr('data-index');
// 						if(j != '1'){
                        //$(obj).closest('.details').find('td.specimen_number>.items-details[data-index="'+j+'"]').remove();
                        //$(obj).closest('.details').find('td.standart>.items-details[data-index="'+j+'"]').remove();
                        $(obj).closest('.items-details').remove();
// 						}
                        layer.close(index);
                    });
                }
				//明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                }
				//行删除事件
				function deleteItem($demo){
					deleteDetailsItem2($demo);
				}
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}
				//监听电话输入框输入正确格式
				inputLimitPhone($('#contact_phone'));

			});
		</script> 
	</body>
</html>
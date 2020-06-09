<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务通知单 -->
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
					<th colspan=10 class="table-h">采样任务通知单</th>
				</tr>
				<tr>
					<th colspan=10 style="text-align:right">采样单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>说明</td>
					<td colspan=9><input type="illustration" name="illustration" value="用于信泽有限公司业务科办理采样业务的下达任务表单" readonly></td>
				</tr>
				<tr>
					<th colspan="10" style="text-align: center;">基本信息</th>
				</tr>
				<tr>
					<td style="background-color: lightskyblue">数据回调</td>
					<td id="contract" class="container" colspan="9">
						<input id='contract_id' name="contract_id" class="contract-search-box" placeholder="输入关键字查询,调取历史通知信息,也可自行填写,非必填!!!">
						<div class="list-container" style="display:none;">
							<ul></ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>项目名称</td>
					<td colspan="2"><input type="text" name="program_name" id="program_name" lay-verify="required"></td>
					<td>联系人</td>
					<td><input type="text" name="contact_person" id="contact_person" lay-verify="required"></td>
					<td>联系电话</td>
					<td colspan=4><input type="text" id="contact_phone" name="contact_phone" lay-verify="required"></td>
				</tr>
				<tr>
					<td>委托单位地址</td>
					<td colspan=3><input type="text" id="entrust_adress" name="entrust_adress" lay-verify="required"></td>
					<td>委托单位名称</td>
					<td colspan="5"><input type="text" name="entrust_name" id="entrust_name" readonly></td>
				</tr>
				<tr>
					<td>合同编号</td>
					<td colspan="2"><input type="text" name="contract_number" id="contract_number" readonly></td>
					<td>报表编码</td>
					<td colspan="2"><input type="text" name="specimen_name" id="specimen_name" readonly></td>
					<td>样品来源</td>
					<td colspan="3">
						<select id="sampleType" name="sampleType" lay-search lay-verify="required" disabled>
							<option value="2">送样</option>
							<option value="1">现场采样</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>采样完成时间</td>
					<td colspan=2><input name="date1" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
					<td>检测类型</td>
					<td><select id="type" name="type" lay-filter="type" lay-search lay-verify="required">
						<option value="">==请选择类型==</option>
						<option>自行检测</option>
						<option>常规检测</option>
						<option>建设项目竣工验收检测</option>
						<option>环评现状检测</option>
						<option>季度比对检测</option>
						<option>验收比对检测</option>
					    </select>
					</td>
					<td>报告完成时间</td>
					<td colspan=4><input name="date2" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
				</tr>
				<tr>
					<td>执行标准</td>
					<td colspan=9><input type="text" id="standard" name="standard" lay-verify="required"></td>
				</tr>
				<tr>
					<th colspan="10" style="text-align: center;">采样任务明细</th>
				</tr>
				<tr>
					<td >序号</td>
					<td>检测点位</td>
					<td>点位个数</td>
					<td>检测项目</td>
					<td>方法依据</td>
					<td>限值</td>
					<td>检测频次</td>
					<td>检测天数</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="number" value="1" readonly></td>
					<td><input type="text" name="detection_site" data-subItems="1" lay-verify="required"></td>
					<td><input type="number" name="site_number" lay-verify="required"></td>
					<td class="items detection_program">
						<div class="items-details">
							<input type="text" name="detection_program" data-index="1" lay-verify="required">
							<span id="add" onclick="addItems(this);">&#43;</span>
						</div>
					</td>
					<td class="items according">
						<div class="items-details">
							<input type="text" name="according" data-index="1" lay-verify="required">
						</div>
					</td>
					<td class="items standart">
						<div class="items-details">
							<input type="text" name="standart" data-index="1" lay-verify="required">
						</div>
					</td>
					<td><input type="text" id="detection_frequency1" name="detection_frequency" lay-verify="required"></td>
					<td><input type="text" id="detection_days1" name="detection_days" lay-verify="required"></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=10 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=10></th>
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

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					$("#sampleType").removeAttr("disabled");
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
					var sampleType = $('#sampleType').find('option:selected').val();//采样方式
					var contract_number = data.field.contract_number;//对应合同编号


                    var currentDetails = [];
                    $.each($('.details'),function(index,item){
                        var number = $(item).find('input[name="number"]').val();
                        var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位
                        var site_number = $(item).find('input[name="site_number"]').val();//点位数量
                        
                        //检测项目及方法依据明细
                        var itemsDetails = [];
                        var detectionArray = $(item).find('td.detection_program>.items-details');//检测项目
                        var accordingArray = $(item).find('td.according>.items-details');//方法依据
                        var standartArray = $(item).find('td.standart>.items-details');//检测标准
                        $.each(detectionArray,function(index0,item0){
                        	var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                        	var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                        	var standart = $(standartArray[index0]).find('input[name="standart"]').val();//检测标准
                        	itemsDetails.push({'processName':detection_program,'methodBasis':according,'process_string':standart});
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
				 		     'currency_id':currency_id,
				 		     'currency_string':illustration,
				 		     'currency_string2':program_name,
				 		     'currency_string3':contact_person,
				 		     'currency_string4':contact_phone,
				 		     'currency_string5':entrust_adress,
				 		     'currency_string10':entrust_name,
				 		     'currency_string7':specimen_name,
				 		     'currency_string17':currency_id,
                             'currency_string18':contract_number,
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
                searchProcess_contract($('#contract'));
    			//获取请购单号
				setBuyNumber();
                var currency_id = '${param.currency_id}';
              	$.ajax({
                    url : "Xinze/selectCurrencyApply.action"
                    ,type : "post"
                    ,data : {"currency_id":currency_id}
                    ,dataType : "JSON"
					,success:function (res) {
						$("#entrust_name").val(res.data.currency_string3);
						$("#contract_number").val(res.data.currency_string4);
						$("#specimen_name").val(res.data.currency_string8);
						if(res.data.currency_string2=="现场采样"){
							$("#sampleType").val("1");
							form.render();
						}else {
                            $("#sampleType").val("2");
                            form.render();
						}
                    }
				});
                
                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
				 			 +	'<td><input type="text" name="detection_site" data-subItems="1" lay-verify="required"></td>'
				 			 +	'<td><input type="number" name="site_number" lay-verify="required"></td>'
				 			 +	'<td class="items detection_program">'
				 			 +		'<div class="items-details">'
				 			 +			'<input type="text" name="detection_program" data-index="1" lay-verify="required">'
				 			 +			'<span id="add" onclick="addItems(this);">&#43;</span>'
				 			 +		'</div>'
				 			 +	'</td>'
				 			 +	'<td class="items according">'
				 			 +		'<div class="items-details">'
				 			 +			'<input type="text" name="according" data-index="1" lay-verify="required">'
				 			 +		'</div>'
							 +	'</td>'
							 +	'<td class="items standart">'
                    		 +		'<div class="items-details">'
							 +			'<input type="text" name="standart" data-index="1" lay-verify="required">'
							 +		'</div>'
							 +	'</td>'
				 			 +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" lay-verify="required"></td>'
				 			 +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="remark"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
				});
				//明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	inputLimitInteger($('#detection_frequency'+index));//监听检测频次只允许输入整数
                	inputLimitInteger($('#detection_days'+index));//监听检测天数只允许输入整数
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
				//添加检测项目点击事件
				window.addItems = function(obj){
					//data-subItems值更新
					var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
					$(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
					//添加项
					var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
							 +      '<input type="text" name="detection_program" lay-verify="required">'
							 +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
							 +  '</div>';
					$(obj).closest('.details').find('td.detection_program').append(html1);
					var html2 = '<div class="items-details" data-index="'+(i+1)+'">'
							  +		'<input type="text" name="according" lay-verify="required">'
							  +	'</div>';
					$(obj).closest('.details').find('td.according').append(html2);
                    var html3 = '<div class="items-details" data-index="'+(i+1)+'">'
                        +		'<input type="text" name="standart" lay-verify="required">'
                        +	'</div>';
                    $(obj).closest('.details').find('td.standart').append(html3);
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
							$(obj).closest('.details').find('td.according>.items-details[data-index="'+j+'"]').remove();
							$(obj).closest('.details').find('td.standart>.items-details[data-index="'+j+'"]').remove();
							$(obj).closest('.items-details').remove();
// 						}
						layer.close(index);
					});
				}

				//数据回调
                //过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
                var back = '';//记录当前合同编号
                function searchProcess_contract($demo){
                    // 过程二第一级 - 获取合同编号
                    //过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
                    $('.contract-search-box').bind("input propertychange",function(event){
                        var currentKey = $(event.target).val();//搜索框值
                        if(currentKey == ''){
                            $demo.find('.list-container>ul').html('');
                            $demo.find('.list-container').css('display','none');
                        }else{
                            $.ajax({
                                url:'Xinze/selectAllNotice.action',
                                type:'post',
                                data:{
                                    'currency_string2':currentKey,
									'currency_type':43
								},
                                dataType:'JSON',
                                success:function(res){
                                    var html = '<li value="" class="list-this">请选择历史通知任务书</li>';
                                    $.each(res.data,function(index,item){
                                        html += '<li value="'+item.currency_id+'" data-program="'+item.currency_string2
                                            +'" data-person="'+item.currency_string3
                                            +'" data-phone="'+item.currency_string4
                                            +'" data-adress="'+item.currency_string5
                                            +'" data-type="'+item.currency_string8
                                            +'" data-code="'+item.currency_string7
                                            +'" data-standard="'+item.currency_string9+'" >项目名称：'+item.currency_string2
                                            +'；委托单位:'+item.currency_string10+'；单位地址：'+item.currency_string5+'；申请时间：'+Format0(item.currency_date,"yyyy-MM-dd HH:mm:ss")
                                            +'</li>';
                                    });
                                    $demo.find('.list-container>ul').html(html);
                                    $demo.find('.list-container').css('display','block');
                                    //给合同编号下拉列表框绑定隐藏事件
                                    hideListContainer_contract('contract');
                                }
                            });
                        }
                    });
                    //过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
                    //给下拉列表框绑定点击事件
                    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                        var value = $(this).val();//number类型
                        var text = $(this).text();
                        var program = $(this).attr('data-program');
                        var person = $(this).attr('data-person');
                        var phone = $(this).attr('data-phone');
                        var adress = $(this).attr('data-adress');
                        var type = $(this).attr('data-type');
                        var code = $(this).attr('data-code');
                        var standard = $(this).attr('data-standard');
                        $("#program_name").val(program);//合同金额
                        $('#contact_person').val(person);//客户名称
                        $('#contact_phone').val(phone);//客户名称
                        $('#entrust_adress').val(adress);//客户名称
                        $('#specimen_name').val(code);//客户名称
                        $('#type').val(type);//客户名称
                        $('#standard').val(standard);//客户名称
                        //查询合同收款计划
                        $.ajax({
                            url:'Currency/selectCurrencyDetails.action',
                            type:'post',
                            data:{'currency_id':value},
                            dataType:'JSON',
                            success:function(res){
                                $('.details').remove();
                                $.each(res.data,function (index,item) {
                                    var processHtml1 = '';
                                    var processHtml2 = '';
                                    var processHtml3 = '';
                                    $.ajax({
                                        url:"Xinze/selectProcessByDetailsId.action"
                                        ,type:"post"
                                        ,data:{"details_id":item.currency_details_id}
                                        ,success:function (result) {
                                            $.each(result.data,function (i,process) {
                                                if (i==0){
                                                    processHtml1 += '<div class="items-details">'
                                                    					+'<input type="text" name="detection_program" value="'+process.processName+'" data-index="1" lay-verify="required">'
                                                    					+'<span id="add" onclick="addItems(this);">&#43;</span>'
                                                    				+'</div>'
												}else {
													processHtml1 += '<div class="items-details" data-index="'+(i+1)+'">'
                                                        		+      '<input type="text" name="detection_program" value="'+process.processName+'" lay-verify="required">'
                                                        		+      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                                                        		+  '</div>';
												}
                                                processHtml2+= '<div class="items-details" data-index="'+(i+1)+'">'
                                                    		+		'<input type="text" name="according" value="'+process.methodBasis+'" lay-verify="required">'
                                                    		+	'</div>';

                                                processHtml3+= '<div class="items-details" data-index="'+(i+1)+'">'
                                                    		+		'<input type="text" name="standart" value="'+process.process_string+'" lay-verify="required">'
                                                    		+	'</div>';
                                            });
                                            var remark = '';
                                            if(item.details_string6 != null || item.details_string6 != undefined){
                                                remark = item.details_string6;
                                            }
                                            var html = '<tr class="details">'
                                                +	'<td><input type="text" name="number" value="'+(n_count++)+'" readonly></td>'
                                                +	'<td><input type="text" name="detection_site" value="'+item.details_string+'" data-subItems="1" lay-verify="required"></td>'
                                                +	'<td><input type="number" name="site_number" value="'+item.details_money5+'" lay-verify="required"></td>'
                                                +	'<td class="items detection_program">'
                                                +		processHtml1
                                                +	'</td>'
                                                +	'<td class="items according">'
                                                +		processHtml2
                                                +	'</td>'
                                                +	'<td class="items standart">'
                                                +		processHtml3
                                                +	'</td>'
                                                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" lay-verify="required"></td>'
                                                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" lay-verify="required"></td>'
                                                +	'<td><input type="text" name="remark" value="'+remark+'"></td>'
                                                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                                +	'</tr>';
                                            $('table.table-open>tbody').append(html);
                                            form.render();
                                            //渲染
                                            detailsRender(d_count); //明细信息每行自定义渲染事件
                                            inputRender();//input框自定义渲染
                                        }
                                    });
                                    d_count++;
                                });
                            }
                        });
                        form.render();
                        //重置下拉列表框
                        $(this).parent().empty();
                        $demo.find('.list-container').css('display','none');
                        back = text;
                    });
                }
                //给合同编号下拉列表框绑定隐藏事件
                function hideListContainer_contract(Id){
                    $(document).bind('click', function(e) {
                        var e = e || window.event; //浏览器兼容性
                        var elem = e.target || e.srcElement;
                        while (elem) { //循环判断至跟节点，防止点击的是div子元素
                            if (elem.id && elem.id == Id) {
                                return;
                            }
                            elem = elem.parentNode;
                        }
                        //点击的不是div或其子元素
                        $('#'+Id+' .list-container').css('display', 'none');
                        //没有重新选择,重置合同编号的input框值
                        $('#'+Id+' input').val(back);
                    });
                }

			});
		</script> 
	</body>
</html>
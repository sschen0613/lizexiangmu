<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!-- 报告流转及盖章申请单 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<th colspan="6" class="table-h">报告流转及盖章申请单</th>
				</tr>
				<tr>
	 				<th colspan=6 style="text-align:right">单据单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
				</tr>
		 	</thead>
		 	<tbody >	 		
		 		<tr>
					<td>申请人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>申请部门</td>
		 			<td><input type="text" name="department_Id" id="department" readonly></td>
		 			<td>申请日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
		 		</tr>
				<tr>
					<td>报表编码</td>
					<td id="tdCode" class="container" colspan="9">
						<input id='code' name="code" class="code-search-box" placeholder="直接输入报表编码调取数据，必填!!!">
						<div class="list-container" style="display:none;">
							<ul></ul>
						</div>
				</tr>
				<tr>
					<td>委托单位</td>
					<td colspan="5"><input type="text" id='client_department' name="client_department" class="layui-input"  readonly /></td>
				</tr>
				<tr>
					<td>任务内容</td>
					<td colspan="5"><input type="text" id="task_definition" name="task_definition"  lay-verify="required" readonly></td>
				</tr>
				<tr>
					<td>申请来源</td>
					<td>
						<select name="source" id="source" lay-filter="source" >
							<option value="1">信泽</option>
							<option value="2">丽泽</option>
						</select>
					</td>
				</tr>
				<tr class="contract_tr">
					<td>合同编号</td>
					<td>
						<input type="text" id='contract_id' name="contract_id" readonly>
					</td>
					<td>合同签订日期</td>
					<td><input type="text" id="contract_date" name="contract_date" readonly></td>
					<td>合同名称</td>
					<td><input type="text" id="contract_name" name="contract_name" readonly></td>
				</tr>
		 		<tr class="contract_tr">
					<td>合同金额</td>
					<td><input type="text" id="contract_amount" name="contract_amount" readonly></td>
					<td>已收金额</td>
					<td><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
					<td>欠款金额</td>
					<td><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
				</tr>
				<tr class="contract_tr">
					<td>合同状况</td>
					<td colspan="5">
						<input type="radio" name="state" value="已合同及付款" title="已合同及付款" checked>
						<input type="radio" name="state" value="未到合同及付款" title="未到合同及付款">
					</td>
				</tr>
				<%--<tr>
		 			<th colspan="6" style="text-align: center;">合同付款约定</th> <!--Payment_agreement-->
		 		</tr>--%>
				<tr class="contract">
					<th colspan=1>合同条款名称</th>
					<th colspan=5>合同条款内容</th>
				</tr>
		 		<%--<tr>
					<td>项目名称</td>
					<td>申请类型</td>
					<td colspan="2">报告编号</td>
					<td>报告份数</td>	
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" id="name" name="unit_name" lay-verify="required" /></td>
					<td>
						<select id="type" name="type" lay-verify="required">
							<option value="">请选择</option>
							<option value="普通检测">普通检测</option>
							<option value="自行检测">自行检测</option>
							<option value="环评现状检测">环评现状检测</option>
							<option value="比对检测">比对检测</option>
							<option value="验收检测">验收检测</option>
						</select>
					</td>
					<td colspan="2"><input type="text" name="report_id" lay-verify="required"></td>
					<td><input type="number" name="report_number" lay-verify="required"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
				<tr>
		 			<td colspan=6 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>--%>
				<tr>
					<td>备注</td>
					<td colspan=5><input type="text" name="remark"></td>
				</tr>
			</tbody>
			<thead>
 				<tr>
 					<th colspan=6></th>
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
				//detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染

                searchProcess_code($('#tdCode'));

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var source = data.field.source;
					var buy_number = data.field.buy_number;//编号
					var code = data.field.code;//报表编码
                    var clientDepartment = data.field.client_department//委托单位
                    var taskDefinition = data.field.task_definition//任务内容
					var contract_number = data.field.contract_id;//合同id
					var contract_name = data.field.contract_name;//合同名称
					var contract_date = data.field.contract_date;//签订日期
					var contract_sum = Number(data.field.contract_amount);//合同金额
					var received_amount = Number(data.field.actual_receipt);//已收金额
					var outstanding_receipt = Number(data.field.outstanding_receipt);
					var contract_str_name = data.field.contract_str_name;//条款名称
					var contract_str_memo = data.field.contract_str_memo;//条款内容
					var remark = data.field.remark;//备注

					var state = data.field.state;//合同状况
					
					/*var currentDetails = [];
					$.each($('.details'),function(index,item){
						var name = $(item).find('input[name="unit_name"]').val();
						var type = $(item).find('select[name="type"]>option:selected').text();
						var report_id = $(item).find('input[name="report_id"]').val();
						var report_number = Number($(item).find('input[name="report_number"]').val());

						var obj = {'details_string2':name,'details_string3':type,'details_string4':report_id,'details_int2':report_number};
						currentDetails.push(obj);
					});*/
					if (source == 1){//信泽
                        $.ajax({
                            url : "Currency/launchCurrencyApply.action"
                            ,type : "post"
                            ,data : {
                                //'currencyDetails':JSON.stringify(currentDetails),
                                'currency_type':50,
                                'currency_number':buy_number,
                                'currency_int2':source,
                                'currency_string3':contract_number,
                                'currency_string4':contract_name,
                                'currency_date2':contract_date,
                                'currency_money':contract_sum,
                                'currency_money2':received_amount,
                                'currency_money3':outstanding_receipt,
                                'currency_string7':remark,
                                'currency_string8':contract_str_name,
                                'currency_string9':contract_str_memo,
                                'currency_string10':state,
                                'currency_string11':code,//报表编码
                                'currency_string12':clientDepartment,//委托单位
                                'currency_string13':taskDefinition//任务内容

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
					}else if (source == 2) {//丽泽
                        $.ajax({
                            url : "Currency/launchCurrencyApply.action"
                            ,type : "post"
                            ,data : {
                                //'currencyDetails':JSON.stringify(currentDetails),
                                'currency_type':50,
                                'currency_number':buy_number,
                                'currency_int2':source,
                                'currency_string4':contract_name,
                                'currency_string7':remark,
                                'currency_string11':code,//报表编码
                                'currency_string12':clientDepartment,//委托单位
                                'currency_string13':taskDefinition//任务内容
                                //'currency_string8':contract_str_name,
                                //'currency_string9':contract_str_memo,

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
					}

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
				//过程三 - 合同编号 - 合同名称+合同签订日期+(合同金额+已收金额+欠款金额)+合同条款
                //searchXZProcessOfContract($('#contract'),1,5);

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" id="name" name="unit_name" lay-verify="required" /></td>'
				 			 +	'<td><select id="type'+d_count+'" name="type" lay-verify="required">'
							 +		'<option value="">请选择</option>'
							 +		'<option value="普通检测">普通检测</option>'
							 +		'<option value="自行检测">自行检测</option>'
							 +		'<option value="环评现状检测">环评现状检测</option>'
							 +		'<option value="比对检测">比对检测</option>'
							 +		'<option value="验收检测">验收检测</option>'
							 +  '</select></td>'
				 			 +	'<td colspan="2"><input type="text" name="report_id" lay-verify="required"></td>'
				 			 +	'<td><input type="number" name="report_number" lay-verify="required"></td>'
				 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
				 			 +	'</tr>';
					$('.details').length > 0 ? $('.details:last').after(html) : $('.addDetails').parent().before(html);;
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染
					form.render();
				});
				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					//searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
				//行删除事件
				function deleteItem($demo){
					deleteDetailsItem1($demo);
				}
				//input滑过显示内容详情 - 防止溢出情况
				function inputRender(){
					$('input').mouseover(function(e){
						e.target.title = e.target.value;
					});
				}

                //数据回调
                //过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
                var back = '';//记录当前合同编号
                function searchProcess_code($demo){
                    // 过程二第一级 - 获取合同编号
                    //过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
                    $('.code-search-box').bind("input propertychange",function(event){
                        var currentKey = $(event.target).val();//搜索框值
                        if(currentKey == ''){
                            $demo.find('.list-container.back>ul').html('');
                            $demo.find('.list-container.back').css('display','none');
                        }else{
                            $.ajax({
                                url:'Xinze/selectAllNotice.action',
                                type:'post',
                                data:{
                                    'currency_string7':currentKey,
                                    'currency_type':43
                                },
                                dataType:'JSON',
                                success:function(res){
                                    var html = '<li value="" class="list-this">请选择历史通知任务书</li>';
                                    $.each(res.data,function(index,item){
                                        html += '<li value="'+item.currency_id+'" data-source="'+item.currency_int3//下发来源
                                            +'" data-taskDefinition="'+item.currency_string11//任务内容
                                            +'" data-code="'+item.currency_string7//报表编码
                                            +'" data-number="'+item.currency_string18//合同编号
                                            +'" data-department="'+item.currency_string10//委托单位
                                            +'" >报表编码：'+item.currency_string7
                                            +'；委托单位:'+item.currency_string10+'；任务内容：'+item.currency_string11+'；申请时间：'+Format0(item.currency_date,"yyyy-MM-dd HH:mm:ss")
                                            +'</li>';
                                    });
                                    $demo.find('.list-container>ul').html(html);
                                    $demo.find('.list-container').css('display','block');
                                    //给合同编号下拉列表框绑定隐藏事件
                                    hideListContainer_code('tdCode');
                                }
                            });
                        }
                    });
                    //过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
                    //给下拉列表框绑定点击事件
                    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                        var value = $(this).val();//number类型
                        var text = $(this).text();
                        var taskDefinition = $(this).attr('data-taskDefinition');//任务内容
                        var source = $(this).attr('data-source');//下发来源
                        var code = $(this).attr('data-code');//报表编码
                        var department = $(this).attr('data-department');//委托单位
                        var number = $(this).attr('data-number');//合同编码
                        $("#task_definition").val(taskDefinition);//任务内容
                        $('#code').val(code);//报表编码
                        $('#client_department').val(department);//委托单位
                        $('#source').val(source);//下发来源
                        //下发来源添加事件
                            if(source == 1){//默认信泽
                                //$("#contract_tr1").removeAttr("class");
                                $(".contract_tr").show();
                                //$("#contract_tr2").removeAttr("class");
                                $("#contract_id").attr("lay-verify","required");
                                $('#contract').show();
                                //form.render('select');
                                $('#contract_id').val(number);//合同编码

                                //查询合同
                                $.ajax({
                                    url:'System/selectAllContract.action',
                                    type:'post',
                                    data:{'cName':number},
                                    dataType:'JSON',
                                    success:function(res){
                                        var contractAmount = (res.data)[0].dblTotalCurrency;//合同金额
                                        var strContractOrderDate = (res.data)[0].strContractOrderDate;//合同签订日期
                                    	var contractName = (res.data)[0].strContractName;//合同名称

                                        $('#contract_date').val(strContractOrderDate);//合同日期
                                        $('#contract_name').val(contractName);//合同名称

                                        //查询合同收款计划
                                        $.ajax({
                                            url:'System/selectXZReceivables.action',
                                            type:'post',
                                            data:{'strContractID':number},
                                            dataType:'JSON',
                                            success:function(result){
                                                var acceptAmount = 0;
                                                $.each(result.data,function(index,item){
                                                    acceptAmount += Number(item.dblPayCurrency);
                                                });
                                                $("#contract_amount").val(contractAmount);//合同金额
                                                $('#actual_receipt').val(acceptAmount);//已收金额
                                                $('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额


                                            }
                                        });

                                        //重置合同条款
                                        $('.contract-details').remove();
                                        //查询合同条款
                                        $.ajax({
                                            url:'System/selectXZContractAll.action',
                                            type:'post',
                                            data:{'strContractID':strContractID},
                                            dataType:'JSON',
                                            success:function(res){
                                                var value = '';//手机端
                                                $.each(res.data,function(index,item){
                                                    //电脑端
                                                    var html = '<tr class="contract-details">'
                                                        + 	'<td colspan='+c1+'><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
                                                        +	'<td colspan='+c2+'><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
                                                        + '</tr>';
                                                    $('.contract').after(html);
                                                    $('#contract_str_name').val(item.strName);
                                                    $('#contract_str_memo').val(item.strMemo);
                                                    callback();//回调函数//inputRender();//input框自定义渲染
                                                    //手机端
                                                    value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
                                                });
                                                //手机端
                                                $('textarea[name="contract"]').val(value);

                                            }
                                        });
                                    }
                                });
                            }else{
                                $(".contract_tr").hide();
                                //$("#contract_tr1").attr("class","layui-hide");
                                //$("#contract_tr2").removeAttr("class");
                                $("#contract_id").attr("lay-verify","");
                                $('#contract').hide();
                                //$("#contract_id").val("");
                                //$("#contract_id").attr("title","");
                                //$("#client_department").val("");
                                //currentContractId = '';//合同编号重置为空
                                //form.render('select');//select是固定写法 不是选择器

                            }
                        form.render();
                        //重置下拉列表框
                        $(this).parent().empty();
                        $demo.find('.list-container').css('display','none');
                        currentContractId = code;
                    });
                }
				//给合同编号下拉列表框绑定隐藏事件
                function hideListContainer_code(Id){
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
                        $('#'+Id+' input').val(currentContractId);
                    });
                }
			});
		</script> 
	</body>
</html>
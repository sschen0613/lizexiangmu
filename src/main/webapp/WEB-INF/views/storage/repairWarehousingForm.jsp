<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 条码录入申请表 -->
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
		<form class="layui-form form-open" action="Storage/insert.action">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=6 class="table-h">条码录入申请表</th>
				</tr>
				<tr>
					<th colspan=6 style="text-align:right">单据编号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>录入人</td>
		 			<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
		 			<td>录入日期</td>
		 			<td><input type="text" name="currency_date" id="date" readonly></td>
		 			<td>录入类型</td>
		 			<td>
						<select name="outgoing_type" id="outgoing_type" lay-filter="outgoing_type" lay-search lay-verify="required">
							<option value="">请选择录入类型</option>
							<option value="配件入库">配件入库</option>
							<option value="配件出库">配件出库</option>
							<option value="维修入库">维修入库</option>
							<option value="维修出库">维修出库</option>
							<option value="质保入库">质保入库</option>
							<option value="质保出库">质保出库</option>
							<option value="入库">入库</option>
							<option value="出库">出库</option>
						</select>
					</td>
				</tr>
				<tr name="out" class="layui-hide">
					<td>单据日期</td>
					<td>
						<input name="outOrderDate" id="outOrderDate" type="text" class="layui-input input-revise date-revise" placeholder="请选择日期">
					</td>
					<td>单据</td>
					<td colspan="3"><select name="outOrder" id="outOrder" lay-filter="outOrder" data-cknumber="" lay-search></select></td>
				</tr>
				<tr name="out" class="layui-hide">
					<td>配件名称</td>
					<td colspan="5"><select name="product_name1" id="product_name1" lay-filter="product_name1" lay-search ></select></td>
				</tr>
				<tr name="no">
					<td>配件名称</td>
					<td colspan="5" class="container">
						<input id='product_name' name="product_name" class="search-box" placeholder="输入关键字查询">
						<div class="list-container" style="display:none;">
							<ul></ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>货品编码</td>
					<td><input type="text" name="inventory_id" id="inventory_id" readonly></td>
					<td>数量</td>
					<td><input type="text" id="buy_quantity" name="buy_quantity" value="1" lay-verify="required"></td>
					<td>备注</td>
					<td><input type="text" name="remark"></td>
				</tr>
				<tr>
					<th colspan=6 style="text-align:center;">条码信息</th>
				</tr>
				<tr>
					<td colspan=5>条码</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td colspan="5"><input type="text" id="barcode1" name="barcode" lay-verify="required"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=6 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加条码信息"></span></td>
		 		</tr>
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

                laydate.render({
                    elem: '#outOrderDate' //指定元素
                    ,done: function(value, date){
                        console.log(value); //得到日期生成的值
						console.log(date);
                        var flag = $('#outgoing_type').find('option:selected').text();//查询相应的类型
                        $.ajax({
                            url:'System/selectOutOrder.action',
                            type:'post',
							data:{"outOrderDate":value,"flag":flag},
                            dataType:'JSON',
                            success:function(res){
                                var html = '<option value="">请选择单据</option>';
                                $.each(res.data,function(index,item){
                                    if ("配件入库" ==  flag) {
                                        html += '<option data-cVenName="'+item.供应商+'" data-cWhName="'+item.仓库+'" value="'+item.入库单号+'">'
                                            +'入库单号：'+item.入库单号+';仓库:'+item.仓库+';供应商:'+item.供应商+';</option>';
									}else{
                                        html += '<option data-cCusName="'+item.客户+'" data-cWhName="'+item.仓库+'" value="'+item.出库单号+'">'
                                            +'出库单号：'+item.出库单号+';仓库:'+item.仓库+';客户:'+item.客户+';</option>';
									}

                                });
                                $('#outOrder').html(html);
                                form.render('select');
                            }
                        });
                    }
                });

                //业务来源添加事件
                form.on('select(outOrder)', function(data){
                    var flag = $('#outgoing_type').find('option:selected').text();//查询相应的类型
					var cCode = data.value;
                    $.ajax({
                        url:'System/selectOutInv.action',
                        type:'post',
                        data:{"cCode":cCode,"flag":flag},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<option value="">请选择配件</option>';
                            $.each(res.data,function(index,item){
								html += '<option data-cInvCode="'+item.配件编码+'" data-cInvName="'+item.配件名称+'" value="'+item.配件数量+'">'
									+'配件编码：'+item.配件编码+';配件名称:'+item.配件名称+';配件数量:'+item.配件数量+';</option>';
                            });
                            $('#product_name1').html(html);
                            form.render('select');
                        }
                    });
                });
                //业务来源添加事件
                form.on('select(product_name1)', function(data){
                    var cInvCode =  $("#product_name1").find('option:selected').attr('data-cInvCode');			//配件编码
                    //var cInvName =  $("#product_name1").find('option:selected').attr('data-cInvName');			//配件名称
					var iQuantity = data.value;																	//配件数量
                    $("#buy_quantity").val(iQuantity);
                    //$("#product_name").val(cInvName);
                    $("#inventory_id").val(cInvCode);
                });
                //业务来源添加事件
                form.on('select(outgoing_type)', function(data){
                    $("#outOrderDate").val("");//清空日期
                    var html1 = '<option value="">请选择单据</option>';
                    var html2 = '<option value="">请选择配件</option>';
					$("#outOrder").html(html1);//清空单据
                    $("#product_name1").html(html2);//清空配件名称

                    $("#product_name").val("");//清空配件名称

                    $("#inventory_id").val("");//清空货品编码
                    $("#buy_quantity").val(1);//数量重置为1

                    if(data.value == '配件出库' || data.value == '配件入库'){
                        //currentContractId = '';
                        $("tr[name='out']").removeAttr("class");
                        $("tr[name='no']").attr("class","layui-hide");

                    }else{
                        $("tr[name='out']").attr("class","layui-hide");
                        $("tr[name='no']").removeAttr("class");

                        //$("#contract_number").attr("lay-verify","");
                        //$("#contract_number").val("");
                        //$("#contract_number").attr("title","");
                        //$("#client_department").val("");
                    }
                    form.render('select');
                });
                searchProcess($('.container')); //每一行绑定即时搜索框
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){

                    layer.confirm('是否确认提交', function(index){
                        var outgoing_type = data.field.outgoing_type;										//出库类型
                        var vendor = "无";
                        var cWhName = "无";
                        var product_name = "";
                        if (outgoing_type == "配件入库") {
                            vendor = $("#outOrder").find('option:selected').attr('data-cVenName');
                            cWhName =  $("#outOrder").find('option:selected').attr('data-cWhName');		//仓库名称
                            product_name = $('#product_name1').find('option:selected').attr('data-cInvName');//配件名称
                        }else if (outgoing_type == "配件入库") {
                            vendor = $("#outOrder").find('option:selected').attr('data-cCusName');
                            cWhName =  $("#outOrder").find('option:selected').attr('data-cWhName');		//仓库名称
                            product_name = $('#product_name1').find('option:selected').attr('data-cInvName');//配件名称
                        }else{
                            product_name = data.field.product_name;									//配件名称
                        }
                        var inventory_id = data.field.inventory_id;											//配件编码
                        var buy_quantity = data.field.buy_quantity;											//配件数量
                        var remark = data.field.remark;														//备注

                        //仓库编码
                        var currencyDetails = [];
                        $.each($('.details'),function(index,item){
                            var barcode = $(item).find('input[name="barcode"]').val();							//条码
                            var obj = {'details_string11':barcode};
                            currencyDetails.push(obj);
                        });

                        $.ajax({
                            url : "Currency/addBarcode.action"
                            ,type : "post"
                            ,data : {
                                "currency_string6":vendor
                                ,"currency_string7":outgoing_type
                                ,'currency_string8':cWhName
                                ,"currency_string10":product_name
                                ,"currency_string11":inventory_id
                                ,"currency_string12":buy_quantity
                                ,"currency_string15":remark
                                ,"currencyDetails":JSON.stringify(currencyDetails)}
                            ,dataType : "JSON"
                            ,beforeSend: function(){
                                layer.msg('正在提交申请', {
                                    icon: 16
                                    ,shade: 0.01
                                });
                            }
                            ,success : function(result){
                                layer.msg("提交成功");
                                window.location.reload();
                            }
                        });
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
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                var areaid = "${sessionScope.systemStaff.staff_Address }";
				setApplyMessage(staffName,departmentId);
				//过程四:区域 - 客户名称 - 设备名称 - 设备其他信息+检测项目 - 检测项目其他信息
				// 过程四第一级 - 获取登陆人区域
				var staff_id="${sessionScope.systemStaff.staff_Id}"; //获取当前登录用户id
        		//过程二初始化
        		// 一:获取仓库
    			/*$.ajax({
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
    			});*/
				//操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
                    var sum = Number($('#buy_quantity').val());
                    var sumTr = $('table.table-open>tbody').find(".details").length;
                    if(sum == sumTr) {
                        layer.msg("已经录入"+sum+"条条码");
                        return false;
                    }
					d_count++;
					var html = '<tr class="details">'
						+ '<td colspan="5"><input type="text" id="barcode' + d_count + '" name="barcode" lay-verify="required"></td>'
						+ '<td class="delete' + d_count + '"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
						+ '</tr>';
					$('table.table-open>tbody').append(html);
					//渲染
					detailsRender(d_count); //明细信息每行自定义渲染事件
					inputRender();//input框自定义渲染

				});

                function changeBarcode($demo){
                    $demo.bind("input propertychange",function(e){

                        var outgoing_type = $("#outgoing_type").find('option:selected').val();//条码录入类型
                        var barcode = $demo.val();

                        if (barcode.length == 13){

						$.ajax({
							url : "Currency/getBarcodeCount.action"
							,type : "post"
							,data : {"barcode":barcode}
							,dataType : "JSON"
							,success : function(result){
								if (result.data > 0){//系统中有记录
                                    if (outgoing_type == "配件入库" || outgoing_type == "入库") {//查询系统中是否存在此条码
                                        layer.msg("系统中已有该条码："+barcode+"，请重新扫描");
                                        $demo.val('');
                                        return false;
                                    }
								}else {//系统中无记录
                                    if (outgoing_type != "配件入库" && outgoing_type != "入库") {//查询系统中是否存在此条码
                                        layer.msg("系统中无该条码："+barcode+"，请重新扫描");
                                        $demo.val('');
                                        return false;
                                    }
                                }
							}
						});


                            var sum = Number($('#buy_quantity').val());//需要输入的条码数量
                            var sumTr = $('table.table-open>tbody').find(".details").length;//已经输入的条码数量

							var i = 0;
                            $.each($('.details'),function(index,item){
                                var b = $(item).find('input[name="barcode"]').val();							//条码
                                if (b == barcode){
                                    i++;
                                }
                            });

							if (i == 2){
								layer.msg("所扫条码重复，请重新扫描");
								$demo.val('');
								console.log("条码重复后重置值"+$demo.val());
								return false;
							}


                            if(sum > sumTr){
                                d_count++;
                                var html = '<tr class="details">'
                                    +	'<td colspan="5"><input type="text" id="barcode'+d_count+'" name="barcode" lay-verify="required"></td>'
                                    +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                    +	'</tr>';
                                $('table.table-open>tbody').append(html);
                                //渲染
                                detailsRender(d_count); //明细信息每行自定义渲染事件
                                inputRender();//input框自定义渲染
                            }else {
                                layer.msg("已经录入"+sum+"条条码");
                                return false;
							}
						}else {
                            return false;
						}

                    });
                }

				//明细信息每行自定义渲染事件
				function detailsRender(index){
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					changeBarcode($('#barcode'+index));
					focusBarcode($('#barcode'+index));
				    //inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
                function focusBarcode($demo){
				    $demo.focus();
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
				//过程二 - 自定义带搜索的下拉列表,根据商品设置其它项内容
        		function searchProcess($demo){
        			//processProduct1($demo);

                    // 过程二第一级 - 获取商品名称(附带其它内容)
                    //即时监听搜索框,形成商品列表下拉列表框
                    $demo.find('.search-box').bind("input propertychange",function(event){
                        var currentKey = $(event.target).val();//搜索框值
                        if(currentKey == ''){
                            $demo.find('.list-container>ul').html('');
                            $demo.find('.list-container').css('display','none');
                        }else{
                            $.ajax({
                                url:'System/selectInvName1.action',
                                type:'post',
                                data:{'cInvName':currentKey},
                                dataType:'JSON',
                                success:function(res){
                                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                                    $.each(res.data,function(index,item){
                                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'">'
                                            +item.存货名称+'</li>';
                                    });
                                    $demo.find('.list-container>ul').html(html);
                                    $demo.find('.list-container').css('display','block');
                                    //给下拉列表框绑定隐藏事件
                                    //hideListContainer($demo.attr('id'));
                                }
                            });
                        }
                    });
                    //过程二第二级 - 选择商品名称,根据商品名称设置其它内容
                    //给下拉列表框绑定点击事件
                    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                        var value = $(this).val();//number类型
                        var text = $(this).text();

                        $('input[name="product_name"]').val($(this).attr('data-name'));
                        $('input[name="inventory_id"]').val($(this).attr('data-id'));

                        //重置下拉列表框
                        //$(this).parent().empty();
                        $demo.find('.list-container').css('display','none');
                    });
        		}

			});
		</script> 
	</body>
</html>
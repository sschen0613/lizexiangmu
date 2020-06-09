<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 信泽材料出库申请表编辑 -->
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
					<th colspan=8 class="table-h">信泽材料出库申请表</th>
				</tr>
				<tr>
					<th colspan=8 style="text-align:right">请购单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请部门</td>
					<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请人</td>
					<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
					<td>申请日期</td>
					<td colspan=2><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>仓库</td>
					<td colspan=7><select name="cangku" id="cangku" lay-filter="cangku" data-cknumber="" lay-search lay-verify="required"></select></td>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan=7><input type="text" name="apply_reason"></td>
				</tr>
				<tr>
					<td>存货编码</td>
					<td>商品名称</td>
					<td>规格型号</td>
					<td>单位</td>
					<td>数量</td>
					<td>库存数量</td>
					<td>备注</td>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="inventory_id" readonly></td>
					<td id="container1" class="container container1">
						<input id='product_name' name="product_name" class="search-box" placeholder="输入关键字查询" lay-verify="required">
						<div class="list-container" style="display:none;">
		                	<ul></ul>
		            	</div>
					</td>
					<td><input type="text" name="specifications_models" readonly></td>
					<td><input type="text" name="unit" readonly></td>
					<td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
					<td><input type="text" name="inventory_quantity" readonly></td>
					<td><input type="text" name="remark"></td>
					<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
				</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=8 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		 		</tr>
	 			<tr>
	 				<th colspan=8></th>
				</tr>
		 	</thead>
		</table>
		<div class="form-notes">
			<i class="layui-icon layui-icon-about"> 添加商品前请先确定仓库</i>
		</div>
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
				});
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var buy_number = data.field.buy_number;
					var cWhName = data.field.cangku;
					var apply_reason = data.field.apply_reason;
					
					var currentDetails = [];
					$.each($('.details'),function(index,item){
						var inventory_id = $(item).find('input[name="inventory_id"]').val();
						var product_name = $(item).find('input[name="product_name"]').val();
						var specifications_models = $(item).find('input[name="specifications_models"]').val();
						var unit = $(item).find('input[name="unit"]').val();
						var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());
						var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val());
						var remark = $(item).find('input[name="remark"]').val();

						var obj = {'details_string4':inventory_id,'details_string5':product_name,'details_string6':specifications_models
								,'details_string7':unit,'details_money':buy_quantity,'inventory_quantity':inventory_quantity,'remark':remark};
						currentDetails.push(obj);
					});

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {'currency_number':buy_number ,"currency_type":11,"currency_string7":apply_reason
                                ,'currency_string8':cWhName, "currencyDetails":JSON.stringify(currentDetails)}
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
                //过程二初始化
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
        		//二:选择仓库,之后就可以选择商品
        		// currentCangkuId //当前选中仓库的id
        		form.on('select(cangku)',function(data){
        			//保存当前选中仓库的id
        			currentCangkuId = data.value;//string类型
        			//明细信息重置
            		$($('.details')[0]).siblings('.details').remove();
					$('.details').find('input').val('');
					//当前明细信息每一行的商品名称input框值重置 
					currentProductValues = [];
        		});

                //操作
                //点击添加明细按钮
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
				 			 +	'<td><input type="text" name="inventory_id" readonly></td>'
				 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
							 +		'<input id="product_name" name="product_name" class="search-box" placeholder="输入关键字查询" lay-verify="required">'
							 +		'<div class="list-container" style="display:none;">'
				             +   		'<ul></ul>'
				             +		'</div>'
							 +	'</td>'
				 			 +	'<td><input type="text" name="specifications_models" readonly></td>'
				 			 +	'<td><input type="text" name="unit" readonly></td>'
				 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
				 			 +	'<td><input type="text" name="inventory_quantity" readonly></td>'
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
					deleteItem($('.delete'+index));  //每一行绑定行删除事件
					searchProcess($('.container'+index)); //每一行绑定即时搜索框
				    inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
				}
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
        			processProductByCangkuId($demo);
				}
				
        		//表单数据初始化填写
                var currency_id0 = '${param.currency_id}';	//number类型
                var currency_type0 = Number('${param.currency_type}'); //string类型
				$.ajax({
                    url:'Currency/selectCurrencyApply.action',
                    type:'post',
                    data:{"currency_id":currency_id0},
                    dataType:'JSON',
                    success:function(res){
                    	//表单赋值操作
                        $('input[name="buy_number"]').val(res.data.currency_id);//请购单号
                        //获取申请人/申请部门
        				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
        				$("#staffName").val(staffName);//申请人
        				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
        				//根据id查询部门
        				$.ajax({
        					url : "Department/selectDingDepartmentId.action",
        					type : "post",
        					data : {"id": departmentId},
        					dataType : "JSON",
        					success : function(res){
        						var departmentName = '无记录';
        						if(res.data != null) departmentName = res.data.department_Name;
        						$("#department").val(departmentName);//申请部门
        					}
        				});
                        $('input[name="currency_date"]').val(Format(res.data.currency_date,"yyyy-MM-dd"));//申请日期
                        //获取明细信息
						$.ajax({
							url:'Currency/selectCurrencyDetails.action',
							type:'post',
							data:{"currency_id":currency_id0},
                            dataType:'JSON',
							success:function (res) {
								$('.details').remove();
								$.each(res.data,function(index,item){
									d_count++;
									var html = '<tr class="details">'
							 			 +	'<td><input type="text" name="inventory_id" value="'+item.details_string4+'" readonly></td>'
							 			 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
										 +		'<input id="product_name" name="product_name" value="'+item.details_string5+'" class="search-box" placeholder="输入关键字查询" lay-verify="required">'
										 +		'<div class="list-container" style="display:none;">'
							             +   		'<ul></ul>'
							             +		'</div>'
										 +	'</td>'
							 			 +	'<td><input type="text" name="specifications_models" value="'+item.details_string6+'" readonly></td>'
							 			 +	'<td><input type="text" name="unit" value="'+item.details_string7+'" readonly></td>'
							 			 +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" value="'+item.details_money+'" lay-verify="required"></td>'
							 			 +	'<td><input type="text" name="inventory_quantity" value="'+item.details_money2+'" readonly></td>'
							 			 +	'<td><input type="text" id="remark'+d_count+'" name="remark" value="'+item.details_string11+'"></td>'
							 			 +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
							 			 +	'</tr>';
									$('table.table-open>tbody').append(html);
									//渲染
									detailsRender(d_count); //明细信息每行自定义渲染事件
									inputRender();//input框自定义渲染
									//判断是否禁止修改
									if(flag0 == 0){
										$('#container'+d_count).find('#product_name').attr('readonly','readonly');//商品名称禁止修改
										$('#buy_quantity'+d_count).attr('readonly','readonly');//数量禁止修改
										$('#remark'+d_count).attr('readonly','readonly');//备注禁止修改
									}
									//保存明细信息当前行的商品名称input框值
									currentProductValues[d_count] = item.details_string5;
								});
                            }
                        });
						$('input[name="apply_reason"]').val(res.data.currency_string7);//申请事由
            			var cangkuId = res.data.currency_string8; //仓库编号
            			currentCangkuId = cangkuId;
                        //过程二第一级 - 获取仓库
                        $.ajax({
            				url:'System/selectCangKu.action',
            				type:'post',
            				dataType:'JSON',
            				success:function(res){
            	 				var html = '<option value="">请选择仓库</option>';
            					$.each(res.data,function(index,item){
            						html += '<option value="'+item.cWhCode+'" ';
            						if(item.cWhCode == cangkuId){html += 'selected';}
            						html += '>'+item.cWhName+'</option>';
            					});
            					$('#cangku').html(html); 
            					form.render('select');
            				}
            			});
                        
                        //判断是否可以修改表单内容
                        var flag0 = 1;//可以修改
                        if(res.msg!=null){//禁止修改
                        	flag0 = 0;//不可以修改
                        	layer.msg(res.msg);
                            //禁用提交按钮
                            $('.button-div button').addClass('layui-btn-disabled');
                            $('.button-div button').attr('disabled','disabled');
                            //禁止修改内容
                            $('input[name="apply_reason"]').attr('disabled','disabled');//申请事由
                            $('select').attr('disabled','disabled');//下拉列表框禁止修改
                            //禁用添加按钮
                            $(".addDetails").unbind("click");
                       }
                    }
				});

			});
		</script> 
	</body>
</html>
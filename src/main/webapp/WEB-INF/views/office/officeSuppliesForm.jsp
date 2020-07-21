<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 办公用品申请单 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
		<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
		<script src="layui/layui.js"></script>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
		<script src="js/form_init.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
		<h2 class="h-open"></h2>
		<form class="layui-form form-open" action="">
		<table class="layui-table table-open">
			<thead>
				<tr>
					<th colspan=6 class="table-h">办公用品领取申请单</th>
				</tr>
				<tr>
					<th colspan=6 style="text-align:right">申请单号：<input type="text" id="buy_number" name="buy_number" readonly> </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>申请部门</td>
					<td><input type="text" name="department_Id" id="department" readonly></td>
					<td>申请人</td>
					<td><input type="text" name="currency_applicant" id="staffName" readonly></td>
					<td>申请日期</td>
					<td><input type="text" name="currency_date" id="date" readonly></td>
				</tr>
				<tr>
					<td>申请事由</td>
					<td colspan=5><input type="text" name="currency_string7"></td>
				</tr>
				<tr>
					<th colspan=6 style="text-align:center;">明细信息</th>
				</tr>
				<tr>
					<td>ID</td>
					<td>编码</td>
					<td>物品名称</td>
					<%--<td>规格型号</td>--%>
					<td>单位</td>
					<td>数量</td>
					<td style="display: none">单价</td>
					<%--<td>预计价格</td>--%>
					<td>操作</td>
				</tr>
				<tr class="details">
					<td><input type="text" name="id" readonly></td>
					<td><input type="text" name="code" readonly></td>
		 			<td id="container1" class="container container1">
						<input id='name' name="name" class="search-box" placeholder="输入关键字查询" type="text">
						<div class="list-container" style="display:none;">
		                	<ul></ul>
		            	</div>
					</td>
		 			<%--<td><input type="text" name="specifications_models"></td>--%>
		 			<td><input type="text" name="unit" readonly></td>
		 			<td><input type="text" id="amount1" name="amount"></td>
		 			<td style="display: none"><input type="text" name="price"></td>
		 			<%--<td><input type="text" name="anticipated_price"></td>--%>
		 			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		 		</tr>
			</tbody>
		 	<thead>
		 		<tr>
		 			<td colspan=6 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
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
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date2' //指定元素
				});
				detailsRender(1); //明细信息每行自定义渲染事件
				inputRender();//input框自定义渲染
				
				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var currency_string7 = data.field.currency_string7;
					var currency_type = 71;//71是当前审批请求的类型,审批管理主键id;
					var details = $('.details');
					var currencyDetails = [];
					var money = 0;
					$.each(details,function(index,item){
						var details_int = $(item).find('input[name="id"]').val();
						var details_string4 = $(item).find('input[name="code"]').val();
						var details_string5 = $(item).find('input[name="name"]').val();
						//var details_string6 = $(item).find('input[name="specifications_models"]').val();
						var details_string7 = $(item).find('input[name="unit"]').val();
						var details_money = Number($(item).find('input[name="amount"]').val());
						var details_money2 = Number($(item).find('input[name="price"]').val());
						var details_money3 = details_money2*details_money;
						money += details_money3;
						
						var obj = {'details_int':details_int,'details_string4':details_string4,'details_string5':details_string5,
							'details_string7':details_string7,'details_money':details_money,'details_money2':details_money2,'details_money3':details_money3};
						currencyDetails.push(obj);
					});
					
				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {currency_string7:currency_string7,"currency_type":currency_type,"currency_money":money,"currencyDetails" : JSON.stringify(currencyDetails)}
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
				setBuyNumber();
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);
				
				//添加明细按钮点击事件
				var d_count = 1;
				$('.addDetails').click(function(){
					d_count++;
					var html = '<tr class="details">'
							+	'<td><input type="text" name="id" readonly></td>'
							+	'<td><input type="text" name="code" readonly></td>'
							 +	'<td id="container'+d_count+'" class="container container'+d_count+'">'
							 +		'<input id="name" name="name" class="search-box" placeholder="输入关键字查询" type="text">'
							 +		'<div class="list-container" style="display:none;">'
				             +   		'<ul></ul>'
				             +		'</div>'
							 +	'</td>'
				 			 //+	'<td><input type="text" name="specifications_models"></td>'
				 			 +	'<td><input type="text" name="unit" readonly></td>'
				 			 +	'<td><input type="text" id="amount'+d_count+'" name="amount"></td>'
				 			 +	'<td style="display: none"><input type="text" name="price"></td>'
				 			 /*+	'<td><input type="text" name="anticipated_price"></td>'*/
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
				    inputLimitNumber($('#amount'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
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
					// 过程二第一级 - 获取商品名称(附带其它内容)
					//即时监听搜索框,形成商品列表下拉列表框
					$demo.find('.search-box').bind("input propertychange",function(event){
						var currentKey = $(event.target).val();//搜索框值
						if(currentKey == ''){
							$demo.find('.list-container>ul').html('');
							$demo.find('.list-container').css('display','none');
						}else{
							$.ajax({
								url:'office/selectOfficeSuppliesList.action',
								type:'post',
								data:{'limit':10000,'page':1,'name':currentKey},
								dataType:'JSON',
								success:function(res){
									var html = '<li value="" class="list-this">请选择办公用品名称</li>';
									$.each(res.data,function(index,item){
										//当属性值不存在时
										var id = item.id;
										var code = item.code;//名字
										if(code == undefined) code = '无';
										var name = item.name;//名字
										if(name == undefined) name = '无';
										var unit = item.unit;//单位
										if(unit == undefined) unit = '无';
										var price = item.price; //价格
										if(price == undefined) price = 0;

										html += '<li value="'+id+'" data-id="'+id+'" data-code="'+code+'" data-name="'+name+'"data-unit="'+unit+'" data-price="'+price+'">' +name+'</li>';
										//将获取的所有信息保存到自定义属性中
									});
									$demo.find('.list-container>ul').html(html);
									$demo.find('.list-container').css('display','block');
									//给下拉列表框绑定隐藏事件
									hideListContainer($demo.attr('id'));
								}
							});
						}
					});
					//过程二第二级 - 选择商品名称,根据商品名称设置其它内容
					//给下拉列表框绑定点击事件
					$demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
						//判断明细信息中是否已存在相同项
						if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="id"]').val()) ) return;
						var value = $(this).val();//number类型
						var text = $(this).text();
						$(this).closest('.details').find('input[name="id"]').val($(this).attr('data-id')); //存货编码
						$(this).closest('.details').find('input[name="code"]').val($(this).attr('data-code')); //商品名称input标签
						$(this).closest('.details').find('input[name="name"]').val($(this).attr('data-name')); //商品名称input标签
						$(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
						$(this).closest('.details').find('input[name="price"]').val($(this).attr('data-price')); //单位
						//保存明细信息当前行的商品名称input框值
						var n = Number( $demo.attr('id').replace('container','') );
						currentProductValues[n] = $(this).closest('.details').find('input[name="name"]').val();
						//重置下拉列表框
						$(this).parent().empty();
						$demo.find('.list-container').css('display','none');
					});
				}

			});
		</script> 
	</body>
</html>
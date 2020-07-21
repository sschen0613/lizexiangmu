<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 办公用品申请-手机端 -->
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
				<h2 class="">办公用品领用申请</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'office/mOfficeSuppliesList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action=""   method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">申请单号 :</label>
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
						<label class="layui-form-label">申请日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_date" id="date" class="layui-input" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">申请事由 :</label>
						<div class="layui-input-block">
							<input type="text" name="currency_string7" class="layui-input">
						</div>
					</div>
					<!-- 明细信息 -->
					<div class="layui-btn layui-btn-normal layui-btn-xs addDetails"><i class="layui-icon layui-icon-add-1" title="点击添加明细信息"></i>点击添加明细信息</div>
					<div class="apply-detail-container">
						<div class="apply-detail">
							<div class="details-title details-title1">明细信息#1<span class="layui-icon layui-icon-up"></span></div>
							<div class="details">
							<div class="layui-form-item">
								<label class="layui-form-label">ID :</label>
								<div class="layui-input-block">
									<input type="text" name="id" class="layui-input" readonly>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">编码 :</label>
								<div class="layui-input-block">
									<input type="text" name="code" class="layui-input" readonly>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">名称 :</label>
								<div id="container1" class="layui-input-block container container1">
									<input id="name" name="name" class="layui-input search-box" placeholder="输入关键字查询" lay-verify="required">
									<div class="list-container" style="display:none;">
										<ul></ul>
									</div>
								</div>
							</div>
								<%--<div class="layui-form-item">
									<label class="layui-form-label">规格型号 :</label>
									<div class="layui-input-block">
										<input type="text" name="details_string2" class="layui-input">
									</div>
								</div>--%>
								<div class="layui-form-item">
									<label class="layui-form-label">单位 :</label>
									<div class="layui-input-block">
										<input type="text" name="unit" class="layui-input" readonly>
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">数量 :</label>
									<div class="layui-input-block">
										<input type="text" id="amount1" name="amount" class="layui-input">
									</div>
								</div>
								<div class="layui-form-item" style="display: none">
									<label class="layui-form-label">价格 :</label>
									<div class="layui-input-block">
										<input type="text" name="price" class="layui-input">
									</div>
								</div>
								<%--<div class="layui-form-item">
									<label class="layui-form-label">预计价格 :</label>
									<div class="layui-input-block">
										<input type="text" name="details_money3" class="layui-input">
									</div>
								</div>--%>
							</div>
							<div class="delete delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary" lay-filter="resetForm">重置</button>
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
				form.render('select');
				// form.render('checkbox');
				// form.render('redio');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
				});
				detailsRender(1); //明细信息第一行自定义渲染事件

                //监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
					var currency_string7 = data.field.currency_string7;
					var currency_type = 71;//1是当前审批请求的类型,审批管理主键id;
					var details = $('.details');
					var currencyDetails = [];
					var money = 0;

					$.each(details,function(index,item){

						var details_int = $(item).find('input[name="id"]').val();
						var details_string4 = $(item).find('input[name="code"]').val();
						var details_string5 = $(item).find('input[name="name"]').val();
						var details_string7 = $(item).find('input[name="unit"]').val();
						var details_money = Number($(item).find('input[name="amount"]').val());
						var details_money2 = Number($(item).find('input[name="price"]').val());
						var details_money3 = details_money2*details_money;

						money += details_money3;

						var obj = {'details_int':details_int,'details_string4':details_string4,'details_string5':details_string5,'details_string7':details_string7
							,'details_money':details_money,'details_money2':details_money2,'details_money3':details_money3};
						currencyDetails.push(obj);
					});

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {'currency_string7':currency_string7,"currency_money":money,"currency_type":currency_type,"currencyDetails" : JSON.stringify(currencyDetails)}
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
				//获取申请人/申请部门/申请日期
				var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
				var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
				setApplyMessage(staffName,departmentId);

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
                    +        '<label class="layui-form-label">ID :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="id" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
					  +      '<div class="layui-form-item">'
					  +        '<label class="layui-form-label">编码 :</label>'
					  +        '<div class="layui-input-block">'
					  +          '<input type="text" name="code" class="layui-input" readonly>'
					  +        '</div>'
					  +      '</div>'
					  +      '<div class="layui-form-item">'
					  +        '<label class="layui-form-label">名称 :</label>'
					  +        '<div id="container'+d_count+'" class="layui-input-block container container'+d_count+'">'
					  +          '<input id="name" name="name" class="layui-input search-box" placeholder="输入关键字查询" lay-verify="required">'
					  +          '<div class="list-container" style="display:none;">'
					  +            '<ul></ul>'
					  +          '</div>'
					  +        '</div>'
					  +      '</div>'
                    /*+      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">规格型号 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="details_string2" class="layui-input">'
                    +        '</div>'
                    +      '</div>'*/
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">单位 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="unit" class="layui-input" readonly>'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">数量 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" id="amount'+d_count+'" name="amount" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                    +      '<div class="layui-form-item" style="display:none;">'
                    +        '<label class="layui-form-label">价格 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="price" class="layui-input">'
                    +        '</div>'
                    +      '</div>'
                   /* +      '<div class="layui-form-item">'
                    +        '<label class="layui-form-label">预计价格 :</label>'
                    +        '<div class="layui-input-block">'
                    +          '<input type="text" name="details_money3" class="layui-input">'
                    +        '</div>'
                    +      '</div>'*/
                    +    '</div>'
                    +    '<div class="delete delete'+d_count+'">'
                    +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                    +    '</div>'
                    +  '</div>';
                  $('.apply-detail-container').append(html);
                  //渲染
                  detailsRender(d_count); //明细信息每行自定义渲染事件
                  //form.render();
                });
                //明细信息每行自定义渲染事件
                function detailsRender(index){
                	deleteItem($('.delete'+index)); //每一行绑定行删除事件
                	slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
                    searchProcess($('.container'+index)); //每一行绑定即时搜索框
                    inputLimitNumber($('#amount'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
                }
                //行删除事件
                function deleteItem($demo){
                	deleteDetailsItem3($demo);
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
										var code = item.code;//编码
										if(code == undefined) code = '无';
										var name = item.name;//名字
										if(name == undefined) name = '无';
										var unit = item.unit;//单位
										if(unit == undefined) unit = '无';
										var price = item.price; //价格
										if(price == undefined) price = 0;

										html += '<li value="'+id+'" data-id="'+id+'" data-code="'+code+'" data-name="'+name+'" data-unit="'+unit+'" data-price="'+price+'">'+name+'</li>';
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
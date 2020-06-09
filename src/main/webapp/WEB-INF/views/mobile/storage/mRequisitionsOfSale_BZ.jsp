<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--销售请购申请-手机端-滨州丽泽 -->
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
		<h2 class="">销售请购申请（滨州丽泽）</h2>
		<!-- <span class="">&emsp;</span>[&emsp;]: 1个中文宽度 -->
		<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'storage/mRequisitionsOfSaleList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
	</div>
	<div class="content">
		<div class="form-notes">
			<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号的顺序进行选择</i>
		</div>
		<form class="layui-form form-apply" action="" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">请购单号 :</label>
				<div class="layui-input-block">
					<input type="text" id="buy_number" name="buy_number" class="layui-input" readonly>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">说明 :</label>
				<div class="layui-input-block">
					<textarea name="illustration" id="illustration" placeholder="" class="layui-textarea" readonly></textarea>
					<!-- 							<input type="text" id="illustration" name="illustration" class="layui-input" value="用于丽泽公司销售合同（包含设备销售、配件销售）" readonly> -->
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
				<label class="layui-form-label">区域 :</label>
				<div class="layui-input-block">
					<select name="area" id="area" lay-filter="area" class="layui-select" lay-search lay-verify="required" disabled></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">客户名称 :</label>
				<div class="layui-input-block">
					<select name="customer_name" id="customer_name" lay-filter="customer_name" class="layui-select" lay-search lay-verify="required"></select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">合同编号 :</label>
				<div class="layui-input-block">
					<select name="contract_id" id="contract_id" lay-filter="contract_id" class="layui-select" lay-search lay-verify="required"></select>
				</div>
			</div>
			<!-- 					<div class="layui-form-item"> -->
			<!-- 						<label class="layui-form-label">发货类型 :</label> -->
			<!-- 						<div class="layui-input-block"> -->
			<!-- 							<input type="radio" name="delivery_type" value="1" title="直发企业" checked> -->
			<!-- 							<input type="radio" name="delivery_type" value="2" title="单位入库"> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<div class="layui-form-item">
				<label class="layui-form-label">期望到货日期 :</label>
				<div class="layui-input-block">
					<input type="text" name="expectedDelivery_date" id="date1" class="layui-input" placeholder="请选择时间" autocomplete="off" lay-verify="required">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">合同条款 :</label>
				<div class="layui-input-block">
					<textarea class="layui-textarea" name="contract" readonly></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">合同金额 :</label>
				<div class="layui-input-block">
					<input type="text" id="contract_amount" name="contract_amount" class="layui-input" readonly>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">已收金额 :</label>
				<div class="layui-input-block">
					<input type="text" id="actual_receipt" name="actual_receipt" class="layui-input" readonly>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">欠款金额 :</label>
				<div class="layui-input-block">
					<input type="text" id="outstanding_receipt" name="outstanding_receipt" class="layui-input" readonly>
				</div>
			</div>
			<!-- 明细信息 -->
			<div class="apply-detail-container">

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
        form.render('radio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        detailsRender(1); //明细信息第一行自定义渲染事件

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            $("#area").removeAttr("disabled");
            var buy_number = data.field.buy_number;											//请购单号
            var illustration = data.field.illustration;										//说明
            var area_id = data.field.area;													//区域编号
            var area_name = $('#area').find('option:selected').text();						//区域名称
            var customer_id = data.field.customer_name;										//客户编号
            var customer_name = $('#customer_name').find('option:selected').text();			//客户名称
            var contract_id = data.field.contract_id;										//合同编号
            var contract_name = $('#contract_id').find('option:selected').attr('data-name'); //合同名称
            //var delivery_type = data.field.delivery_type;									//发货类型
            var expectedDelivery_date = data.field.expectedDelivery_date;					//期望到货日期
            //var expectedArrival_date = data.field.expectedArrival_date;						//预计到货日期
            //var confirm_inventory = data.field.confirm_inventory;							//物资部库管员确认入库
            //合同付款约定
            var contract_amount = Number(data.field.contract_amount);						//合同总额
            var actual_receipt = Number(data.field.actual_receipt);							//实际已收款
            var outstanding_receipt = Number(data.field.outstanding_receipt);				//未收金额

            var currency_type = 9;
            var price = 0, flag = 1, currentDetails = [];
            $.each($('.details'),function(index,item){
                var number = $(item).find('input[name="number"]').val();				//序号
                var inventory_id = $(item).find('input[name="inventory_id"]').val();	//存货编码
                var product_name = $(item).find('input[name="product_name"]').val();	//商品名称
                var specifications_models = $(item).find('input[name="specifications_models"]').val(); //规格型号
                var unit = $(item).find('input[name="unit"]').val(); 		//单位
                var contract_quantity = Number($(item).find('input[name="contract_quantity"]').val()); //合同数量
                var buy_quantity = Number($(item).find('input[name="buy_quantity"]').val());	//请购数量
                var inventory_quantity = Number($(item).find('input[name="inventory_quantity"]').val()); //库存数量
                var recent_price = Number($(item).find('input[name="recent_price"]').val()); //最近日期商品价格

                price += buy_quantity * recent_price ;
                //价格判断是否符合要求
				/*if(recent_price > contract_price){
				 flag = 0; //价格大于合同条款规定价格
				 return;
				 }*/
                var obj = {
                    'details_string': number
                    , 'details_string4': inventory_id
                    , 'details_string5': product_name
                    , 'details_string6': specifications_models
                    , 'details_string7': unit
                    , 'details_money2': contract_quantity
                    , 'details_money': buy_quantity
                    , 'details_money3': inventory_quantity
                    , 'details_date2': expectedDelivery_date
                    , 'details_string8': recent_price
                }
                currentDetails.push(obj);
            });

            //价格判断不符合要求,表单不提交
			/*if(flag == 0){
			 layer.msg('商品单价大于合同条款规定价格('+contract_price+'元)');
			 return false;
			 }*/
            //表单提交
            $.ajax({
                url : "Currency/launchCurrencyApply.action"
                ,type : "post"
                ,data : {
                    "currency_number":buy_number
                    ,"currency_string":illustration
                    ,"currency_int":area_id
                    ,"currency_string2":area_name
                    ,"currency_string4":customer_id
                    //,"currency_string3":customer_name
                    ,"currency_string7":customer_name
                    ,"currency_string3":contract_id
                    //,"currency_string4":contract_name
                    ,"currency_date":currencyDate
                    //,"currency_int4":delivery_type //发货类型
                    ,"currency_date2":expectedDelivery_date
                    //,"currency_date3":expectedArrival_date
                    //,"currency_int2":confirm_inventory//物资部库管员确认入库
                    ,"currency_money":contract_amount//合同总额
                    ,"currency_money2":actual_receipt
                    ,"currency_money3":outstanding_receipt
                    ,"currency_type":currency_type
                    ,"currency_money6":price
                    ,'currency_string5':cCusPPerson
                    ,'currency_string11':cCusDepart
                    ,'currencyDetails':JSON.stringify(currentDetails)}
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
        var areaid = "${sessionScope.systemStaff.staff_Address }";
        setApplyMessage(staffName,departmentId);
        //说明
        $('#illustration').val('用于丽泽公司销售合同（包含设备销售、配件销售）');
        //过程一:区域 - 客户名称 - 合同编号 - (合同金额+已收金额+欠款金额)+合同条款+运营设备 - 运营设备其它信息
        // 过程一第一级 - 获取所有区域
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
                $('#area').val(areaid);
                form.render('select');
            }
        });
        // 过程一第二级 - 根据区域获取客户名称(同时获取业务员编码)
        //form.on('select(area)', function(data){
        var cDCCode = areaid;
        $.ajax({
            url:'System/selectUser.action',
            type:'post',
            data:{"cDCCode": cDCCode},
            dataType:'JSON',
            success:function(res){
                var html = '<option value="">请选择客户名称</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'">'+item.cCusName+'</option>'
                });
                $('#customer_name').html(html);
                form.render('select');
            }
        });
        // 重置[客户名称]级下面的内容(销售合同编号 金额信息 合同条款 明细信息)
        $('#contract_id').siblings().remove();
        $('#contract_id').html('');
        $('#contract_amount').val('');
        $('#actual_receipt').val('');
        $('#outstanding_receipt').val('');
        $('textarea[name="contract"]').val('');
        $('.apply-detail-container').html('');
        form.render();
        //});
        // 过程一第三级 - 根据客户名称获取销售合同编号
        var cCusPPerson = '';//保存业务员编码
        var cCusDepart = '';//保存业务员部门
        form.on('select(customer_name)', function(data){
            var cCusCode = data.value;
            cCusPPerson = $(data.elem).find('option:selected').attr('data-cCusPPerson');
            cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
            $.ajax({
                url:'System/selectContract.action',
                type:'post',
                data:{"cCusCode": cCusCode,"strContractType":"01"},
                dataType:'JSON',
                success:function(res){
                    var html = '<option value="">请选择销售合同编号</option>';
                    $.each(res.data,function(index,item){
                        html += '<option data-money="'+item.dblTotalCurrency+'" value="'+item.strContractID+'">名称：'+item.strContractName
                            +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate+'</option>';
                    });
                    $('#contract_id').html(html);
                    form.render('select');
                }
            });
            //重置[合同编号]级下面的内容(金额信息 合同条款 明细信息)
            $('#contract_amount').val('');
            $('#actual_receipt').val('');
            $('#outstanding_receipt').val('');
            $('textarea[name="contract"]').val('');
            $('.apply-detail-container').html('');
            form.render();
        });
        // 过程一第四级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
        //获取存货编码 / 存货名称 /规格型号/单位/合同数量/库存数量
        var runproduct_name_html = ''; //运营设备下拉列表
        var contract_price = 0;	//合同条款带出的价格
        var contract_type = 2;	//设置合同类型
        form.on('select(contract_id)', function(data){
            //重置之前内容

            //明细信息重置
            $($('.details')[0]).siblings('.details').remove();
            $('.details').find('input:not(input[name="number"])').val('');
            form.render();
            //获取新内容
            var strContractID = data.value; //合同编号
            var contractAmount = Number($(data.elem).find("option:selected").attr('data-money'));
            $("#contract_amount").val(contractAmount); //合同金额
            //查询合同收款计划
            $.ajax({
                url:'System/selectReceivables.action',
                type:'post',
                data:{'strContractID':strContractID},
                dataType:'JSON',
                success:function(result){
                    var acceptAmount = 0;
                    $.each(result.data,function(index,item){
                        acceptAmount += Number(item.dblPayCurrency);
                    });
                    $('#actual_receipt').val(acceptAmount); //已收金额
                    $('#outstanding_receipt').val(contractAmount-acceptAmount); //欠款金额
                }
            });
            //重置合同条款带出的价格
            contract_price = 0;
            //查询合同条款
            $.ajax({
                url:'System/selectContractAll.action',
                type:'post',
                data:{'strContractID':strContractID},
                dataType:'JSON',
                success:function(res){
                    var value = '';
                    $.each(res.data,function(index,item){
                        contract_price = Math.max(item.cDefine26,contract_price); //number类型
                        value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
                    });
                    $('textarea[name="contract"]').val(value);
                }
            });
            //获取运营设备(附带运营设备编码和设备运营期间)
            $.ajax({
                url:'System/selectshebei.action',
                type:'post',
                data:{"strContractID": strContractID,'type':contract_type},
                dataType:'JSON',
                success:function(res){
                    $('.apply-detail-container').html('');
                    var count = 0;
                    $.each(res.data,function(index,item){
                        var models = item.规格;  if(models == undefined){models = '无';}
                        var fAvaQuantity = item.可用量;  if(fAvaQuantity == undefined){fAvaQuantity = 0;}
                        var recentPrice = 0;
                        //获取最近日期商品价格
                        $.ajax({
                            url:'System/selectCost.action',
                            type:'post',
                            data:{'cInvCode':item.商品编号},
                            dataType:'JSON',
                            success:function(res){
                                d_count++;count++;
                                if(res.data.length > 0) recentPrice = res.data[0].iUnitCost;
                                var html = ''
                                    +  '<div class="apply-detail">'
                                    +    '<div class="details-title details-title'+d_count+'">明细信息#'+count+'<span class="layui-icon layui-icon-up"></span></div>'
                                    +    '<div class="details">'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">存货编码 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="inventory_id" value="'+item.商品编号+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">商品名称 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="product_name" value="'+item.商品名称+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">规格型号 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="specifications_models" value="'+models+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">单位 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="unit" value="'+item.数量单位+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">合同数量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="contract_quantity" value="'+item.合同数量+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">请购数量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="buy_quantity" id="buy_quantity'+d_count+'" class="layui-input" lay-verify="required">'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">可用量 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="inventory_quantity" value="'+fAvaQuantity+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +      '<div class="layui-form-item">'
                                    +        '<label class="layui-form-label">最近日期商品价格 :</label>'
                                    +        '<div class="layui-input-block">'
                                    +          '<input type="text" name="recent_price" value="'+recentPrice+'" class="layui-input" readonly>'
                                    +        '</div>'
                                    +      '</div>'
                                    +    '</div>'
                                    +    '<div class="delete delete'+d_count+'">'
                                    +      '<button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button>'
                                    +    '</div>'
                                    +  '</div>';
                                $('.apply-detail-container').append(html);
                                //渲染
                                detailsRender(d_count); //明细信息每行自定义渲染事件
                            }
                        });
                    });
                }
            });
        });

        //操作
        var d_count = 1;
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            slideToggleDetailsItem($('.details-title'+index)); //每一行绑定滑动事件
            inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem3($demo);
        }

    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 设备、配件销售请购单 - 菏泽丽泽 -->
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
			<th colspan="10" class="table-h">设备、配件销售请购单（菏泽丽泽）</th>
		</tr>
		<tr>
			<th colspan=10 style="text-align:right">请购单号：<input type="text" id='buy_number' name="buy_number" readonly> </th>
		</tr>
		</thead>
		<tbody >
		<tr>
			<td>说明</td>
			<td colspan=9><input type="text" name="illustration" value="用于丽泽公司销售合同（包含设备销售、配件销售）" readonly></td>
		</tr>
		<tr>
			<th colspan=10 style="text-align:center;">基本信息</th>
		</tr>
		<tr>
			<td>申请人</td>
			<td colspan=2><input type="text" name="currency_applicant" id="staffName" readonly></td>
			<td>申请部门</td>
			<td colspan=2><input type="text" name="department_Id" id="department" readonly></td>
			<td>申请日期</td>
			<td colspan=3><input type="text" name="currency_date" id="date" readonly></td>
		</tr>
		<tr>
			<td>区域</td>
			<td colspan=2><select name="area" id="area" lay-filter="area" lay-search lay-verify="required" disabled></select></td>
			<td>客户名称</td>
			<td colspan=6><select name="customer_name" id="customer_name" lay-filter="customer_name" lay-search lay-verify="required"></select></td>
		</tr>
		<tr>
			<td>销售合同编号</td>
			<td colspan=9><select name="contract_id" id="contract_id" lay-filter="contract_id" lay-search lay-verify="required"></select></td>
		</tr>
		<tr>

			<td>期望到货日期</td>
			<td colspan=9><input type="text" name="expectedDelivery_date" id="date1" class="layui-input" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<th colspan="10" style="text-align: center;">销售合同付款约定</th> <!--payment_agreement-->
		</tr>
		<tr class="contract">
			<th colspan=3>合同条款名称</th>
			<th colspan=7>合同条款内容</th>
		</tr>
		<tr id="money">
			<td>合同总额</td>
			<td colspan=2><input type="text" id="contract_amount" name="contract_amount" readonly></td>
			<td>实际已收款</td>
			<td colspan=2><input type="text" id="actual_receipt" name="actual_receipt" readonly></td>
			<td>未收金额</td>
			<td colspan=3><input type="text" id="outstanding_receipt" name="outstanding_receipt" readonly></td>
		</tr>
		<tr>
			<th colspan=10 style="text-align:center;">明细信息</th>
		</tr>
		<tr id='prc'>
			<td>序号</td>
			<td>存货编码</td>
			<td>商品名称</td>
			<td>规格型号</td>
			<td>单位</td>
			<td>合同数量</td>
			<td>请购数量</td>
			<td>库存数量</td>
			<td name="recent">近期商品价格</td>
			<td>操作</td>
		</tr>
		<tr class="details">
			<td><input type="text" name="number" value="1" readonly></td>
			<td><input type="text" name="inventory_id" readonly></td>
			<td><input type="text" name="product_name" readonly></td>
			<td><input type="text" name="specifications_models" readonly></td>
			<td><input type="text" name="unit" readonly></td>
			<td><input type="text" name="contract_quantity" readonly></td>
			<td><input type="text" id="buy_quantity1" name="buy_quantity" lay-verify="required"></td>
			<td><input type="text" name="inventory_quantity" readonly></td>
			<td name="recent"><input type="text" name="recent_price" readonly></td>
			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		</tr>
		</tbody>
		<thead>
		<tr>
			<th colspan=10></th>
		</tr>
		</thead>
	</table>
	<div class="form-notes">
		<i class="layui-icon layui-icon-about"> 请按照区域 - 客户名称 - 合同编号的顺序进行选择</i>
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
        form.render('radio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            //,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        laydate.render({
            elem: '#date2' //指定元素
            //,type: 'datetime' //yyyy-MM-dd HH:mm:ss
        });
        detailsRender(1); //明细信息第一行自定义渲染事件
        inputRender();//input框自定义渲染

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
// 						if(recent_price > contract_price){
// 							flag = 0; //价格大于合同条款规定价格
// 							return;
// 						}
                var obj = {'details_string':number
                    ,'details_string4':inventory_id
                    ,'details_string5':product_name
                    ,'details_string6':specifications_models
                    ,'details_string7':unit
                    ,'details_money2':contract_quantity
                    ,'details_money':buy_quantity
                    ,'details_money3':inventory_quantity
                    ,'details_date2':expectedDelivery_date
                    ,'details_string8':recent_price
                };
                currentDetails.push(obj);
            });
            //价格判断不符合要求,表单不提交
// 					if(flag == 0){
// 						layer.msg('商品单价大于合同条款规定价格('+contract_price+'元)');
// 						return false;
// 					}
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
        var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息
        //如果当前登录人角色不为  5:管理员；23:总经理；34:财务主管；47:区域经理；29:开发管理员
        if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70){
            //登录人角色不为上述角色，则将合同金额信息隐藏
            $("#money").css('display','none');
            $('td[name="recent"]').css('display','none');
        }
        setApplyMessage(staffName,departmentId);
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
                    html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-cDep="'+item.cCusDepart+'">'+item.cCusName+'</option>'
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
        $('.contract-details').remove();
        $($('.details')[0]).siblings('.details').remove();
        $('.details').find('input:not(input[name="number"])').val('');
        form.render();
        //});
        // 过程一第三级 - 根据客户名称获取销售合同编号
        var cCusPPerson = '';//保存业务员编码
        var cCusDepart = '';//保存业务员部门
        form.on('select(customer_name)', function(data){
            var cCusCode = data.value;
            cCusPPerson = $("#customer_name").find('option:selected').attr('data-cCusPPerson');
            cCusDepart = $("#customer_name").find('option:selected').attr('data-cDep');
            $.ajax({
                url:'System/selectContract.action',
                type:'post',
                //客户编号加合同类型（销售类合同）
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
            $('.contract-details').remove();
            $($('.details')[0]).siblings('.details').remove();
            $('.details').find('input:not(input[name="number"])').val('');
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
            //重置合同条款
            $('.contract-details').remove();
            //重置合同条款带出的价格
            contract_price = 0;
            //查询合同条款
            $.ajax({
                url:'System/selectContractAll.action',
                type:'post',
                data:{'strContractID':strContractID},
                dataType:'JSON',
                success:function(res){
                    $.each(res.data,function(index,item){
                        contract_price = Math.max(item.cDefine26,contract_price); //number类型
                        var html = '<tr class="contract-details">'
                            + 	'<td colspan=3><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
                            +	'<td colspan=7><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
                            + '</tr>';
                        $('.contract').after(html);
                        inputRender();//input框自定义渲染
                    });
                }
            });
            //获取运营设备(附带运营设备编码和设备运营期间)
            $.ajax({
                url:'System/selectshebei.action',
                type:'post',
                data:{"strContractID": strContractID,'type':contract_type},
                dataType:'JSON',
                success:function(res){
                    $('.details').remove();
                    n_count = 0;
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
                                d_count++;
                                if(res.data.length > 0) recentPrice = res.data[0].iUnitCost;
                                var html = '<tr class="details">'
                                    +	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
                                    +	'<td><input type="text" name="inventory_id" value="'+item.商品编号+'" readonly></td>'
                                    +	'<td><input type="text" name="product_name" value="'+item.商品名称+'" readonly></td>'
                                    +	'<td><input type="text" name="specifications_models" value="'+models+'" readonly></td>'
                                    +	'<td><input type="text" name="unit" value="'+item.数量单位+'" readonly></td>'
                                    +	'<td><input type="text" name="contract_quantity" value="'+item.合同数量+'" readonly></td>'
                                    +	'<td><input type="text" id="buy_quantity'+d_count+'" name="buy_quantity" lay-verify="required"></td>'
                                    +	'<td><input type="text" name="inventory_quantity" value="'+fAvaQuantity+'" readonly></td>'
                                if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70){
                                    html+=	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                        + '</tr>';
                                }else {
                                    html+=	'<td name="recent"><input type="text" name="recent_price" value="'+recentPrice+'" readonly></td>'
                                        +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                        + '</tr>';
                                }
                                $('table.table-open>tbody').append(html);
                                //渲染
                                detailsRender(d_count); //明细信息每行自定义渲染事件
                                inputRender(); //input滑过显示内容详情 - 防止溢出情况
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
            deleteItem($('.delete'+index));  //每一行绑定行删除事件
            inputLimitNumber($('#buy_quantity'+index)); //每一行给申请数量绑定方法,限制输入内容(数字)(in function_tool.js)
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem2($demo);
        }
        //文本输入框自定义渲染事件	//input滑过显示内容详情 - 防止溢出情况
        function inputRender(){
            $('input').mouseover(function(e){
                e.target.title = e.target.value;
            });
        }

    });
</script>
</body>
</html>
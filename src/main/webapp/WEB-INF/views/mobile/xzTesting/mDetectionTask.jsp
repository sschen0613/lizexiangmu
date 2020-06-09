<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测业务下发申请-手机端 -->
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
				<h2 class="">检测业务表</h2>
				<span class="menu layui-icon layui-icon-more" onclick="$('.sub-menu').slideToggle();">
					<div class="sub-menu">
						<ul>
							<li onclick="window.location.href = 'xzTesting/mDetectionTaskList.action';">查看申请记录</li>
						</ul>
					</div>
				</span>
			</div>
			<div class="content">
				<form class="layui-form form-apply" action="" method="post">
					<div class="layui-form-item">
						<label class="layui-form-label">下发部门 :</label>
						<div class="layui-input-block">
							<input id='department' name="issued_department" class="layui-select" readonly>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">下发人 :</label>
						<div class="layui-input-block">
							<input type="text" name="issued_person" id="staffName" class="layui-input" readonly>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">下发日期 :</label>
						<div class="layui-input-block">
							<input type="text" name="issued_date" id="date" class="layui-input" readonly>
						</div>
 					</div>
					<div class="layui-form-item" id="source_div">
						<label class="layui-form-label">下发来源 :</label>
						<div class="layui-input-block">
							<select type="text" name="source" class="layui-select" lay-filter="source">
								<option value="1">信泽</option>
								<option value="2">丽泽</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item" id="contract_tr">
						<label class="layui-form-label">合同编号 :</label>
						<div id="contract" class="layui-input-block container">
							<input type="text" name="contract_id" id='contract_id' class="layui-input contract-search-box" placeholder="输入关键字查询" lay-verify="required">
							<div class="list-container" style="display:none;">
								<ul></ul>
							</div>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">委托单位 :</label>
						<div class="layui-input-block">
							<input id='client_department' name="client_department" class="layui-input" lay-verify="required">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">样品来源 :</label>
						<div class="layui-input-block">
							<select type="text" name="specimen_source" class="layui-select" lay-verify="required">
								<option value="现场采样">现场采样</option>
								<option value="送样">送样</option>
							</select>
						</div>
					</div>
 					<div class="layui-form-item">
						<label class="layui-form-label">报表编码 :</label>
						<div class="layui-input-block">
							<input type="text" name="code" class="layui-input" lay-verify="required">
						</div>
 					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">任务内容 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="task_definition" placeholder="请务必填写任务内容" lay-verify="required"></textarea>
						</div>
					</div>
					<div class="layui-form-item">
 						<label class="layui-form-label">备注 :</label>
						<div class="layui-input-block">
							<textarea class="layui-textarea" name="remark" placeholder=""></textarea>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
							<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
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
					elem: '#date1' ,//指定元素
					type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});
				laydate.render({
					elem: '#date2' ,//指定元素
					type: 'datetime' //yyyy-MM-dd HH:mm:ss
				});

                //业务来源添加事件
                form.on('select(source)', function(data){
                    if(data.value == 1){
                        $("#contract_tr").removeAttr("class");
                        $("#contract_id").attr("lay-verify","required");
                        //form.render('select');
                    }else{
                        $("#contract_tr").attr("class","layui-hide");
                        $("#contract_id").attr("lay-verify","");
                        $("#contract_id").val("");
                        $("#contract_id").attr("title","");
                        $("#client_department").val("");
                        currentContractId = '';//合同编号重置为空
                        //form.render('select');//select是固定写法 不是选择器
                    }
                });

				//监听提交按钮
              	form.on('submit(submitForm)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
                    var issued_department = data.field.issued_department;
                    var issued_person = data.field.issued_person;
                    var issued_date = data.field.issued_date;
                    var client_department = data.field.client_department;
                    var contract_number = data.field.contract_id;
                    var specimen_source = data.field.specimen_source;
                    var source = data.field.source;
					/*var implement_department = data.field.implement_department;
					 var implement_person = data.field.implement_person;
					 var get_date = data.field.get_date;*/
                    var task_definition = data.field.task_definition;
                    var remark = data.field.remark;
                    var code = data.field.code;

				 	$.ajax({
				 		 url : "Currency/launchCurrencyApply.action"
				 		,type : "post"
				 		,data : {
                            'currency_type':51,
                            'currency_int':5,
                            'currency_int2':source,
                            'currency_string3':client_department,
                            'currency_string4':contract_number,
                            'currency_string2':specimen_source,
                            'currency_string5':task_definition,
                            'currency_string7':remark,
                            'currency_string8':code
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
                            $('#myForm').attr("disabled", "disabled");
				 		}
				 	});
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
                //监听重置按钮
    			$('#resetForm').click(function(e){
    				window.location.reload();
    			});
                
    			//表单初始化
                //数据初始化
                //获取申请人/申请部门/申请日期
                var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
                var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                setApplyMessage(staffName,departmentId);
                searchProcess_contract($('#contract'));
            	//操作
                //客户Id
                var customer;
                //过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
                var currentContractId = '';//记录当前合同编号
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
                                url:'System/selectXZAllContract.action',
                                type:'post',
                                data:{'cName':currentKey},
                                dataType:'JSON',
                                success:function(res){
                                    var html = '<li value="" class="list-this">请选择销售合同编号</li>';
                                    $.each(res.data,function(index,item){
                                        html += '<li value="'+item.strContractID+'" data-id="'+item.strContractID
                                            +'" data-name="'+item.cCusName
                                            +'" data-cusCode="'+item.cCusCode
                                            +'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
                                            +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate
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
                        var strContractID = $(this).attr('data-id');
                        var contractAmount = $(this).attr('data-money');
                        var contractName = $(this).attr('data-name');
                        customer = "";
                        customer = $(this).attr("data-cusCode");
                        $('#contract_id').val(strContractID);  //合同编号
                        $("#contract_amount").val(contractAmount);//合同金额
                        $('#client_department').val(contractName);//委托单位
                        $('#customer_name').val(contractName);//客户名称
                        //查询合同收款计划
                        $.ajax({
                            url:'System/selectXZReceivables.action',
                            type:'post',
                            data:{'strContractID':strContractID},
                            dataType:'JSON',
                            success:function(result){
                                var acceptAmount = 0;
                                $.each(result.data,function(index,item){
                                    acceptAmount += Number(item.dblPayCurrency);
                                });
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
                                $.each(res.data,function(index,item){
                                    var html = '<tr class="contract-details">'
                                        + 	'<td colspan=2><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
                                        +	'<td colspan=6><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
                                        + '</tr>';
                                    $('.contract').after(html);
                                    inputRender();//input框自定义渲染
                                });
                            }
                        });
                        //重置下拉列表框
                        $(this).parent().empty();
                        $demo.find('.list-container').css('display','none');
                        //保存当前选择的合同编号
                        currentContractId = strContractID;
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
                        $('#'+Id+' input').val(currentContractId);
                    });
                }
                //input滑过显示内容详情 - 防止溢出情况
                function inputRender(){
                    $('input').mouseover(function(e){
                        e.target.title = e.target.value;
                    });
                }
            	
            });
        </script>
	</body>
</html>
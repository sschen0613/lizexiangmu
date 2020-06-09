<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 普通运营请购审批 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="layui_exts/excel.js"></script>
	</head>
	<body>
	 	<form class="layui-form form-top" action="">
	 		<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label label-revise">申请人 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_string2" lay-verify="" placeholder="请输入申请人" autocomplete="off" class="layui-input input-revise">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">申请部门 :</label>
					<div class="layui-input-block select-revise">
						<select id="department" name="currency_department" lay-verify="" lay-search class="select-revise">
							<option value="">请选择部门</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">开始日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date2" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="请选择开始日期">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">结束日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date3" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="请选择结束日期">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">销售合同编号 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_string4" placeholder="请输入销售合同编号" autocomplete="off" class="layui-input input-revise">
					</div>
				</div>
			  	<div class="layui-inline">
					<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-xs button-revise" lay-submit="">
	              		检索
					</button>
					<button lay-filter="out" class="layui-btn layui-btn-danger layui-btn-xs button-revise" lay-submit="">
						导出
					</button>
				</div> 
			</div>
		</form>

		<table id="tab" lay-filter="table"></table>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="print">打印</a>
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">审批</a>
			<%--<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">审批进度</a>--%>
			<a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="sign">标记</a>
		</script>
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
				
				 var currency_type = 10;
				 var staffid ="${sessionScope.systemStaff.dingding_staffid }";
				 
				//表单更新渲染
				form.render();
				form.render('select');
				//执行一个laydate实例
				laydate.render({
					elem: '#date1' //指定元素
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
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后，判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 2000},function(){$('#date2').val('');});
				    	}
			        }
				});
				
				//检索栏数据初始化
				//查询所有部门
				$.ajax({
					url : "Department/selectDingAllDepartment.action",
					type : "post",
					data : {},
					dataType : "JSON",
					success : function(res){
						var html = '<option value="">请选择部门</option>';
						$.each(res.data,function(index,item){
							html += '<option value="'+item.ding_depmid+'">'+item.department_Name+'</option>';
						});
						$('#department').html(html);
						form.render('select');
					}
				});

				//监听检索按钮
				form.on('submit(search)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					// console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
	  
					//重载表格
					tableInner.reload({
						where: data.field
						//重新从第 1 页开始
						,page: {curr: 1}
					});
	  
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});

                //监听导出按钮
                form.on('submit(out)', function(data){
                    var date1 = $('input[name="currency_date2"]').val();
                    var date2 = $('input[name="currency_date3"]').val();
                    var currency_string2 = $('input[name="currency_string2"]').val();
                    var currency_string4 = $('input[name="currency_string4"]').val();

                    var currency_department = $('#department').find('option:selected').val();

                    var url = 'Currency/selectCurrencyApprover2.action?currency_type=10&currency_string='+staffid;
                    if (date1 != null && date1 != ''){
                        url += '&currency_date2='+date1;
                    }
                    if (date2 != null && date2 != ''){
                        url += '&currency_date3='+date2;
                    }
                    if (currency_string2 != null && currency_string2 != ''){
                        url += '&currency_string2='+currency_string2;
                    }
                    if (currency_department != null && currency_department != ''){
                        url += '&currency_department='+currency_department;
                    }
                    if (currency_string4 != null && currency_string4 != ''){
                        url += '&currency_string4='+currency_string4;
                    }
                    $.ajax({
                        url: url,
                        dataType: 'json',
                        success: function(res) {
                            var data = LAY_EXCEL.filterExportData(res.data, {
                                currency_number:'currency_number',
                                staff_name:"staff_name",
                                department_name:"department_name",
                                currency_date:function (value,line,data) {
                                    return Format0(value,"yyyy-MM-dd HH:mm:ss");
                                },
                                currency_string2:"currency_string2",
                                currency_string7:"currency_string7",
                                currency_string3:"currency_string3",
                                currency_int2:function (value,line,data) {
									return value == "1" ? "BO设备出库" : "运营设备出库";
                                },
                                currency_int3:function (value,line,data) {
                                    return value == "1" ? "普通请购" : "维修入库";
                                },
                                currency_string9:"currency_string9",
                                currency_date2:function (value,line,data) {
                                    return Format(value,"yyyy-MM-dd");
                                },
                                currency_date3:function (value,line,data) {
                                    return Format(value,"yyyy-MM-dd");
                                },
                                currency_money:"currency_money",
                                currency_money2:"currency_money2",
                                currency_money3:"currency_money3",
                                details_string:"details_string",
                                details_string2:"details_string2",
                                details_date2:function (value,line,data) {
                                    return Format(value,"yyyy-MM-dd");
                                },
                                details_date3:function (value,line,data) {
                                    return Format(value,"yyyy-MM-dd");
                                },
                                details_string4:"details_string4",
                                details_string5:"details_string5",
                                details_string6:"details_string6",
                                details_string7:"details_string7",
                                details_money:"details_money",
                                details_money3:"details_money3",
                                details_money4:"details_money4"
                            });
                            data.unshift({
                                currency_number: '编号',staff_name:"申请人",department_name:"申请部门",currency_date: '申请日期',currency_string2:"区域",
                                currency_string7: '客户名称',currency_string3: '合同编号',currency_int2: '出库类型',currency_int3: '申请类型',currency_string9: '货品编码',
								currency_date2: '运营合同起止时间',currency_date3: '期望到货日期',currency_money: '合同金额', currency_money2: '收款金额',currency_money3: '未收金额',
                                details_string:"运营设备编码",details_string2:"运营设备名称", details_date2:"设备开始日期",details_date3:"设备结束日期",
                                details_string4:"存货编码",details_string5:"商品名称", details_string6:"规格型号",details_string7:"单位",
                                details_money:"请购数量",details_money3:"库存数量",details_money4:"物品报价"
                            });
                            // 3. 执行导出函数，系统会弹出弹框
                            LAY_EXCEL.exportExcel(data, '普通运营配件.xlsx', 'xlsx');
                        }
                    });

                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });

				//创建table实例					
				var tableInner = table.render({
					elem: '#tab'
					,url: 'Currency/selectCurrencyApprover.action?currency_type='+ currency_type+"&currency_string="+staffid //数据接口
					,page: true //开启分页
					,toolbar: true
			    	,title: '普通运营请购审批'
// 			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_number', title: '编号', minWidth:80}
						,{field: 'staff_name', title: '申请人', minWidth:80}
						,{field: 'department_name', title: '申请部门', minWidth:100}
						,{field: 'currency_date', title: '申请日期', sort: true, minWidth:100, templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
						,{field: 'currency_string2', title: '区域', minWidth:80}
						,{field: 'currency_string7', title: '客户名称', minWidth:100}
						,{field: 'currency_string3', title: '销售合同编号', minWidth:120}
						,{field: 'currency_int2', title: '出库类型', minWidth:100,templet:'<div>{{d.currency_int2 == "1" ? "BO设备出库" : "运营设备出库"}}</div>'}
                        ,{field: 'currency_int3', title: '申请类型', minWidth:100,templet:'<div>{{d.currency_int3 == "1" ? "普通请购" : "维修入库"}}</div>'}
                        ,{field: 'currency_string9', title: '货品编码', minWidth:100,templet:'<div>{{d.currency_string9 == null ? "无" : d.currency_string9}}</div>'}
						,{field: 'currency_date2', title: '运营合同开始时间', minWidth:140,templet:'<div>{{ Format(d.currency_date2,"yyyy-MM-dd")}}</div>'}
                        ,{field: 'currency_date4', title: '运营合同结束时间', minWidth:140,templet:'<div>{{ Format(d.currency_date4,"yyyy-MM-dd")}}</div>'}
						,{field: 'currency_date3', title: '期望到货日期', minWidth:120,templet:'<div>{{ Format(d.currency_date3,"yyyy-MM-dd")}}</div>'}
						,{field: 'currency_money', title: '合同金额', minWidth:100}
						,{field: 'currency_money2', title: '实际已收款', minWidth:110}
						,{field: 'currency_money3', title: '欠款金额', minWidth:100}
                        ,{field: 'currency_string16', title: '期初合同已收款', minWidth:100}
                        ,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:270}
					]],
                    done: function (res, curr, count) {
                        for (var i = 0; i < res.data.length; i++) {   //遍历返回数据
                            if (res.data[i].currency_int7 == 1) {    //设置条件
                                $("table tbody tr").eq(i).css('background-color', 'lightgreen')    //改变满足条件行的颜色
                            }
                        }
                    }
				});

				//监听工具条
				table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
					if(layEvent === 'detail'){ //查看
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							//content: 'Currency/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+currency_type //iframe的url currency_id通用审批流主键
							content: 'storage/setupAllocationApproverDetail.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type
						});
					}else if(layEvent === 'print'){ //打印
                        layer.open({
                            type: 2,
                            // skin:'layui-layer-molv', //layui-layer-lan
                            title: '普通运营请购打印',
                            shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['80%', '80%'],
                            content: 'storage/setupAllocationApproverPrint.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type
                        });
                    } /*else if(layEvent === 'del'){ //删除
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '审批进度',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'Currency/approvalProgress.action?currency_id='+data.currency_id+"&current_approvalCount="
									+data.current_approvalCount+"&approver_count="+data.approver_count+"&approvalOpinion_type=10"//iframe的url
						}); 
					}*/ else if(layEvent === 'edit'){ //审批
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '审批',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['30%', '40%'],
							content: 'Currency/approvalOpinion.action?approval_id=10&currency_id='+data.currency_id
						});
					}else if(layEvent === 'sign'){ //审批
                        if (data.current_approvalCount/data.approver_count != 1){
                            layer.msg('未审批完成，暂无法标记!',{time: 2000});
                        }else if (data.currency_int7 == 1){
                            layer.msg('已标记，请勿重复标记!',{time: 2000});
                        }else {
                            $.ajax({
                                url:'Currency/signCurrencyApply.action',
                                type:'post',
                                data:{'currency_id':data.currency_id,'currency_type':data.currency_type},
                                dataType:'JSON',
                                success:function(result){
                                    layer.msg(result.msg);
                                    //重载表格
                                    tableInner.reload({
                                        where: data.field
                                        //重新从第 1 页开始
                                        ,page: {curr: 1}
                                    });
                                }
                            });
                        }
                    }
				});

			});
		</script> 
	</body>
</html>
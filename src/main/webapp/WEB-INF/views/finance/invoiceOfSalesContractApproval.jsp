<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售合同发票开具审批 -->
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
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">审批</a>
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="del">审批进度</a>
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
				
				 var currency_type = 28;
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

                    var url = 'Currency/selectCurrencyApprover2.action?currency_type=28&currency_string='+staffid;
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
                                currency_string3:"currency_string3",
                                currency_string4:"currency_string4",
                                currency_string5:"currency_string5",
                                currency_string7:"currency_string7",
                                currency_string8:"currency_string8",
                                currency_string9:"currency_string9",
                                currency_string10:"currency_string10",
                                currency_string11:"currency_string11",
                                currency_money:"currency_money",
                                currency_money2:"currency_money2",
                                currency_money3:"currency_money3",
                                currency_string12:"currency_string12",
                                currency_string13:"currency_string13",
                                currency_int5:function (value,line,data) {
                                    return value == "1" ? "普通发票" : "专用发票";
                                },
                                currency_string14:"currency_string14",
                                currency_int6:function (value,line,data) {
                                    return value == "1" ? "是" : "否";
                                },
                                details_string5:"details_string5",
                                details_string6:"details_string6",
                                details_string7:"details_string7",
                                details_money:"details_money",
                                details_money4:"details_money4",
                            });
                            data.unshift({
                                currency_number: '编号',staff_name:"申请人",department_name:"申请部门",currency_date: '申请日期',currency_string2:"所属区域",
                                currency_string3: '客户名称',currency_string4: '合同编号',currency_string5: '开票名称',currency_string7: '税号',currency_string8: '地址',
                                currency_string9: '电话',currency_string10: '开户行',currency_string11: '账号',currency_money: '合同金额', currency_money2: '收款金额',currency_money3: '未收金额',
                                currency_string12:"已开票金额",currency_string13:"申请开票金额", currency_int5:"发票类型",
                                currency_string14:"开票事由",currency_int6:"开票信息是否一致",details_string5:"货物名称",details_string6:"型号"
                                ,details_string7:"单位",details_money:"数量",details_money4:"金额"
                            });
                            // 3. 执行导出函数，系统会弹出弹框
                            LAY_EXCEL.exportExcel(data, '丽泽销售合同发票.xlsx', 'xlsx');
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
			    	,title: '丽泽销售合同发票开具审批'
// 			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_number', title: '编号', minWidth:200}
						,{field: 'staff_name', title: '申请人', minWidth:80}
						,{field: 'department_name', title: '申请部门', minWidth:100}
						,{field: 'currency_date', title: '申请日期', sort: true, minWidth:100, templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
						,{field: 'currency_string2', title: '所属区域', minWidth:150}
						,{field: 'currency_string3', title: '客户名称', minWidth:200}
						,{field: 'currency_string4', title: '合同编号', minWidth:100}
						,{field: 'currency_string5', title: '开票名称', minWidth:100}
						,{field: 'currency_string7', title: '税号', minWidth:100}
						,{field: 'currency_string8', title: '地址', minWidth:200}
						,{field: 'currency_string9', title: '电话', minWidth:100}
						,{field: 'currency_string10', title: '开户行', minWidth:120}
						,{field: 'currency_string11', title: '账号', minWidth:120}
						,{field: 'currency_money', title: '合同总金额', minWidth:110}
						,{field: 'currency_money2', title: '实际收款', minWidth:100}
						,{field: 'currency_money3', title: '欠款金额', minWidth:100}
						,{field: 'currency_string12', title: '已开票金额', minWidth:110}
						,{field: 'currency_string13', title: '申请开票金额', minWidth:120}
						,{field: 'currency_int5', title: '发票类型', minWidth:100,templet:'<div>{{d.currency_int5 == "1" ? "普通发票" : "专用发票"}}</div>'}
                        ,{field: 'currency_string15', title: '期出合同已开票', minWidth:110}
                        ,{field: 'currency_string16', title: '期初合同已收款', minWidth:120}
						,{field: 'currency_string14', title: '开票事由', minWidth:100}
						,{field: 'currency_int6', title: '开票信息是否一致', minWidth:140,templet:'<div>{{d.currency_int6 == "1" ? "是" : "否"}}</div>'}
                        ,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:230}
					]]
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
                            content: 'finance/invoiceOfSalesContractApprovalDetail.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type
                        });
					} else if(layEvent === 'del'){ //删除
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '审批进度',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'Currency/approvalProgress.action?currency_id='+data.currency_id+"&current_approvalCount="
									+data.current_approvalCount+"&approver_count="+data.approver_count+"&approvalOpinion_type=28"//iframe的url
						}); 
					} else if(layEvent === 'edit'){ //审批
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '审批',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['30%', '50%'],
							content: 'Currency/approvalOpinion.action?approval_id=28&currency_id='+data.currency_id
						});
					}
				});

			});
		</script> 
	</body>
</html>
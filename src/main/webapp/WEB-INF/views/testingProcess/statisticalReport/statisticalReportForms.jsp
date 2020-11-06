<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 统计报表 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="layui/layui.js"></script>
		<script src="js/function_tool.js"></script>
		<script src="layui_exts/excel.js"></script>
	</head>
	<body>
	 	<form class="layui-form form-top" action="">
 	 		<div class="layui-form-item">
 				<div class="layui-inline">
 					<label class="layui-form-label label-revise">项目名称 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_string2"  placeholder="请输入委托单位" autocomplete="off" class="layui-input input-revise">
					</div>
 				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">开始日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date2" type="text" class="layui-input input-revise date-revise" id="date1 autocomplete="off" placeholder="请选择开始日期">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label label-revise">结束日期 :</label>
					<div class="layui-input-block">
						<input name="currency_date3" type="text" class="layui-input input-revise date-revise" id="date2" autocomplete="off" placeholder="请选择结束日期">
					</div>
				</div>
 			  	<div class="layui-inline">
 					<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
 	              		检索
 					</button>
					<button lay-filter="out" class="layui-btn layui-btn-danger layui-btn-xs button-revise" lay-submit="">
						导出
					</button>
 				</div>
			</div>
		</form>

 		<table id="tab" lay-filter="table"></table>

		<script type="text/html" id="toolbarDemo">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-xs" lay-event="add"></button>
			</div>
		</script>
		<script type="text/html" id="barDemo">
			<%--<a class="layui-btn layui-btn-xs" lay-event="detail">查看明细</a>--%>
			<a class="layui-btn layui-btn-xs" lay-event="edit">逾期处理</a>
			<!--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
		</script>

		<script type="text/html" id="over1">
			{{#  if(d.register.search("超时") != -1){ }}
			<span style="color: red;">{{ d.register }}</span>
			{{#  } else { }}
			{{ d.register }}
			{{#  } }}
		</script>
		<script type="text/html" id="over2">
			{{#  if(d.testing.search("超时") != -1){ }}
			<span style="color: red;">{{ d.testing }}</span>
			{{#  } else { }}
			{{ d.testing }}
			{{#  } }}
		</script>
		<script type="text/html" id="over3">
			{{#  if(d.report.search("超时") != -1){ }}
			<span style="color: red;">{{ d.report }}</span>
			{{#  } else { }}
			{{ d.report }}
			{{#  } }}
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

				//监听检索按钮
				form.on('submit(search)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					//data = data.field;//当前容器的全部表单字段，名值对形式：{name: value}

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
                    var currency_string2 = $('input[name="currency_string2"]').val();//项目名称
                    var url = 'Xinze/selectBusinessTracking.action?currency_type=43';
                    if (currency_string2 != null && currency_string2 != ''){
                        url += '&currency_string2='+currency_string2;
                    }
                    if (date1 != null && date1 != ''){
                        url += '&currency_date2='+date1;
                    }
                    if (date2 != null && date2 != ''){
                        url += '&currency_date3='+date2;
                    }
                    $.ajax({
                        url: url,
                        dataType: 'json',
                        success: function(res) {
                            var data = LAY_EXCEL.filterExportData(res.data, {
                                currency_number:'currency_number',
                                currency_string7:"currency_string7",
                                currency_string18:"currency_string18",
                                currency_string2:"currency_string2",
                                currency_date:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                },
                                register:"register",
                                registerTime:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                },
                                handover:"handover",
                                handoverTime:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                },
                                testing:"testing",
                                testTime:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                },
                                report:"report",
                                reportTime:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                }/*,
                                finance:"finance",
                                financeTime:function (value,line,data) {
                                    return value == undefined ? "" : Format0(value,"yyyy-MM-dd HH:mm:ss");
                                }*/
                            });
                            data.unshift({
                                currency_number: '编号',currency_string7:"报表编码",currency_string18:"合同编号",currency_string2:"项目名称",
								currency_date: '下发时间',register:'现场科登记',registerTime:'到达时间',
                                handover:'质控科交接',handoverTime:'到达时间',testing:'检测科检测',testTime:'到达时间',
                                report:'质控科报告',reportTime:'到达时间'/*,finance:'财务科确认',financeTime:'盖章时间',*/
                            });
                            // 3. 执行导出函数，系统会弹出弹框
                            LAY_EXCEL.exportExcel(data, '信泽业务追踪.xlsx', 'xlsx');
                        }
                    });

                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });

				//创建table实例
                var tableInner = table.render({
					elem: '#tab'
					,url: 'Xinze/selectBusinessTracking.action?currency_type=43' //数据接口
					,page: true //开启分页
					,toolbar: true
			    	,title: '统计报表'
			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{fixed: 'left',field: 'currency_string7', title: '报告编码', minWidth:120}
                        ,{field: 'currency_string18', title: '合同编号', minWidth:120}
                        ,{field: 'currency_string2', title: '项目名称', minWidth:150}
                        //,{field: 'notice', title: '业务科通知'}
                        ,{field: 'currency_date', title: '下发时间', minWidth:150, templet:'<div>{{d.currency_date == undefined ? "无" : Format0(d.currency_date,"yyyy-MM-dd HH:mm:ss")}}</div>'}
                        ,{field: 'register', title: '现场科采样', minWidth:120, templet:'#over1'}
                        ,{field: 'currency_string3', title: '完成时间', minWidth:150, templet:'<div>{{d.currency_string3 == undefined ? "无" : d.currency_string3}}</div>'}
                        ,{field: 'handover', title: '样品流转', minWidth:120}
                        ,{field: 'currency_string4', title: '完成时间', minWidth:150, templet:'<div>{{d.currency_string4 == undefined ? "无" : d.currency_string4}}</div>'}
                        ,{field: 'testing', title: '检测科检测', minWidth:120, templet:'#over2'}
                        ,{field: 'currency_string5', title: '完成时间', minWidth:150, templet:'<div>{{d.currency_string5 == undefined ? "无" : d.currency_string5}}</div>'}
                        ,{field: 'report', title: '质控科报告', minWidth:120, templet:'#over3'}
                        ,{field: 'currency_string10', title: '完成时间', minWidth:150, templet:'<div>{{d.currency_string10 == undefined ? "无" : d.currency_string10}}</div>'}
                        //,{field: 'finance', minWidth:150, title: '财务科确认'}
                        //,{field: 'financeTime', title: '到达时间', minWidth:150, templet:'<div>{{d.reportTime == undefined ? "无" : Format0(d.financeTime,"yyyy-MM-dd HH:mm:ss")}}</div>'}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:210}
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
                            title: '查看明细',
                            shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['80%', '80%'],
                            content: 'Xinze/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
                        });
					} else if(layEvent === 'del'){ //删除
						layer.confirm('确认删除', function(index){
							obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
							layer.close(index);
							//向服务端发送删除指令
						});
					} else if(layEvent === 'edit'){ //编辑
						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '逾期处理申请',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'testingProcess/samplingMessage/overDueDealForm.action?currency_id='+data.currency_id//45
						});
					}
				});
				//监听头工具栏事件
				table.on('toolbar(table)', function(obj){
					var checkStatus = table.checkStatus(obj.config.id);
					switch(obj.event){
						case 'add':
							layer.open({
								type: 2,
								// skin:'layui-layer-molv', //layui-layer-lan
								title: '填写',
								shadeClose: true,
								shade: 0.8,
								maxmin: true,
								area: ['80%', '80%'],
								content: '' //iframe的url
							}); 
				    	break;
				    	case 'delete':
				    		layer.msg('删除');
				    	break;
				    	case 'update':
				    		layer.msg('编辑');
				    	break;
					};
				});

			});
		</script> 
	</body>
</html>
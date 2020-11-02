<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测报告登记 -->
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
			<label class="layui-form-label label-revise">联系人 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string3" required  lay-verify="" placeholder="请输入联系人" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">项目名称 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string17" required  lay-verify="" placeholder="请输入项目名称" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
				检索
			</button>
		</div>
	</div>
</form>

<table id="tab" lay-filter="table"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="confirm">确认</a>
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="add">添加</a>
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="detail">详情</a>
	<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="compile">完成</a>
	<%--<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">报告详情</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">导出</a>--%>
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
            elem: '#date' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
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

        //创建table实例
        var tableInner = table.render({
            elem: '#tab'
            ,url: 'Currency/selectCurrencyList.action?currency_type=45&currency_int=-1' //数据接口
            ,page: true //开启分页
            ,toolbar: true
            ,title: '检测报告登记'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
				{fixed: 'left',field: 'currency_number', title: '编码单号', minWidth:200}
				,{field: 'currency_int3', title: '是否确认', minWidth: 100,templet:'<div>{{d.currency_int3 == 1 ? "已确认" : "未确认"}}</div>'}
				,{field: 'currency_int2', title: '检测超期', minWidth: 100,templet:'<div>{{d.currency_int2 == 1 ? "超期" : "未超期"}}</div>'}
				,{field: 'currency_string3', title: '检测任务编码', minWidth:230}
				,{field: 'currency_string2', title: '检测开始时间', minWidth:150}
				,{field: 'currency_money', title: '检测限制天数', minWidth:80}
				,{field: 'currency_date3', title: '报告期限', minWidth:150, sort: true, templet:'<div>{{ Format0(d.currency_date3,"yyyy-MM-dd HH:ss:mm")}}</div>'}
				//,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:210}
            ]]/*,
            done: function (res, curr, count) {
                for (var i = 0; i < res.data.length; i++) {   //遍历返回数据
                    if (res.data[i].currency_int6 == -1) {    //设置条件
                        $("table tbody tr").eq(i).css('background-color', 'lightgreen')    //改变满足条件行的颜色
                    }
                }
            }*/
        });

        //监听工具条
        table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
			if(layEvent === 'confirm'){ //确认
				if (data.currency_int3 == 1){
					layer.msg('已确认，请勿重复操作!',{time: 2000});
				}else {
					$.ajax({
						url:'Xinze/confirmTest45.action',
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
			} else if(layEvent === 'add'){ //查看明细
				layer.open({
					type: 2,
					// skin:'layui-layer-molv', //layui-layer-lan
					title: '报告新增',
					shadeClose: true,
					shade: 0.8,
					maxmin: true,
					area: ['80%', '80%'],
					content: 'testingProcess/testingReport/testingReportAdd.action?currency_id='+data.currency_id
					//content: 'testingProcess/testingReport/testingReportRegisterForm.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type+'&currency_int2='+data.currency_int2+'&currency_string17='+data.currency_string17 //iframe的url currency_id通用审批流主键
				});
			}else if(layEvent === 'detail'){ //查看明细
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '报告详情',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
					content: 'testingProcess/testingReport/testingReportDetails.action?currency_id='+data.currency_id
					//content: 'testingProcess/testingReport/testingReportRegisterForm.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type+'&currency_int2='+data.currency_int2+'&currency_string17='+data.currency_string17 //iframe的url currency_id通用审批流主键
                });
            } else if(layEvent === 'compile'){ //完成
                if (data.currency_int6 == -1){
                    layer.msg('已完成，请勿重复操作!',{time: 2000});
                }else {
                    $.ajax({
                        url:'Xinze/complieReport.action',
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
            } else if(layEvent === 'del'){ //撤回
                var data1,data2,data3,data4;

                var ajax1 = $.ajax({
                    url: 'Xinze/selectReprotOne.action',
                    type:'post',
                    data:{"currency_id":data.currency_id},
                    dataType: 'json',
                    success: function(res) {
                        var arr = new Array();
                        arr[0] = res.data;
                        data1 = LAY_EXCEL.filterExportData(arr, {
                            currency_string10:'currency_string10',
                            currency_string5:'currency_string5',
                            currency_string3:'currency_string3',
                            currency_string4:'currency_string4',
                            currency_int2:function (value,line,data) {
                                return value == 1 ? "现场采样" : "送样";
                            },
                            currency_string8:'currency_string8',
                            currency_date2:function (value,line,data) {
                                return Format(value,"yyyy-MM-dd");
                            },
                            currency_date3:function (value,line,data) {
                                return Format(value,"yyyy-MM-dd");
                            },
                            currency_date4:function (value,line,data) {
                                return Format(value,"yyyy-MM-dd");
                            },
                            currency_date5:function (value,line,data) {
                                return Format(value,"yyyy-MM-dd");
                            }
                        });
                        data1.unshift({
                            currency_string10: '委托单位',currency_string5:"委托单位地址",currency_string3:"委托人",currency_string4: '联系电话',currency_int2:"样品来源",
                            currency_string8:"检测目的",currency_date2:"采样开始日期", currency_date3:"采样结束日期",currency_date4:"分析开始日期",currency_date5: '分析结束日期'
                        });

                        data2 = LAY_EXCEL.filterExportData(res.data2, {
                            details_string:'details_string',
                            processName:'processName',
                            details_int3:function (value,line,data) {
                                return value + "次/天";
                            },
                            details_int4:function (value,line,data) {
                                return value + "天";
                            }
                        });
                        data2.unshift({
                            details_string: '检测点位',processName:"检测项目",details_int3:"检测频次",details_int4: '检测天数'
                        });
                    }
                });
                var ajax2 = $.ajax({
                    url : "Xinze/selectCurrencyDetails.action"
                    ,type : "post"
                    ,data : {"currency_id":data.currency_id}
                    ,dataType : "JSON"
                    ,success:function (res) {
                        data3 = LAY_EXCEL.filterExportData(res.data, {
                            details_string:'details_string',
                            processName:'processName',
                            methodBasis:'methodBasis',
                            process_string:'process_string'
                        });
                        data3.unshift({
                            details_string: '检测点位',processName:"检测项目",methodBasis:"方法依据",process_string: '限值'
                        });
                    }
                });

                var ajax3 = $.ajax({
                    url:'Xinze/selectTestResult.action',
                    type:'post',
                    data:{
                        "currency_id":data.currency_id,
                        "currency_int2":data.currency_int2,
                        "currency_string17":data.currency_string17
                    },
                    dataType:'JSON',
                    success:function(res){
                        data4 = LAY_EXCEL.filterExportData(res.data, {
                            details_string:'details_string',
                            details_string2:'details_string2',
                            details_string3:'details_string3',
                            details_string9:'details_string9'
                        });
                        data4.unshift({
                            details_string: '检测点位',details_string2:"检测项目",details_string3:"样品编码",details_string9: '检测结果'
                        });
                    }
                });

                $.when(ajax1,ajax2,ajax3).done(function () {
                    // 3. 执行导出函数，系统会弹出弹框
                    LAY_EXCEL.exportExcel({sheet1: data1,sheet2: data2,sheet3: data3,sheet4: data4}, '检测报告.xlsx', 'xlsx');
                });
            } else if(layEvent === 'approval'){ //审批详情
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '审批详情',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: 'Currency/approvalProgress.action?currency_id='+data.currency_id+"&current_approvalCount="
                    +data.current_approvalCount+"&approver_count="+data.approver_count+"&approvalOpinion_type="+data.currency_type
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
                        title: '检测登记表填写',
                        //shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['80%', '80%'],
                        content: 'testingProcess/testingReport/testingReportRegisterForm.action' //iframe的url
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
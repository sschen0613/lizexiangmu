<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务登记 -->
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
			<label class="layui-form-label label-revise">任务下达人 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string2" placeholder="请输入任务下达人" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">报告编码 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string7" placeholder="请输入报告编码进行" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">开始日期 :</label>
			<div class="layui-input-block">
				<input name="currency_date2" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="请选择任务下达日期">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">结束日期 :</label>
			<div class="layui-input-block">
				<input name="currency_date3" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="请选择任务下达日期">
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

<!-- 		<script type="text/html" id="toolbarDemo"> -->
<!-- 			<div class="layui-btn-container"> -->
<!-- 				<button class="layui-btn layui-btn-xs" lay-event="add">采样登记表</button> -->
<!-- 			</div> -->
<!-- 		</script> -->
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="next">采样任务登记</a>
	<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
	<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">结束流程</a>
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

        //检索栏数据初始化
        //查询所有审批人
        $.ajax({
            url : "",
            type : "post",
            data : {},
            dataType : "JSON",
            success : function(res){
                var html = '<option value="">请选择审批人</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.id+'">'+item.name+'</option>';
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
            var currency_string2 = $('input[name="currency_string2"]').val();
            var currency_string5 = $('input[name="currency_string5"]').val();
            var currency_string7 = $('input[name="currency_string7"]').val();
            var date1 = $('input[name="currency_date2"]').val();
            var date2 = $('input[name="currency_date3"]').val();
            var url = 'Xinze/selectApplicantCurrency.action?currency_type=43&currency_int=0&currency_int2=1';
            if (currency_string2 != null && currency_string2 != ''){
                url += '&currency_string2='+currency_string2;
            }
            if (currency_string5 != null && currency_string5 != ''){
                url += '&currency_string5='+currency_string5;
            }
            if (currency_string7 != null && currency_string7 != ''){
                url += '&currency_string7='+currency_string7;
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
                        staff_name:"staff_name",
                        department_name:"department_name",
                        currency_date:function (value,line,data) {
                            return Format0(value,"yyyy-MM-dd HH:mm:ss");
                        },
                        currency_string2:"currency_string2",
                        //currency_string3:"currency_string3",
                        //currency_string4:"currency_string4",
                        //currency_string5:"currency_string5",
                        //currency_string10:"currency_string10",
                        currency_string7:"currency_string7",
                        currency_date2:function (value,line,data) {
                            return Format(value,"yyyy-MM-dd");
                        },
                        currency_string8:"currency_string8",
                        currency_date3:function (value,line,data) {
                            return Format(value,"yyyy-MM-dd");
                        }
                        //,currency_string9:"currency_string9"
                    });
                    data.unshift({
                        currency_number: '采样任务单号',staff_name:"下达人",department_name:"下达部门",currency_date: '下达日期',
                        currency_string2:'项目名称',
                        //currency_string3: '联系人',currency_string4: '联系电话',currency_string5: '委托单位地址', currency_string10:'委托单位名称',
                        currency_string7: '报告编码',currency_date2: '采样完成时间',currency_string8: '检测类型',
                        currency_date3:"协议完成时间"//,currency_string9:"执行标准"
                    });
                    // 3. 执行导出函数，系统会弹出弹框
                    LAY_EXCEL.exportExcel(data, '采样任务下发.xlsx', 'xlsx');
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //创建table实例
        var tableInner = table.render({
            elem: '#tab'
			//															采样为0，登记后为1		现场采样
            ,url: 'Xinze/selectApplicantCurrency.action?currency_type=43&currency_int=0&currency_int2=1' //数据接口
            ,page: true //开启分页
            ,toolbar: true
            ,title: '采样任务登记'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
                {field: 'currency_number', fixed: 'left', title: '采样单号', minWidth:220, sort:true}
                ,{field: 'currency_string2', title: '项目名称', minWidth:150}
                //,{field: 'currency_string3', title: '联系人', minWidth:80}
                //,{field: 'currency_string4', title: '联系电话', minWidth:100}
                //,{field: 'currency_string5', title: '委托单位地址', minWidth:200}
                //,{field: 'currency_string10', title: '委托单位名称', minWidth:120}
                ,{field: 'currency_string7', title: '报告编码', minWidth:120}
				,{field: 'currency_date2', title: '采样完成时间', sort: true, minWidth:180, templet:'<div>{{ Format0(d.currency_date2,"yyyy-MM-dd HH:mm:ss")}}</div>'}
				,{field: 'currency_string8', title: '检测类型', minWidth:120}
				,{field: 'currency_date3', title: '协议完成时间', sort: true, minWidth:180, templet:'<div>{{ Format0(d.currency_date3,"yyyy-MM-dd HH:mm:ss")}}</div>'}
                //,{field: 'currency_string9', title: '执行标准', minWidth:200}
                //,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:300}
            ]]
        });

        //监听工具条
        table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看明细
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
            } else if(layEvent === 'edit'){ //编辑
                layer.open({
                    type: 2,
                    title: '采样登记表修改',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: '?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url
                });
                //同步更新缓存对应的值
                obj.update({
                    // username: '123'
                    // ,title: 'xxx'
                    // 字段 : '要更新的值',
                });
            } else if(layEvent === 'del'){ //撤回
                layer.confirm('确认结束流程？', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url:'Xinze/endTest.action',
                        type:'post',
                        data:{'currency_id':data.currency_id},
                        dataType:'JSON',
                        success:function(result){
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                            layer.msg(result.msg,{time: 2000});
                        }
                    });
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
            } else if(layEvent === 'next'){ //采样任务交接
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '采样任务登记表填写',
                    //shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: 'testingProcess/samplingMessage/samplingTaskRegisterForm.action?currency_id='+data.currency_id //iframe的url
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
                        title: '采样登记表填写',
                        //shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['80%', '80%'],
                        content: 'testingProcess/samplingMessage/samplingTaskRegisterForm.action' //iframe的url
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
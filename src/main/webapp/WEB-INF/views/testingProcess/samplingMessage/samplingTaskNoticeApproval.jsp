<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采样任务通知审批 -->
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
</head>
<body>
<form class="layui-form form-top" action="">
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label label-revise">采样单号 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_number"  lay-verify="" placeholder="请输入采样单号" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<%--<div class="layui-inline">
            <label class="layui-form-label label-revise">委托地址 :</label>
            <div class="layui-input-block">
                <input type="text" name="currency_string5" lay-verify="" placeholder="请输入委托地址" autocomplete="off" class="layui-input input-revise">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label label-revise">委托单位 :</label>
            <div class="layui-input-block">
                <input type="text" name="currency_string10" lay-verify="" placeholder="请输入委托单位名称" autocomplete="off" class="layui-input input-revise">
            </div>
        </div>--%>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">开始时间 :</label>
			<div class="layui-input-block">
				<input name="startDate" type="text" class="layui-input input-revise date-revise" id="date1" placeholder="任务下达时间">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">结束时间 :</label>
			<div class="layui-input-block">
				<input name="endDate" type="text" class="layui-input input-revise date-revise" id="date2" placeholder="要求完成时间">
			</div>
		</div>
		<div class="layui-inline">
			<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-xs button-revise" lay-submit="">
				检索
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

        var currency_type = 43;
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
            ,url: 'Currency/selectCurrencyApprover.action?currency_type='+ currency_type+"&currency_string="+staffid //数据接口
            ,page: true //开启分页
            ,toolbar: true
            ,title: '采样任务通知审批'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'currency_number', title: '采样单号', minWidth:200}
                ,{field: 'currency_string2', title: '项目名称', minWidth:100}
                //,{field: 'currency_string3', title: '联系人', minWidth:80}
                //,{field: 'currency_string4', title: '联系电话', minWidth:100}
                //,{field: 'currency_string5', title: '委托单位地址', minWidth:200}
                //,{field: 'currency_string10', title: '委托单位名称', minWidth:120}
                ,{field: 'currency_string7', title: '报表编码', minWidth:100}
                ,{field: 'currency_int2', title: '样品来源', minWidth:100,templet:'<div>{{d.currency_int2 == "1" ? "现场采样" : "送样"}}</div>'}
                ,{field: 'currency_date2', title: '采样完成时间', sort: true, minWidth:120, templet:'<div>{{ Format(d.currency_date2,"yyyy-MM-dd")}}</div>'}
                ,{field: 'currency_string8', title: '检测类型', minWidth:100}
                ,{field: 'currency_date3', title: '协议完成时间', sort: true, minWidth:120, templet:'<div>{{ Format(d.currency_date3,"yyyy-MM-dd")}}</div>'}
                //,{field: 'currency_string9', title: '执行标准', minWidth:100}
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
                    content: 'Xinze/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+currency_type //iframe的url currency_id通用审批流主键
                });
            } else if(layEvent === 'del'){ //删除
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '详情',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: 'Currency/approvalProgress.action?currency_id='+data.currency_id+"&current_approvalCount="
                    +data.current_approvalCount+"&approver_count="+data.approver_count+"&approvalOpinion_type=43"//iframe的url
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
                    content: 'Currency/approvalOpinion.action?approval_id=43&currency_id='+data.currency_id
                });
            }
        });

    });
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测登记 -->
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

<!-- 		<script type="text/html" id="toolbarDemo"> -->
<!-- 			<div class="layui-btn-container"> -->
<!-- 				<button class="layui-btn layui-btn-xs" lay-event="add">检测登记表</button> -->
<!-- 			</div> -->
<!-- 		</script> -->
<!-- 		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> -->
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
	<%--<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">检测登记</a>--%>
	<%--<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="approval">审批详情</a>--%>
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
            ,url: 'Currency/selectCurrencyList.action?currency_type=45&currency_int=-1' //查询已经完成的
            ,page: true //开启分页
            ,toolbar: true
            ,title: '检测登记'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'currency_number', title: '编码单号', minWidth:200, sort:true}
				,{field: 'currency_int2', title: '是否超期', minWidth: 120,templet:'<div>{{d.currency_int2 == 0 ? "超期" : "未超期"}}</div>'}
				,{field: 'currency_string3', title: '检测任务编码', minWidth:150}
                ,{field: 'currency_string2', title: '检测开始时间', minWidth:150}
                ,{field: 'currency_money2', title: '检测限制天数', minWidth:80}
                //,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:210}
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
                    content: 'Currency/currencyDetails.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
                });
            } else if(layEvent === 'edit'){ //编辑
                layer.open({
                    type: 2,
                    title: '检测登记表修改',
                    //shadeClose: true,
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
            } else if(layEvent === 'del'){ //检测登记
                $.ajax({
                    url:"Xinze/selectJianCeCount.action"
                    ,type:"post"
                    ,data:{"currency_details_id":data.currency_details_id}
                    ,dataType:"JSON"
                    ,success:function (res) {
                        console.log(res.data);
                        if(res.data == 0){
                            layer.open({
                                type: 2,
                                // skin:'layui-layer-molv', //layui-layer-lan
                                title: '检测登记',
                                shadeClose: true,
                                shade: 0.8,
                                maxmin: true,
                                area: ['80%', '80%'],
                                content: 'testingProcess/testingProcess/testingRegisterForm.action?currency_id='+data.currency_id+'&currency_type='+data.currency_type+'&currency_details_id='+data.currency_details_id+'&id='+data.id //iframe的url currency_id通用审批流主键
                            });
                        }else {
                            alert("已经检测登记过，请另选");
                            tableInner.reload({
                                where: data.field
                                //重新从第 1 页开始
                                ,page: {curr: 1}
                            });
                            /*alert("已经检测两次不能再次进行检测,提交失败！！");
                            $.post("Xinze/updateJianceBiaoshi.action","currency_details_id="+data.id,function (res) {
                                if(res.data ==1){
                                    //重载表格
                                    tableInner.reload({
                                        where: data.field
                                        //重新从第 1 页开始
                                        ,page: {curr: 1}
                                    });
                                }

                            });*/
                        }

                    }
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
        /*//监听头工具栏事件
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
                        content: 'testingProcess/testingProcess/testingRegisterForm.action"' //iframe的url
                    });
                break;
                case 'delete':
                    layer.msg('删除');
                break;
                case 'update':
                    layer.msg('编辑');
                break;
            };
        });*/

    });
</script>
</body>
</html>
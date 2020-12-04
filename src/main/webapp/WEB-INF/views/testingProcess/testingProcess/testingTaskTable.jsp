<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测任务表 -->
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
			<label class="layui-form-label label-revise">样品编码 :</label>
			<div class="layui-input-block">
				<input type="text" name="details_string" required  lay-verify="" placeholder="请输入样品编码" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">检测项目 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string17" required  lay-verify="" placeholder="请输入检测项目" autocomplete="off" class="layui-input input-revise">
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
			<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
				检索
			</button>
		</div>
	</div>
</form>

<table id="tab" lay-filter="table"></table>

<script type="text/html" id="toolbarDemo">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-xs" lay-event="add">批量领取</button>
	</div>
</script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">领取</a>
	<%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="detail">撤回</a>--%>
	<%--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
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
            ,url: 'Xinze/selectLatest1.action?currency_type=45&currency_int=2' //数据接口
            ,page: true //开启分页
			,toolbar: '#toolbarDemo'
            ,title: '检测任务表'
// 			    	,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'details_int', title: '是否领取', minWidth: 80,templet:'<div>{{d.details_int != 0 ? "已领取" : "未领取"}}</div>'}
                ,{field: 'details_string3', title: '领取人', minWidth: 100,templet:'<div>{{d.details_string3 == null ? "无" : d.details_string3}}</div>'}
                ,{field: 'details_string', title: '样品编码', minWidth: 150}
				,{field: 'currency_string', title: '项目名称', minWidth: 130}
                ,{field: 'details_string2', title: '检测项目', minWidth: 100}
                ,{field: 'details_money3', title: '样品数量', minWidth: 80}
                ,{field: 'currency_string2', title: '检测开始时间', minWidth: 130}
                ,{field: 'currency_money', title: '检测限制天数', minWidth: 120}
                ,{field: 'details_string6', title: '备注', minWidth: 200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:150}
            ]]

        });

        //监听工具条
        table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            console.log(data);
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看
                $.ajax({
                    url:'Xinze/selectOneDetails.action'
                    ,type:"post"
                    ,data:{"id":data.id}
                    ,dataType:"JSON"
                    ,success:function (res) {
                        if(res.data[0].code_int != 2){
                            alert("该任務已登記，無法撤回！！！");
                        }else {
                            layer.confirm('确认撤回', function(index){
                                $.ajax({
                                    url:'Xinze/taskRecall.action'
                                    ,type:"post"
                                    ,data:{
                                        "details_money":data.id,
                                        "currency_id":data.currency_id,
                                        "currency_details_id":data.currency_details_id,
                                    }
                                    ,dataType:"JSON"
                                    ,success:function (result) {
                                        layer.msg(result.msg);
                                    }
                                });
                            });
                        }

                    }
                });
                //do somehing
            } else if(layEvent === 'del'){ //删除
                layer.confirm('确认删除', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){ //编辑
                //do something
                if(data.details_int != '未领取' && data.details_int != null){
                    alert("请勿重复领取！！！");
                }else {
                    layer.open({
                        type: 2,
                        // skin:'layui-layer-molv', //layui-layer-lan
                        title: '详情',
                        shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['80%', '80%'],
                        content: 'testingProcess/testingProcess/testingTaskTableForm.action?detailsId='+data.currency_details_id //iframe的url currency_id通用审批流主键
                    });
                }
                /*$.ajax({
                    url:'Xinze/selectOneDetails.action'
                    ,type:"post"
                    ,data:{"id":data.id}
                    ,dataType:"JSON"
                    ,success:function (res) {
                        if(res.data[0].code_int != null){
                            alert("请勿重复领取！！！");
                        }else {
                            layer.open({
                                type: 2,
                                // skin:'layui-layer-molv', //layui-layer-lan
                                title: '详情',
                                shadeClose: true,
                                shade: 0.8,
                                maxmin: true,
                                area: ['80%', '80%'],
                                content: 'testingProcess/testingProcess/testingTaskTableForm.action?currency_id='+data.currency_id+'&currency_details_id='+data.currency_details_id+'&id='+data.id //iframe的url currency_id通用审批流主键
                            });
                        }

                    }
                });*/

                //同步更新缓存对应的值
                obj.update({
                    // username: '123'
                    // ,title: 'xxx'
                    // 字段 : '要更新的值',
                });
            }
        });
        //监听头工具栏事件
        table.on('toolbar(table)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id),
			data = checkStatus.data;
            if (data.length < 1){
            	layer.msg("请选中至少一行数据");
            	return false;
			}
			var detailsId = "";
            var currency_id = data[0].currency_id;
            for (var i=0;i<data.length;i++){
            	detailsId += data[i].currency_details_id +",";
			}
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
                        content: 'testingProcess/testingProcess/testingTaskTableForm.action?detailsId='+detailsId //iframe的url
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--报告编码、流转单打印 -->
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
					<label class="layui-form-label label-revise">报表编码 :</label>
					<div class="layui-input-block">
						<input type="text" name="currency_string7" required  lay-verify="" placeholder="请输入报表编码" autocomplete="off" class="layui-input input-revise">
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
				<button class="layui-btn layui-btn-xs" lay-event="add"></button>
			</div>
		</script>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="form1">样品编码表</a>
			<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="form2">样品流转单</a>
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
					,url: 'Xinze/selectApplicantCurrency.action?currency_type=45&currency_int=2' //数据接口
					,page: true //开启分页
					// ,toolbar: '#toolbarDemo'
			    	,title: '报告编码及流转单打印'
// 			    	,totalRow: true //开启合计行
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'currency_string2', title: '项目名称', minWidth: 100}
						,{field: 'currency_string7', title: '报表编码', minWidth: 100}
						,{field: 'currency_date3', title: '任务要求完成时间', minWidth: 140, sort: true, templet:'<div>{{ Format(d.currency_date3,"yyyy-MM-dd")}}</div>'}
						,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:150}
					]]
				});

                //监听头工具栏事件
                table.on('tool(table)', function(obj){
                    //var checkStatus = table.checkStatus(obj.config.id);
                    var data = obj.data; //获得当前行数据
                    var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                    var tr = obj.tr; //获得当前行 tr 的DOM对象
                     if(layEvent === 'form1'){ //样品编码表
                        layer.open({
                            type: 2,
                            // skin:'layui-layer-molv', //layui-layer-lan
                            title: '样品编码表',
                            //shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['80%', '80%'],
                            content: 'testingProcess/samplingMessage/sampleCodingForm.action?currency_id='+data.currency_id //iframe的url
                        });
                    } else if(layEvent === 'form2'){ //样品流转单
                         layer.open({
                             type: 2,
                             // skin:'layui-layer-molv', //layui-layer-lan
                             title: '样品流转单',
                             //shadeClose: true,
                             shade: 0.8,
                             maxmin: true,
                             area: ['80%', '80%'],
                             content: 'testingProcess/samplingMessage/sampleCirculationForm.action?currency_id='+data.currency_id //iframe的url
                         });
                     }
			    });


			});
		</script> 
	</body>
</html>
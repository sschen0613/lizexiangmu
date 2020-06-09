<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--货品流转信息 -->
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
					<label class="layui-form-label label-revise">条码标识 :</label>
					<div class="layui-input-block">
						<input name="barcode" type="text" class="layui-input input-revise date-revise" id="barcode" placeholder="请输入条码">
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
            <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
            <%--<a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="barcode">查看条码</a>--%>
            <%--<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">撤回</a>
            <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="approval">审批详情</a>--%>
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
				    	//开始日选好后,判断结束日期是否合法
				    	if($('#date2').val() != ''){
				    		 value <= $('#date2').val() ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date1').val('');}); 
				    	}
				    }
				});
				laydate.render({
					elem: '#date2' //指定元素
			        ,done: function (value, date, endDate) {
			            // console.log(value); //得到日期生成的值
				    	//结束日选好后,判断开始日期是否合法
				    	if($('#date1').val() != ''){
				    		$('#date1').val() <= value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date2').val('');});
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
					,url: 'Currency/selectFlowMessage.action?' //数据接口
					,page: true //开启分页
					,toolbar: '#toolbarDemo'
			    	,title: '货品流转信息表'
					,cols: [[ //表头
						{field: 'barcode', title: '条码标识', minWidth:40, sort:true}
						,{field: 'productName', title: '配件名称', sort: true, minWidth:80}
						,{field: 'productCode', title: '配件编码', minWidth:40}
                        ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:60}
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
                            title: '条码录入申请表',
                            //shadeClose: true,
                            shade: 0.8,
                            maxmin: true,
                            area: ['80%', '80%'],
                            content: 'storage/repairWarehousingApproval.action?barcode='+data.barcode//+data.currency_type //iframe的url
                        });
                    }
                });

			});
		</script> 
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 办公用品审批 -->
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link rel="stylesheet" href="layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="css/form_top_revise.css">
		<link rel="stylesheet" type="text/css" href="css/table.css">
		<script src="js/echarts.js"></script>
		<script src="layui/layui.js"></script>
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/function_tool.js"></script>
	</head>
	<body>
	 	<form class="layui-form form-top" action="">
	 		<div class="layui-form-item">
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
				</div> 
			</div>
		</form>

		<table id="tab" lay-filter="table"></table>

		<%--<div id="statisticList" style="width: 700px;height: 400px;"></div>--%>

		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
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

				var currency_type = 71;
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
					url : "Department/selectDingDepartmentId.action",
					type : "post",
					data : {},
					dataType : "JSON",
					success : function(res){
						var html = '<option value="">请选择部门</option>';
						$.each(res.data,function(index,item){
							html += '<option value="'+item.department_Id+'">'+item.department_Name+'</option>';
						});
						$('#department').html(html);
						form.render('select');
					}
				});

				//监听检索按钮
				form.on('submit(search)', function(data){
					// console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
					// console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
					data = data.field //当前容器的全部表单字段，名值对形式：{name: value}
	  
					//重载表格
					table.reload("tab" ,{
						page: true,
						where : {"currency_date2":data.currency_date2,"currency_date3":data.currency_date3},
					});
	  
					return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});

				//创建table实例					
				table.render({
					elem: '#tab'
					,url: 'office/selectOfficeSuppliesAmountList.action?currency_type='+ currency_type+"&currency_string="+staffid //数据接口
					,page: true //开启分页
					,toolbar: '#toolbarDemo'
			    	,title: '办公用品领取统计表'
 			    	,totalRow: true //开启合计行
					,id : "tab"
					,cols: [[ //表头
						{type: 'checkbox', fixed: 'left'}
						,{field: 'department_name', title: '申请部门', minWidth:100}
						,{field: 'currency_money', title: '总额', minWidth:100}
						,{title:'操作', toolbar: '#barDemo', minWidth:250}
					]]
				});

				//监听工具条
				table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的DOM对象
				 
					if(layEvent === 'detail'){ //查看

                        var currency_date2= $('#date1').val();
                        var currency_date3= $('#date2').val();

                        if (currency_date2 == ""){
                            currency_date2 = 1;
                        }

                        if (currency_date3 == ""){
                            currency_date3 = 2;
                        }

						layer.open({
							type: 2,
							// skin:'layui-layer-molv', //layui-layer-lan
							title: '详情',
							shadeClose: true,
							shade: 0.8,
							maxmin: true,
							area: ['80%', '80%'],
							content: 'office/officeSuppliesStatisticDetails.action?currency_type='+currency_type+'&currency_department='+data.department_id
							+'&currency_date2='+currency_date2+'&currency_date3='+currency_date3//iframe的url currency_id通用审批流主键
						}); 
					}
				});

				//var myChart = echarts.init(document.getElementById('statisticList'));
				var option = {
					title: {
						text: '各部门办公用品使用情况',
						subtext:'单位：元',          //---副标题内容样式
						subtextStyle:{
							color:'#bbb'
						},
					},
					tooltip: {
						trigger: 'axis',
						axisPointer: {
							type: 'shadow'
						}
					},
					xAxis: {
						name: '部门',
						type: 'category',
						data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
						triggerEvent:true
					},
					yAxis: {
						type: 'value',
						name: '金额',
					},
					series: [{
						data: [120, 200, 150, 80, 70, 110, 130],
						type: 'bar',
						label:{						//---图形上的文本标签
							show:true,
							position:'insideTop',	//---相对位置
							rotate:0,				//---旋转角度
							color:'#eee',
						}
					}]
				};
				/*myChart.setOption(option);

				myChart.on('click', function (params) {
					console.log(params.value);
					console.log(params[1].ind)
					console.log(params);
				});*/

			});
		</script>
	</body>
</html>
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
<table id="tab" lay-filter="table"></table>

<script type="text/html" id="barDemo">

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
		var url = 'Currency/getDevilLiquorDetail.action?currency_type=78';
		var currency_date2 = ${param.currency_date2}; //string类型
		var currency_date3 = ${param.currency_date3}; //string类型
		var currency_string9 = "${param.currency_string9}"; //string类型
		url = url + '&currency_string9='+currency_string9;
		if (currency_date2 !=1){
			url = url +'&currency_date2'+currency_date2
		}

		if (currency_date3 !=1){
			url = url +'&currency_date3='+currency_date3;
		}

        //创建table实例
        var tableInner = table.render({
            elem: '#tab'
            //,url: 'Currency/getDevilLiquorDetail.action?currency_type=78&currency_string9='+currency_string9+'&currency_date2'+currency_date2+'&currency_date3'+currency_date3
			,url: url //数据接口
            ,page: false //开启分页
            ,toolbar: '#toolbarDemo'
            ,title: '废液明细表'
            ,cols: [[
				{fixed: 'left',field: 'details_string', title: '编码', minWidth:60}
				,{field: 'currency_string3', title: '地区', minWidth:50}
				,{field: 'details_string2', title: '重量(kg)', minWidth:20}
                ,{field: 'currency_string8', title: '站点名称', minWidth:50}
				,{field: 'details_int', title: '状态', minWidth:50,templet:'<div>{{d.details_int == "1" ? "已转移" : "未转移"}}</div>'}
				,{field: 'currency_date', title: '产生日期', sort: true, minWidth:80, templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
				,{field: 'details_date', title: '转移日期', sort: true, minWidth:80, templet:'<div>{{ Format(d.details_date,"yyyy-MM-dd")}}</div>'}
                ,{field: 'currency_string11', title: '转移大区', minWidth:40}
            ]]
        });

    });
</script>
</body>
</html>
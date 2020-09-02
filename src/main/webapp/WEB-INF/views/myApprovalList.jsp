<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 我的审批列表页 -->
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
			<label class="layui-form-label label-revise">申请类别 :</label>
			<div class="layui-input-block">
				<select name="currency_type" autocomplete="off" id="currency_type" class="layui-select" lay-search>
					<option value="">==请选择相应类别==</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label label-revise">审批状态 :</label>
			<div class="layui-input-block">
				<%--该字段用来判断审批人是否审批--%>
				<select name="currency_int6" autocomplete="off" class="layui-select" lay-search>
					<option value="">==请选择审批状态==</option>
					<option value="0">未审批</option>
					<option value="1">已通过</option>
					<option value="2">未通过</option>
				</select>
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
<!-- 		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a> -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">审批</a>
	<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="approval">审批详情</a>
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

        $.ajax({
            url:'Currency/findCurrencyNameByTyep1.action'
            ,type:'post'
            ,data:{}
            ,dataType:'JSON'
            ,success:function (res) {
                var html = '<option value="">请选相应类别</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.approval_id+'">'+item.approval_name+'</option>';
                });
                $('#currency_type').html(html);
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

        //创建table实例
        var staffid ="${sessionScope.systemStaff.dingding_staffid }";
        var tableInner = table.render({
            elem: '#tab'
            ,url: 'Currency/selectCurrencyApprover.action?currency_string='+staffid //数据接口
            ,page: true //开启分页
            ,toolbar: '#toolbarDemo'
            ,title: '我的审批'
            // ,totalRow: true //开启合计行, totalRowText: '合计'
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'currency_number', title: '编号', minWidth:200, sort:true}
                ,{field: 'currency_date', title: '申请日期', sort: true, minWidth:100,templet:'<div>{{ Format(d.currency_date,"yyyy-MM-dd")}}</div>'}
                ,{field: 'currency_type', title: '申请类别', minWidth:200,templet:'<div>{{ Type(d.currency_type)}}</div>'}
                ,{field: 'currency_string7', title: '备注', minWidth:200}
                ,{field: 'approver_progress', title: '审批进度', minWidth:100, sort: true, templet:'<div>{{ d.current_approvalCount/d.approver_count*100 + "%" }}</div>'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:150}
            ]]
        });

        //监听工具条
        table.on('tool(table)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象

            if(layEvent === 'detail'){ //查看明细
                var url = 'Currency/currencyDetails.action?currency_id=';

                if (data.currency_type == 2){//材料类出库
					url = 'storage/outlibraryOfMaterialClassApprovalDetail.action?currency_id=';
				}
                if (data.currency_type ==8){//备货采购
                    url = 'storage/requisitionsOfStockupSuppliesApprovalDetail.action?currency_id=';
                }
                if (data.currency_type == 9){//销售采购
                    url = 'storage/requisitionsOfSaleSuppliesApprovalDetail.action?currency_id=';
                }
                if (data.currency_type == 10){//运营配件
                    url = 'storage/setupAllocationApproverDetail.action?currency_id=';
                }
                if (data.currency_type == 13){//销售类出库
                    url = 'storage/outlibraryOfSaleClassSuppliesApprovalDetail.action?currency_id=';
                }
                if (data.currency_type == 14){//内部出库
                    url = 'storage/outlibraryOfAllocationSuppliesApprovalDetail.action?currency_id=';
                }
                if (data.currency_type == 18){//药品出库
                    url = 'storage/outlibraryOfDrugsSuppliesApprovalDetail.action?currency_id=';
                }
                if (data.currency_type == 17){//药品采购
                    url = 'storage/requisitionsOfDrugsSuppliesApprovalDetail.action?currency_id=';
                }

                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '查看明细',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: url+data.currency_id+'&currency_type='+data.currency_type //iframe的url currency_id通用审批流主键
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
            } else if(layEvent === 'edit') { //审批
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '审批',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['30%', '50%'],
                    content: 'Currency/approvalOpinion.action?approval_id=' + data.currency_type + '&currency_id=' + data.currency_id
                });
            }
        });
    });

    function Type(type) {
        var result = "";
        $.ajax({
            url : "Currency/findCurrencyNameByTyep.action",
            type : "post",
            data : {"currency_type" : type},
            dataType : "JSON",
            async:false,
            success : function (res){
                result = res.msg;
            }
        });
        return result;
    }
</script>
</body>
</html>
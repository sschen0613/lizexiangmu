<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 丽泽销售合同盖章申请 -->
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
			<label class="layui-form-label label-revise">合同编号 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string" placeholder="合同编号 :" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">业务员 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string11" placeholder="业务员 :" autocomplete="off" class="layui-input input-revise">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">地区 :</label>
			<div class="layui-input-block select-revise">
				<select name="currency_string10" id="area" lay-search class="select-revise">
					<option value="">请选择</option>
				</select>
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">客户名称 :</label>
			<div class="layui-input-block select-revise">
				<select name="currency_string2" id="customer_name" lay-search class="select-revise">
					<option value="">请选择</option>
				</select>
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">合同签订日期起 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string3" placeholder="合同签订日期起" id="date3" class="layui-input input-revise date-revise">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">合同签订日期止 :</label>
			<div class="layui-input-block">
				<input type="text" name="currency_string7" placeholder="合同签订日期止" id="date4" class="layui-input input-revise date-revise">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">来款时间起 :</label>
			<div class="layui-input-block">
				<input name="currency_string8" type="text" class="layui-input input-revise date-revise" id="date5" placeholder="来款时间起">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label label-revise">来款时间止 :</label>
			<div class="layui-input-block">
				<input name="currency_string9" type="text" class="layui-input input-revise date-revise" id="date6" placeholder="来款时间止">
			</div>
		</div>
	</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<button lay-filter="search" class="layui-btn layui-btn-warm layui-btn-sm button-revise" lay-submit="">
					检索
				</button>
				<button lay-filter="out" class="layui-btn layui-btn-danger layui-btn-xs button-revise" lay-submit="">
					导出
				</button>
			</div>
		</div>
	</div>
</form>

<table id="tab" lay-filter="table"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs layui-btn-primary" lay-event="detail">查看明细</a>
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
            ,type: 'date'
        });
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'date'
        });

        laydate.render({
            elem: '#date3' //指定元素
            ,type: 'date' //yyyy-MM-dd HH:mm:ss
        });

        laydate.render({
            elem: '#date4' //指定元素
            ,type: 'date' //yyyy-MM-dd HH:mm:ss
        });

        laydate.render({
            elem: '#date5' //指定元素
            ,type: 'date' //yyyy-MM-dd HH:mm:ss
        });

        laydate.render({
            elem: '#date6' //指定元素
            ,type: 'date' //yyyy-MM-dd HH:mm:ss
        });

        //监听导出按钮
        form.on('submit(out)', function(data){
            var currency_string = $('input[name="currency_string"]').val();//合同编号
            var currency_string11 = $('input[name="currency_string11"]').val();//业务员
            //var currency_string10 = $('input[name="currency_string10"]').val();//地区
            var currency_string10 = $('#area').val();//地区
            var currency_string2 = $('#customer_name').val();//客户名称
            var currency_string3 = $('input[name="currency_string3"]').val();//签订时间起
            var currency_string7 = $('input[name="currency_string7"]').val();//签订时间止
            var currency_string8 = $('input[name="currency_string8"]').val();//来款时间起
            var currency_string9 = $('input[name="currency_string9"]').val();//来款时间止

            var url = 'Currency/selectContractStatement.action?currency_string6=01';
            if (currency_string != null && currency_string != ''){
                url += '&currency_string='+currency_string;
            }
            if (currency_string2 != null && currency_string2 != ''){
                url += '&currency_string2='+currency_string2;
            }
            if (currency_string3 != null && currency_string3 != ''){
                url += '&currency_string3='+currency_string3;
            }
            if (currency_string7 != null && currency_string7 != ''){
                url += '&currency_string7='+currency_string7;
            }
            if (currency_string8 != null && currency_string8 != ''){
                url += '&currency_string8='+currency_string8;
            }
            if (currency_string9 != null && currency_string9 != ''){
                url += '&currency_string9='+currency_string9;
            }
            if (currency_string11 != null && currency_string11 != ''){
                url += '&currency_string11='+currency_string11;
            }

            if (currency_string10 != null && currency_string10 != ''){
                url += '&currency_string10='+currency_string10;
            }
            $.ajax({
                url: url,
                dataType: 'json',
                success: function(res) {
                    // 假如返回的 res.data 是需要导出的列表数据
                    //console.log(res.data); [{name: 'wang', age: 18, sex: '男'}, {name: 'layui', age: 3, sex: '女'}]
                    // 1. 数组头部新增表头
                    //res.data.unshift({currency_number: '编号',currency_date: '日期', currency_string8: '仓库', currency_string3: '合同编号'});
                    //2. 如果需要调整顺序，请执行梳理函数
                    //var exportData = [{currency_number: '编号',currency_date: '日期', currency_string8: '仓库', currency_string3: '合同编号'}];
                    var data = LAY_EXCEL.filterExportData(res.data, {
                        /* currency_number:'currency_number',
                         staff_name:"staff_name",
                         department_name:"department_name",
                         currency_date:function (value,line,data) {
                             return Format0(value,"yyyy-MM-dd HH:mm:ss");
                         },*/
                        cDCName:"cDCName",
                        cCusName:"cCusName",
                        strContractID:"strContractID",
                        strCode:"strCode",
                        strName:"strName",
                        dblQuantity:"dblQuantity",
                        dblPrice:"dblPrice"
                        ,dblSum:"dblSum"
                        ,dblTotalCurrency:"dblTotalCurrency",
                        receiveAmount:"receiveAmount",
                        spareMaoney:"spareMaoney",
                        //strContractStartDate:"strContractStartDate",
                        /*strContractStartDate:function (value,line,data) {
                            return Format0(value,"yyyy-MM-dd");
                        },
                        //strContractEndDate:"strContractEndDate",
                        strContractEndDate:function (value,line,data) {
                            return Format0(value,"yyyy-MM-dd");
                        },*/
                        //strContractOrderDate:"strContractOrderDate",
                        strContractOrderDate:function (value,line,data) {
                            return Format0(value,"yyyy-MM-dd");
                        },
                        moneyDate:"moneyDate",
                        billDate:"billDate",
                        clause:"clause",
                        parts:"parts",
                        test:"test",
                        dtPayDate:"dtPayDate",
                        cDefine14:"cDefine14",
                        cDefine11:"cDefine11",
                        cPersonName:"cPersonName"
						,outInfo:"outInfo"
                    });
                    data.unshift({
                        cDCName: '区县',cCusName:"企业名称",strContractID:"合同编号"
                        ,strCode: '标的编码',strName: '标的名称',dblQuantity:"数量",dblPrice:"含税原币单价",dblSum:"含税原币金额"
                        ,dblTotalCurrency:"合同总金额（元）", receiveAmount:"已付金额（元）",spareMaoney:"欠款金额（元）"
                        /*, strContractStartDate:"合同起",strContractEndDate:"合同止",*/
                        ,strContractOrderDate: '签订时间',moneyDate: '来款时间', billDate:"开票时间"
                        ,clause:"合同付款约定",parts:"配件特殊约定",test:"检测比对约定"
                        ,dtPayDate:"约定付款日期",cDefine14:"期初合同已收款", cDefine11:"期初合同已开票",cPersonName:"业务员"
						,outInfo:"出库信息"
                    });
                    // 3. 执行导出函数，系统会弹出弹框
                    LAY_EXCEL.exportExcel(data, '销售类合同报表.xlsx', 'xlsx');
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
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

        $.ajax({
            url:'System/getRegion.action',
            type:'post',
            data:{},
            dataType:'JSON',
            success:function(res){
                var html = '<option value="">请选择地区</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.cDCCode+'">'+item.cDCName+'</option>';
                });
                $('#area').html(html);
                form.render('select');
            }
        });

        $.ajax({
            url:'System/selectAllUser.action',
            type:'post',
            data:{},
            dataType:'JSON',
            success:function(res){
                var html = '<option value="">请选择客户名称</option>';
                $.each(res.data,function(index,item){
                    html += '<option value="'+item.cCusCode+'" data-cCusPPerson="'+item.cCusPPerson+'" data-dept="'+item.cCusDepart+'">'+item.cCusName+'</option>'
                });
                $('#customer_name').html(html);
                form.render('select');
            }
        });

        //创建table实例
        var tableInner = table.render({
            elem: '#tab'
            ,url: 'Currency/selectContractStatement.action?currency_string6=01' //数据接口
            ,page: true //开启分页
            ,toolbar: '#toolbarDemo'
            ,title: '合同报表'
// 			,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'number', title: '序号', minWidth:80, sort:true}
                ,{field: 'cDCName', title: '区县', minWidth:100, sort:true}
                ,{field: 'cCusName', title: '企业名称', minWidth:200, sort:true}
                ,{field: 'strContractID', title: '合同编号', minWidth:150, sort:true}
                ,{field: 'strCode', title: '标的编码', minWidth:100, sort:true}
                ,{field: 'strName', title: '标的名称', minWidth:200, sort:true}
                ,{field: 'dblQuantity', title: '数量', minWidth:80, sort:true}
                ,{field: 'dblPrice', title: '含税原币单价', minWidth:120, sort:true}
                ,{field: 'dblSum', title: '含税原币金额', minWidth:120, sort:true}
                ,{field: 'dblTotalCurrency', title: '合同总金额(元)', minWidth:130, sort:true}
                ,{field: 'receiveAmount', title: '已付金额(元)', minWidth:120, sort:true}
                ,{field: 'spareMaoney', title: '欠款金额(元)', minWidth:100, sort:true}
                ,{field: 'strContractOrderDate', title: '签订时间', sort: true, minWidth:100, templet:'<div>{{ subDate(d.strContractOrderDate)}}</div>'}
                ,{field: 'moneyDate', title: '来款时间', sort: true, minWidth:100}
                ,{field: 'billDate', title: '开票时间', sort: true, minWidth:100}
                ,{field: 'clause', title: '合同付款约定', minWidth:150}
                ,{field: 'parts', title: '配件特殊规定', minWidth:100}
                ,{field: 'test', title: '检测比对约定', minWidth:200}
                ,{field: 'dtPayDate', title: '约定付款日期', minWidth:120}
                ,{field: 'cDefine14', title: '期初合同已收款', minWidth:100}
                ,{field: 'cDefine11', title: '期出合同已开票', minWidth:100}
                ,{field: 'cPersonName', title: '业务员', minWidth:100}
                ,{field: 'outInfo', title: '出库信息', minWidth:200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', minWidth:100}
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
                    content: 'Currency/contractDetails.action?strContractID='+data.strContractID//iframe的url currency_id通用审批流主键
                });
            } else if(layEvent === 'edit'){ //编辑
                layer.open({
                    type: 2,
                    title: '',
                    //shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['80%', '80%'],
                    content: '' //iframe的url
                });
                //同步更新缓存对应的值
                obj.update({
                    // username: '123'
                    // ,title: 'xxx'
                    // 字段 : '要更新的值',
                });
            } else if(layEvent === 'del'){ //撤回
                layer.confirm('确认撤回申请？', function(index){
                    //向服务端发送删除指令
                    $.ajax({
                        url:'Currency/deleteCurrencyApply.action',
                        type:'post',
                        data:{'currency_id':data.currency_id,'currency_type':data.currency_type},
                        dataType:'JSON',
                        success:function(result){
                            if(result.msg==null || result.msg == ""){
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(index);
                                layer.msg('您的申请已成功撤回',{time: 2000});
                            }else{
                                layer.msg(result.msg);
                            }
                        }
                    });
                });
            } else if(layEvent === 'approval'){ //审批详情
                layer.open({
                    type: 2,
                    // skin:'layui-layer-molv', //layui-layer-lan
                    title: '审批详情',
                    //shadeClose: true,
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
                        title: '丽泽销售合同盖章申请单填写',
                        shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['80%', '80%'],
                        content: 'contract/salesContractSealForm.action' //iframe的url
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 检测业务表 -->
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="layui/css/layui.css">
	<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
	<link rel="stylesheet" type="text/css" href="css/form_open_revise.css">
	<link rel="stylesheet" type="text/css" href="css/search_bar_custom.css">
	<script src="layui/layui.js"></script>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/form_init.js"></script>
	<script src="js/function_tool.js"></script>
</head>
<body>
<h2 class="h-open"></h2>
<form class="layui-form form-open" action="">
	<table class="layui-table table-open">
		<thead>
		<tr>
			<th colspan="10" class="table-h">检测业务表</th>
		</tr>
		</thead>
		<tbody >
		<tr>
			<td colspan="2">说明</td>
			<td colspan="8"><input type="illustration" name="illustration" value="用于信泽有限公司业务科办理采样业务的下达任务表单" readonly></td>
		</tr>
		<tr>
			<td colspan="2">下发部门</td>
			<td colspan="2"><input id='department' name="issued_department" class="layui-select" lay-filter="issued_department" lay-verify="required"  readonly/></td>
			<td>下发人</td>
			<td colspan="2"><input type="text" id='staffName' name="issued_person" lay-verify="required" readonly></td>
			<td>下发日期</td>
			<td colspan="2"><input type="text" name="issued_date" class="layui-input" id="date" placeholder="请选择日期" autocomplete="off" lay-verify="required" readonly></td>
		</tr>
		<tr>
			<td colspan="2" style="background-color: lightskyblue">数据回调</td>
			<td id="contractBack" class="container" colspan="9">
				<input id='contract_id' name="contract_id" class="contract-search-box back" placeholder="输入关键字查询,调取历史下发信息,也可自行填写,非必填!!!">
				<div class="list-container back" style="display:none;">
					<ul></ul>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">下发来源</td>
			<td colspan="2">
				<select name="source" id="source" lay-filter="source" lay-verify="required">
					<option value="1">信泽</option>
					<option value="2">丽泽</option>
				</select>
			</td>
		</tr>
		<tr id="contract_tr">
			<td colspan="2">合同编号</td>
			<td colspan="8" id="contractNumber" class="container">
				<input id='contract_number' name="contract_number" class="contract-search-box number" placeholder="输入关键字查询" lay-verify="required">
				<div class="list-container number" style="display:none;">
					<ul></ul>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">项目名称</td>
			<td colspan="2"><input type="text" name="program_name" id="program_name" lay-verify="required"></td>
			<%--<td>联系人</td>
            <td colspan="1"><input type="text" name="contact_person" id="contact_person" lay-verify="required"></td>
            <td colspan="1">联系电话</td>
            <td colspan="4"> <input type="text" id="contact_phone" name="contact_phone" lay-verify="required"></td>--%>
			<%--</tr>--%>
			<%--<tr>
               <td>委托单位</td>
               <td colspan="3"><input type="text" id='client_department' name="client_department" class="layui-input"  lay-verify="required" /></td>
               <td>委托单位地址</td>
               <td colspan="5"><input type="text" id="entrust_adress" name="entrust_adress" class="layui-input" lay-verify="required"></td>
           </tr>--%>
			<%--<tr>--%>
			<td>采样完成时间</td>
			<td colspan="2"><input name="date1" type="text" class="layui-input" id="date1" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
			<td>报告编码</td>
			<td colspan="2"><input type="text" id="code" name="code" placeholder="请务必填写报告编码" autocomplete="off" lay-verify="required"></td>
		</tr>
		<tr>
			<td colspan="2">样品来源</td>
			<td colspan="2">
				<select  id='specimen_source' name="specimen_source" lay-verify="required">
					<option value="1">现场采样</option>
					<option value="2">送样</option>
				</select>
			</td>
			<td>检测类型</td>
			<td colspan="2"><select id="type" name="type" lay-filter="type" lay-search lay-verify="required">
				<option value="">==请选择类型==</option>
				<option value="自行检测">自行检测</option>
				<option value="常规检测">常规检测</option>
				<option value="建设项目竣工验收检测">建设项目竣工验收检测</option>
				<option value="环评现状检测">环评现状检测</option>
				<option value="季度比对检测">季度比对检测</option>
				<option value="验收比对检测">验收比对检测</option>
			</select>
			</td>
			<%--<td >检测完成时间</td>
            <td colspan="1"><input name="date3" type="text" class="layui-input" id="date3" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
            --%>
			<td>报告完成时间</td>
			<td colspan="2"><input name="date2" type="text" class="layui-input" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
		</tr>

		<%--<tr>
            <td>实施部门</td>
            <td><select id='implement_department' name="implement_department" class="layui-select" lay-filter="implement_department" lay-search lay-verify="required"></select></td>
            <td>实施人</td>
            <td><input type="text" id='implement_person' name="implement_person" lay-verify="required"></td>
            <td>接收日期</td>
            <td><input type="text" name="get_date" class="layui-input date-revise" id="date2" placeholder="请选择日期" autocomplete="off" lay-verify="required"></td>
        </tr>--%>
		<%--<tr>
            <td>任务内容</td>
            <td colspan="9"><input type="text" name="task_definition" placeholder="请务必填写任务内容" lay-verify="required"></td>
        </tr>
        <tr>
            <td>执行标准</td>
            <td colspan="9"><input type="text" id="standard" name="standard" placeholder="请务必填写执行标准" lay-verify="required"></td>
        </tr>--%>
		<tr>
			<td colspan="2">备注</td>
			<td colspan="8"><input type="text" id="remark" name="remark" autocomplete="off"></td>
		</tr>

		<tr>
			<th colspan="10" style="text-align: center;">采样任务明细</th>
		</tr>
		<tr>
			<%--<td >序号</td>--%>
			<td colspan="3">检测项目类别</td>
			<%--<td>检测点位</td>--%>
			<td>点位个数</td>
			<%--<td>检测项目</td>--%>
			<td>检测项目个数</td>
			<%--<td>方法依据</td>
			<td>限值</td>--%>
			<td>检测频次</td>
			<td>检测天数</td>
			<td>备注</td>
			<td>操作</td>
		</tr>
		<tr class="details">
			<%--<td><input type="text" name="number" value="1" readonly></td>--%>
			<td colspan="3">
				<select id="program_type1" name="program_type" lay-filter="program_type" lay-search lay-verify="required">
					<option value="">==请选择==</option>
					<option value="烟气常规检测">烟气常规检测</option>
					<option value="在线监测设备比对检测（气）">在线监测设备比对检测（气）</option>
					<option value="水的比对检测">水的比对检测</option>
					<option value="在线监测设备验收检测（超低）">在线监测设备验收检测（超低）</option>
					<option value="在线监测设备验收检测（非超低）">在线监测设备验收检测（非超低）</option>
					<option value="水质在线设备验收检测">水质在线设备验收检测</option>
					<option value="环评现状检测">环评现状检测</option>
					<option value="竣工验收检测">竣工验收检测</option>
					<option value="无组织土壤">无组织土壤</option>
					<option value="无组织噪声">无组织噪声</option>
					<option value="无组织废气">无组织废气</option>
					<option value="采水">采水</option>
				</select>
			</td>
			<%--<td><input type="text" name="detection_site" data-subItems="1" lay-verify="required"></td>--%>
			<td><input type="number" name="site_number" lay-verify="required"></td>
			<td><input type="number" name="program_number" lay-verify="required"></td>
			<%--<td class="items detection_program">
				<div class="items-details">
					<input type="text" name="detection_program" data-index="1" lay-verify="required">
					<span id="add" onclick="addItems(this);">&#43;</span>
				</div>
			</td>--%>
			<%--<td class="items according">
				<div class="items-details">
					<input type="text" name="according" data-index="1" lay-verify="required">
				</div>
			</td>--%>
			<%--<td class="items standart">
				<div class="items-details">
					<input type="text" name="standart" data-index="1" lay-verify="required">
				</div>
			</td>--%>
			<td><input type="text" id="detection_frequency1" name="detection_frequency" lay-verify="required"></td>
			<td><input type="text" id="detection_days1" name="detection_days" lay-verify="required"></td>
			<td><input type="text" name="remark"></td>
			<td class="delete1"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>
		</tr>
		</tbody>
		<thead>
		<tr>
			<td colspan=10 class="addDetails"><span class="layui-icon layui-icon-add-1" title="添加明细信息"></span></td>
		</tr>
		<tr>
			<th colspan=10></th>
		</tr>
		<tr>
			<td>上传附件</td>
			<td><input type="file" id="pics" name="pics" multiple="multiple"></td>
		</tr>
		</thead>
	</table>
	<div class="layui-form-item button-div-t">
		<div class="layui-input-block">
			<button type="submit" id="myForm" class="layui-btn" lay-submit="" lay-filter="submitForm">提交</button>
			<button type="reset" id="resetForm" class="layui-btn layui-btn-primary">重置</button>
			<button type="submit" id="tForm" class="layui-btn" lay-submit="" lay-filter="temporaryForm">暂存</button>
		</div>
	</div>
</form>
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
        // form.render('checkbox');
        // form.render('redio');
        //执行一个laydate实例
        laydate.render({
            elem: '#date1' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			,trigger: 'click'
            ,done: function(value, date, endDate){
                // console.log(value); //得到日期生成的值
                //开始日选好后，判断结束日期是否合法
                if($('#date2').val() != ''){
                    $('#date2').val() > value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date1').val('');});
                }
            }
        });
        laydate.render({
            elem: '#date2' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
			,trigger: 'click'
            ,done: function (value, date, endDate) {
                // console.log(value); //得到日期生成的值
                //结束日选好后，判断开始日期是否合法
                if($('#date1').val() != ''){
                    $('#date1').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date2').val('');});
                }
            }
        });

        /*laydate.render({
            elem: '#date3' //指定元素
            ,type: 'datetime' //yyyy-MM-dd HH:mm:ss
            ,done: function (value, date, endDate) {
                // console.log(value); //得到日期生成的值
                //结束日选好后，判断开始日期是否合法
                if($('#date3').val() != ''){
                    $('#date3').val() < value ? 1 : layer.msg('请选择正确日期范围',{time: 1000},function(){$('#date3').val('');});
                }
            }
        });*/
        inputRender();//input框自定义渲染
		var d_count = 1;


        //业务来源添加事件
        form.on('select(source)', function(data){
            if(data.value == 1){
                $("#contract_tr").removeAttr("class");
                $("#contract_number").attr("lay-verify","required");
            }else{
                $("#contract_tr").attr("class","layui-hide");
                $("#contract_number").attr("lay-verify","");
                $("#contract_number").val("");
                $("#contract_number").attr("title","");
                //$("#client_department").val("");
                currentContractId = '';
            }
        });

        //监听提交按钮
        form.on('submit(submitForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var illustration =  data.field.illustration;//说明
            var issued_person = data.field.issued_person;//下发人
            var issued_department = data.field.issued_department;//下发部门
            var issued_date = data.field.issued_date;//下发日期
            var source = data.field.source;//下发来源
            var contract_number = data.field.contract_number;//合同编号
            var program_name =  data.field.program_name;//项目名称
            //var contact_person =  data.field.contact_person;//联系人
            //var contact_phone =  data.field.contact_phone;//联系电话
            //var entrust_name = data.field.client_department;//委托单位
            //var entrust_adress =  data.field.entrust_adress;//委托单位地址
            var sampleType = data.field.specimen_source;//样品来源
            var date1 =  data.field.date1;//采样完成时间
            var specimen_name =  data.field.code;//报告编码
            var type =  $('#type').find('option:selected').text();//检测类型
            //var type =  data.field.type;//检测类型
            //var date3 = data.field.date3;//检测完成时间
            var date2 =  data.field.date2;//报告完成时间
            //var task_definition = data.field.task_definition;//任务内容
            //var standard =  data.field.standard;//执行标准
            var remarkA = data.field.remark;//备注

            var flag = 0;
            if(sampleType == 2){//送样则flag为1，直接让采样员检测业务下发进行操作。
                flag = 1;
            }

            var currentDetails = [];
            $.each($('.details'),function(index,item){
               /* var number = $(item).find('input[name="number"]').val();//序号*/
                //var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位
                var program_type = $(item).find('select[name="program_type"]').find('option:selected').text();//检测项目类别
                var site_number = $(item).find('input[name="site_number"]').val();//点位个数
                var program_number = $(item).find('input[name="program_number"]').val();//检测项目个数
                //检测项目及方法依据明细
                //var itemsDetails = [];
                //var detectionArray = $(item).find('td.detection_program>.items-details');//检测项目
                //var accordingArray = $(item).find('td.according>.items-details');//方法依据
                //var standartArray = $(item).find('td.standart>.items-details');//检测标准
                /*$.each(detectionArray,function(index0,item0){
                    var detection_program = $(item0).find('input[name="detection_program"]').val();//检测项目
                    var according = $(accordingArray[index0]).find('input[name="according"]').val();//方法依据
                    var standart = $(standartArray[index0]).find('input[name="standart"]').val();//检测标准
                    itemsDetails.push({'processName':detection_program,'methodBasis':according,'process_string':standart});
                });*/

                var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                var remark = $(item).find('input[name="remark"]').val();

                var obj = {
                    //'details_int2':number,
                    //'details_string':detection_site,
                    'details_string':program_type,//检测项目类别
                    'details_money3':program_number,//检测项目个数
                    'details_money5':site_number,//点位个数
                    //'details_string2':detection_program,
                    //'details_string3':according,
                    //'details_string2':itemsDetails,
                    'details_int3':detection_frequency,
                    'details_int4':detection_days,
                    'details_string6':remark,
                    'details_money2':site_number*detection_frequency*detection_days
                };
                currentDetails.push(obj);
            });

            var myForm = new FormData();
            myForm.set("currency_type",43);
            myForm.set("currency_id",currency_id0);
            myForm.set("currency_string",illustration);//说明
            myForm.set("currency_int3",source);//下发来源
            myForm.set("currency_string18",contract_number);//合同编号
            myForm.set("currency_string2",program_name);//项目名称
            myForm.set("currency_int2",sampleType);//样品来源
            myForm.set("currency_date2",date1);//采样完成时间
            myForm.set("currency_string7",specimen_name);//报告编码
            myForm.set("currency_string8",type);//检测类型
            myForm.set("currency_date3",date2);//报告完成时间
            myForm.set("currency_string9",remarkA);
            myForm.set("currency_int",flag);
            myForm.set("currencyDetails",JSON.stringify(currentDetails));
            for(let i = 0;i < $("#pics")[0].files.length;i++){
                myForm.append("pics",$("#pics")[0].files[i])
            }

            $.ajax({
                url : "Xinze/launchCurrencyApply.action"
                ,type : "post"
                ,data :myForm
                ,contentType: false
                ,processData: false
                ,cache:false
                ,dataType : "JSON"
                ,beforeSend: function(){
                    layer.msg('正在提交申请', {
                        icon: 16
                        ,shade: 0.01
                    });
                }
                ,success : function(result){
                    layer.msg(result.msg);
                    $('#myForm').addClass('layui-btn-disabled');
                    $('#myForm').attr("disabled",'disabled');
                    $('#tForm').addClass('layui-btn-disabled');
                    $('#tForm').attr("disabled",'disabled');
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听暂存按钮
        form.on('submit(temporaryForm)', function(data){
            // console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            // console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            // console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
            var illustration =  data.field.illustration;//说明
            var issued_person = data.field.issued_person;//下发人
            var issued_department = data.field.issued_department;//下发部门
            var issued_date = data.field.issued_date;//下发日期
            var source = data.field.source;//下发来源
            var sampleType = data.field.specimen_source;//样品来源
            var contract_number = data.field.contract_number;//合同编号
            var program_name =  data.field.program_name;//项目名称
            var date1 =  data.field.date1;//采样完成时间
            var specimen_name =  data.field.code;//报告编码
            var type =  $('#type').find('option:selected').text();//检测类型
            var date2 =  data.field.date2;//报告完成时间
            var remarkA = data.field.remark;//备注

			//采样为0，送样为1
            var flag = 0;
            if(sampleType == 2){//送样则flag为1，直接让采样员检测业务下发进行操作。
                flag = 1;
            }

            var currentDetails = [];
            $.each($('.details'),function(index,item){
                //var number = $(item).find('input[name="number"]').val();//序号
                //var detection_site = $(item).find('input[name="detection_site"]').val();//检测点位
                var program_type = $(item).find('select[name="program_type"]').find('option:selected').text();//检测项目类别
                var site_number = $(item).find('input[name="site_number"]').val();//点位个数
                var program_number = $(item).find('input[name="program_number"]').val();//检测项目个数

                var detection_frequency = $(item).find('input[name="detection_frequency"]').val();//检测频率
                var detection_days = $(item).find('input[name="detection_days"]').val();//监测天数
                var remark = $(item).find('input[name="remark"]').val();

                var obj = {
                    'details_int2':number,
                    'details_string':program_type,//检测项目类别
                    'details_money3':program_number,//检测项目个数
                    'details_money5':site_number,//点位个数
                    'details_int3':detection_frequency,
                    'details_int4':detection_days,
                    'details_string6':remark,
                    'details_money2':site_number*detection_frequency*detection_days
                };
                currentDetails.push(obj);
            });

            var myForm = new FormData();
            myForm.set("currency_type",43);
            myForm.set("currency_id",currency_id0);
            myForm.set("currency_string",illustration);//说明
            myForm.set("currency_int3",source);//下发来源
            myForm.set("currency_string18",contract_number);//合同编号
            myForm.set("currency_string2",program_name);//项目名称
            myForm.set("currency_int2",sampleType);//样品来源
            myForm.set("currency_date2",date1);//采样完成时间
            myForm.set("currency_string7",specimen_name);//报告编码
            myForm.set("currency_string8",type);//检测类型
            myForm.set("currency_date3",date2);//报告完成时间
            myForm.set("currency_string9",remarkA);
            myForm.set("currency_int",flag);
            myForm.set("currencyDetails",JSON.stringify(currentDetails));
            for(let i = 0;i < $("#pics")[0].files.length;i++){
                myForm.append("pics",$("#pics")[0].files[i])
            }
            $.ajax({
                url : "Xinze/launchCurrencyApplyTemporary.action"
                ,type : "post"
                ,data : myForm
                ,contentType: false
                ,processData: false
                ,cache:false
                ,dataType : "JSON"
                ,beforeSend: function(){
                    layer.msg('正在提交申请', {
                        icon: 16
                        ,shade: 0.01
                    });
                }
                ,success : function(result){
                    layer.msg(result.msg);
                    $('#myForm').addClass('layui-btn-disabled');
                    $('#myForm').attr("disabled",'disabled');
                    $('#tForm').addClass('layui-btn-disabled');
                    $('#tForm').attr("disabled",'disabled');
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
        //监听重置按钮
        $('#resetForm').click(function(e){
            window.location.reload();
        });

        //数据初始化
        //获取申请人/申请部门/申请日期
        var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
        var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
        setApplyMessage(staffName,departmentId);
        searchProcess_contract_number($('#contractNumber'));
        searchProcess_contract_back($('#contractBack'));

        //客户Id
        var customer;
        //过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
        var currentContractId = '';//记录当前合同编号
        function searchProcess_contract_number($demo){
            // 过程二第一级 - 获取合同编号
            //过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
            $('.contract-search-box.number').bind("input propertychange",function(event){
                var currentKey = $(event.target).val();//搜索框值
                if(currentKey == ''){
                    $demo.find('.list-container.number>ul').html('');
                    $demo.find('.list-container.number').css('display','none');
                }else{
                    $.ajax({
                        url:'System/selectXZAllContract.action',
                        type:'post',
                        data:{'cName':currentKey},
                        dataType:'JSON',
                        success:function(res){
                            var html = '<li value="" class="list-this">请选择销售合同编号</li>';
                            $.each(res.data,function(index,item){
                                html += '<li value="'+item.strContractID+'" data-id="'+item.strContractID
                                    +'" data-name="'+item.cCusName
                                    +'" data-cusCode="'+item.cCusCode
                                    +'" data-cCusAddress="'+item.cCusAddress
                                    +'" data-money="'+item.dblTotalCurrency+'" >名称：'+item.strContractName
                                    +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate
                                    +'</li>';
                            });
                            $demo.find('.list-container.number>ul').html(html);
                            $demo.find('.list-container.number').css('display','block');
                            //给合同编号下拉列表框绑定隐藏事件
                            hideListContainer_contract('contractNumber');
                        }
                    });
                }
            });
            //过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
            //给下拉列表框绑定点击事件
            $demo.find(".list-container.number>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                var value = $(this).val();//number类型
                var text = $(this).text();
                var strContractID = $(this).attr('data-id');
                //var contractAmount = $(this).attr('data-money');
                //var contractName = $(this).attr('data-name');
                //var cCusAddress = $(this).attr('data-cCusAddress');
                customer = "";
                customer = $(this).attr("data-cusCode");
                $('#contract_number').val(strContractID);  //合同编号
                //$("#contract_amount").val(contractAmount);//合同金额
                //$('#client_department').val(contractName);//委托单位
                //$('#customer_name').val(contractName);//客户名称
                //$('#entrust_adress').val(cCusAddress);//委托单位地址
                //重置合同条款
                $('.contract-details').remove();
                //重置下拉列表框
                $(this).parent().empty();
                $demo.find('.list-container').css('display','none');
                //保存当前选择的合同编号
                currentContractId = strContractID;
            });
        }
        //给合同编号下拉列表框绑定隐藏事件
        function hideListContainer_contract(Id){
            $(document).bind('click', function(e) {
                var e = e || window.event; //浏览器兼容性
                var elem = e.target || e.srcElement;
                while (elem) { //循环判断至跟节点，防止点击的是div子元素
                    if (elem.id && elem.id == Id) {
                        return;
                    }
                    elem = elem.parentNode;
                }
                //点击的不是div或其子元素
                $('#'+Id+' .list-container').css('display', 'none');
                //没有重新选择,重置合同编号的input框值
                $('#'+Id+' input').val(currentContractId);
            });
        }



        //数据回调
        //过程三 - 自定义带搜索的下拉列表,根据合同编号设置其它项内容
        var back = '';//记录当前合同编号
        function searchProcess_contract_back($demo){
            // 过程二第一级 - 获取合同编号
            //过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
            $('.contract-search-box.back').bind("input propertychange",function(event){
                var currentKey = $(event.target).val();//搜索框值
                if(currentKey == ''){
                    $demo.find('.list-container.back>ul').html('');
                    $demo.find('.list-container.back').css('display','none');
                }else{
                    $.ajax({
                        url:'Xinze/selectAllNotice.action',
                        type:'post',
                        data:{
                            'currency_string2':currentKey,
                            'currency_type':43
                        },
                        dataType:'JSON',
                        success:function(res){
                            var html = '<li value="" class="list-this">请选择历史业务下发表</li>';
                            $.each(res.data,function(index,item){
                                html += '<li value="'+item.currency_id+'" data-program="'+item.currency_string2
                                    +'" data-person="'+item.currency_string3
                                    +'" data-phone="'+item.currency_string4
                                    +'" data-date="'+item.currency_date
                                    +'" data-adress="'+item.currency_string5
                                    +'" data-type="'+item.currency_string8
                                    +'" data-code="'+item.currency_string7
                                    +'" data-sampleType="'+item.currency_int2
                                    +'" data-number="'+item.currency_string18
                                    +'" data-department="'+item.currency_string10
                                    +'" data-standard="'+item.currency_string9+'" >项目名称：'+item.currency_string2
                                    +'；申请时间：'+Format0(item.currency_date,"yyyy-MM-dd HH:mm:ss")
                                    +'</li>';
                            });
                            $demo.find('.list-container.back>ul').html(html);
                            $demo.find('.list-container.back').css('display','block');
                            //给合同编号下拉列表框绑定隐藏事件
                            hideListContainer_contract('contractBack');
                        }
                    });
                }
            });
            //过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
            //给下拉列表框绑定点击事件
            $demo.find(".list-container.back>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
                var value = $(this).val();//number类型
                var text = $(this).text();
                var program = $(this).attr('data-program');
                //var person = $(this).attr('data-person');
                //var phone = $(this).attr('data-phone');
                //var adress = $(this).attr('data-adress');
                var type = $(this).attr('data-type');
                var code = $(this).attr('data-code');
                //var dateA = $(this).attr('data-date');
                //$("#date1").val(dateA);//日期
                var number = $(this).attr('data-number');
                var sampleType = $(this).attr('data-sampleType');//样品来源
                $('#specimen_source').val(sampleType);//样品来源
                //var department = $(this).attr('data-department');//委托单位
                var standard = $(this).attr('data-standard');
                $('#contract_number').val(number);//合同编号
                $("#program_name").val(program);//项目名称
                //$('#contact_person').val(person);//联系人
                //$('#contact_phone').val(phone);//联系电话
                //$('#entrust_adress').val(adress);//委托单位地址
                $('#specimen_name').val(code);//报告编码
                //('#client_department').val(department);//委托单位
                $('#type').val(type);//客户名称
                $('#standard').val(standard);//客户名称
                //查询明细信息
                $.ajax({
                    url:'Currency/selectCurrencyDetails.action',
                    type:'post',
                    data:{'currency_id':value},
                    dataType:'JSON',
                    success:function(res){
                        $('.details').remove();
                        $.each(res.data,function (index,item) {
                            var remark = '';
                            if(item.details_string6 != null || item.details_string6 != undefined){
                                remark = item.details_string6;
                            }
                            var html = '<tr class="details">'
                                //+	'<td><input type="text" name="number" value="'+(n_count++)+'" readonly></td>'
                                +	'<td colspan="3">'
								+ 		'<select id="program_type'+d_count+'" name="program_type" lay-filter="program_type" lay-search lay-verify="required">'
								+			'<option value="">==请选择==</option>' +
								+			'<option value="烟气常规检测">烟气常规检测</option>'
								+			'<option value="在线监测设备比对检测（气）">在线监测设备比对检测（气）</option>'
								+			'<option value="水的比对检测">水的比对检测</option>'
								+			'<option value="在线监测设备验收检测（超低）">在线监测设备验收检测（超低）</option>'
								+			'<option value="在线监测设备验收检测（非超低）">在线监测设备验收检测（非超低）</option>'
								+			'<option value="水质在线设备验收检测">水质在线设备验收检测</option>'
								+			'<option value="环评现状检测">环评现状检测</option>'
								+			'<option value="竣工验收检测">竣工验收检测</option>'
								+			'<option value="无组织土壤">无组织土壤</option>'
								+			'<option value="无组织噪声">无组织噪声</option>'
								+			'<option value="无组织废气">无组织废气</option>'
								+			'<option value="采水">采水</option>'
								+		'</select>'
								+ 	'</td>'
                                //+	'<td><input type="text" name="detection_site" value="'+item.details_string+'" data-subItems="1" lay-verify="required"></td>'
                                +	'<td><input type="number" name="site_number" value="'+item.details_money5+'" lay-verify="required"></td>'
                                +	'<td><input type="number" name="program_number" value="'+item.details_money3+'" lay-verify="required"></td>'
                                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" lay-verify="required"></td>'
                                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" lay-verify="required"></td>'
                                +	'<td><input type="text" name="remark" value="'+remark+'"></td>'
                                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                +	'</tr>';
                            $('table.table-open>tbody').append(html);
							$("#program_type"+d_count).find("option:contains('"+item.details_string+"')").attr("selected",true);
							form.render();
							form.render('select');
                            //渲染
                            detailsRender(d_count); //明细信息每行自定义渲染事件
                            inputRender();//input框自定义渲染
                            d_count++;
                        });
                        /*$.each(res.data,function (index,item) {
                            var processHtml1 = '';
                            var processHtml2 = '';
                            var processHtml3 = '';
                            $.ajax({
                                url:"Xinze/selectProcessByDetailsId.action"
                                ,type:"post"
                                ,data:{"details_id":item.currency_details_id}
                                ,success:function (result) {
                                    $.each(result.data,function (i,process) {
                                        if (i==0){
                                            processHtml1 += '<div class="items-details">'
                                                +'<input type="text" name="detection_program" value="'+process.processName+'" data-index="1" lay-verify="required">'
                                                +'<span id="add" onclick="addItems(this);">&#43;</span>'
                                                +'</div>'
                                        }else {
                                            processHtml1 += '<div class="items-details" data-index="'+(i+1)+'">'
                                                +      '<input type="text" name="detection_program" value="'+process.processName+'" lay-verify="required">'
                                                +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                                                +  '</div>';
                                        }
                                        processHtml2+= '<div class="items-details" data-index="'+(i+1)+'">'
                                            +		'<input type="text" name="according" value="'+process.methodBasis+'" lay-verify="required">'
                                            +	'</div>';

                                        processHtml3+= '<div class="items-details" data-index="'+(i+1)+'">'
                                            +		'<input type="text" name="standart" value="'+process.process_string+'" lay-verify="required">'
                                            +	'</div>';
                                    });
                                    var remark = '';
                                    if(item.details_string6 != null || item.details_string6 != undefined){
                                        remark = item.details_string6;
                                    }
                                    var html = '<tr class="details">'
                                        +	'<td><input type="text" name="number" value="'+(n_count++)+'" readonly></td>'
                                        +	'<td><select id="program_type" name="program_type" lay-filter="program_type" lay-search lay-verify="required">' +
                                        '<option value="">==请选择检测项目类别==</option>' +
                                        '<option>有组织废气</option>' +
                                        '<option>无组织废气</option>' +
                                        '<option>水和废水</option>' +
                                        '<option>噪声</option>' +
                                        '<option>土壤和固废</option>' +
                                        '</select></td>'
                                        //+	'<td><input type="text" name="detection_site" value="'+item.details_string+'" data-subItems="1" lay-verify="required"></td>'
                                        +	'<td><input type="number" name="site_number" value="'+item.details_money5+'" lay-verify="required"></td>'
                                        +	'<td class="items detection_program">'
                                        +		processHtml1
                                        +	'</td>'
                                        +	'<td class="items according">'
                                        +		processHtml2
                                        +	'</td>'
                                        +	'<td class="items standart">'
                                        +		processHtml3
                                        +	'</td>'
                                        +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" lay-verify="required"></td>'
                                        +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" lay-verify="required"></td>'
                                        +	'<td><input type="text" name="remark" value="'+remark+'"></td>'
                                        +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                        +	'</tr>';
                                    $('table.table-open>tbody').append(html);
                                    form.render();
                                    //渲染
                                    detailsRender(d_count); //明细信息每行自定义渲染事件
                                    inputRender();//input框自定义渲染
                                }
                            });
                            d_count++;
                        });*/
                    }
                });
                form.render();
                //重置下拉列表框
                $(this).parent().empty();
                $demo.find('.list-container').css('display','none');
                currentContractId = text;
            });
        }


        //操作
        //点击添加明细按钮
        $('.addDetails').click(function(){
            d_count++;
            var html = '<tr class="details">'
                //+	'<td><input type="text" name="number" value="'+(++n_count)+'" readonly></td>'
				+	'<td colspan="3">'
				+ 		'<select id="program_type'+d_count+'" name="program_type" lay-filter="program_type" lay-search lay-verify="required">'
				+			'<option value="">==请选择==</option>' +
				+			'<option value="烟气常规检测">烟气常规检测</option>'
				+			'<option value="在线监测设备比对检测（气）">在线监测设备比对检测（气）</option>'
				+			'<option value="水的比对检测">水的比对检测</option>'
				+			'<option value="在线监测设备验收检测（超低）">在线监测设备验收检测（超低）</option>'
				+			'<option value="在线监测设备验收检测（非超低）">在线监测设备验收检测（非超低）</option>'
				+			'<option value="水质在线设备验收检测">水质在线设备验收检测</option>'
				+			'<option value="环评现状检测">环评现状检测</option>'
				+			'<option value="竣工验收检测">竣工验收检测</option>'
				+			'<option value="无组织土壤">无组织土壤</option>'
				+			'<option value="无组织噪声">无组织噪声</option>'
				+			'<option value="无组织废气">无组织废气</option>'
				+			'<option value="采水">采水</option>'
				+		'</select>'
				+ 	'</td>'
                //+	'<td><input type="text" name="detection_site" data-subItems="1" lay-verify="required"></td>'
                +	'<td><input type="number" name="site_number" lay-verify="required"></td>'
                +	'<td><input type="number" name="program_number" lay-verify="required"></td>'
                /*+	'<td class="items detection_program">'
                +		'<div class="items-details">'
                +			'<input type="text" name="detection_program" data-index="1" lay-verify="required">'
                +			'<span id="add" onclick="addItems(this);">&#43;</span>'
                +		'</div>'
                +	'</td>'
                +	'<td class="items according">'
                +		'<div class="items-details">'
                +			'<input type="text" name="according" data-index="1" lay-verify="required">'
                +		'</div>'
                +	'</td>'
                +	'<td class="items standart">'
                +		'<div class="items-details">'
                +			'<input type="text" name="standart" data-index="1" lay-verify="required">'
                +		'</div>'
                +	'</td>'*/
                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" lay-verify="required"></td>'
                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" lay-verify="required"></td>'
                +	'<td><input type="text" name="remark"></td>'
                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                +	'</tr>';
            $('table.table-open>tbody').append(html);
            form.render();
            //渲染
            detailsRender(d_count); //明细信息每行自定义渲染事件
            inputRender();//input框自定义渲染
        });
        //明细信息每行自定义渲染事件
        function detailsRender(index){
            deleteItem($('.delete'+index)); //每一行绑定行删除事件
            inputLimitInteger($('#detection_frequency'+index));//监听检测频次只允许输入整数
            inputLimitInteger($('#detection_days'+index));//监听检测天数只允许输入整数
        }
        //行删除事件
        function deleteItem($demo){
            deleteDetailsItem2($demo);
        }

        //监听电话输入框输入正确格式
        //inputLimitPhone($('#contact_phone'));
        //添加检测项目点击事件
        /*window.addItems = function(obj){
            //data-subItems值更新
            var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
            $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i+1));
            //添加项
            var html1 = '<div class="items-details" data-index="'+(i+1)+'">'
                +      '<input type="text" name="detection_program" lay-verify="required">'
                +      '<span id="minus" onclick="removeItems(this);">&minus;</span>'
                +  '</div>';
            $(obj).closest('.details').find('td.detection_program').append(html1);
            var html2 = '<div class="items-details" data-index="'+(i+1)+'">'
                +		'<input type="text" name="according" lay-verify="required">'
                +	'</div>';
            $(obj).closest('.details').find('td.according').append(html2);
            var html3 = '<div class="items-details" data-index="'+(i+1)+'">'
                +		'<input type="text" name="standart" lay-verify="required">'
                +	'</div>';
            $(obj).closest('.details').find('td.standart').append(html3);
        }
        //移除检测项目点击事件
        window.removeItems = function(obj){
            layer.confirm('确认移除？',function(index){
                //data-subItems值更新
                var i = Number($(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems'));
                $(obj).closest('.details').find('input[name="detection_site"]').attr('data-subItems',(i-1));
                //删除项
                var j = $(obj).closest('.items-details').attr('data-index');
// 						if(j != '1'){
                $(obj).closest('.details').find('td.according>.items-details[data-index="'+j+'"]').remove();
                $(obj).closest('.details').find('td.standart>.items-details[data-index="'+j+'"]').remove();
                $(obj).closest('.items-details').remove();
// 						}
                layer.close(index);
            });
        }*/

        //操作
        //input滑过显示内容详情 - 防止溢出情况
        function inputRender(){
            $('input').mouseover(function(e){
                e.target.title = e.target.value;
            });
        }

        //表单数据初始化填写
        var currency_id0 = '${param.currency_id}';	//number类型
        var currency_type0 = Number('${param.currency_type}'); //string类型
        $.ajax({
            url:'Xinze/selectCurrencyApply.action',
            type:'post',
            data:{"currency_id":currency_id0},
            dataType:'JSON',
            success:function(res){
                //表单赋值操作
                $('input[name="buy_number"]').val(res.data.currency_id);//请购单号
                //获取申请人/申请部门
                var staffName ="${sessionScope.systemStaff.staff_Name }";//获取当前登录用户名称
                $("#staffName").val(staffName);//申请人
                var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id
                //根据id查询部门
                $.ajax({
                    url : "Department/selectDingDepartmentId.action",
                    type : "post",
                    data : {"id": departmentId},
                    dataType : "JSON",
                    success : function(res){
                        var departmentName = '无记录';
                        if(res.data != null) departmentName = res.data.department_Name;
                        $("#department").val(departmentName);//申请部门
                    }
                });
                $('input[name="currency_date"]').val(Format(res.data.currency_date,"yyyy-MM-dd"));//申请日期

                $('#source').val(res.data.currency_int3);//下发来源
                $('#specimen_source').val(res.data.currency_int2);//样品来源
                $('#contract_number').val(res.data.currency_string18);//合同编号
                $("#program_name").val(res.data.currency_string2);//项目名称
                $("#date1").val(Format0(res.data.currency_date2,"yyyy-MM-dd HH:mm:ss"));//采样完成时间
                $('#code').val(res.data.currency_string7);//报告编码
                $('#type').val(res.data.currency_string8);//检测类型
                $("#date2").val(Format0(res.data.currency_date3,"yyyy-MM-dd HH:mm:ss"));//报告完成时间
                $('#remark').val(res.data.currency_string9);//备注


                //查询明细信息
                $.ajax({
                    url:'Currency/selectCurrencyDetails.action',
                    type:'post',
                    data:{'currency_id':currency_id0},
                    dataType:'JSON',
                    success:function(res){
                        $('.details').remove();
                        $.each(res.data,function (index,item) {
                            var remark = '';
                            if(item.details_string6 != null || item.details_string6 != undefined){
                                remark = item.details_string6;
                            }
                            var html = '<tr class="details">'
                                //+	'<td><input type="text" name="number" value="'+(n_count++)+'" readonly></td>'
								+	'<td colspan="3">'
								+ 		'<select id="program_type'+d_count+'" name="program_type" lay-filter="program_type" lay-search lay-verify="required">'
								+			'<option value="">==请选择==</option>' +
								+			'<option value="烟气常规检测">烟气常规检测</option>'
								+			'<option value="在线监测设备比对检测（气）">在线监测设备比对检测（气）</option>'
								+			'<option value="水的比对检测">水的比对检测</option>'
								+			'<option value="在线监测设备验收检测（超低）">在线监测设备验收检测（超低）</option>'
								+			'<option value="在线监测设备验收检测（非超低）">在线监测设备验收检测（非超低）</option>'
								+			'<option value="水质在线设备验收检测">水质在线设备验收检测</option>'
								+			'<option value="环评现状检测">环评现状检测</option>'
								+			'<option value="竣工验收检测">竣工验收检测</option>'
								+			'<option value="无组织土壤">无组织土壤</option>'
								+			'<option value="无组织噪声">无组织噪声</option>'
								+			'<option value="无组织废气">无组织废气</option>'
								+			'<option value="采水">采水</option>'
								+		'</select>'
								+ 	'</td>'
                                //+	'<td><input type="text" name="detection_site" value="'+item.details_string+'" data-subItems="1" lay-verify="required"></td>'
                                +	'<td><input type="number" name="site_number" value="'+item.details_money5+'" lay-verify="required"></td>'
                                +	'<td><input type="number" name="program_number" value="'+item.details_money3+'" lay-verify="required"></td>'
                                +	'<td><input type="text" id="detection_frequency'+d_count+'" name="detection_frequency" value="'+item.details_int3+'" lay-verify="required"></td>'
                                +	'<td><input type="text" id="detection_days'+d_count+'" name="detection_days" value="'+item.details_int4+'" lay-verify="required"></td>'
                                +	'<td><input type="text" name="remark" value="'+remark+'"></td>'
                                +	'<td class="delete'+d_count+'"><button type="button" class="layui-btn layui-btn-danger layui-btn-xs">删除</button></td>'
                                +	'</tr>';
                            $('table.table-open>tbody').append(html);
							$("#program_type"+d_count).find("option:contains('"+item.details_string+"')").attr("selected",true);
							form.render();
							form.render('select');
                            //渲染
                            detailsRender(d_count); //明细信息每行自定义渲染事件
                            inputRender();//input框自定义渲染
                            d_count++;
                        });
                    }
                });
                form.render();
            }
        });

    });
</script>
</body>
</html>
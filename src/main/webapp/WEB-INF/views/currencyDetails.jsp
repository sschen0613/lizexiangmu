<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!--审批详情页 -->
<link rel="stylesheet" href="../css/search_revise.css">
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/function_tool.js"></script>


<table class="layui-hide" id="test" lay-filter="test"></table>

<table class="layui-hide" id="test1" lay-filter="test1"></table>

<table class="layui-hide" id="test2" lay-filter="test2"></table>

<table class="layui-hide" id="test3" lay-filter="test3"></table>

<script type="text/html" id="barDemo">

</script>

<script type="text/html" id="toolbarDemo">
 
</script>
<script type="text/html" id="system_img">

</script>

<script type="text/html" id="system_file">
    <%--<img src="{{d.coverpath}}" class="layui-nav-img">--%>
    <a href="{{d.coverpath}}">查看文件</a>
</script>

<script type="text/javascript">
    layui.use(['laydate', 'laypage', 'layer','table', 'element'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,table = layui.table //表格
            ,element = layui.element
            ,layer = layui.layer; //元素操作

        var currency_id = ${param.currency_id};	//number类型
        var currency_type = Number('${param.currency_type}'); //string类型
        var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息
        var departmentId ="${sessionScope.systemStaff.department_Id }";//获取当前登录用户部门id

        //销售请购审批
        if(currency_type == 9){

            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: '../System/selectContractAll1.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '合同条款'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'strName', title: '合同条款名称', minWidth: 120}
                    ,{field: 'strMemo', title: '合同条款内容', minWidth: 400}
                ]]
            });

            //如果当前登录人角色不为  5:管理员；23:总经理；34:财务主管；47:区域经理；29:开发管理员 26:物资部长
            if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70) {
                //执行一个 table 实例
                table.render({
                    elem: '#test1'
                    , url: 'selectCurrencyDetails.action?currency_id=' + currency_id //数据接口
                    , page: false
                    , title: '用户数据表'
                    , totalRow: true
                    , cols: [[ //表头
                        {fixed: 'left', field: 'details_string5', title: '商品名称', minWidth: 100}
                        , {field: 'details_string4', title: '存货编码', minWidth: 100}
                        , {field: 'details_string6', title: '规格型号', minWidth: 100}
                        , {field: 'details_string7', title: '单位', minWidth: 80}
                        , {field: 'details_money2', title: '合同数量', minWidth: 100}
                        , {field: 'details_money', title: '请购数量', minWidth: 100}
                        , {field: 'details_money3', title: '库存数量', minWidth: 100}
                        , {field: 'details_string8', title: '最低售价', minWidth: 120,hide:true}
                    ]]
                });
            }else {
                //执行一个 table 实例
                table.render({
                    elem: '#test1'
                    , url: 'selectCurrencyDetails.action?currency_id=' + currency_id //数据接口
                    , page: false
                    , title: '用户数据表'
                    , totalRow: true
                    , cols: [[ //表头
                        {fixed: 'left', field: 'details_string5', title: '商品名称', minWidth: 100}
                        , {field: 'details_string4', title: '存货编码', minWidth: 100}
                        , {field: 'details_string6', title: '规格型号', minWidth: 100}
                        , {field: 'details_string7', title: '单位', minWidth: 80}
                        , {field: 'details_money2', title: '合同数量', minWidth: 100}
                        , {field: 'details_money', title: '请购数量', minWidth: 100}
                        , {field: 'details_money3', title: '库存数量', minWidth: 100}
                        , {field: 'details_string8', title: '参考成本', minWidth: 120}
                        , {field: 'details_string10', title: '最低售价', minWidth: 120}
                        , {field: 'details_string9', title: '销售单价', minWidth: 120}
                    ]]
                });
            }
        }
        //备货请购审批
        else if(currency_type == 8){

            //如果当前登录人角色不为  5:管理员；23:总经理；34:财务主管；47:区域经理；29:开发管理员 26:物资部长
            if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70) {
                //执行一个 table 实例
                table.render({
                    elem: '#test'
                    , url: 'selectCurrencyDetails.action?currency_id=' + currency_id //数据接口
                    , page: false
                    , title: '用户数据表'
                    , totalRow: true
                    , cols: [[ //表头
                        {fixed: 'left', field: 'details_string5', title: '商品名称', minWidth: 100}
                        ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                        ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '请购数量', minWidth: 100}
                        ,{field: 'details_money2', title: '库存数量', minWidth: 100}
                        , {field: 'details_money4', title: '近期商品价格', minWidth: 120,hide:true}
                    ]]
                });
            }else {
                //执行一个 table 实例
                table.render({
                    elem: '#test'
                    ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                    ,page: false
                    ,title: '用户数据表'
                    ,totalRow: true
                    ,cols: [[ //表头
                        {fixed: 'left', field: 'details_string5', title: '商品名称', minWidth: 100}
                        ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                        ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '请购数量', minWidth: 100}
                        ,{field: 'details_money2', title: '库存数量', minWidth: 100}
                        ,{field: 'details_money4', title: '近期商品价格', minWidth: 120}
                    ]]
                });
            }


        }
        //信泽材料出库审批 || 丽泽销售出库审批 || 丽泽内部出库审批 || 药品出库审批
        else if(currency_type == 11 || currency_type == 13 || currency_type == 14 || currency_type == 18){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '商品名称', minWidth: 100}
                    ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money2', title: '库存数量', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });
        }
        //普通运营请购审批
        else if(currency_type == 10){

            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: '../System/selectContractAll1.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '合同条款'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'strName', title: '合同条款名称', minWidth: 120}
                    ,{field: 'strMemo', title: '合同条款内容', minWidth: 400}
                ]]
            });

            //如果当前登录人角色不为  5:管理员；23:总经理；34:财务主管；47:区域经理；29:开发管理员 26:物资部长
            if (position_Id != 5 && position_Id != 77 && position_Id != 76 && position_Id != 73 && position_Id != 29 && position_Id != 70) {
                //执行一个 table 实例
                table.render({
                    elem: '#test1'
                    , url: 'selectCurrencyDetails.action?currency_id=' + currency_id //数据接口
                    , page: false
                    , title: '用户数据表'
                    , totalRow: true
                    , cols: [[ //表头
                        {fixed: 'left', field: 'details_string2', title: '运营设备名称', minWidth: 120}
                        ,{field: 'details_string', title: '运营设备编码', minWidth: 120}
                        /*,{field: 'details_date2', title: '设备开始日期', minWidth: 120, templet:'<div>{{ Format(d.details_date2,"yyyy-MM-dd")}}</div>'}
                        ,{field: 'details_date3', title: '设备结束日期', minWidth: 120, templet:'<div>{{ Format(d.details_date3,"yyyy-MM-dd")}}</div>'}*/
                        ,{field: 'details_string5', title: '商品名称', minWidth: 100}
                        ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                        ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '请购数量', minWidth: 100}
                        ,{field: 'details_money3', title: '库存数量', minWidth: 100}
                        , {field: 'details_money4', title: '物品报价', minWidth: 120,hide:true}
                    ]]
                });
            }else {
                //执行一个 table 实例
                table.render({
                    elem: '#test1'
                    ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                    ,page: false
                    ,title: '用户数据表'
                    ,totalRow: true
                    ,cols: [[ //表头
                        {fixed: 'left', field: 'details_string2', title: '运营设备名称', minWidth: 120}
                        ,{field: 'details_string', title: '运营设备编码', minWidth: 120}
                        /*,{field: 'details_date2', title: '设备开始日期', minWidth: 120, templet:'<div>{{ Format(d.details_date2,"yyyy-MM-dd")}}</div>'}
                        ,{field: 'details_date3', title: '设备结束日期', minWidth: 120, templet:'<div>{{ Format(d.details_date3,"yyyy-MM-dd")}}</div>'}*/
                        ,{field: 'details_string5', title: '商品名称', minWidth: 100}
                        ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                        ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '请购数量', minWidth: 100}
                        ,{field: 'details_money3', title: '库存数量', minWidth: 100}
                        ,{field: 'details_money4', title: '物品报价', minWidth: 100}
                    ]]
                });
            }
        }
        //丽泽材料类出库审批
        else if(currency_type == 2){

            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: '../System/selectContractAll1.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '合同条款'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'strName', title: '合同条款名称', minWidth: 120}
                    ,{field: 'strMemo', title: '合同条款内容', minWidth: 400}
                ]]
            });
            //执行一个 table 实例
            table.render({
                elem: '#test1'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string', title: '运营设备名称', minWidth: 120}
                    ,{field: 'details_string2', title: '运营设备编码', minWidth: 120}
                    ,{field: 'details_string3', title: '设备运营期间', minWidth: 120}
                    ,{field: 'details_string5', title: '商品名称', minWidth: 100}
                    ,{field: 'details_string4', title: '存货编码', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '申请数量', minWidth: 100}
                    ,{field: 'details_money2', title: '可用量', minWidth: 80}
// 		    	 	,{field: 'details_string8', title: '近期商品价格', minWidth: 120}
                    //,{field: 'details_string10', title: '货架编码', minWidth: 100}
                    //,{field: 'details_money3', title: '货架货物数量', minWidth: 120}
                ]]
            });
        }
        //信泽实验室设备及资产采购审批 || 信泽设备维修审批
        else if(currency_type == 15){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '设备名称', minWidth: 100}
                    ,{field: 'details_string8', title: '设备厂家', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });
        }
        else if( currency_type == 16){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '设备厂家', minWidth: 100}
                    ,{field: 'details_string5', title: '设施名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });
        }
        //药品请购审批
        else if(currency_type == 17){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '物品名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '申请数量', minWidth: 100}
                    ,{field: 'details_money2', title: '库存数量', minWidth: 100}
                    ,{field: 'details_string8', title: '使用科室', minWidth: 100}
                ]]
            });
        }
        //办公用品审批
        else if(currency_type == 1){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '物品名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money2', title: '预计单价', minWidth: 80}
                    ,{field: 'details_money3', title: '预计价格', minWidth: 100}
                ]]
            });
        }

        //办公用品审批
        else if(currency_type == 67){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '物品名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money2', title: '预计单价', minWidth: 80}
                    //,{field: 'details_money3', title: '预计价格', minWidth: 100}
                ]]
            });
        }

        //办公用品审批
        else if(currency_type == 71){
            if (departmentId == 297){
                //执行一个 table 实例
                table.render({
                    elem: '#test'
                    ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                    ,page: false
                    ,title: '用户数据表'
                    ,totalRow: true
                    ,cols: [[ //表头
                        {fixed: 'left', field: 'details_string4', title: '编码', minWidth: 80},
                        {field: 'details_string5', title: '物品名称', minWidth: 100}
                        //,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '数量', minWidth: 80}
                        ,{field: 'details_money2', title: '单价', minWidth: 80}
                        ,{field: 'details_money3', title: '金额', minWidth: 100}
                    ]]
                });
            }else {
                //执行一个 table 实例
                table.render({
                    elem: '#test'
                    ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                    ,page: false
                    ,title: '用户数据表'
                    ,totalRow: true
                    ,cols: [[ //表头
                        {fixed: 'left', field: 'details_string4', title: '编码', minWidth: 80},
                        {field: 'details_string5', title: '物品名称', minWidth: 100}
                        //,{field: 'details_string6', title: '规格型号', minWidth: 100}
                        ,{field: 'details_string7', title: '单位', minWidth: 80}
                        ,{field: 'details_money', title: '数量', minWidth: 80}
                        //,{field: 'details_money2', title: '预计单价', minWidth: 80}
                        //,{field: 'details_money3', title: '预计价格', minWidth: 100}
                    ]]
                });
            }

        }
        //在线运维
        //试剂标液配置领取审批
        else if(currency_type == 22){			//执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '试剂/标液名称', minWidth: 130}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 80}
                    ,{field: 'details_string8', title: '区域', minWidth: 80}
                    ,{field: 'details_string9', title: '使用企业', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 100}
                ]]
            });
        }
        else if(currency_type == 55){			//执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string8', title: '区域名称', minWidth: 130}
                    ,{field: 'details_string5', title: '企业站点名称', minWidth: 80}
                    ,{field: 'details_string9', title: '标气类型', minWidth: 80}
                    ,{field: 'details_string10', title: '浓度', minWidth: 80}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_string11', title: '备注', minWidth: 100}
                ]]
            });
        }
        //丽泽运营站点变更交接审批
        else if(currency_type == 39){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {field: 'details_int', title: '变更类型', minWidth: 100, templet:'<div>{{d.details_int == 1 ? "新增" : "终止"}}</div>'}
                    ,{field: 'details_string8', title: '变更站点名称', minWidth: 120}
                    ,{field: 'details_string3', title: '设备类型', minWidth: 100}
                    ,{field: 'details_int2', title: '数量', minWidth: 80}
                    ,{field: 'details_string12', title: '合同起止日期', minWidth: 120}
                    ,{field: 'details_string4', title: '设备品牌', minWidth: 100}
                    ,{field: 'details_string5', title: '设备型号', minWidth: 100}
                   /* ,{field: 'details_int3', title: '流量计是否运维', minWidth: 130, templet:'<div>{{d.details_int3 == 1 ? "是" : "否"}}</div>'}
                    ,{field: 'details_string6', title: '运维流量计类型', minWidth: 130}
                    ,{field: 'details_string7', title: '流量计品牌', minWidth: 110}
                    ,{field: 'details_int4', title: '是否间歇性排水', minWidth: 130, templet:'<div>{{d.details_int4 == 1 ? "是" : "否"}}</div>'}*/
                    ,{field: 'details_string9', title: '设备责任人', minWidth: 110}
                    ,{field: 'details_string10', title: '企业(环保)负责人/环保联系人', minWidth: 200}
                    ,{field: 'details_string11', title: '联系方式(电话)', minWidth: 130}
                    ,{field: 'details_string6', title: '备注', minWidth: 130}
                ]]
            });
        }
        //技术支持审批 || 安装调试审批
        else if(currency_type == 19 || currency_type == 38){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '企业名称', minWidth: 100}
                    ,{field: 'details_string5', title: '设备名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string8', title: '服务性质', minWidth: 100}
                    ,{field: 'details_string9', title: '问题描述', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });
        }
        //配件内部维修审批
        else if(currency_type == 20 || currency_type == 61){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string8', title: '企业名称', minWidth: 100}
                    ,{field: 'details_string2', title: '配件名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string9', title: '用途', minWidth: 80}
                    ,{field: 'details_string3', title: '备注', minWidth: 200}
                ]]
            });
        }
        //备机使用审批
        else if(currency_type == 40){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '设备名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_string8', title: '适用企业', minWidth: 100}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });
        }
        else if(currency_type == 47){			//执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectProgramDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '检测内容'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'string2', title: '检测名称', minWidth: 100}
                    ,{field: 'program', title: '检测内容', minWidth: 100}
                    ,{field: 'money', title: '金额', minWidth: 80}
                ]]
            });

            table.render({
                elem: '#test1'
                ,url: 'selectPaymentPlan.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '收款计划'
                ,totalRow: true
                ,cols: [[ //表头

                    { fixed: 'left', field: 'dtPayDate', title: '收款日期', minWidth: 100, sort: true, templet:'<div>{{ Format(d.dtPayDate,"yyyy-MM-dd")}}</div>'}
                    ,{field: 'dblPayRatio', title: '收款比例(%)', minWidth: 100}
                    ,{field: 'dblPayCurrency', title: '收款金额', minWidth: 50}
                    ,{field: 'strSettleStyleID', title: '结算方式', minWidth: 50}
                    ,{field: 'strPayFactor', title: '条件', minWidth: 100}
                    ,{field: 'strExp', title: '说明', minWidth: 100}
                ]]
            });

            table.render({
                elem: '#test2'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同图片', width: 150,templet:"#system_img"}
                ]]
            });
        }
        else if(currency_type == 36){			//执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectProgramDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '合同内容'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'program', title: '合同内容', minWidth: 100}
                    ,{field: 'money', title: '金额', minWidth: 80}
                ]]
            });

            table.render({
                elem: '#test1'
                ,url: 'selectPaymentPlan.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '收款计划'
                ,totalRow: true
                ,cols: [[ //表头

                    { fixed: 'left', field: 'dtPayDate', title: '收款日期', minWidth: 100, sort: true, templet:'<div>{{ Format(d.dtPayDate,"yyyy-MM-dd")}}</div>'}
                    ,{field: 'dblPayRatio', title: '收款比例(%)', minWidth: 100}
                    ,{field: 'dblPayCurrency', title: '收款金额', minWidth: 50}
                    ,{field: 'strSettleStyleID', title: '结算方式', minWidth: 50}
                    ,{field: 'strPayFactor', title: '条件', minWidth: 100}
                    ,{field: 'strExp', title: '说明', minWidth: 100}
                ]]
            });

            table.render({
                elem: '#test2'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同图片', width: 150,templet:"#system_img"}
                ]]
            });
        }
        //检测过程管理
        //采样任务通知审批
        else if(currency_type == 43){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string', title: '检测项目类别', minWidth: 100}
                    ,{field: 'details_money3', title: '检测项目个数', minWidth: 100}
                    ,{field: 'details_money5', title: '点位个数', minWidth: 100}
                    ,{field: 'details_int3', title: '检测频次', minWidth: 100}
                    ,{field: 'details_int4', title: '检测天数', minWidth: 100}
                    ,{field: 'details_string6', title: '备注', minWidth: 200}
                ]]
            });
            table.render({
                elem: '#test2'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同图片', width: 150,templet:"#system_img"}
                ]]
            });
        }
        //采样结果
        else if (currency_type == 48){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string', title: '检测点位', minWidth: 100}
                    ,{field: 'processName', title: '检测项目', minWidth: 100}
                    ,{field: 'methodBasis', title: '方法依据', minWidth: 100}
                    ,{field: 'details_int3', title: '检测频次', minWidth: 100}
                    ,{field: 'details_int4', title: '检测天数', minWidth: 100}
                    ,{field: 'details_money2', title: '应采样数量', minWidth: 100}
                    ,{field: 'details_money3', title: '已采样数量', minWidth: 100}
                    ,{field: 'details_string6', title: '备注', minWidth: 200}
                ]]
            });
        }
        //采样任务登记审批
        else if(currency_type == 44){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string', title: '检测点位', minWidth: 100}
                    ,{field: 'details_string2', title: '检测项目', minWidth: 100}
                    ,{field: 'details_string3', title: '方法依据', minWidth: 100}
                    ,{field: 'details_int3', title: '检测频次', minWidth: 100}
                    ,{field: 'details_int4', title: '检测天数', minWidth: 100}
                    ,{field: 'details_money2', title: '应采样数量', minWidth: 120}
                    ,{field: 'details_money3', title: '已采样数量', minWidth: 120}
                    ,{field: 'details_money4', title: '当天采样数量', minWidth: 130}
                    ,{field: 'details_string6', title: '备注', minWidth: 200}
                ]]
            });
        }
        //检测任务明细表
        else if(currency_type == 000){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头

                    { fixed: 'left', field: 'details_string2', title: '检测项目', minWidth: 100}
                    ,{field: 'details_string3', title: '样品编码', minWidth: 100}
                    ,{field: 'details_int3', title: '样品数量', minWidth: 100}
                    ,{field: 'details_string6', title: '备注', minWidth: 200}
                ]]
            });

        }
        //采样交接审批 || 检测登记审批
        else if(currency_type == 45 || currency_type == 000){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string', title: '样品编码', minWidth: 100}
                    ,{field: 'details_string2', title: '检测项目', minWidth: 100}
                    ,{field: 'details_money3', title: '样品数量', minWidth: 100}
                    ,{field: 'details_string6', title: '备注', minWidth: 200}
                ]]
            });
        }
        //报告流转及盖章审批
        else if(currency_type == 50){
            //执行一个 table 实例
            /*table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '项目名称', minWidth: 100}
                    ,{field: 'details_string3', title: '申请类型', minWidth: 100}
                     ,{field: 'details_string4', title: '报告编号', minWidth: 100}
                     ,{field: 'details_int2', title: '报告份数 ', minWidth: 100}
                ]]
            });*/

            table.render({
                elem: '#test1'
                ,url: 'selectProgramDetailsByContract.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '检测内容'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'strName', title: '检测内容', minWidth: 100}
                    ,{field: 'dblSum', title: '金额', minWidth: 80}
                ]]
            });
		}
		//合同管理
		//丽泽销售合同盖章审批
		else if(currency_type == 34){
			//执行一个 table 实例
			table.render({
		    	elem: '#test'
		    	,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
		    	,page: false
		    	,title: '用户数据表'
		    	,totalRow: true
		    	,cols: [[ //表头
		    		{fixed: 'left', field: 'details_string5', title: '货物名称', minWidth: 200}
		    		,{field: 'details_string4', title: '存货编码', minWidth: 100}
		    	//	,{field: 'details_string8', title: '品牌', minWidth: 100}
		    	 	,{field: 'details_string6', title: '型号', minWidth: 100}
		    	 	,{field: 'details_string7', title: '单位', minWidth: 80}
		    	 	,{field: 'details_money', title: '数量', minWidth: 80}
		    	 	,{field: 'details_money4', title: '单价', minWidth: 80}
		    	 	,{field: 'details_money7', title: '金额', minWidth: 80}
                    ,{field: 'details_money6', title: '最低售价', minWidth: 80}
		    	 	,{field: 'details_string11', title: '备注', minWidth: 200}
				]]
			});

            table.render({
                elem: '#test1'
                ,url: 'selectPaymentPlan.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '收款计划'
                ,totalRow: true
                ,cols: [[ //表头

                    { fixed: 'left', field: 'dtPayDate', title: '收款日期', minWidth: 100, sort: true, templet:'<div>{{ Format(d.dtPayDate,"yyyy-MM-dd")}}</div>'}
                    ,{field: 'dblPayRatio', title: '收款比例(%)', minWidth: 100}
                    ,{field: 'dblPayCurrency', title: '收款金额', minWidth: 50}
                    ,{field: 'strSettleStyleID', title: '结算方式', minWidth: 50}
                    ,{field: 'strPayFactor', title: '条件', minWidth: 100}
                    ,{field: 'strExp', title: '说明', minWidth: 100}
                ]]
            });

            table.render({
                elem: '#test2'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同图片', width: 150,templet:"#system_img"}
                ]]
            });
        }
        //丽泽运营服务合同盖章审批
        else if(currency_type == 35){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '运营设备', minWidth: 100}
                    ,{field: 'details_string4', title: '运营设备编码', minWidth: 120}
                    //,{field: '', title: '品牌', minWidth: 100}
                    ,{field: 'details_string6', title: '型号', minWidth: 100}
                    ,{field: 'details_string3', title: '设备运营开始日期', minWidth: 140}
                    ,{field: 'details_string13', title: '设备运营结束日期', minWidth: 140}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_string11', title: '备注', minWidth: 200}
                ]]
            });

            table.render({
                elem: '#test1'
                ,url: 'selectPaymentPlan.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '收款计划'
                ,totalRow: true
                ,cols: [[ //表头

                    { fixed: 'left', field: 'dtPayDate', title: '收款日期', minWidth: 100, sort: true, templet:'<div>{{ Format(d.dtPayDate,"yyyy-MM-dd")}}</div>'}
                    ,{field: 'dblPayRatio', title: '收款比例(%)', minWidth: 100}
                    ,{field: 'dblPayCurrency', title: '收款金额', minWidth: 50}
                    ,{field: 'strSettleStyleID', title: '结算方式', minWidth: 50}
                    ,{field: 'strPayFactor', title: '条件', minWidth: 100}
                    ,{field: 'strExp', title: '说明', minWidth: 100}
                ]]
            });

            table.render({
                elem: '#test2'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同图片', width: 150,templet:"#system_img"}
                ]]
            });
		}
        //合同管理
        //丽泽销售合同盖章审批
        else if(currency_type == 63){
            table.render({
                elem: '#test3'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '合同文件', width: 150,templet:"#system_file"}
                ]]
            });
        }
        //现场科绩效
        else if(currency_type == 58){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left',field: 'details_string4', title: '采样人员', minWidth: 100, totalRowText: '合计'}
                    ,{field: 'details_int3', title: '检测类型', minWidth: 100, templet:'<div>{{ d.details_int3 == 1 ? "常规检测" : "在线比对"}}</div>'}
                    ,{field: 'details_int4', title: '采样类型', minWidth: 100, templet:'<div>{{ d.details_int4 == 1 ? "超低排放" : "非超低排放"}}</div>'}
                    ,{field: 'details_money', title: '数量', minWidth: 100}
                    ,{field: 'details_money2', title: '绩效金额', minWidth: 140, totalRow: true}
                    ,{field: 'details_string11', title: '备注', minWidth: 100}
                ]]
            });
        }
        //检测科绩效
        else if(currency_type == 59){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left',field: 'details_date2', title: '检测日期', minWidth:100, templet:'<div>{{ Format(d.details_date2,"yyyy-MM-dd")}}</div>'}
                    ,{field: 'details_string2', title: '企业名称/样品名称/编号', minWidth:100}
                    ,{field: 'details_string3', title: '分析内容', minWidth:100}
                    ,{field: 'details_money', title: '数量', minWidth:100, totalRow: true}
                    ,{field: 'details_money2', title: '绩效单价', minWidth:100, totalRow: true}
                    ,{field: 'details_money3', title: '绩效金额', minWidth:100, totalRow: true}
                    ,{field: 'details_string11', title: '备注', minWidth:100}
                ]]
            });
        }

        //丽泽销售合同发票开具申请
        else if(currency_type == 28){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '货物名称', minWidth: 200}
                    ,{field: 'details_string6', title: '型号', minWidth: 80}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money4', title: '金额', minWidth: 80}
                ]]
            });
        }
        //技术保障部配件采购明细
        else if(currency_type == 73){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '技术保障部配件采购明细表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '物品名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money2', title: '预估金额', minWidth: 80}
                    ,{field: 'details_string7', title: '备注', minWidth: 100}
                ]]
            });
        }

        //其他类采购流程明细
        else if(currency_type == 62 || currency_type == 68){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '采购明细表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '物品名称', minWidth: 100}
                    ,{field: 'details_string6', title: '规格型号', minWidth: 100}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                ]]
            });
        }

        else if(currency_type == 66){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '水样检测申请详情'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string2', title: '检测项目', minWidth: 100}
                    ,{field: 'details_money3', title: '检测数量', minWidth: 80}
                ]]
            });
        }//天人合同发票开具申请
        else if(currency_type == 70){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '用户数据表'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string5', title: '货物名称', minWidth: 200}
                    ,{field: 'details_string6', title: '型号', minWidth: 80}
                    ,{field: 'details_string7', title: '单位', minWidth: 80}
                    ,{field: 'details_money', title: '数量', minWidth: 80}
                    ,{field: 'details_money4', title: '金额', minWidth: 80}
                ]]
            });
        }//合同管理
        //公章使用审批
        else if(currency_type == 72){
            //执行一个 table 实例
            table.render({
                elem: '#test3'
                ,url: 'selectContractPicture.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '图片'
                ,totalRow: true
                ,cols: [[ //表头
                    { type: 'numbers', title: '序号', width: 180  }
                    ,{field: 'picture', title: '文件', width: 150,templet:"#system_file"}
                ]]
            });
        }//信泽技术服务合同变更审批
        else if(currency_type == 74){
            //执行一个 table 实例
            table.render({
                elem: '#test'
                ,url: 'selectCurrencyDetails.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '合同明细'
                ,totalRow: true
                ,cols: [[ //表头
                    {fixed: 'left', field: 'details_string4', title: '项目编码', minWidth: 100}
                    ,{field: 'details_string5', title: '项目名称', minWidth: 100}
                    ,{field: 'details_string6', title: '内容描述', minWidth: 200}
                    ,{field: 'details_string7', title: '内容描述变更', minWidth: 200}
                    ,{field: 'details_money', title: '数量', minWidth: 100}
                    ,{field: 'details_money2', title: '数量变更', minWidth: 400}
                    ,{field: 'details_money3', title: '含税原币单价', minWidth: 120}
                    ,{field: 'details_money4', title: '含税原币单价变更', minWidth: 120}
                    ,{field: 'details_money5', title: '含税原币金额', minWidth: 120}
                ]]
            });

            table.render({
                elem: '#test1'
                ,url: 'selectPaymentPlan.action?currency_id='+currency_id //数据接口
                ,page: false
                ,title: '收款计划'
                ,totalRow: true
                ,cols: [[ //表头
                    { fixed: 'left', field: 'strSettleStyleID', title: '合同条款名称', minWidth: 100, sort: true}
                    ,{field: 'string', title: '合同条款名称变更', minWidth: 100}
                    ,{field: 'strPayFactor', title: '合同条款内容', minWidth: 100}
                    ,{field: 'string2', title: '合同条款内容变更', minWidth: 100}
                ]]
            });
        }

        table.on('row(test2)', function(obj){
            var data = obj.data;

            layer.open({
                type: 1 //Page层类型
                ,area: ['700px', '300px']
                ,title: '图片查看'
                ,shade: 0.6 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,anim: 1 //0-6的动画形式，-1不开启
                ,content: '<img src="'+data.coverpath+'" alt="查看图片">'
            });
            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });

        /*table.on('row(test3)', function(obj){
            var data = obj.data;

            layer.open({
                type: 2 //Page层类型
                ,area: ['700px', '300px']
                ,title: '文件查看'
                ,shade: 0.6 //遮罩透明度
                ,maxmin: true //允许全屏最小化
                ,anim: 1 //0-6的动画形式，-1不开启
                //,content: '<img src="'+data.coverpath+'" alt="查看图片">'
                ,content: data.coverpath
            });
            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });*/
    });
</script>
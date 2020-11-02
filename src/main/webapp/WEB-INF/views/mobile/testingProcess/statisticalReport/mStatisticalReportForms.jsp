<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 统计报表-手机端 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/mobile.css">
    <script src="layui/layui.js"></script>
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/function_tool.js"></script>
</head>
<body>
<div class="approval-list">
    <div class="approval-list-title">
        <a onclick="javascript:history.back(-1);" class="layui-icon layui-icon-left"></a>
        <h2 class="">信泽检测流程追踪</h2>
        <span class="menu layui-icon layui-icon-more">
					<div class="sub-menu">
						<ul>
						</ul>
					</div>
				</span>
    </div>
    <div class="approval-list-content">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">检测业务列表</li>
               <%-- <li>已通过</li>
                <li>未通过</li>--%>
            </ul>
            <div class="layui-tab-content" style="height:100%;">
                <div class="layui-tab-item waitting layui-show">
                    <ul id="waitting_demo">
                        <!-- 待审批 -->
                    </ul>
                </div>
               <%-- <div class="layui-tab-item adopt">
                    <ul id="adopt_demo">
                        <!-- 已通过 -->
                    </ul>
                </div>
                <div class="layui-tab-item reject">
                    <ul id="reject_demo">
                        <!-- 未通过 -->
                    </ul>
                </div>--%>
            </div>
        </div>
    </div>
    <div id="toTop" class="layui-icon return-top" onclick="returnToTop()"></div>
    <input type="text" class="iframe-return-type" value="0" style="display:none;">
</div>

<script type="text/javascript">
    layui.use(['form','element','layer','laydate','flow' ],function(){
        var form = layui.form
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
            ,flow = layui.flow; //流加载

        //保存页面信息
        var A_List = {
            'waitting':[{'count':0,'name':'waitting'}],
            'adopt':[{'count':0,'name':'adopt'}],
            'reject':[{'count':0,'name':'reject'}]
        };
        //UNIT //每页加载数量(in funtion_tool.js)

        //数据初始化
        $.ajax({
            url:'Xinze/selectBusinessTracking.action?currency_type=43',
            type:'post',
            dataType:'JSON',
            beforeSend: function(){
                layer.load(1);
            },
            success:function(res){
                layer.closeAll('loading');
                $.each(res.data,function(index,item){
                   /* var state;
                    //判断审批状态
                    //未通过
                    if(item.approver_state == -300){state = 'reject';}
                    //审批通过
                    else if(item.approver_count == item.current_approvalCount && item.approver_state == 0){state = 'adopt';}
                    //审批未处理
                    else{state = 'waitting';}*/
//    				    	myApply(item,index,state);
                    var html = '';
                    html += '<li>'
                        +		'<h2>项目名称:【'+item.currency_string2+'】</h2>'
                        +		'<i>合同编号 : '+item.currency_string18+'</i>'
                        +		'<i>业务编号 : '+item.currency_number+'</i>'
                        +		'<a href="testingProcess/statisticalReport/mStatisticalReportDetails.action'
                        +'?currency_number='+item.currency_number+'&currency_id='+item.currency_id
                        +'&staff_name='+item.staff_name+'&department_name='+item.department_name+'&currency_date='+Format0(item.currency_date,"yyyy-MM-dd HH:mm:ss")
                        +'&register='+item.register+'&registerTime='+item.currency_string3
                        +'&handover='+item.handover+'&handoverTime='+item.currency_string4
                        +'&testing='+item.testing+'&testTime='+item.currency_string5
                        +'&report='+item.report+'&reportTime='+item.currency_string10
                        //+'&finance='+item.finance+'&financeTime='+(item.reportTime == undefined ? "无" : Format0(item.reportTime,"yyyy-MM-dd HH:mm:ss"))
                        +'&approverState=waitting" id="a'+index+'" onclick="approvalDetails(this);return false;">'
                        +			'查看详情'
                        +			'<span class="layui-icon layui-icon-right"></span>'
                        +		'</a>'
                        +	'</li>';


                        A_List.waitting[A_List.waitting.length] = html;
                        A_List.waitting[0].count++;

                });
            },
            complete: function(){
                //没有内容,显示图标
                $.each(A_List,function(index,item){
                    if(item[0].count == 0){
                        $('.'+item[0].name).addClass('approval-none');
                    }
                });
                if(A_List.waitting[0].count > 0){
                    //审批未处理流加载初始化
                    flow.load({
                        elem: '#waitting_demo' //流加载容器
                        ,isAuto: true //自动加载
                        ,end: '没有更多信息了' //底部信息
                        ,done: function(page, next){ //执行下一页的回调
                            //模拟数据插入
                            setTimeout(function(){
                                var lis = [];
                                for(var i = 1; i <= UNIT; i++){
                                    lis.push(A_List.waitting[UNIT*(page-1)+i]);
                                }
                                //执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
                                //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                                next(lis.join(''), page < A_List.waitting[0].count/UNIT);
                            }, 500);
                        }
                    });
                }
            }
        });
        //操作
        //监听选项卡切换
        element.on('tab(docDemoTabBrief)', function(data){
            if(data.index == 0 && A_List.waitting[0].count > 0){
                $('#waitting_demo').html('');
                //审批未处理流加载初始化
                flow.load({
                    elem: '#waitting_demo' //流加载容器
                    ,isAuto: true //自动加载
                    ,end: '没有更多信息了' //底部信息
                    ,done: function(page, next){ //执行下一页的回调
                        //模拟数据插入
                        setTimeout(function(){
                            var lis = [];
                            for(var i = 1; i <= UNIT; i++){
                                lis.push(A_List.waitting[UNIT*(page-1)+i]);
                            }
                            //执行下一页渲染,第二参数为:满足"加载更多"的条件,即后面仍有分页
                            //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                            next(lis.join(''), page < A_List.waitting[0].count/UNIT);
                        }, 500);
                    }
                });
            }
        });
        //查看详情点击事件
        window.approvalDetails = function(e){
            var action = $(e).attr('href');
            layer.open({
                type: 1,
                title: false,
                closeBtn: 1,
                //shadeClose: true,
                area: ['93%','96%'],
                content: '<iframe src="'+action+'" class="approval-details-iframe"></iframe>'
            });
        }

    });

</script>
</body>
</html>
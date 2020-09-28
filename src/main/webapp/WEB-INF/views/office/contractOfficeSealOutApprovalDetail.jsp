<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 采购合同用章详情 -->
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/print_revise.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/jQuery.print.js"></script>
    <script src="js/function_tool.js"></script>
    <script src="js/form_init.js"></script>
    <script src="layui/layui.js"></script>
</head>
<body>
<div id="content" class="content">
    <div class="sign"><i id="number"></i></div>
    <div class="title">
        <h2>采购合同用章申请详情</h2>
    </div>
    <div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
        <div id="innerdiv" style="position:absolute;">
            <img id="bigimg" style="border:5px solid #fff;" src="" />
        </div>
    </div>
    <table border="1" class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
        </colgroup>
        <tbody>
        <tr>
            <td>申请人</td>
            <td id="staff_name"></td>
            <td>申请部门</td>
            <td id="department"></td>
            <td>申请日期</td>
            <td id="date"></td>
        </tr>
        <tr>
            <td>使用方式</td>
            <td id="use_type"></td>
            <td>使用公司</td>
            <td id="use_company"></td>
            <td>公章类型</td>
            <td id="seal_type"></td>
        </tr>
        <tr>
            <td>材料类型</td>
            <td colspan="2" id="doc_type"></td>
            <td>归还日期</td>
            <td colspan="2" id="currency_date2"></td>
        </tr>
        <tr>
            <td>申请事由</td>
            <td colspan="5" id="request_reason"></td>
        </tr>
        <tr>
            <td>备注</td>
            <td colspan="5" id="remark"></td>
        </tr>
        <tr class="pics">
            <td>合同图片</td>
        </tr>
        <tr>
            <td>审批详情</td>
        </tr>
        <tr>
            <td>审批组</td>
            <td>审批人</td>
            <td>审批意见</td>
            <td>审批时间</td>
        </tr>
        </tbody>
    </table>

</div>
<script>
    var currency_id = '${param.currency_id}';
    var currency_type = '${param.currency_type}';
    var position_Id = "${sessionScope.systemStaff.position_Id }";//获取当前登录人角色信息
    $.ajax({
        url:'Currency/selectCurrency.action',
        type:'post',
        data:{"currency_id":currency_id,"currency_type":currency_type},
        dataType:'JSON',
        success:function(res){
            $("#staff_name").text(res.data[0].staff_name);
            $("#department").text(res.data[0].department_name);
            $("#date").text(Format(res.data[0].currency_date,"yyyy-MM-dd"));
            $("#use_type").text(res.data[0].currency_string2);
            $("#use_company").text(res.data[0].currency_string3);
            $("#seal_type").text(res.data[0].currency_string4);
            $("#doc_type").text(res.data[0].currency_string8);
            $("#currency_date2").text(res.data[0].currency_date2==null?"无":Format(res.data[0].currency_date2,"yyyy-MM-dd"));
            $("#request_reason").text(res.data[0].currency_string5);
            $("#remark").text(res.data[0].currency_string7);
        }
    });

    $.ajax({
        url:'Currency/selectApprovalOpinion.action',
        type:'post',
        data:{
            "approval_id":currency_id,
            "approvalOpinion_type":currency_type
        },
        dataType:'JSON',
        success:function(res){
            $.each(res.data,function (index,item) {
                var approver_name = '';
                if (item.approver_name != undefined){
                    approver_name = item.approver_name;
                }
                var approvalOpinion_result = '';
                if (item.approvalOpinion_result != undefined){
                    approvalOpinion_result = item.approvalOpinion_result;
                }

                var html = '<tr>';
                html += '<td>'+item.approval_state+'</td>'
                    +	'<td>'+approver_name+'</td>'
                    +	'<td>'+approvalOpinion_result+'</td>'
                    +	'<td>'+Format0(item.approval_date,"yyyy-MM-dd HH:mm:ss")+'</td>'
                    +	'</tr>';
                $('.layui-table>tbody').append(html);
            });
        }
    });

    //获取图片
    $.ajax({
        url:'Currency/selectContractPicture.action?currency_id='+currency_id,
        type:'post',
        data:{},
        dataType:'JSON',
        success:function(res){
            var html = '<tr>';
            $.each(res.data, function (index, item) {
                html += '<td><img src='+item.coverpath+' class="pimg"></td>';
            });
            html += '</tr>';
            $('.pics').after(html);
            $(".pimg").on('click',function(){
                var _this = $(this);//将当前的pimg元素作为_this传入函数
                imgShow("#outerdiv", "#innerdiv", "#bigimg", _this);
            });
        }
    });
    function imgShow(outerdiv, innerdiv, bigimg, _this){
        var src = _this.attr("src");//获取当前点击的pimg元素中的src属性
        $(bigimg).attr("src", src);//设置#bigimg元素的src属性

        /*获取当前点击图片的真实大小，并显示弹出层及大图*/
        $("<img/>").attr("src", src).on('load',function(){
            var windowW = $(window).width();//获取当前窗口宽度
            var windowH = $(window).height();//获取当前窗口高度
            var realWidth = this.width;//获取图片真实宽度
            var realHeight = this.height;//获取图片真实高度
            var imgWidth, imgHeight;
            var scale = 0.4;//缩放尺寸，当图片真实宽度和高度大于窗口宽度和高度时进行缩放

            /*if(realHeight>windowH*scale) {//判断图片高度
                imgHeight = windowH*scale;//如大于窗口高度，图片高度进行缩放
                imgWidth = imgHeight/realHeight*realWidth;//等比例缩放宽度
                if(imgWidth>windowW*scale) {//如宽度扔大于窗口宽度
                    imgWidth = windowW*scale;//再对宽度进行缩放
                }
            } else if(realWidth>windowW*scale) {//如图片高度合适，判断图片宽度
                imgWidth = windowW*scale;//如大于窗口宽度，图片宽度进行缩放
                imgHeight = imgWidth/realWidth*realHeight;//等比例缩放高度
            } else {//如果图片真实高度和宽度都符合要求，高宽不变
                imgWidth = realWidth;
                imgHeight = realHeight;
            }*/
            imgWidth = realWidth*scale;
            imgHeight = realHeight*scale;
            $(bigimg).css("width",imgWidth);//以最终的宽度对图片缩放

            var w = (windowW-imgWidth)/2;//计算图片与窗口左边距
            var h = (windowH-imgHeight)/2;//计算图片与窗口上边距
            $(innerdiv).css({"top":h, "left":w});//设置#innerdiv的top和left属性
            $(outerdiv).fadeIn("fast");//淡入显示#outerdiv及.pimg
        });

        $(outerdiv).on('click',function(){//再次点击淡出消失弹出层
            $(this).fadeOut("fast");
        });
    }

</script>
</body>
</html>
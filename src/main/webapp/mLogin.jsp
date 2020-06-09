<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 登录页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
		<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <link rel="stylesheet" href="layui/css/layui.css">
        <link rel="stylesheet" href="css/mobile.css">
        <script src="layui/layui.js"></script>
	</head>
	<body>
		<h2 class="title-login">丽泽综合业务管理平台V1.0</h2>
		<div class="login-container">
			<div class="login-header">
				<h2>后台登录</h2>
			</div>
			<div class="login-content">
				<form class="layui-form form-login" action="Staff/Mlogin.action" method="post" >
					<div class="layui-form-item">
			            <div class="layui-input-block">
			                <input type="text" class="layui-input" name="staff_Number" id="name" placeholder="请输入用户名">
			            </div>
			        </div>
			        <div class="layui-form-item">
			            <div class="layui-input-block">
			                <input type="password" class="layui-input" name="staff_Password" id="password" placeholder="请输入密码">
			            </div>
			        </div>
			        <div class="layui-form-item">
			            <div class="layui-input-block">
			                <button class="layui-btn btn-login" id="login" lay-submit="" lay-filter="login" type="">登录</button>
			            </div>
			        </div>
				</form>
			</div>
		</div>

	<script type="text/javascript" src="//g.alicdn.com/dingding/dingtalk-jsapi/2.6.41/dingtalk.open.js" ></script>
	<script type="text/javascript">
        layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'],function(){
            var laydate = layui.laydate //日期
                ,laypage = layui.laypage //分页
                ,layer = layui.layer //弹层
                ,table = layui.table //表格
                ,element = layui.element //元素操作
                ,form = layui.form
                ,layedit = layui.layedit;

            dd.ready(function() {
                dd.runtime.permission.requestAuthCode({
                    corpId : "dingc8ddd51a8f49f5aa35c2f4657eb6378f",
                    onSuccess : function(result) {
                        var code = result.code;
                       // layer.msg(code);
                        //将code 发往后台处理
                        $.ajax({
                            url : "Ding/dingdingUserId.action",
                            type : "post",
                            data : {"code":code},
                            dataType : "JSON",
                            success : function(res){
                                if (res.data != null){
                                    $('#name').val(res.data.staff_Number);
                                    $('#password').val(res.data.staff_Password);
                                }else {
                                    layer.msg("未查询到账户，请手动输入！");
                                }
                            },
							error:function () {
								alert("调用失败，请手动输入！！！");
                            }
                        });
                    },
                    onFail : function(err) {
                        alert('出错了, ' + JSON.stringify(err));
                    }
                });
            });
        });
	</script>
	</body>
</html>
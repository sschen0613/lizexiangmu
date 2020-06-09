<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
    <!-- <link rel="stylesheet" type="text/css" href="../public/css/base.css">  -->
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="shortcut icon" href="img/login.png">
    <link rel="stylesheet" href="layui/css/layui.css">
	<title>丽泽信息化管理系统后台登录页面</title>
</head>
<body>
	<div class="container">
		<div class="container-top">
			<span class="logo"></span>
			<h2>丽泽综合业务管理平台V1.0</h2>
		</div>
		<div class="container-ctn">
			<div class="login-container">
				<div class="header">
					<h2>后台登录</h2>
				</div>
				<div class="content">
					<form action="Staff/login.action" method="post" class="form-horizontal">
				          <div class="form-group input">
				              <div class="col-lg-4">
				                <input id="username" type="text" name="staff_Number" class="form-control" placeholder="请输入账号名">
				              </div>              
				          </div>
				          
						  <div class="form-group"></div>
						  <div class="form-group"></div>
		
				          <div class="form-group input">
				              <div class="col-lg-4">
				                <input id="password" type="password" name="staff_Password" class="form-control" placeholder="请输入密码">
				              </div>              
				          </div>
		                  <div class="form-group"></div>

				          <div class="form-group jzhuwo">
				            <div class="col-lg-8 col-lg-offset-1">              
				                <span class="checkbox ">
				                </span>           
				            </div>
				          </div>
		
				          <div class="form-group">
				            <div class="dlann">
				                <input type="submit" value="登 录" class="btn btn-primary btn-sm"><br/>
				                <span class="text">${error }</span>              
				            </div>
				          </div>
					</form>
				</div>
			</div>
		</div>
	</div>

<script src="./public/js/jquery-3.1.1.min.js"></script>
<script src="./bootstrap/js/bootstrap.min.js"></script>
<script src="./public/js/delaunay.js"></script>
<script src="./public/js/TweenMax.js"></script>
<script src="jss/effect.js"></script>
<script type="text/javascript" src=""></script>

</body>
</html>
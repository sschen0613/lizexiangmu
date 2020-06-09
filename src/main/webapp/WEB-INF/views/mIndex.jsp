<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no"/>
        <link rel="stylesheet" href="layui/css/layui.css">
        <link rel="stylesheet" href="css/mobile.css">
        <link rel="stylesheet" href="css/iconfont.css">
        <script src="layui/layui.js"></script>
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/iconfont.js"></script>
	</head>
	<body>
		<h2 class="title-login">丽泽综合业务管理平台V1.0</h2>
		<div class="container-index">
			<div id="apply" class="tab"></div>
			<div id="approval" class="tab"></div>
			<div id="myInformation" class="tab this-tab"></div>
		</div>
		<div class="footer-index"> 
			<ul>
				<li class="apply" onclick="updateMobileView(this)"><i class="layui-icon layui-icon-survey"></i><span>申请</span></li>
				<li class="approval" onclick="updateMobileView(this)"><i class="layui-icon layui-icon-log"></i><span>审批</span></li>
				<li class="myInformation this-li" onclick="updateMobileView(this)"><i class="layui-icon layui-icon-user"></i><span>我的信息</span></li>
			</ul>
		</div>
		<script>
			//页面切换事件
			function updateMobileView(target){
				//切换底部菜单
				$('.this-li').removeClass('this-li');
				var tab_id = $(target).attr('class');
				$(target).addClass('this-li');
				$('.this-tab').removeClass('this-tab');
				$('#'+tab_id).addClass('this-tab');
			}
		</script>
		<script type="text/javascript">
            layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table',  'element', 'form'],function(){
				var laydate = layui.laydate //日期
				,laypage = layui.laypage //分页
				,layer = layui.layer //弹层
				,table = layui.table //表格
				,element = layui.element //元素操作
				,form = layui.form
				,layedit = layui.layedit;
				
				//页面内容加载 	申请
				$.ajax({
					url : "view/getmenu.action"
					,type : "post"
					,data : {"staff_Superior" :2}
					,dataType : "JSON"
					,beforeSend: function(){
						layer.load(1);
				 	}
					,success : function(menus){
						layer.closeAll('loading');
						var html ='';
						$.each(menus,function(index1,item1){
							if(item1.menu_type == 0){
								html += '<div class="module">'
									 +		'<h2>'
									 +			'<svg class="alSvgIcon" aria-hidden="true">'
									 +			    '<use xlink:href="#'+item1.menu_icon+'"></use>'
									 +			'</svg>'
									 +			item1.menu_Name
									 +		'</h2>'
									 +		'<div class="content">';
								var count = 0; //计算二级菜单个数
								$.each(menus,function(index2,item2){
									if(item2.menu_Superior == item1.menu_Id && item2.menu_type == '2'){
										html += '<a href="'+item2.menu_PhoneUrl+'">'
											 +		'<span class="iconfont '+item2.menu_icon+'"></span>'
											 +		'<i>'+item2.menu_Name+'</i>'
											 +	'</a>';
										count++;
									}
								});
								if(count%4 != 0){
									for(var i=0;i<4-(count%4);i++){
										html +='<a href="" style="border:0;background-color:white;"></a>';
									}
								}
								html += 	'</div>'
									 +	'</div>';
							}
						});
						$('#apply').html(html);
					}
				});
				//页面内容加载	审批
				$.ajax({
					url : "view/getmenu.action"
					,type : "post"
					,data : {"staff_Superior" :1}
					,dataType : "JSON"
					,success : function(menus){
						var html ='';
						$.each(menus,function(index1,item1){
							if(item1.menu_type == 0){
								html += '<div class="module">'
									 +		'<h2>'
									 +			'<svg class="alSvgIcon" aria-hidden="true">'
									 +			    '<use xlink:href="#'+item1.menu_icon+'"></use>'
									 +			'</svg>'
									 +			item1.menu_Name
									 +		'</h2>'
									 +		'<div class="content">';
								var count = 0; //计算二级菜单个数
								$.each(menus,function(index2,item2){
									if(item2.menu_Superior == item1.menu_Id && item2.menu_type == '1'){
										html += '<a href="'+item2.menu_PhoneUrl+'">'
											 +		'<span class="iconfont '+item2.menu_icon+'"></span>'
											 +		'<i>'+item2.menu_Name+'</i>'
											 +	'</a>';
										count++;
									}
								});
								if(count%4 != 0){
									for(var i=0;i<4-(count%4);i++){
										html +='<a href="" style="border:0;background-color:white;"></a>';
									}
								}
								html += 	'</div>'
									 +	'</div>';
							}
						});
						$('#approval').html(html);
					}
				});

                var myInformation ='';
                myInformation += '<div class="module">'
                    +		'<h2>'
                    +			'<svg class="alSvgIcon" aria-hidden="true">'
                    +			    '<use xlink:href="#layui-icon-friends"></use>'
                    +			'</svg>'
                    +		'我的信息</h2>'
                    +		'<div class="content">';

                myInformation += '<a href="Staff/mMessage.action">'
                    +		'<span class="layui-icon layui-icon-edit"></span>'
                    +		'<i>修改密码</i>'
                    +	'</a>';

                myInformation += '<a href="Staff/mMyApply.action">'
                    +		'<span class="layui-icon layui-icon-survey"></span>'
                    +		'<i>我的申请</i>'
                    +	'</a>';

                myInformation += '<a href="Staff/mMyApproval.action">'
                    +		'<span class="layui-icon layui-icon-list"></span>'
                    +		'<i>我的审批</i>'
                    +	'</a>';

                $('#myInformation').html(myInformation);

				//获取当前选中选项卡
				var currentTab = "${param.currentTab}";
				if(currentTab == 'apply'){
					updateMobileView($('.apply'));
				}else if(currentTab == 'approval'){
					updateMobileView($('.approval'));
				}else if (currentTab == 'myInformation'){
				    updateMobileView($('.myInformation'))
				}else {
					//页面初始化
					updateMobileView($('.this-li'));
				}
				
				//操作
				
            });
		</script>
	</body>
</html>
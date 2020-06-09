<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 手机端申请页面 -->
<base href="<%=basePath%>">
<meta charset="utf-8">
<!-- <link rel="stylesheet" href="css/mobile.css"> -->
<!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
<script type="text/javascript" src="js/iconfont.js"></script>

<div id="apply" class="tab">

</div>

<script  type="text/javascript">
	layui.use(['layer', 'element'], function(){
		var layer = layui.layer //弹层
		,element = layui.element; //元素操作
		
		//页面内容加载
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
							if(item2.menu_Superior == item1.menu_Id){
								html += '<a href="'+item2.menu_PhoneUrl+'">'
									 +		'<span class="layui-icon layui-icon-survey"></span>'
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
		
	});
</script>
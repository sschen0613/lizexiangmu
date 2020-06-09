<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>丽泽信息化管理</title>
<link rel="shortcut icon" href="img/logo_mini.png">
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="css/iconfont.css">
<script src="layui/layui.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="js/echarts.js"></script>
<script type="text/javascript" src="js/iconfont.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header header_revise">
			<div class="layui-logo logo_revise"><span></span><h2>丽泽综合业务管理平台V1.0</h2></div>
			<!-- 头部区域（可配合layui已有的水平导航） -->

			<ul class="layui-nav layui-layout-right topNav_revise">
				<li class="layui-nav-item">
					<a href="javascript:;">${sessionScope.systemStaff.staff_Name }</a>
					<dl class="layui-nav-child staffName_revise">
						<dd>
							<a href="javascript:;"  lay-submit="" lay-filter="updatepwd" type="submit" id="updatepwd">修改密码</a>
							<a href="javascript:;"  lay-submit="" lay-filter="myApply" onclick="updateView('666','我的申请','Staff/myApply.action')" id="myApply">我的申请</a>
							<a href="javascript:;"  lay-submit="" lay-filter="myApproval" onclick="updateView('999','我的审批','Staff/myApproval.action')" id="myApproval">我的审批</a>
						</dd>
					</dl>
				</li>
 				<li class="layui-nav-item">
 					<a href="javascript:;" onclick="OpenWindow()">
 						<i class="layui-icon navicon layui-icon-speaker"></i>
 						<span id="number" class="layui-badge msg-count">0</span>
 					</a>
<!-- 					<dl class="layui-nav-child message_revise"> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('storage/purchaseConsideration.action')" lay-submit="" lay-filter="updatepwd3" type="submit">采购审批<span id="purchase" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('storage/outlibraryConsideration.action')" lay-submit="" lay-filter="updatepwd4" type="submit">出库审批<span id="outStock" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('storage/SaleConsideration.action')" lay-submit="" lay-filter="updatepwd5" type="submit">销售审批<span id="endProduct" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('storage/stockAllocationConsideration.action')" lay-submit="" lay-filter="updatepwd6" type="submit">库存调拨审批<span id="stockInventory" class="layui-badge msg-count">0</span></a> -->
							
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('facilities/facilitiesAllotManagerApprovalViews.action')" lay-submit="" lay-filter="updatepwd7" type="submit">设施调拨审批<span id="facilitiesAllocation" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('archives/accessedConsideration.action')" lay-submit="" lay-filter="updatepwd1" type="submit">档案调阅审批<span id="number1" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 						<dd> -->
<!-- 							<a href="javascript:;" onclick="updateView('archives/destroyConsideration.action')" lay-submit="" lay-filter="updatepwd2" type="submit">档案销毁审批<span id="number2" class="layui-badge msg-count">0</span></a> -->
<!-- 						</dd> -->
<!-- 					</dl> -->
					
				</li>
				<li class="layui-nav-item"><a href="Staff/logout.action">退出</a></li>
			</ul>
		</div>

		<div class="layui-side side_revise" style=" overflow-y:hidden">
			<div class="layui-side-scroll" style="border: 1px  #000000; width: 240px; margin: 0 auto;">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree menu_context menu_revise" lay-filter="test">

				</ul>
			</div>
		</div>

		<div class="layui-body right_revise " scrolling="no">
			<!-- 内容主体区域 -->
			
<!-- 			<div style="padding:15px 0 0 15px; width: 100%; height: 100%;" id="jsp_context"> -->
<!-- 			</div> -->
			<!-- 选项卡 -->
			<div class="layui-tab tab_revise" lay-filter="demo" lay-allowClose="true">
				<ul class="layui-tab-title">

				</ul>
				<div class="layui-tab-content">

				</div>
			</div>
			
			<!-- 底部固定区域 -->
			<div class="layui-footer footer_revise" style="text-align:right;padding-right:40px;">
				<!-- 菜单栏隐藏显示按钮 -->
				<div class="menu-slide show"><span class="layui-icon layui-icon-prev"></span></div>
				© 山东丽泽环境技术服务有限公司
			</div>
		</div>

<!-- 左侧导航栏一级菜单模板   <span class="iconfont icon-icon_hetongshenqing menuicon"></span> -->
		<li class="layui-nav-item menu_parent">
			<a href="javascript:;">
				<span class="menuicon">
					<svg class="alSvgIcon" aria-hidden="true">
					    <use xlink:href=""></use>
					</svg>
				</span>
				<span class="menuname"></span>
			</a>
			<dl class="layui-nav-child">

			</dl>
		</li>
<!-- 左侧导航栏二级菜单模板 -->
		<dd class="menu_child">
			<a href="javascript:;" class="menu_action">
				<span class="menuicon">
					<svg class="alSvgIcon" aria-hidden="true">
					    <use xlink:href=""></use>
					</svg>
				</span>
				<span class="menuname"></span>
			</a>
			<dl>
					
			</dl>
		</dd>

<script type="text/javascript">
// 	var msgCount = 0;
// 	 $.ajax({
// 		url:"archives/selectAccessedConsideration.action",
// 		type:"post",
// 		data:{"limit":10,"page":1},
// 		async: false,
// 		dataType:"JSON",
// 		success:function(h){
// 			  $("#number1").text(h.count);
// 			msgCount += h.count;
// 			$('#number').text(msgCount);  
// 		}
// 	}) ;
// 	 $.ajax({
// 			url:"archives/selectArchivesDestroy.action",
// 			type:"post",
// 			data:{"limit":10,"page":1},
// 			async: false,
// 			dataType:"JSON",
// 			success:function(h){
// 				  $("#number2").text(h.count);
// 				msgCount += h.count;
// 				$('#number').text(msgCount);  
// 			}
// 		}) ;
//  /* 	$.ajax({
// 		url:"archives/count1.action",
// 		type:"post",
// 		dataType:"JSON",
// 		success:function(h){
// 			$("#number1").text(h);
// 			msgCount += h;
// 			$('#number').text(msgCount);
// 		}
// 	});
// 	$.ajax({
// 		url:"archives/count2.action",
// 		type:"post",
// 		dataType:"JSON",
// 		success:function(h){
// 			$("#number2").text(h);
// 			msgCount += h;
// 			$('#number').text(msgCount);
// 		}
// 	});	 */
 
//  staffid ="${sessionScope.systemStaff.dingding_staffid }";
//  //采购
// 	$.ajax({
// 			url:'Purchase/selectApprovalPurchase.action',
// 			type:'post',
// 			data:{"id":staffid},
// 			async: false,
// 			dataType:"json",
// 			success:function(result){
// 				msgCount += result.count;
// 				$("#purchase").text(result.count);
// 			}
// 		});
//  //办公设施调拨
// 	$.ajax({
// 		url:'FacilitiesAllocation/selectApprovalFacilities.action?allocation_Remarks='+staffid,
// 		type:'post',
// 		data:{"dingding_staffid":staffid},
// 		async: false,
// 		dataType:"json",
// 		success:function(result){
// 			msgCount += result.count;
			
// 			$("#facilitiesAllocation").text(result.count);
// 		}
// 	});
//  //出库
// 	$.ajax({
// 		url:'OutLibrary/selectApproverOutStock.action',
// 		type:'post',
// 		data:{"id":staffid},
// 		async: false,
// 		dataType:"json",
// 		success:function(result){
// 			msgCount += result.count;
// 			$("#outStock").text(result.count);
// 		}
// 	});
//  //库存调拨
// 	$.ajax({
// 		url:'Stock/selectApprovalStockAllocation.action',
// 		type:'post',
// 		data:{"dingding_staffid":staffid},
// 		async: false,
// 		dataType:"json",
// 		success:function(result){
// 			msgCount += result.count;
// 			$('#number').text(msgCount);
// 			$("#stockInventory").text(result.count);
// 		}
// 	});
// 	 //销售
// 	$.ajax({
// 		url:'S/endproductManagerConsideration.action',
// 		type:'post',
// 		data:{"id":staffid},
// 		async: false,
// 		dataType:"json",
// 		success:function(result){
// 			msgCount += result.count;
// 			$('#number').text(msgCount);
// 			$("#endProduct").text(result.count);
// 		}
// 	});
</script>
<script>
layui.use(['laydate', 'layedit', 'laypage', 'layer', 'table', 'element', 'form'], function(){
	var laydate = layui.laydate //日期
	,laypage = layui.laypage //分页
	,layer = layui.layer //弹层
	,table = layui.table //表格
	,element = layui.element //元素操作
	,form = layui.form
	,layedit = layui.layedit;
	
	//选项卡事件
	var active = {
	    tabAdd: function(id,title,content){
	      	//新增一个Tab项
	      	element.tabAdd('demo', {
	        	title: title
	        	,content: '<iframe id="testiframe'+id+'" name="testiframe'+id+'" iframe-id="'+id+'" src="'+content+'" class="content_revise" frameborder="0" ></iframe>'
// 	        	,content:content
	        	,id: id
	      	});
//**	      	console.log('add0');
//** 	      	console.log($('#testiframe'+id).find('form'));
//** 	      	console.log($(document.getElementById('testiframe'+id).contentWindow.document.body).html());
//** 	      	$("#testiframe"+id).contents().find('#approval-open')
//** 	      	$(window.frames['testiframe'+id].document).find('#approval-open')[0]
//** 	      	$($('#testiframe')[0].contentWindow.document.body).find('.approval-open')[0]
	    }
	    ,tabChange: function(id){
	      	//切换到指定Tab项
	      	element.tabChange('demo', id); //切换到：用户管理
	    }
	    ,tabDelete: function(layid){
	    	element.tabDelete('demo', layid);
	    }
	};
	var currentTabs = [] , currentId; //当前在容器中的所有选项卡的lay-id值的数组 ，当前显示的选项卡项id
	// 监听选项卡点击事件
	$('.layui-tab').click(function(e){
// 		console.log(e.target);
		if($(e.target).is("button")){return;}
		if($(e.target).is("ul")){return;}
		// 判断是否是删除事件（即点击[差号图标]）
		if($(e.target).is(".layui-tab-close")){
			// 获取删除项的id
			var d_id = $(e.target).parent().attr('lay-id');
            var index = $.inArray(d_id,currentTabs);
			// 要删除的项为当前显示项 ，针对bug使用自定义方法	// 判断tab数是否超过容器宽度 $('.layui-unselect.layui-tab-bar')[0] != undefined 
			if(d_id == currentId){
				// 获取下一个获取焦点的选项卡的id
                var id = ( index == currentTabs.length-1 ) ? (currentTabs.length == 1 ? -1 : currentTabs[index-1]) : currentTabs[index+1] ;
                active.tabDelete(d_id);
                active.tabChange(id);
                currentId = id;
            }
            currentTabs.splice(index,1);
        }
		// 判断是否是点击选项卡事件（即点击title）
		else if($(e.target).is("li")){
        	// 获取当前点击的选项卡的id
            var c_id = $(e.target).attr('lay-id');
    		currentId = c_id;
        }
		//联动左侧菜单栏
		$('.menu_context dd.layui-this').removeClass('layui-this');
		if(currentId == -1){
			tabsDelete(2);
		}else{
			$('.menu_context dd[menu-id='+currentId+']').addClass('layui-this');
	        var currentDd = $('.menu_context dd[menu-id='+currentId+']').parent().parent();
	        if(currentDd.hasClass('layui-nav-itemed') == false)
	        	currentDd.addClass('layui-nav-itemed');
	        var currentLi = $('.menu_context dd[menu-id='+currentId+']').closest('li');
	        if(currentLi.hasClass('layui-nav-itemed') == false)
	        	currentLi.addClass('layui-nav-itemed');
		}
        
	});
	// 添加清除选项卡按钮
	function tabsDelete(type){
		switch(type){
			// 添加或更新位置
			case 1 :
				//删除按钮已存在
				if($('span.delete-tabs')[0] != undefined){
					$('span.delete-tabs').remove();
				}
				var html = '<span class="delete-tabs"><button class="layui-btn layui-btn-primary layui-btn-sm">清 除</button></span>';
				$('.layui-tab-title').append(html);
				$('span.delete-tabs>button').click(function(){
					layer.confirm('清除选项卡 ？', function(index){
						$('.layui-tab-title').children().remove();
						$('.layui-tab-content').children().remove();
						//重置currentId，currentTabs
						currentId = -1;
						currentTabs.splice(0,currentTabs.length);
						//联动左侧菜单栏
						$('.menu_context dd.layui-this').removeClass('layui-this');
				        layer.close(index);
				    });
				});
				break;
			// 删除
			case 2 :
				$('span.delete-tabs').remove();
				break;
		}
	}

	// 定义菜单栏点击事件
	window.updateView = function(id,title,action){
		//选项卡不存在 创建选项卡
		if(id && $.inArray(id,currentTabs) == -1){
			// $.ajax({
			// 	url:action,
			// 	type:"post",
			// 	dataType:"HTML",
			// 	success:function(html){
					active.tabAdd(id,title,action);
					currentTabs.push(id);
					//**var ifrm = document.getElementById('testiframe'+id).contentWindow.document;
					//**console.log(ifrm);
					//**iframe子页面的元素
					
			// 	}
			// });
		}else{
			//选项卡已存在 刷新该选项卡内容iframe页面
			$('iframe[iframe-id='+id+']').attr('src', $('iframe[iframe-id='+id+']').attr('src'));
		} 
		// 更新焦点
		active.tabChange(id);
		currentId = id;
		//给选项卡添加删除按钮
		tabsDelete(1);
	}
	//初始化左侧菜单栏
	$.ajax({
		url:'view/getmenu.action',
		type:'post',
		async: false,
		dataType:"JSON",
		success:function(menus){
			$.each(menus,function(index1,item1){
				//构造一级菜单
				if(item1.menu_Superior == null){
					var li = $('.menu_parent').clone();
					li.removeClass('menu_parent');
					li.find('.menuname').text(item1.menu_Name);
// 					li.find('.menuicon use').attr('xlink:href','#icon-icon_hetongxinxibiao');
					li.find('.menuicon use').attr('xlink:href','#'+item1.menu_icon);
					//构造二级菜单
					$.each(menus,function(index2,item2){
						if(item2.menu_Superior == item1.menu_Id){
							var dd = $('.menu_child').clone();
							dd.removeClass('menu_child');
							dd.find('.menuname').text(item2.menu_Name);
							//构造三级菜单
							var flag = 0;
							$.each(menus,function(index3,item3){
								if(item3.menu_Superior == item2.menu_Id){
									flag = 1;
									var sub = $('.menu_child').clone();
									sub.removeClass('menu_child');
									sub.find('.menuname').text(item3.menu_Name);
									sub.find('a').attr('onclick','updateView("'+item3.menu_Id+'","'+item3.menu_Name+'","'+item3.menu_Url+'")');
									sub.find('use').attr('xlink:href','#icon-file');
									sub.attr('menu-id',item3.menu_Id);
									dd.children('dl').append(sub);
								}
							});
							if(flag == 0){
								//绑定方式1	window.updateView = function(id,title,action){}
								dd.find('a').attr('onclick','updateView("'+item2.menu_Id+'","'+item2.menu_Name+'","'+item2.menu_Url+'")');
								//绑定方式2	function updateView(id,title,action){}
								// dd.find('a').click(function(){
								// 	updateView(item2.menu_id,item2.menu_name,item2.menu_url);
								// });
								dd.find('use').attr('xlink:href','#icon-file');
								dd.attr('menu-id',item2.menu_Id);
							}else{
								dd.addClass('third-menu');
								dd.children('dl').addClass('layui-nav-child');
								dd.children('a').children('span').children('svg').children('use').attr('xlink:href','#icon-folder');
							}
							li.children('.layui-nav-child').append(dd);
						}
					});
					$('.menu_context').append(li);
				}
			});
			//页面重新渲染 !!!
			layui.use('element', function(){
				var element2 = layui.element;
				element2.init();
			});

		}
	});
	// 菜单栏隐藏显示按钮 
	$('.menu-slide').click(function(){
		if($('.menu-slide').hasClass('show')){
			$('.layui-layout-admin .layui-side').animate({left:'-230px'},'0.7');
			$('.layui-body').animate({left:'0'},'0.7');
			$('.layui-layout-admin .layui-footer').animate({left:'0'},'0.7');
			$('.menu-slide>span').removeClass('layui-icon-prev').addClass('layui-icon-next');
			$('.menu-slide').addClass('hide').removeClass('show');
		}else if($('.menu-slide').hasClass('hide')){
			$('.layui-layout-admin .layui-side').animate({left:'0'},'0.7');
			$('.layui-body').animate({left:'230px'},'0.7');
			$('.layui-layout-admin .layui-footer').animate({left:'230px'},'0.7');
			$('.menu-slide>span').removeClass('layui-icon-next').addClass('layui-icon-prev');
			$('.menu-slide').addClass('show').removeClass('hide');
		}
	});
	
	//修改密码
	$('#updatepwd').click(function(){
    	layer.open({
    		type: 2,
    		title :'修改密码',
    		shade: 0.8,
    		shadeClose:true,
    		maxmin: true,
    		closeBtn: 1,
    		area: ['800px', '80%'],
    		content: 'Staff/message.action',
    		end: function () {
    	        	
    	    	table.reload("tab" ,{});
    		}
		});
	});
});
</script>
</body>
</html>
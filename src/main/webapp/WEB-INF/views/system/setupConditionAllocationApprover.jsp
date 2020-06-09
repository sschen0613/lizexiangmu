<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>
<!-- 审批管理 设置 设定 设置条件审批流程 --> 
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/form_system_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../js/function_tool.js"></script>
<form class="layui-form form-approval-persion">
	<div class="layui-form-item">
		 <div class="layui-inline">
			<label class="layui-form-label">人员&nbsp;&nbsp;:&nbsp;</label>
			<div class="layui-input-inline">
			     <select id="approver_id" name="staff_id" lay-filter="dingrole" lay-search class="">
			  </select>
			</div>
		 </div>
		 <div class="layui-inline">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
              	添加
            </button>
	      </div> 
		 <div class="layui-inline">
			<label class="layui-form-label">主管&nbsp;&nbsp;:&nbsp;</label>
			<div class="layui-input-inline">
			  <select name="department_id" lay-filter="zhuguan" lay-search class="">
			  	<option value=''>请选择主管</option>
			  	<option value='1'>直接主管</option>
			  	<option value='2'>二级主管</option>
			  	<option value='3'>三级主管</option>
			  	<option value='4'>四级主管</option>
			  	<option value='5'>五级主管</option>
			  	<option value='6'>六级主管</option>
			  	<option value='7'>七级主管</option>
			  </select>
			</div>
		 </div>
		 <div class="layui-inline">
            <button lay-submit="" lay-filter="search2" type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
              	添加
            </button>
	      </div> 
		 <div class="layui-inline">
			<label class="layui-form-label">角色&nbsp;&nbsp;:&nbsp;</label>
			<div class="layui-input-inline">
			     <select id="dingrole" name="role_id" lay-filter="role" lay-search class="">
			  </select>
			</div>
		 </div>
		  <div class="layui-inline">
            <button lay-submit="" lay-filter="search3" type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
              	添加
            </button>
	      </div> 
		 <div class="layui-inline">
			<label class="layui-form-label">金额&nbsp;&nbsp;&ge;</label>
			<div class="layui-input-inline">
			     <input type="text" id="approval_money" name="approval_money" placeholder="金额只保留整数" autocomplete="off" class="layui-input">
			</div>
		 </div>
		 <div class="layui-inline">
            <button lay-submit="" lay-filter="search4" type="submit" class="layui-btn layui-btn-sm layui-btn-warm">
              	修改
            </button>
	      </div> 
		</div>

</form>  
<table class="layui-hide" id="test" lay-filter="demo" lay-data="{url:'/test/table/demo1.json', id:'demo'}" lay-filter="demo" lay-size="sm"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">移除</a>
</script>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add">批量移除</button>
  </div>
</script>

<script type="text/javascript">


layui.use(['laydate', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  ,layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,element = layui.element //元素操作
	  ,form = layui.form
	  ,layedit = layui.layedit;
	  var company_id = ${param.company_id};
	  var approval_id = ${param.approval_id };
	  var condition = 2;
		//监听添加提交按钮
	  form.on('submit(search4)', function(data2){
		  	  var data = data2.field;
		 	  var approval_money = data.approval_money;
			  var approver_id = data.approver_id;
	 	        $.ajax({
		        	url : "../system/updateApprovalMoney.action",
		        	type : "post",
		        	data : {"id":company_id, "money":approval_money,"approval_id":approval_id},
		        	dataType : "JSON",
		        	success : function (result){
		        		layer.msg(result.msg);
						//重载表格
				      	table.reload("tab" ,{
							
				      	}); 
		        	}
		        	
		        });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	//监听行双击事件
	  table.on('rowDouble(demo)', function(obj){
		  console.log(obj.tr) //得到当前行元素对象
		  console.log(obj.data) //得到当前行数据
		  //obj.del(); //删除当前行
		  //obj.update(fields) //修改当前行数据
		  var data = obj.data
		  ,approval_id = data.approval_id
		  ,role_type = data.role_type
		  ,approver_id = data.approver_id;
		  
		    layer.open({
		    	type: 2,
		    	title :'',
		    	shade: 0.8,
		    	shade: 0,
		        maxmin: true,
		        closeBtn: 1,
		    	area: ['80%', '80%'],
		    	content: '../Approval/setApprovalStaffView.action?approver_role_id='+data.approver_role_id, 
		        end: function () {
		        	table.reload("tab" ,{
		        	});
		          }
		    });
	  });
	  //监听单元格编辑
	  table.on('edit(demo)', function(obj){
	    var role_priority = obj.value //得到修改后的值
	    ,data = obj.data //得到所在行所有键值
	    ,field = obj.field; //得到字段
	    var approver_role_id = data.approver_role_id;
	    
	    
 	        $.ajax({
	        	url : "../Approval/updatePriority.action",
	        	type : "post",
	        	data : {"approver_role_id": approver_role_id, "role_priority":role_priority},
	        	dataType : "JSON",
	        	success : function (result){
	        		layer.msg(result.msg);
	        		if(result.code > 0){
	        			layer.msg('[ID: '+ data.approver_name +'] ' + field + ' 字段更改为：'+ value);
	        		}else{
	        			layer.msg(reuslt.msg);
	        		}
					//重载表格
			      	table.reload("tab" ,{
						
			      	}); 
	        	}
	        	
	        }); 
	    
	  });
	  var approver_name = null;
	  form.on('select(dingrole)', function(data){
		  approver_name = data.elem[data.elem.selectedIndex].text;

	  })
	  var name = null;
	  form.on('select(zhuguan)', function(data){
		  name = data.elem[data.elem.selectedIndex].text;

	  })
	  var rolename = null;
	  form.on('select(role)', function(data){
		  rolename = data.elem[data.elem.selectedIndex].text;

	  })
 	    		//监听添加提交按钮
	  form.on('submit(search3)', function(data3){
			 if(rolename == null){
				 layer.msg("请先进行选择");
			 }else{
				  var data2 = data3.field;
				  var role_id = data2.role_id;
				  var role_type = 1;
				  //添加审批角色
		 	        $.ajax({
			        	url : "../Approval/addFacilitiesApproval.action",
			        	type : "post",
			        	data : {"approver_name": rolename, "approver_id":role_id, "company_id":company_id, "role_type":role_type, "approval_id":approval_id,"approver_condition":condition},
			        	dataType : "JSON",
			        	success : function (result){
			        		layer.msg(result.msg);
							//重载表格
					      	table.reload("tab" ,{
								
					      	}); 
			        	}
			        	
			        });
			 }
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
  		//监听添加提交按钮
	  form.on('submit(search)', function(data3){
		 if(approver_name == null){
			 layer.msg("请先进行选择");
		 }else{
			  var data2 = data3.field;
			  var staff_id = data2.staff_id;
			  var role_type = 3;
			  //添加审批人
	 	        $.ajax({
		        	url : "../Approval/addFacilitiesApproval.action",
		        	type : "post",
		        	data : {"approver_name": approver_name, "approver_id":staff_id, "company_id":company_id, "role_type":role_type, "approval_id":approval_id,"approver_condition":condition},
		        	dataType : "JSON",
		        	success : function (result){
		        		layer.msg(result.msg);
						//重载表格
				      	table.reload("tab" ,{
							
				      	}); 
		        	}
		        	
		        });
		 }
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
 		//监听添加提交按钮
	  form.on('submit(search2)', function(data3){
		  var data2 = data3.field;
		 if(data2.department_id == ""){
			 layer.msg("请先进行选择");
		 }else{
			 
			  var department_id = data2.department_id;
			  var role_type = 2;
			//添加审批主管
	 	        $.ajax({
		        	url : "../Approval/addFacilitiesApproval.action",
		        	type : "post",
		        	data : {"approver_name": name, "approver_id": department_id, "role_type":role_type, "company_id":company_id, "approval_id":approval_id,"approver_condition":condition},
		        	dataType : "JSON",
		        	success : function (result){
		        		layer.msg(result.msg);
						//重载表格
				      	table.reload("tab" ,{
							
				      	}); 
		        	}
		        	
		        });
		 }
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		}); 
	  //查询钉钉所有角色
	    $.ajax({
	  	url : "../Approval/selectDingRole.action",
	  	type : "post",
	  	dataType : "JSON",
	  	success : function (list){
			 var html ="<option value=''>请选择角色</option>";
			 $.each(list, function(index, item){
				 $.each(item.roles, function(index, item){
					html += "<option value='"+item.id+"'>"+item.name+"</option>";
				 })
			 });
			 $("#dingrole").html(html);
			 form.render('select');
	  	}
	  });
		//获取所有员工
		  $.ajax({
			url : "../Staff/selectStaff.action",
			type : "post",
			dataType : "JSON",
			success : function (list){
				 var html ="<option value=''>请选择人员</option>";
				 $.each(list.data, function(index, item){
					html += "<option value='"+item.dingding_staffid+"'>"+item.stname+"</option>";
						
				 });
				 $("#approver_id").html(html);
				 form.render('select');
			}
		});
			//获取审批金额
		  $.ajax({
			url : "../Company/selectApprovalCondition.action",
			data: {"company_id" : company_id, "approval_id": approval_id},
			type : "post",
			dataType : "JSON",
			success : function (result){
				$("#approval_money").val(result.data);
			}
		});
	  //执行一个 table 实例
	  table.render({
	    elem: '#test'
	    //,height: 332
	    ,url: '../Approval/selectConditionApproval.action?approval_id='+approval_id+'&approver_condition='+condition+'&company_id='+company_id //数据接口
	    ,page: false //开启分页
	    ,id:'tab'
	    ,cols: [[ //表头
	      {field: 'approver_name', title: '角色名称'}
	      ,{field: 'role_priority', title: '审批顺序', sort: true, edit: 'text'}
	      ,{field: 'role_state', title: '审批方式', templet:'<div>{{ state(d.role_state)}}</div>'}
	      ,{fixed: 'right', title:'操作', align:'center', toolbar: '#barDemo'} 
	      ]]
	  });


	//监听工具条
	table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    	var data = obj.data //获得当前行数据
    	,layEvent = obj.event; //获得 lay-event 对应的值
    	var tr = obj.tr; //获得当前行 tr 的DOM对象
   
    	if(layEvent === 'detail'){
      		layer.msg('查看操作');
    	} else if(layEvent === 'del'){
      		layer.confirm('确认删除', function(index){
        		obj.del(); //删除对应行（tr）的DOM结构
        		layer.close(index);
        		//向服务端发送删除指令
        		var approver_role_id = data.approver_role_id;
        		$.ajax({
        			url : "../Approval/deleteDingRole.action",
        			type : "post",
        			data : {"approver_role_id" : approver_role_id},
        			dataType : "JSON",
        			success : function (result){
        				layer.msg(result.msg);
        			}
        		});
      		});
    	}
	});
	//限制金额只保留整数
	inputLimitInteger($('#approval_money'));
});
	function state(role_state) {
		var state ="";
		if(role_state == 1){
			state ="或签";
		}else{
			state ="会签";
		}
		return state;
	}
</script>
    
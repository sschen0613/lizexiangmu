<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 职员列表 添加 弹出框 -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<script src="../layui/layui.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise">
 
          <div class="layui-form-item">
            <label class="layui-form-label">员工账号</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Number" placeholder="(*必填)" autocomplete="off" class="layui-input" >
		    </div>
		  </div>
		  <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Password" placeholder="(*必填)" autocomplete="off" class="layui-input" lay-verify="required" >
		    </div>
		  </div>
		  <div class="layui-form-item">
            <label class="layui-form-label">重复密码</label>
		    <div class="layui-input-block">
		      <input type="text" name="password" placeholder="(*必填)" autocomplete="off" class="layui-input" lay-verify="required" >
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">员工姓名</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Name" placeholder="(*必填)" autocomplete="off" class="layui-input" lay-verify="required" >
		    </div>
		  </div>

		<div class="layui-form-item">
			<label class="layui-form-label">u8编码</label>
			<div class="layui-input-block">
				<input type="number" name="staff_idture" placeholder="(非必填)" autocomplete="off" class="layui-input" >
			</div>
		</div>

		  <div class="layui-form-item">
		    <label class="layui-form-label">年龄</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Age" placeholder="" autocomplete="off" class="layui-input">
		    </div>
		  </div> 
		  <div class="layui-form-item">
		    <label class="layui-form-label">性别</label>
		    <div class="layui-input-block">
		      <input type="radio" name="staff_Sex" value="男" title="男">
		      <input type="radio" name="staff_Sex" value="女" title="女" checked>
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">联系电话</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Phone" placeholder="133********" autocomplete="off" class="layui-input">
		      <!-- lay-verify="phone" -->
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">身份证号</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Identity" placeholder="370***************" autocomplete="off" class="layui-input" >
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">出生日期</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Birthday" class="layui-input" id="birthday" placeholder= "年-月-日">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">电子邮箱</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Email" placeholder="****.@****" autocomplete="off" class="layui-input">
		      <!-- lay-verify="email" -->
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属地区</label>
		    <div class="layui-input-block">
		      <%--<input type="text" name=staff_Address autocomplete="off" class="layui-input" >--%>
				<select id="staff_Address" name="staff_Address" lay-filter="select_position">
				</select>
			</div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">职位</label>
		    <div class="layui-input-block">
		      <select id="position" name="position_Id" lay-filter="select_position">
		      </select>
		    </div>
  		  </div>
  		   <div class="layui-form-item">
		    <label class="layui-form-label">所属公司</label>
		    <div class="layui-input-block">
		      <select id="company" name="company_Id" lay-filter="company">
		      </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属部门</label>
		    <div class="layui-input-block">
		      <select id="department" name="department_Id" lay-filter="select_depart">
		      </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">入职时间</label>
		    <div class="layui-input-block">
		      <input type="text" class="layui-input" name="join_Data" id="date" placeholder= "年-月-日" >
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">入职状态</label>
		    <div class="layui-input-block">
		      <select id="staffstate" name="staff_State" lay-filter="select_state">
		      </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="addstaff" type="submit">提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>   
    </form> 
    

<script type="text/javascript">
layui.use(['laydate', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,element = layui.element //元素操作
	  ,form = layui.form
	  ,layedit = layui.layedit;
		form.on('submit(addstaff)', function(data){
			console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
				,staff_Name = data2.staff_Name
				,staff_Age = data2.staff_Age
				,staff_Sex = data2.staff_Sex
				,staff_Phone = data2.staff_Phone
				,staff_Identity = data2.staff_Identity
				,staff_Birthday = data2.staff_Birthday
				,staff_Email = data2.staff_Email
				,staff_Address = data2.staff_Address
				,position_Id = data2.position_Id
				,staff_Superior = data2.staff_Superior
				,department_Id = data2.department_Id
				,company_Id = data2.company_Id
				,join_Data = data2.join_Data
				,staff_State = data2.staff_State
				,staff_Password = data2.staff_Password
				,password = data2.password
				,staff_idture = data2.staff_idture
				,staff_Number = data2.staff_Number;
		 	$.ajax({
		 		url : "../system/addStaff.action"
		 		,type : "post"
		 		,data : {"staff_Number" :staff_Number, "staff_Name" : staff_Name, "staff_Age" :staff_Age, "staff_Sex" :staff_Sex, "staff_Phone" :staff_Phone
	 				, "staff_Identity" :staff_Identity, "staff_Birthday" :staff_Birthday, "staff_Email" :staff_Email, "staff_Address" :staff_Address
	 				, "position_Id" :position_Id, "staff_Superior" :staff_Superior, "department_Id" :department_Id
	 				, "company_Id" :company_Id, "join_Data" :join_Data, "staff_State" :staff_State, "staff_Password" :staff_Password,'staff_Idture':staff_idture}
		 		,dataType : "JSON"
		 		,success : function(result){
		 				//账号密码不能为空
						$('#myForm').addClass('layui-btn-disabled');
                    	$('#myForm').attr("disabled", "disabled");
		 				alert(result.msg);
		 		}
		 });
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
		
	 //查询所有入职状态
  $.ajax({
	  	url : "../Staff/getStaffState.action",
	  	type : "post",
	  	dataType : "JSON",
	  	success : function (list){
			 var html ="<option value=''>入职状态</option>";
			 $.each(list.data, function(index, item){
				html += "<option value='"+item.staffstate_Id+"'>"+item.state_Name+"</option>";
			 });
			 $("#staffstate").html(html);
			 form.render('select');
	  	}
});

//查询所有职位
$.ajax({
	url : "../Position/getPosition.action",
	type : "post",
	dataType : "JSON",
	success : function (list){
		 var html ="<option value=''>请选择职位</option>";
		 $.each(list, function(index, item){
			html += "<option value='"+item.position_Id+"'>"+item.position_Name+"</option>";
				
		 });
		 $("#position").html(html);
		 form.render('select');
	}
});

//查询所有地区
    $.ajax({
        url : "../System/getRegion.action",
        type : "post",
        dataType : "JSON",
        success : function (list){
            var html ="<option value=''>请选择地区</option>";
            $.each(list.data, function(index, item){
                html += "<option value='"+item.cDCCode+"'>"+item.cDCName+"</option>";

            });
            $("#staff_Address").html(html);
            form.render('select');
        }
    });


//获取所有员工
  $.ajax({
	url : "../Staff/selectStaff.action",
	type : "post",
	dataType : "JSON",
	success : function (list){
		 var html ="<option value=''>请选择领导</option>";
		 $.each(list.data, function(index, item){
			html += "<option value='"+item.stid+"'>"+item.stname+"</option>";
				
		 });
		 $("#Superior").html(html);
		 form.render('select');
	}
});

  //获取所有公司信息详情
  $.ajax({
  	url : "../Company/getCompany.action",
  	type : "post",
  	dataType : "JSON",
  	success : function (res){
		 var html ="<option value=''>请选择公司</option>";
		 $.each(res.data, function(index, item){
			html += "<option value='"+item.company_id+"'>"+item.company_name+"</option>";
				
		 });
		 $("#company").html(html);
		 form.render('select');
  	}
  });
  //查询所有部门
 $.ajax({
		url : "../Department/getDepartment.action",
		type : "post",
		dataType : "JSON",
		success : function(res){
			var html ="<option value=''>请选择部门</option>";
			$.each(res.data, function(index, item){
				html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
				
			});
			$("#department").html(html);
			form.render('select');
		}
	}); 
  
  /*form.on('select(company)', function(data){
	  	var cid = data.value;
	  		//选择了"请选择公司"查询出所有部门
			 $.ajax({
					url : "../Department/getDepartment.action",
					type : "post",
					data : {"company_Id" :cid},
					dataType : "JSON",
					success : function(res){
						var html ="<option value=''>请选择部门</option>";
						$.each(res.data, function(index, item){
							html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
							
						});
						$("#department").html(html);
						form.render('select');
					}
				}); 

	  	
	});*/


	  
	//各种基于事件的操作
	laydate.render({
		elem:'#date'
		,type: 'datetime'
	});
	laydate.render({
		elem:'#birthday'
		,type: 'datetime'
	}); 
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
<!-- 职员列表 编辑 弹出框 -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" href="../css/edit_revise.css">
<link rel="stylesheet" href="../formselect/formSelects-v4.css">
<script src="../layui/layui.js"></script>
<script src="../formselect/formSelects-v4.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script>

    <form class="layui-form form_revise">
    	<div class="layui-form-item">
		    <label class="layui-form-label">员工账号</label>
		    <div class="layui-input-block">
		      <input placeholder="${param.stnumber }" type="text" name="staff_Number"  autocomplete="off" class="layui-input">
		    </div>
		  </div> 
		  <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
		    <div class="layui-input-block">
		      <input type="text" placeholder="******" name="staff_Password" autocomplete="off" class="layui-input">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">员工姓名</label>
		    <div class="layui-input-block">
		      <input type="text" value="${param.stname }" name="staff_Name"  autocomplete="off" class="layui-input">
				<input type="hidden" id="sa" value="${param.staff_address }">
		    </div>
		  </div>

		<div class="layui-form-item">
			<label class="layui-form-label">u8编码</label>
			<div class="layui-input-block">
				<input type="number" value="${param.staff_idture }" name="staff_Idture"  autocomplete="off" class="layui-input">
			</div>
		</div>

		  <div class="layui-form-item">
			  <div class="layui-inline">
			    <label class="layui-form-label">年龄 </label>
			    <div class="layui-input-inline">
			      <input name="staff_Age" value="${param.stage }" lay-verify="" autocomplete="off"  class="layui-input ">
			    </div>
			  </div>
		    <label class="layui-form-label">性别</label>
		    <div class="layui-input-inline">
		      <input type="radio" id="staff_Sex1" name="staff_Sex" value="男" title="男">
		      <input type="radio" id="staff_Sex2" name="staff_Sex" value="女" title="女">
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">联系电话</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Phone" value="${param.staff_phone }"  autocomplete="off" class="layui-input" >
		      <!-- lay-verify="phone" -->
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">身份证号</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Identity" value="${param.staff_identity }" autocomplete="off" class="layui-input" >
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">出生日期</label>
		    <div class="layui-input-block">
		      <input placeholder="年-月-日" type="text"class="layui-input" id="birthday" name="staff_Birthday">
		    </div>
		  </div>
		 <div class="layui-form-item">
		    <label class="layui-form-label">入职时间</label>
		    <div class="layui-input-block">
		      <input name="join_Date" placeholder="年-月-日" type="text" class="layui-input" id="date" >
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">电子邮箱</label>
		    <div class="layui-input-block">
		      <input type="text" name="staff_Email" value="${param.staff_email }" autocomplete="off" class="layui-input" >
		      <!-- lay-verify="email" -->
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属地区</label>
		    <div class="layui-input-block">
		      <%--<input type="text" name="staff_Address" value="${param.staff_address }" autocomplete="off" class="layui-input" >--%>
                <select id="staff_Address" name="staff_Address" xm-select="staff_Address" xm-select-skin="default">
                </select>
		      <!-- lay-verify="email" -->
		    </div>
		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">职位</label>
		    <div class="layui-input-block">
		      <select id="position" name="position_Id"  lay-filter="position" lay-search class="searchintop_select_revise">
			  </select>
		    </div>
  		  </div>
  		  <div class="layui-form-item">
		    <label class="layui-form-label">所属公司</label>
		    <div class="layui-input-block">
		      <select id="company" name="company_Id" lay-filter="company" lay-search class="searchintop_select_revise">
			  </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">所属部门</label>
		    <div class="layui-input-block">
		      <select id="department" name="department_Id" lay-verify="department" lay-search class="searchintop_select_revise">
			  </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <label class="layui-form-label">入职状态</label>
		    <div class="layui-input-block">
		      <select id="staffstate" name="staff_State" lay-verify="state" lay-search class="searchintop_select_revise">
			  </select>
		    </div>
  		  </div>
		  <div class="layui-form-item">
		    <div class="layui-input-block">
		      <button class="layui-btn" id="myForm" lay-submit="" lay-filter="submission" type="submit">提交</button>
		      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
		    </div>
		  </div>   
    </form> 

<script type="text/javascript">

layui.use(['laydate', 'layedit','laypage', 'layer', 'table',  'element','form'], function(){
	  var laydate = layui.laydate //日期
	  ,laypage = layui.laypage //分页
	  ,layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,element = layui.element //元素操作
	  ,form = layui.form
	  ,layedit = layui.layedit;
    var formSelects = layui.formSelects;
	  console.log("日志信息");
	  var position_id = ${param.position_id};
	  var company_id = ${param.company_id};
	  var ding_depmid = ${param.ding_depmid};
	  var staff_state = ${param.staff_state};
	  form.render('select'); 
	  
	  var stsex = '${param.stsex}';
	  if(stsex == '男'){
		  $("#staff_Sex1").attr('checked','true');
	  }else{
		  $("#staff_Sex2").attr('checked','true');
	  }
	  form.render('radio');
	  var joindate = ${param.join_date};
	  $("#date").val(fmtDate(joindate))
	  var staff_birthday = ${param.staff_birthday};
	  $("#birthday").val(fmtDate(staff_birthday))
	  //通过js将时间戳转换成"yyyy--mm--dd"格式
	  function fmtDate(obj){
		    var date =  new Date(obj);
		    var y = 1900+date.getYear();
		    var m = "0"+(date.getMonth()+1);
		    var d = "0"+date.getDate();
		    return y+"-"+m.substring(m.length-2,m.length)+"-"+d.substring(d.length-2,d.length);
		}
	  
		form.on('submit(submission)', function(data){
			console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
			console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
			var data2 = data.field //当前容器的全部表单字段，名值对形式：{name: value
				,staff_Name = data2.staff_Name
				,staff_Password = data2.staff_Password
				,staff_Age = data2.staff_Age
				,staff_Sex = data2.staff_Sex
				,staff_Phone = data2.staff_Phone
				,staff_Identity = data2.staff_Identity
				,staff_Birthday = data2.staff_Birthday
				,staff_Email = data2.staff_Email
				,staff_Address = formSelects.value('staff_Address','valStr')/*data2.staff_Address*/
				,position_Id = data2.position_Id
				,staff_Superior = data2.staff_Superior
				,department_Id = data2.department_Id
				,company_Id = data2.company_Id
				,join_Date = data2.join_Date
				,staff_State = data2.staff_State
				,staff_Number = data2.staff_Number
				,staff_Idture = data2.staff_Idture
				,staff_Id = ${param.stid};
		 	$.ajax({
		 		url : "../system/updateStaff.action"
		 		,type : "post"
		 		,data : {"staff_Number":staff_Number, "staff_Name" : staff_Name, "staff_Age" :staff_Age, "staff_Sex" :staff_Sex, "staff_Phone" :staff_Phone
		 				, "staff_Identity" :staff_Identity, "staff_Birthday" :staff_Birthday, "staff_Email" :staff_Email, "staff_Address" :staff_Address
		 				, "position_Id" :position_Id, "staff_Superior" :staff_Superior, "department_Id" :department_Id, "staff_Password":staff_Password
		 				, "company_Id" :company_Id, "join_Date" :join_Date, "staff_State" :staff_State, "staff_Id" :staff_Id,"staff_Idture":staff_Idture}
		 		,dataType : "JSON"
		 		,success : function(result){
						layer.msg(result.msg);
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
				if(staff_state == item.staffstate_Id){
					html += "<option value='"+item.staffstate_Id+"' selected = 'selected'>"+item.state_Name+"</option>";
				}else{
					html += "<option value='"+item.staffstate_Id+"'>"+item.state_Name+"</option>";
				}
				
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
                if(position_id == item.position_Id){
                    html += "<option value='"+item.position_Id+"' selected = 'selected'>"+item.position_Name+"</option>";
                }else{
                    html += "<option value='"+item.position_Id+"'>"+item.position_Name+"</option>";
                }
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
                /*if(staff_Address == item.cDCCode){
                    html += "<option value='"+item.cDCCode+"' selected = 'selected'>"+item.cDCName+"</option>";
                }else{
                    html += "<option value='"+item.cDCCode+"'>"+item.cDCName+"</option>";
                }*/
                html += "<option value='"+item.cDCCode+"'>"+item.cDCName+"</option>";
            });
            $("#staff_Address").html(html);
            var sa = $("#sa").val();
            var sa1 = sa.split(",");
           /* $("#staff_Address").val(sa1);*/
            formSelects.render('staff_Address');
            formSelects.value('staff_Address',sa1);
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
			if(company_id == item.company_id){
				html += "<option value='"+item.company_id+"' selected = 'selected'>"+item.company_name+"</option>";
			}else{
				html += "<option value='"+item.company_id+"'>"+item.company_name+"</option>";
			}
				
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
				if(ding_depmid == item.dingdepmid){
					html += "<option value='"+item.dingdepmid+"' selected = 'selected'>"+item.dname+"</option>";
				}else{
					html += "<option value='"+item.dingdepmid+"'>"+item.dname+"</option>";
				}
				
			});
			$("#department").html(html);
			form.render('select');
		}
	}); 
  
  /*form.on('select(company)', function(data){
	  	var cid = data.value;
	  /!* 	if(cid == ""){ *!/
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
/!* 	  	}else{
	  		//选择了一个公司查询这个公司下的部门
			 $.ajax({
				url : "../Department/getDepartment.action",
				type : "post",
				data : {"company_Id" :cid},
				dataType : "JSON",
				success : function(res){
					var html ="<option value=''>请选择部门</option>";
					$.each(res.data, function(index, item){
						html += "<option value='"+item.did+"'>"+item.dname+"</option>";
						
					});
					$("#department").html(html);
					form.render('select');
				}
			}); 
	  	} *!/
	  		/!* var html = "<option value='0'>请先选择公司</option>";
	  		$("#Erji").html(html);
	  		form.render('select'); *!/
	  	
	});*/
	  
	//各种基于事件的操作
	laydate.render({
		elem:'#date'
	});
	laydate.render({
		elem:'#birthday'
	}); 
});
</script>
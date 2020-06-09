<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   
	String path = request.getContextPath();   
	String basePath = request.getScheme()+"://" +request.getServerName()+":" +request.getServerPort()+path+"/" ;   
%>   
    
<!-- 职员列表 -->
<!-- <link rel="stylesheet" href="../css/search_revise.css">  -->
<link rel="stylesheet" href="../layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="../css/form_top_revise.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<script src="../layui/layui.js"></script>
<script src="../layui_exts/excel.js"></script>
<script type="text/javascript" src="../js/jquery-3.1.1.min.js"></script> 
<form class="layui-form form-top">
	<div class="layui-form-item">
	  <div class="layui-inline">
	    <label class="layui-form-label label-revise searchintop_label_revise">姓名 :</label>
	    <div class="layui-input-inline">
	      <input name="staff_Name" lay-verify="" autocomplete="" placeholder="请输入姓名" class="layui-input input-revise searchintop_input_revise">
	    </div>
	  </div>
	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">职位 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="position" name="position_Id"  lay-filter="position" lay-search class="select-revise searchintop_select_revise">
		      <option value="">请选择职位</option>
		  </select>
		</div>
	  </div>
	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">所属公司 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="company" name="company_Id" lay-filter="company" lay-search class="select-revise searchintop_select_revise">
		      <option value="">请选择公司</option>
		  </select>
		</div>
	  </div>
	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">所属部门 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="department" name="department_Id" lay-verify="department" lay-search class="select-revise searchintop_select_revise">
		      <option value="">请选择部门</option>
		  </select>
		</div>
	  </div>

	  <div class="layui-inline">
		<label class="layui-form-label label-revise searchintop_label_revise">入职状态 :</label>
		<div class="layui-input-inline select-revise">
	      <select id="staffstate" name="staff_State" lay-verify="state" lay-search class="select-revise searchintop_select_revise">
		  </select>
		</div>
	  </div>
	  <div class="layui-inline ">
            <button lay-submit="" lay-filter="search" type="submit" class="layui-btn layui-btn-sm layui-btn-warm button-revise searchintop_button_revise">
              	检索
            </button>
		  <button lay-filter="out" class="layui-btn layui-btn-danger layui-btn-xs button-revise" lay-submit="">
			  导出
		  </button>
      </div> 
	</div>
</form>
   
<table class="layui-hide" id="test" lay-filter="test" lay-size="sm"></table>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-danger layui-btn-xs batchdel" lay-event="batchdel">批量删除</button>
	<button class="layui-btn layui-btn-primary layui-btn-xs add" lay-event="add">添加员工</button>
	<button class="layui-btn layui-btn-xs" lay-event="tongbu">同步钉钉人员</button>
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
  
  //重新渲染   针对select下拉列表不显示的情况
  form.render('select');
  
  //监听搜索提交按钮
  form.on('submit(search)', function(data){
	  console.log(data.elem);//被执行事件的元素DOM对象，一般为button对象
	  console.log(data.form);//被执行提交的form对象，一般在存在form标签时才会返回
	  var data2 = data.field;//当前容器的全部表单字段，名值对形式：{name: value}
	  
		//重载表格
      	table.reload("tab" ,{
      		page: true,
			where : {
				"staff_Name" :data2.staff_Name,"company_Id" :data2.company_Id
				,"position_Id" :data2.position_Id, "department_Id" :data2.department_Id
				,"staff_State" :data2.staff_State
			},
      	});
	  
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});

    //监听导出按钮
    form.on('submit(out)', function(data){
        var data2 = data.field;
        var url = '../Staff/selectStaff.action?limit=300&page=1';
        if (data2.staff_Name != null && data2.staff_Name != ''){
            url += '&staff_Name='+data2.staff_Name;
        }
        if (data2.company_Id != null && data2.company_Id != ''){
            url += '&company_Id='+data2.company_Id;
        }
        if (data2.position_Id != null && data2.position_Id != ''){
            url += '&position_Id='+data2.position_Id;
        }
        if (data2.department_Id != null && data2.department_Id != ''){
            url += '&department_Id='+data2.department_Id;
        }
        if (data2.staff_State != null && data2.staff_State != ''){
            url += '&staff_State='+data2.staff_State;
        }
        $.ajax({
            url: url,
            dataType: 'json',
            success: function(res) {
                var data = LAY_EXCEL.filterExportData(res.data, {
                    stid:'stid',
                    stnumber:"stnumber",
                    stname:"stname",
                    position_name:"position_name",
                    department_name:"department_name",
                    staff_address:function (value,line,data) {
						return Region(value);
                    },
                    company_name:"company_name",
                    state_name:"state_name"
                });
                data.unshift({
                    stid: 'ID',stnumber:"账号",stname:"姓名",
                    position_name:'职位',department_name: '所属部门',staff_address: '所属区域',
                    company_name:"所属公司",state_name:"任职状态"
                });
                // 3. 执行导出函数，系统会弹出弹框
                LAY_EXCEL.exportExcel(data, '人员列表.xlsx', 'xlsx');
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
		 var html ="<option value=''>请选择入职状态</option>";
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
  
  form.on('select(company)', function(data){
	  	var cid = data.value;
	  	if(cid == ""){
	  		//选择了"请选择公司"查询出所有部门
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
	  	}else{
	  		//选择了一个公司查询这个公司下的部门
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
	  	}
	  		/* var html = "<option value='0'>请先选择公司</option>";
	  		$("#Erji").html(html);
	  		form.render('select'); */
	  	
	});
  
  
   
//创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor'); 
  
  //监听Tab切换
  element.on('tab(demo)', function(data){
    layer.msg('切换了：'+ this.innerHTML);
    console.log(data);
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    //,height: 332
    ,url: '../Staff/selectStaff.action' //数据接口
    ,page: true //开启分页
    ,toolbar: '#toolbarDemo'
    ,title: '用户数据表'
//     ,totalRow: true
    ,id:"tab"
    ,cols: [[ //表头
    	{type: 'checkbox', fixed: 'left'}
      ,{field: 'stid', title: 'ID', width:80, sort: true}
      ,{field: 'stnumber', title: '账号', width:80, sort: true}
      ,{field: 'stname', title: '姓名', width: 100}
      ,{field: 'position_name', title: '职位', width: 100, sort: true}
      ,{field: 'department_name', title: '所属部门', width:100}
      ,{field: 'staff_address', title: '所属地区', width:120,templet:'<div>{{ Region(d.staff_address)}}</div>'}
      ,{field: 'company_name', title: '所属公司', width:100}
      ,{field: 'join_date', title: '入职时间', width:210, templet:'<div>{{ Format(d.join_date)}}</div>'}
      ,{field: 'state_name', title: '任职状态', width:100}  
      ,{field: 'stsex', title: '性别', width:70}
      ,{field: 'stage', title: '年龄', width:70}
      ,{field: 'staff_phone', title: '联系电话', width: 140, sort: true}
      ,{field: 'staff_identity', title: '身份证号', width:200}
      ,{field: 'staff_birthday', title: '生日', width:210, templet:'<div>{{ Format(d.staff_birthday)}}</div>'}
      ,{field: 'staff_email', title: '电子邮箱', width:200}
      ,{fixed: 'right', title:'操作', width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'batchdel':
        var data = checkStatus.data;
        //layer.alert(JSON.stringify(data.stid));
        var staffids = new Array();
    	$.each(data, function(index, item){
    		staffids.push(item.stid);
		});
	        $.ajax({
	        	url : "../Staff/updateDeletes.action",
	        	type : "post",
	        	data : {"staffids" : staffids},
	        	traditional : true,
	        	dataType : "JSON",
	        	success : function (res){
	        		layer.msg(res.msg);
	        	}
	        	
	        });
      	table.reload("tab" ,{
      	});
      break;
      case 'add':
    	  layer.open({
  	    	type: 2,
  	    	title :'添加新职员',
  	    	shade: 0.8,
  	    	shadeClose:true,
  	        maxmin: true,
  	        closeBtn: 1,
  	    	area: ['800px', '80%'],
  	    	content: '../system/addStaffList.action',
  	        end: function () {
  	        	
  	        	table.reload("tab" ,{
  	        	});
  	          },
  	      });
      break;
      case 'tongbu':
    	//加载层-默认风格
    	  layer.load();
    	  //同步钉钉人员
	        $.ajax({
	        	url : "../Staff/updateDingStaff.action",
	        	type : "post",
	        	data : {"staffids" : staffids},
	        	traditional : true,
	        	dataType : "JSON",
	        	success : function (res){
	        		layer.closeAll('loading');
	        		layer.msg(res.msg);
	              	table.reload("tab" ,{
	              	});
	        	}
	        	
	        });
    };
  });
  
  //监听工具条
  table.on('tool(test)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
        var id = data.stid;
        $.ajax({
        	url : "../Staff/updateDelete.action",
        	type : "post",
        	data : {"staff_Id" : id},
        	dataType : "JSON",
        	success : function (res){
        		if (res > 0){
        			layer.msg("删除成功!");
        		}else{
        			layer.msg("删除失败!");
        		}
        	}
        	
        });

        
      });
    } else if(layEvent === 'edit'){

		    layer.open({
		    	type: 2,
		    	title :'修改职员信息',
		    	shade: 0.8,
		    	shadeClose:true,
		        maxmin: true,
		        closeBtn: 1,
		    	area: ['800px', '80%'],
		    	content: '../system/reviseStaff.action?stid='+data.stid+'&stnumber='+data.stnumber+'&position_id='+data.position_id+'&staff_Address='+data.staff_Address
		    			+'&stname='+data.stname+'&stsex='+data.stsex+'&stage='+data.stage+'&company_id='+data.company_id
		    			+'&staff_phone='+data.staff_phone+'&staff_identity='+data.staff_identity+'&ding_depmid='+data.ding_depmid
		    			+'&staff_birthday='+data.staff_birthday+'&staff_email='+data.staff_email+'&staff_state='+data.staff_state
		    			+'&staff_address='+data.staff_address+'&join_date='+data.join_date+'&staff_idture='+data.staff_idture,
		        end: function () {
		        	
		        	table.reload("tab" ,{
		        	});
		          }
		    });

    }
  });

  
});
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//Format("2016-10-04 8:9:4.423","yyyy-MM-dd hh:mm:ss.S") ==> 2016-10-04 08:09:04.423   
//Format("1507353913000","yyyy-M-d h:m:s.S")      ==> 2017-10-7 13:25:13.0  
function Format(datetime) {
	var date1 = datetime;
	var unixTimestamp = new Date(date1) ;
	commonTime = unixTimestamp.toLocaleString();
return commonTime;
}

function Region(region) {
    if (region == "01"){
        return "山东省";
    }else if (region == "0101"){
        return "临沂市";
    }else if (region == "010101"){
        return "兰山区";
    }else if (region == "010102"){
        return "河东区";
    }else if (region == "010103"){
        return "罗庄区";
    }else if (region == "010104"){
        return "高新技术开发区";
    }else if (region == "010105"){
        return "经济技术开发区";
    }else if (region == "010106"){
        return "临沭县";
    }else if (region == "010107"){
        return "费县";
    }else if (region == "010108"){
        return "平邑县";
    }else if (region == "010109"){
        return "蒙阴县";
    }else if (region == "010110"){
        return "莒南县";
    }else if (region == "010111"){
        return "临港经济开发区";
    }else if (region == "010112"){
        return "兰陵县";
    }else if (region == "010113"){
        return "郯城县";
    }else if (region == "010114"){
        return "沂南县";
    }else if (region == "010115"){
        return "沂水县";
    }else if (region == "0102"){
        return "济南市";
    }else if (region == "0103"){
        return "青岛市";
    }else if (region == "99"){
        return "无分类";
    }else if (region == "02"){
        return "北京市";
    }
}
</script>

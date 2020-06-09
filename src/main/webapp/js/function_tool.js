//全局变量
var UNIT = 6; //手机端审批列表页面流加载每页信息加载条数
//基础工具函数
//文本输入框内容限制
//限制文本框车牌格式符合要求
function inputLimitCarPlate($demo){
	$demo.blur(function(e){
		if( !( /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/.test($(e.target).val()) ) && $(e.target).val() != '' ){
			layer.msg('请输入合法车牌号');
			$(e.target).val('');
		}
	});
}
//限制文本框电话格式符合要求
function inputLimitPhone($demo){
	$demo.blur(function(e){
		if( !( (/^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$/.test($(e.target).val())) || (/^\d{11}$/.test($(e.target).val())) ) && $(e.target).val() != '' ){
			layer.msg('请输入合法电话号码');
			$(e.target).val('');
		}
	});
}
//限制文本输入框只允许输入数字(包括小数)
function inputLimitNumber($demo){
	$demo.bind("input propertychange",function(e){
		if( (!/^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val())) && $(e.target).val() != ''){
    		layer.msg('请输入正确的数量');
    		$(e.target).val('');
    	}
	});
}

//限制文本输入框只允许输入数字(包括小数)
function inputLimitMark($demo){
    $demo.bind("input propertychange",function(e){
        if( $(e.target).val() != '' &&  $(e.target).val().indexOf(";") >= 0){
            layer.msg('请使用中文分号');
            $(e.target).val('');
        }
    });
}


//限制文本输入框只允许输入整数
function inputLimitInteger($demo){
	$demo.bind("input propertychange",function(e){
		if( (!/^[0-9]{0,}$/.test($(e.target).val())) && $(e.target).val() != ''){
    		layer.msg('请输入正确的数量');
    		$(e.target).val('');
    	}
	});
}
//监听金额输入框只允许输入数字(小数点后保留两位)
var tempAmountValue0 = '';
function inputLimitAmount0($demo){
	$demo.bind("input propertychange",function(event){
		var currentValue = $demo.val();//获取当前文本框内容
		if( /^[0-9]+(.[0-9]{0,2})?$/.test($demo.val()) && $demo.val() != '' ){
			tempAmountValue0 = currentValue;
		}else if( /^[0-9]+(.[0-9]{2,})?$/.test($demo.val()) && $demo.val() != '' ){
			layer.msg('小数点后只允许保留两位');
			$demo.val(tempAmountValue0);
		}else{
			layer.msg('请输入正确的金额');
			$demo.val('');
		}	      
	});
}
//监听金额输入框只允许输入数字(小数点后保留两位) 且  转化成大写(数字输入框,大写输入框)
var tempAmountValue = '';
function inputLimitAmount($demo,$demo0){
	$demo.bind("input propertychange",function(event){
		var currentValue = $demo.val();//获取当前文本框内容
		if( /^[0-9]+(.[0-9]{0,2})?$/.test($demo.val()) && $demo.val() != '' ){
			tempAmountValue = currentValue;
			$demo0.val( smalltoBIG( Number(currentValue) ) );	
		}else if( /^[0-9]+(.[0-9]{2,})?$/.test($demo.val()) && $demo.val() != '' ){
			layer.msg('小数点后只允许保留两位');
			$demo.val(tempAmountValue);
		}else{
			layer.msg('请输入正确的金额');
			$demo0.val('');
		}	      
	});
}
//数字金额大写转换(可以处理整数,小数,负数)
function smalltoBIG(n)     
{    
    var fraction = ['角', '分', '厘', '毫', '丝'];    
    var digit = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖'];    
    var unit = [ ['元', '万', '亿'], ['', '拾', '佰', '仟']  ];    
    var head = n < 0? '欠': '';    
    n = Math.abs(n);    
  
    var s = '';    
  
    for (var i = 0; i < fraction.length; i++)     
    {    
        s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');    
    }    
    s = s || '整';    
    n = Math.floor(n);    
  
    for (var i = 0; i < unit[0].length && n > 0; i++)     
    {    
        var p = '';    
        for (var j = 0; j < unit[1].length && n > 0; j++)     
        {    
            p = digit[n % 10] + unit[1][j] + p;    
            n = Math.floor(n / 10);    
        }    
        s = p.replace(/(零.)*零$/, '').replace(/^$/, '零')  + unit[0][i] + s;    
    }    
    return head + s.replace(/(零.)*零元/, '元').replace(/(零.)+/g, '零').replace(/^整$/, '零元整');    
}
//计算金额 (数量，单价，金额)
function getSum($demo1,$demo2,$demo0){
	//数量 限制文本输入框只允许输入数字(包括小数) 并计算金额
	//function inputLimitNumberGetSum($demo1){
		$demo1.bind("input propertychange",function(e){
			if( /^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val()) && $(e.target).val() != ''){
	    		if($demo2.val() != ''){$demo0.val( (Number($(e.target).val())*Number($demo2.val())) );}//金额
	    	}else{
	    		layer.msg('请输入正确的数量');
	    		$(e.target).val('');
	    	}
		});
	//}
	//单价 监听金额输入框只允许输入数字(小数点后保留两位) 并计算金额
	//function inputLimitAmount0GetSum($demo2){
		$demo2.bind("input propertychange",function(e){
			if( /^[0-9]+(.[0-9]{0,2})?$/.test($(e.target).val()) && $(e.target).val() != '' ){
				tempAmountValue0 = $(e.target).val();//保存当前正确数字
				if($demo1.val() != ''){$demo0.val( Number($demo1.val())*Number($(e.target).val()) );}//金额
			}else if( /^[0-9]+(.[0-9]{2,})?$/.test($(e.target).val()) && $(e.target).val() != '' ){
				layer.msg('小数点后只允许保留两位');
				$(e.target).val(tempAmountValue0);
			}else{
				layer.msg('请输入正确的金额');
				$(e.target).val('');
			}	      
		});
	//}
}

function getSum1($demo1,$demo2,$demo0){
    //数量 限制文本输入框只允许输入数字(包括小数) 并计算金额
    //function inputLimitNumberGetSum($demo1){
    $demo1.bind("input propertychange",function(e){
        if( /^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val()) && $(e.target).val() != ''){
            if($demo2.val() != ''){$demo0.val( (Number($(e.target).val())/100*Number($demo2.val())) );}//金额
        }else{
            layer.msg('请输入数字');
            $(e.target).val('');
        }
    });
}

function getSum2($demo1,$demo2,$demo0){
    //数量 限制文本输入框只允许输入数字(包括小数) 并计算金额
    //function inputLimitNumberGetSum($demo1){
    $demo1.bind("input propertychange",function(e){
        if( /^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val()) && $(e.target).val() != ''){
            if($demo2.val() != ''){$demo0.val( (Number($(e.target).val())*Number($demo2.val())) );}//金额
        }else{
            layer.msg('请输入数字');
            $(e.target).val('');
        }
    });

    $demo2.bind("input propertychange",function(e){
        if( /^[0-9]+(.[0-9]{0,})?$/.test($(e.target).val()) && $(e.target).val() != ''){
            if($demo1.val() != ''){$demo0.val( (Number($(e.target).val())*Number($demo1.val())) );}//金额
        }else{
            layer.msg('请输入数字');
            $(e.target).val('');
        }
    });
}
	
//日期格式转化    示例: Format(date,"yyyy-MM-dd");
function Format(datetime,fmt) {
	if(datetime == undefined) return '无';
	if (parseInt(datetime)==datetime) {
		if (datetime.length==10) {
			datetime=parseInt(datetime)*1000;
		} else if(datetime.length==13) {
			datetime=parseInt(datetime);
		}
	}
	datetime=new Date(datetime);
	var o = {
		"M+" : datetime.getMonth()+1,                 //月份   
		"d+" : datetime.getDate()              //日   
          //毫秒   
	};   
	if(/(y+)/.test(fmt))   
		fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));   
	for(var k in o)   
		if(new RegExp("("+ k +")").test(fmt))   
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	return fmt;
}
//日期格式转化 	精确到秒  	示例: Format(date,"yyyy-MM-dd HH:mm:ss");
function Format0(datetime,fmt){
	if(datetime == undefined) return '无';
	if (parseInt(datetime)==datetime) {
		if (datetime.length==10) {
			datetime=parseInt(datetime)*1000;
		} else if(datetime.length==13) {
			datetime=parseInt(datetime);
		}
	}
	datetime=new Date(datetime);
	var o = {
			"M+" : datetime.getMonth()+1,			//月份   
			"d+" : datetime.getDate(),				//日   
			"H+" : datetime.getHours(),				//小时
	        "m+" : datetime.getMinutes(),			//分钟
	        "s+" : datetime.getSeconds(),			//秒
	        "q+" : Math.floor((datetime.getMonth() + 3) / 3),
	        "S+" : datetime.getMilliseconds()
          //毫秒   
	};   
	if(/(y+)/.test(fmt))   
		fmt=fmt.replace(RegExp.$1, (datetime.getFullYear()+"").substr(4 - RegExp.$1.length));   
	for(var k in o)   
		if(new RegExp("("+ k +")").test(fmt))   
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
	return fmt;
}

//日期间隔时长计算（天 小时 分钟 秒）
function getDays(date1,date2){
	date1 = new Date(date1).getTime();
	date2 = new Date(date2).getTime();
	var time = parseFloat(date2-date1) / 1000;
    if (time != null && time != "") {  
    	if(time < 60){
    		time = parseInt(time) +"秒";
    	}else if(time < 60*60){
    		time = parseInt(time /60.0) +"分钟"+ parseInt((parseFloat(time /60.0) - parseInt(time /60.0)) *60) +"秒";  
    	}else if(time < 60*60*24){
    		time = parseInt(time /3600.0) + "小时" 
    		+ parseInt((parseFloat(time /3600.0) - parseInt(time /3600.0)) *60) + "分钟" 
    		+ parseInt((parseFloat((parseFloat(time /3600.0) - parseInt(time /3600.0)) *60) - parseInt((parseFloat(time /3600.0) - parseInt(time /3600.0)) *60)) *60) +"秒";  
    	}else{
    		time = + parseInt(time /(3600.0*24)) + "天" 
    		+ parseInt((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24) + "小时" 
    		+ parseInt((parseFloat((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24) - parseInt((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24)) *60) + "分钟" 
    		+ parseInt((parseFloat((parseFloat((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24) - parseInt((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24)) *60) - parseInt((parseFloat((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24) - parseInt((parseFloat(time /(3600.0*24)) - parseInt(time /(3600.0*24)))*24)) *60)) *60) +"秒"; 
    	}
    }else{  
        time = "0 时 0 分0 秒";  
    }
    return time;
}
//日期间隔时长计算（天）
function getDays1(date1,date2){
	date1 = new Date(date1).getTime();
	date2 = new Date(date2).getTime();
	var time = parseFloat(date2-date1) / 1000;
    if (time != null && time != "") {  
    	time = + parseInt(time /(3600.0*24)) + "天"
    }else{  
        time = "0天";
    }
    return time;
}

//日期间隔时长计算（天）
function getDays2(date1,date2){
    date1 = new Date(date1).getTime();
    date2 = new Date(date2).getTime();
    var time = parseFloat(date2-date1) / 1000;
    if (time == 0){
        time = "1";
	} else if (time != null && time != "") {
        time = + (parseInt(time /(3600.0*24)) + 1);
    }else{
        time = "0";
    }
    return time;
}

//日期间隔时长计算（天）
function getDays3(date1,date2){
    date1 = new Date(date1).getTime();
    date2 = new Date(date2).getTime();
    var time = parseFloat(date2-date1) / 1000;
    if (time == 0){
        time = "1";
    } else if (time != null && time != "") {
        time = + (parseInt(time /(3600.0*24)) + 1);
    }else{
        time = "0";
    }
    return time;
}

function subDate(datetime) {
    if(datetime == undefined) return '';
    var time = datetime.substring(0,10);
    return time;
}

//手机端审批列表页面
//监听页面滚动显示返回顶部按钮
var Height = 500;
//$(function(){
//	$('#toTop').hide();
	$(window).scroll(function(){
		if($(window).scrollTop() > Height){
			$('#toTop').fadeIn(Height);
		}else{
			$('#toTop').fadeOut(Height-100);
		}
	});
//});
//返回顶部事件
window.returnToTop = function(){
//    $('#toTop').on('touchend',function(){
//        var T = $(window).scrollTop();
//        var t = setInterval(function(){
//            if(T < 0){
//                clearInterval( t );
//            }else{
//                T -= 50;
//                $(window).scrollTop(T);
//            }
//        },50);
//    });
	$('body,html').animate({scrollTop:0},Height);
	return false;	
}
//申请页面弹出层报表数据展示初始化(申请人+申请部门+申请时间/过程一/过程二)
/*$(function(){
	//init();//表单数据初始化
	//processArea();//表单填写过程一
	//processProduct($('.container1'));//表单填写过程二初始化
});*/
//表单数据初始化
function init(){}
//获取请购单号
function setBuyNumber(){
	$.ajax({
		 url : "System/selectNumber.action"
		,type : "post"
		,data : {}
		,dataType : "JSON"
		,success : function(result){
			$("#buy_number").val(result.data);
		}
	});
}
//获取申请信息    申请人/申请部门/申请日期
var currencyDate;
function setApplyMessage(staffName,departmentId){
	//获取当前日期设置为申请日期
    var myDate = new Date;
    currencyDate = myDate;
    var year = myDate.getFullYear(); //获取当前年
    var mon = myDate.getMonth() + 1; //获取当前月
    var day = myDate.getDate(); //获取当前日
    var hours = myDate.getHours(); //获取小时
    var minutes = myDate.getMinutes(); //获取分钟
    var seconds = myDate.getSeconds(); //获取秒
    date = year + " 年 " + mon + " 月 " + day + " 日 ";
    //设置申请日期
    $("#date").val(date);
    //设置申请人
    $("#staffName").val(staffName);
	//根据id查询部门
	$.ajax({
		url : "Department/selectDingDepartmentId.action",
		type : "post",
		data : {"id": departmentId},
		dataType : "JSON",
		success : function(res){
			var departmentName = '无记录';
			if(res.data != null) departmentName = res.data.department_Name;
			//设置申请部门
			$("#department").val(departmentName);
		}
	});
}

//表单填写过程一:区域->客户名称->销售合同编号->运营设备
function processArea(){}

//表单填写过程二:自定义搜索选择框查询商品->设置相关信息
var currentProductValues = [];//全局变量 当前明细信息每一行的商品名称input框值
//[1]不考虑仓库(请购)
function processProduct($demo){
	// 过程二第一级 - 获取商品名称(附带其它内容)
	//即时监听搜索框,形成商品列表下拉列表框
	$demo.find('.search-box').bind("input propertychange",function(event){
		var currentKey = $(event.target).val();//搜索框值
		if(currentKey == ''){
			$demo.find('.list-container>ul').html('');
			$demo.find('.list-container').css('display','none');
		}else{
        	$.ajax({
        		url:'System/selectInvName.action',
        		type:'post',
        		data:{'cInvName':currentKey},
        		dataType:'JSON',
        		success:function(res){
//					var data=[
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库1','仓库编码':'001-01','货位编码':'001-01-01','货架货物数量':'1','合同数量':'1.1','物品报价':'1001','备注':'测试1备注1','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库2','仓库编码':'001-02','货位编码':'001-02-01','货架货物数量':'2','合同数量':'1.2','物品报价':'1001','备注':'测试1备注2','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库1','仓库编码':'002-01','货位编码':'002-01-01','货架货物数量':'1','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库2','仓库编码':'002-02','货位编码':'002-02-01','货架货物数量':'2','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'}
//					];
        			var html = '<li value="" class="list-this">请选择商品名称</li>';
        			$.each(res.data,function(index,item){
        				//当属性值不存在时
        				var models = item.规格;
        				if(models == undefined) models = '无';
        				var unit = item.单位名称;
        				if(unit == undefined) unit = '无';
        				var iQuantity = item.可用量; //库存数量
        				if(iQuantity == undefined) iQuantity = 0;
        				var fAvaQuantity = 0;//可用量
        				if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
        				var cQuantity = item.合同数量;
        				if(cQuantity == undefined) cQuantity = 0;
        				var hjnumber = item.货位编码;
        				if(hjnumber == undefined) hjnumber = '无';
        				var hjcount = item.货架货物数量;
        				if(hjcount == undefined) hjcount = 0;
        				var iTaxRate = item.税率;
        				if(iTaxRate == undefined) iTaxRate = 0;
        				var offer = item.物品报价;
        				if(offer == undefined) offer = 0;
        				var manufacturer = item.设备厂家;
        				if(manufacturer == undefined) manufacturer = '无记录';
        				var anticipatedPrice = item.预计价格;
        				if(anticipatedPrice == undefined) anticipatedPrice = 0;
        				html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
        				+models+'" data-unit="'+unit+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cQuantity="'+cQuantity+'" data-cangku="'
        				+item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'+hjcount+'" data-offer="'
        				+offer+'" data-remark="'+item.备注+'" data-office="'+item.使用科室+'" data-manufacturer="'
        				+manufacturer+'" data-anticipated-price="'+anticipatedPrice+'" data-iTaxRate="'+iTaxRate+'">'
        				+item.存货名称+'</li>';
        				//将获取的所有信息保存到自定义属性中
        			});
        			$demo.find('.list-container>ul').html(html);
        			$demo.find('.list-container').css('display','block');
        			//给下拉列表框绑定隐藏事件
        			hideListContainer($demo.attr('id'));
        		}
        	});
		}
	});
	//过程二第二级 - 选择商品名称,根据商品名称设置其它内容
	//给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
    	//判断明细信息中是否已存在相同项
    	if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
    	var value = $(this).val();//number类型
    	var text = $(this).text();
    	$(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
      	$(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
      	//$(this).closest('.details').find('input[name="product_name"]').attr('data-name',$(this).attr('data-name')); //商品名称input标签自定义属性：商品名称
      	//$(this).closest('.details').find('input[name="product_name"]').attr('data-cangku',$(this).attr('data-cangku')); //商品名称input标签自定义属性：仓库名称
      	$(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate')); //税率-商品名称input标签自定义属性
       	$(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
       	$(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
       	$(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
       	$(this).closest('.details').find('input[name="cangku"]').val($(this).attr('data-cangku')); //仓库名称
       	$(this).closest('.details').find('input[name="cangku"]').attr('data-cknumber',$(this).attr('data-cknumber')); //仓库编码
       	$(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
       	$(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量 
       	$(this).closest('.details').find('input[name="contract_quantity"]').val($(this).attr('data-cQuantity')); //合同数量
       	$(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
       	$(this).closest('.details').find('input[name="item_offer"]').val($(this).attr('data-offer')); //物品报价
       	//$(this).closest('.details').find('input[name="remark"]').val($(this).attr('data-remark')); //备注
       	//$(this).closest('.details').find('input[name="administrative_office"]').val($(this).attr('data-office')); //使用科室
       	$(this).closest('.details').find('input[name="product_manufacturer"]').val($(this).attr('data-manufacturer')); //设备厂家
    	$(this).closest('.details').find('input[name="unit_price"]').val($(this).attr('data-offer')); //单价
       	$(this).closest('.details').find('input[name="anticipated_price"]').val($(this).attr('data-anticipated-price')); //预计价格
       	//根据存货编码获取最近日期商品价格
       	var $recentPriceDemo = $(this).closest('.details').find('input[name="recent_price"]'); //最近日期商品价格jquery对象
        //根据存货编码获取u8设置的参考成本
        //var $item_offer = $(this).closest('.details').find('input[name="item_offer"]');//备货采购申请显示的价格
        $.ajax({
            url:'System/selectInvSPrice.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                if (res.data == null){
                    $recentPriceDemo.val(0);
                }else {
                    $recentPriceDemo.val(res.data.iInvSPrice);
                }
            }
        });
       	/*$.ajax({
       		url:'System/selectCost.action',
       		type:'post',
       		data:{'cInvCode':$(this).attr('data-id')},
       		dataType:'JSON',
       		success:function(res){
       			var iUnitCost = 0;
       			if(res.data.length > 0) iUnitCost = res.data[0].iUnitCost;
       			$recentPriceDemo.val(iUnitCost); //最近日期商品价格
       		}
       	});*/
       	//保存明细信息当前行的商品名称input框值
       	var n = Number( $demo.attr('id').replace('container','') );
		currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
       	//重置下拉列表框
		$(this).parent().empty();
		$demo.find('.list-container').css('display','none');
    });
}


//[1]不考虑仓库(请购) 根据输入搜索框的值查询对应药品和库存数量
function productInventoryQuantity($demo){
    // 过程二第一级 - 获取商品名称(附带其它内容)
    //即时监听搜索框,形成商品列表下拉列表框
    $demo.find('.search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey != ''){
            $.ajax({
                url:'System/selectInvQuantity.action',
                type:'post',
                data:{'cInvName':currentKey},
                dataType:'JSON',
                success:function(res){
                    var item = res.data;
                    var fAvaQuantity = 0;//可用量
                    if(item != null && item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                    $(event.target).closest('.details').find('input[name="inventory_quantity"]').val(fAvaQuantity); //库存数量

                }
            });
        }
    });
    //过程二第二级 - 选择商品名称,根据商品名称设置其它内容
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        //判断明细信息中是否已存在相同项
        if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
        var value = $(this).val();//number类型
        var text = $(this).text();
        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-name',$(this).attr('data-name')); //商品名称input标签自定义属性：商品名称
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-cangku',$(this).attr('data-cangku')); //商品名称input标签自定义属性：仓库名称
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate')); //税率-商品名称input标签自定义属性
        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
        $(this).closest('.details').find('input[name="cangku"]').val($(this).attr('data-cangku')); //仓库名称
        $(this).closest('.details').find('input[name="cangku"]').attr('data-cknumber',$(this).attr('data-cknumber')); //仓库编码
        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        $(this).closest('.details').find('input[name="contract_quantity"]').val($(this).attr('data-cQuantity')); //合同数量
        $(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
        $(this).closest('.details').find('input[name="item_offer"]').val($(this).attr('data-offer')); //物品报价
        //$(this).closest('.details').find('input[name="remark"]').val($(this).attr('data-remark')); //备注
        //$(this).closest('.details').find('input[name="administrative_office"]').val($(this).attr('data-office')); //使用科室
        $(this).closest('.details').find('input[name="product_manufacturer"]').val($(this).attr('data-manufacturer')); //设备厂家
        $(this).closest('.details').find('input[name="unit_price"]').val($(this).attr('data-offer')); //单价
        $(this).closest('.details').find('input[name="anticipated_price"]').val($(this).attr('data-anticipated-price')); //预计价格
        //根据存货编码获取最近日期商品价格
        var $recentPriceDemo = $(this).closest('.details').find('input[name="recent_price"]'); //最近日期商品价格jquery对象
        $.ajax({
            url:'System/selectCost.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                var iUnitCost = 0;
                if(res.data.length > 0) iUnitCost = res.data[0].iUnitCost;
                $recentPriceDemo.val(iUnitCost); //最近日期商品价格
            }
        });
        //保存明细信息当前行的商品名称input框值
        var n = Number( $demo.attr('id').replace('container','') );
        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');
    });
}

//丽泽销售合同盖章申请单 如果库存为0，不让生成出库单
function processProductSaleForContract($demo){
    // 过程二第一级 - 获取商品名称(附带其它内容)
    //即时监听搜索框,形成商品列表下拉列表框
    $demo.find('.search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey == ''){
            $demo.find('.list-container>ul').html('');
            $demo.find('.list-container').css('display','none');
        }else{
            $.ajax({
                url:'System/selectInvName.action',
                type:'post',
                data:{'cInvName':currentKey,'type':'99'},
                dataType:'JSON',
                success:function(res){
//					var data=[
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库1','仓库编码':'001-01','货位编码':'001-01-01','货架货物数量':'1','合同数量':'1.1','物品报价':'1001','备注':'测试1备注1','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库2','仓库编码':'001-02','货位编码':'001-02-01','货架货物数量':'2','合同数量':'1.2','物品报价':'1001','备注':'测试1备注2','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库1','仓库编码':'002-01','货位编码':'002-01-01','货架货物数量':'1','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库2','仓库编码':'002-02','货位编码':'002-02-01','货架货物数量':'2','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'}
//					];
                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                    $.each(res.data,function(index,item){
                        //当属性值不存在时
                        var models = item.规格;
                        if(models == undefined) models = '无';
                        var unit = item.单位名称;
                        if(unit == undefined) unit = '无';
                        var iQuantity = item.可用量; //库存数量
                        if(iQuantity == undefined) iQuantity = 0;
                        var fAvaQuantity = 0;//可用量
                        if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                        var cQuantity = item.合同数量;
                        if(cQuantity == undefined) cQuantity = 0;
                        var hjnumber = item.货位编码;
                        if(hjnumber == undefined) hjnumber = '无';
                        var hjcount = item.货架货物数量;
                        if(hjcount == undefined) hjcount = 0;
                        var iTaxRate = item.税率;
                        if(iTaxRate == undefined) iTaxRate = 0;
                        var offer = item.物品报价;
                        if(offer == undefined) offer = 0;
                        var manufacturer = item.设备厂家;
                        if(manufacturer == undefined) manufacturer = '无记录';
                        var anticipatedPrice = item.预计价格;
                        if(anticipatedPrice == undefined) anticipatedPrice = 0;
                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
                            +models+'" data-unit="'+unit+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cQuantity="'+cQuantity+'" data-cangku="'
                            +item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'+hjcount+'" data-offer="'
                            +offer+'" data-remark="'+item.备注+'" data-office="'+item.使用科室+'" data-manufacturer="'
                            +manufacturer+'" data-anticipated-price="'+anticipatedPrice+'" data-iTaxRate="'+iTaxRate+'">'
                            +item.存货名称+'</li>';
                        //将获取的所有信息保存到自定义属性中
                    });
                    $demo.find('.list-container>ul').html(html);
                    $demo.find('.list-container').css('display','block');
                    //给下拉列表框绑定隐藏事件
                    hideListContainer($demo.attr('id'));
                }
            });
        }
    });
    //过程二第二级 - 选择商品名称,根据商品名称设置其它内容
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        //判断明细信息中是否已存在相同项
        if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
        var value = $(this).val();//number类型
        var text = $(this).text();

        var product_name = $(this).attr('data-name');//货物名称
        var inventory_quantity = $(this).attr('data-iQuantity');//货物数量
        if (inventory_quantity == 0){
            layer.msg(product_name+"的库存数量为0，不能进行销售合同申请");
            return;
        }
        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-name',$(this).attr('data-name')); //商品名称input标签自定义属性：商品名称
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-cangku',$(this).attr('data-cangku')); //商品名称input标签自定义属性：仓库名称
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate')); //税率-商品名称input标签自定义属性
        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
        $(this).closest('.details').find('input[name="cangku"]').val($(this).attr('data-cangku')); //仓库名称
        $(this).closest('.details').find('input[name="cangku"]').attr('data-cknumber',$(this).attr('data-cknumber')); //仓库编码
        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        $(this).closest('.details').find('input[name="contract_quantity"]').val($(this).attr('data-cQuantity')); //合同数量
        $(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
        $(this).closest('.details').find('input[name="item_offer"]').val($(this).attr('data-offer')); //物品报价
        //$(this).closest('.details').find('input[name="remark"]').val($(this).attr('data-remark')); //备注
        //$(this).closest('.details').find('input[name="administrative_office"]').val($(this).attr('data-office')); //使用科室
        $(this).closest('.details').find('input[name="product_manufacturer"]').val($(this).attr('data-manufacturer')); //设备厂家
        $(this).closest('.details').find('input[name="unit_price"]').val($(this).attr('data-offer')); //单价
        $(this).closest('.details').find('input[name="anticipated_price"]').val($(this).attr('data-anticipated-price')); //预计价格
        //根据存货编码获取最近日期商品价格
        var $recentPriceDemo = $(this).closest('.details').find('input[name="recent_price"]'); //最近日期商品价格jquery对象
        $.ajax({
            url:'System/selectCost.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                var iUnitCost = 0;
                if(res.data.length > 0) iUnitCost = res.data[0].iUnitCost;
                $recentPriceDemo.val(iUnitCost); //最近日期商品价格
            }
        });
        //保存明细信息当前行的商品名称input框值
        var n = Number( $demo.attr('id').replace('container','') );
        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');
    });
}


function processProductSale($demo){
    // 过程二第一级 - 获取商品名称(附带其它内容)
    //即时监听搜索框,形成商品列表下拉列表框
    $demo.find('.search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey == ''){
            $demo.find('.list-container>ul').html('');
            $demo.find('.list-container').css('display','none');
        }else{
            $.ajax({
                url:'System/selectInvName.action',
                type:'post',
                data:{'cInvName':currentKey,'type':'99'},
                dataType:'JSON',
                success:function(res){
//					var data=[
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库1','仓库编码':'001-01','货位编码':'001-01-01','货架货物数量':'1','合同数量':'1.1','物品报价':'1001','备注':'测试1备注1','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库2','仓库编码':'001-02','货位编码':'001-02-01','货架货物数量':'2','合同数量':'1.2','物品报价':'1001','备注':'测试1备注2','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库1','仓库编码':'002-01','货位编码':'002-01-01','货架货物数量':'1','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库2','仓库编码':'002-02','货位编码':'002-02-01','货架货物数量':'2','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'}
//					];
                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                    $.each(res.data,function(index,item){
                        //当属性值不存在时
                        var models = item.规格;
                        if(models == undefined) models = '无';
                        var unit = item.单位名称;
                        if(unit == undefined) unit = '无';
                        var iQuantity = item.可用量; //库存数量
                        if(iQuantity == undefined) iQuantity = 0;
                        var fAvaQuantity = 0;//可用量
                        if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                        var cQuantity = item.合同数量;
                        if(cQuantity == undefined) cQuantity = 0;
                        var hjnumber = item.货位编码;
                        if(hjnumber == undefined) hjnumber = '无';
                        var hjcount = item.货架货物数量;
                        if(hjcount == undefined) hjcount = 0;
                        var iTaxRate = item.税率;
                        if(iTaxRate == undefined) iTaxRate = 0;
                        var offer = item.物品报价;
                        if(offer == undefined) offer = 0;
                        var manufacturer = item.设备厂家;
                        if(manufacturer == undefined) manufacturer = '无记录';
                        var anticipatedPrice = item.预计价格;
                        if(anticipatedPrice == undefined) anticipatedPrice = 0;
                        var iInvLSCost = item.最低售价;
                        if(iInvLSCost == undefined) iInvLSCost = 0;
                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
                            +models+'" data-unit="'+unit+'" data-iInvLSCost="'+iInvLSCost+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cQuantity="'+cQuantity+'" data-cangku="'
                            +item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'+hjcount+'" data-offer="'
                            +offer+'" data-remark="'+item.备注+'" data-office="'+item.使用科室+'" data-manufacturer="'
                            +manufacturer+'" data-anticipated-price="'+anticipatedPrice+'" data-iTaxRate="'+iTaxRate+'">'
                            +item.存货名称+'</li>';
                        //将获取的所有信息保存到自定义属性中
                    });
                    $demo.find('.list-container>ul').html(html);
                    $demo.find('.list-container').css('display','block');
                    //给下拉列表框绑定隐藏事件
                    hideListContainer($demo.attr('id'));
                }
            });
        }
    });
    //过程二第二级 - 选择商品名称,根据商品名称设置其它内容
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        //判断明细信息中是否已存在相同项
        if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
        var value = $(this).val();//number类型
        var text = $(this).text();
        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-name',$(this).attr('data-name')); //商品名称input标签自定义属性：商品名称
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-cangku',$(this).attr('data-cangku')); //商品名称input标签自定义属性：仓库名称
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate')); //税率-商品名称input标签自定义属性
        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
        $(this).closest('.details').find('input[name="cangku"]').val($(this).attr('data-cangku')); //仓库名称
        $(this).closest('.details').find('input[name="cangku"]').attr('data-cknumber',$(this).attr('data-cknumber')); //仓库编码
        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        $(this).closest('.details').find('input[name="contract_quantity"]').val($(this).attr('data-cQuantity')); //合同数量
        $(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
        //$(this).closest('.details').find('input[name="item_offer"]').val($(this).attr('data-offer')); //物品报价
        //$(this).closest('.details').find('input[name="remark"]').val($(this).attr('data-remark')); //备注
        //$(this).closest('.details').find('input[name="administrative_office"]').val($(this).attr('data-office')); //使用科室
        $(this).closest('.details').find('input[name="product_manufacturer"]').val($(this).attr('data-manufacturer')); //设备厂家
        $(this).closest('.details').find('input[name="unit_price"]').val($(this).attr('data-offer')); //单价
        $(this).closest('.details').find('input[name="anticipated_price"]').val($(this).attr('data-anticipated-price')); //预计价格
        $(this).closest('.details').find('input[name="lsPrice"]').val($(this).attr('data-iInvLSCost')); //最低售价

        //根据存货编码获取u8设置的参考成本
        var $item_offer = $(this).closest('.details').find('input[name="item_offer"]');//备货采购申请显示的价格
        $.ajax({
            url:'System/selectInvSPrice.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                if (res.data == null){
                    $item_offer.val(0);
                }else {
                    $item_offer.val(res.data.iInvSPrice);
                }
            }
        });
        //根据存货编码获取最近日期商品价格
        var $recentPriceDemo = $(this).closest('.details').find('input[name="recent_price"]'); //最近日期商品价格jquery对象
        $.ajax({
            url:'System/selectCost.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                var iUnitCost = 0;
                if(res.data.length > 0) iUnitCost = res.data[0].iUnitCost;
                $recentPriceDemo.val(iUnitCost); //最近日期商品价格
            }
        });
        //保存明细信息当前行的商品名称input框值
        var n = Number( $demo.attr('id').replace('container','') );
        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');
    });
}

//[2]不考虑仓库,但获取商品时要根据仓库Id(丽泽材料类出库)
var currentCangkuId = '';	//当前选中仓库的id 全局变量
function processProductByCangkuId($demo){
	// 过程二第一级 - 获取商品名称
	//即时监听搜索框,形成商品列表下拉列表框(附带其它内容)
	$demo.find('.search-box').bind("input propertychange",function(event){
		var currentKey = $(event.target).val();//搜索框值
		if(currentKey == '' || currentCangkuId == ''){
			if(currentCangkuId == '') layer.msg('请先选择仓库');
			$demo.find('.list-container>ul').html('');
			$demo.find('.list-container').css('display','none');
		}else{
        	$.ajax({
        		url:'System/selectTarget2.action',
        		type:'post',
        		data:{'cInvName':currentKey,'cWhCode':currentCangkuId},
        		dataType:'JSON',
        		success:function(res){
        			var html = '<li value="" class="list-this">请选择商品名称</li>';
        			$.each(res.data,function(index,item){
// 通过 [System/selectTarget2.action] 可获取的数据:
//  Inventory.cInvName 存货名称,Inventory.cInvCode 存货编码 , CurrentStock.iQuantity AS 可用量,CurrentStock.fStopQuantity 冻结数量
//  ,Inventory.cInvStd 规格,ComputationUnit.cComUnitName 单位名称 ,Warehouse.cWhName 仓库名称,Warehouse.cWhCode 仓库编码
//  ,InvPositionSum.iQuantity AS 货架货物数量,InvPositionSum.cPosCode 货位编码,货位档案.cPosName 货位名称
//  ,rdrecords01.iUnitCost 单价 ,rdrecords01.AutoID 采购字表id
        				var models = item.规格;
        				if(models == undefined) models = '无';
        				var unit = item.单位名称;
        				if(unit == undefined) unit = '无';
        				var iQuantity = item.可用量;
        				if(iQuantity == undefined) iQuantity = 0;
        				var fAvaQuantity = 0;
        				if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
        				var hjnumber = item.货位编码;
        				if(hjnumber == undefined) hjnumber = '无';
        				var hjcount = item.货架货物数量;
        				if(hjcount == undefined) hjcount = 0;
        				var recentPrice = item.单价;
        				if(recentPrice == undefined) recentPrice = 0;
                        var iTaxRate = item.税率;
                        if(iTaxRate == undefined) iTaxRate = 0;
        				html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
        				+models+'" data-unit="'+unit+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cangku="'
        				+item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'
        				+hjcount+'" data-recentPrice="'+recentPrice+'" data-iTaxRate="'+iTaxRate+'">'+item.存货名称+'</li>';
        			});
        			$demo.find('.list-container>ul').html(html);
        			$demo.find('.list-container').css('display','block');
        			//给下拉列表框绑定隐藏事件
        			hideListContainer($demo.attr('id'));
        		}
        	});
		}
	});
	//过程二第二级 - 根据商品名称设置其它内容
	//给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
    	//判断明细信息中是否已存在相同项
    	if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
    	var value = $(this).val();//number类型
    	var text = $(this).text();
        var product_name = $(this).attr('data-name');//货物名称
        var inventory_quantity = $(this).attr('data-iQuantity');//货物数量

        var product_id = $(this).attr('data-id');//货物名称
        var count = 0;
        /*$.ajax({
            url: 'Currency/getProductCount.action',
            type: 'post',
            data: {'product_id': product_id},
            dataType: 'JSON',
            async:false,
            success: function (res) {
                if (res.data != null){
                    count = res.data;
                }
            }
        });*/

        if (inventory_quantity - count < 1){
            layer.msg(product_name+"的可出库数量为0，无法进行出库");
            return;
        }
    	$(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
      	$(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate'));//商品税率
        $(this).closest('.details').find('input[name="product_name"]').attr('data-price',$(this).attr('data-recentPrice'));//商品单价
       	$(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
       	$(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
       	$(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
       	$(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
       	$(this).closest('.details').find('input[name="recent_price"]').val($(this).attr('data-recentPrice')); //最近日期商品价格
       	$(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
       	$(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        //保存明细信息当前行的商品名称input框值
       	var n = Number( $demo.attr('id').replace('container','') );
		currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
       	//重置下拉列表框
		$(this).parent().empty();
		$demo.find('.list-container').css('display','none');
		
    });
}

//[2]不考虑仓库,但获取商品时要根据仓库Id(信泽材料类出库)
var currentCangkuId = '';	//当前选中仓库的id 全局变量
function xzProcessProductByCangkuId($demo){
    // 过程二第一级 - 获取商品名称
    //即时监听搜索框,形成商品列表下拉列表框(附带其它内容)
    $demo.find('.search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey == '' || currentCangkuId == ''){
            if(currentCangkuId == '') layer.msg('请先选择仓库');
            $demo.find('.list-container>ul').html('');
            $demo.find('.list-container').css('display','none');
        }else{
            $.ajax({
                url:'System/selectXzTarget2.action',
                type:'post',
                data:{'cInvName':currentKey,'cWhCode':currentCangkuId},
                dataType:'JSON',
                success:function(res){
                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                    $.each(res.data,function(index,item){
// 通过 [System/selectTarget2.action] 可获取的数据:
//  Inventory.cInvName 存货名称,Inventory.cInvCode 存货编码 , CurrentStock.iQuantity AS 可用量,CurrentStock.fStopQuantity 冻结数量
//  ,Inventory.cInvStd 规格,ComputationUnit.cComUnitName 单位名称 ,Warehouse.cWhName 仓库名称,Warehouse.cWhCode 仓库编码
//  ,InvPositionSum.iQuantity AS 货架货物数量,InvPositionSum.cPosCode 货位编码,货位档案.cPosName 货位名称
//  ,rdrecords01.iUnitCost 单价 ,rdrecords01.AutoID 采购字表id
                        var models = item.规格;
                        if(models == undefined) models = '无';
                        var unit = item.单位名称;
                        if(unit == undefined) unit = '无';
                        var iQuantity = item.可用量;
                        if(iQuantity == undefined) iQuantity = 0;
                        var fAvaQuantity = 0;
                        if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                        var hjnumber = item.货位编码;
                        if(hjnumber == undefined) hjnumber = '无';
                        var hjcount = item.货架货物数量;
                        if(hjcount == undefined) hjcount = 0;
                        var recentPrice = item.单价;
                        if(recentPrice == undefined) recentPrice = 0;
                        var iTaxRate = item.税率;
                        if(iTaxRate == undefined) iTaxRate = 0;

                        var cInvDefine4 = item.浓度;
                        if(cInvDefine4 == undefined) cInvDefine4 = '无';
                        var cBatch = item.批号;
                        if(cBatch == undefined) cBatch = '无';
                        var dVDate = item.失效日期;
                        if(dVDate == undefined) dVDate = '无';

                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
                            +models+'" data-unit="'+unit+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cangku="'
                            +item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'
                            +hjcount+'" data-recentPrice="'+recentPrice+'" data-iTaxRate="'+iTaxRate+'">'+item.存货名称+'/'+cInvDefine4+'/'+cBatch+'/'+dVDate+'</li>';
                    });
                    $demo.find('.list-container>ul').html(html);
                    $demo.find('.list-container').css('display','block');
                    //给下拉列表框绑定隐藏事件
                    hideListContainer($demo.attr('id'));
                }
            });
        }
    });
    //过程二第二级 - 根据商品名称设置其它内容
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        //判断明细信息中是否已存在相同项
        if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
        var value = $(this).val();//number类型
        var text = $(this).text();
        var product_name = $(this).attr('data-name');//货物名称
        var inventory_quantity = $(this).attr('data-iQuantity');//货物数量

        var product_id = $(this).attr('data-id');//货物名称
        var count = 0;
        /*$.ajax({
            url: 'Currency/getProductCount.action',
            type: 'post',
            data: {'product_id': product_id},
            dataType: 'JSON',
            async:false,
            success: function (res) {
                if (res.data != null){
                    count = res.data;
                }
            }
        });*/

        if (inventory_quantity - count < 1){
            layer.msg(product_name+"的可出库数量为0，无法进行出库");
            return;
        }

        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate'));//商品税率
        $(this).closest('.details').find('input[name="product_name"]').attr('data-price',$(this).attr('data-recentPrice'));//商品单价
        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
        $(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
        $(this).closest('.details').find('input[name="recent_price"]').val($(this).attr('data-recentPrice')); //最近日期商品价格
        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        //保存明细信息当前行的商品名称input框值
        var n = Number( $demo.attr('id').replace('container','') );
        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');

    });
}

//【3】条码录入带货位
function processProduct1($demo){
    // 过程二第一级 - 获取商品名称(附带其它内容)
    //即时监听搜索框,形成商品列表下拉列表框
    $demo.find('.search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey == ''){
            $demo.find('.list-container>ul').html('');
            $demo.find('.list-container').css('display','none');
        }else{
            $.ajax({
                url:'System/selectInvName1.action',
                type:'post',
                data:{'cInvName':currentKey},
                dataType:'JSON',
                success:function(res){
//					var data=[
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库1','仓库编码':'001-01','货位编码':'001-01-01','货架货物数量':'1','合同数量':'1.1','物品报价':'1001','备注':'测试1备注1','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试1','存货编码':'001','规格型号':'S01','单位名称':'个','可用量':'100','冻结数量':'10','仓库名称':'测试仓库2','仓库编码':'001-02','货位编码':'001-02-01','货架货物数量':'2','合同数量':'1.2','物品报价':'1001','备注':'测试1备注2','使用科室':'a1','设备厂家':'A1','预计价格':'101$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库1','仓库编码':'002-01','货位编码':'002-01-01','货架货物数量':'1','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'},
//						{'存货名称':'测试2','存货编码':'002','规格型号':'S02','单位名称':'个','可用量':'200','冻结数量':'20','仓库名称':'测试仓库2','仓库编码':'002-02','货位编码':'002-02-01','货架货物数量':'2','合同数量':'2.2','物品报价':'2000','备注':'测试2备注','使用科室':'b','设备厂家':'B','预计价格':'200$'}
//					];
                    var html = '<li value="" class="list-this">请选择商品名称</li>';
                    $.each(res.data,function(index,item){
                        //当属性值不存在时
                        var models = item.规格;
                        if(models == undefined) models = '无';
                        var unit = item.单位名称;
                        if(unit == undefined) unit = '无';
                        var iQuantity = item.可用量; //库存数量
                        if(iQuantity == undefined) iQuantity = 0;
                        var fAvaQuantity = 0;//可用量
                        if(item.可用量 != undefined && item.冻结数量 != undefined) fAvaQuantity = item.可用量 - item.冻结数量 ;
                        var cQuantity = item.合同数量;
                        if(cQuantity == undefined) cQuantity = 0;
                        var hjnumber = item.货位编码;
                        if(hjnumber == undefined) hjnumber = '无';
                        var hjcount = item.货架货物数量;
                        if(hjcount == undefined) hjcount = 0;
                        var iTaxRate = item.税率;
                        if(iTaxRate == undefined) iTaxRate = 0;
                        var offer = item.物品报价;
                        if(offer == undefined) offer = 0;
                        var manufacturer = item.设备厂家;
                        if(manufacturer == undefined) manufacturer = '无记录';
                        var anticipatedPrice = item.预计价格;
                        if(anticipatedPrice == undefined) anticipatedPrice = 0;
                        html += '<li value="'+item.存货编码+'" data-id="'+item.存货编码+'" data-name="'+item.存货名称+'" data-models="'
                            +models+'" data-unit="'+unit+'" data-iQuantity="'+iQuantity+'" data-fAvaQuantity="'+fAvaQuantity+'" data-cQuantity="'+cQuantity+'" data-cangku="'
                            +item.仓库名称+'" data-cknumber="'+item.仓库编码+'" data-hjnumber="'+hjnumber+'" data-hjcount="'+hjcount+'" data-offer="'
                            +offer+'" data-remark="'+item.备注+'" data-office="'+item.使用科室+'" data-manufacturer="'
                            +manufacturer+'" data-anticipated-price="'+anticipatedPrice+'" data-iTaxRate="'+iTaxRate+'">'
                            +item.存货名称+'</li>';
                        //将获取的所有信息保存到自定义属性中
                    });
                    $demo.find('.list-container>ul').html(html);
                    $demo.find('.list-container').css('display','block');
                    //给下拉列表框绑定隐藏事件
                    hideListContainer($demo.attr('id'));
                }
            });
        }
    });
    //过程二第二级 - 选择商品名称,根据商品名称设置其它内容
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        //判断明细信息中是否已存在相同项 取消重复判断 2019-10-24 css
        //if( ! judgeItems($(this).closest('.details'),$(this).attr('data-name'),$(this).closest('.details').find('input[name="runproduct_id"]').val()) ) return;
        var value = $(this).val();//number类型
        var text = $(this).text();
        $(this).closest('.details').find('input[name="inventory_id"]').val($(this).attr('data-id')); //存货编码
        $(this).closest('.details').find('input[name="product_name"]').val($(this).attr('data-name')); //商品名称input标签
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-name',$(this).attr('data-name')); //商品名称input标签自定义属性：商品名称
        //$(this).closest('.details').find('input[name="product_name"]').attr('data-cangku',$(this).attr('data-cangku')); //商品名称input标签自定义属性：仓库名称
        $(this).closest('.details').find('input[name="product_name"]').attr('data-iTaxRate',$(this).attr('data-iTaxRate')); //税率-商品名称input标签自定义属性
        $(this).closest('.details').find('input[name="specifications_models"]').val($(this).attr('data-models')); //规格型号
        $(this).closest('.details').find('input[name="unit"]').val($(this).attr('data-unit')); //单位
        $(this).closest('.details').find('input[name="fAvaQuantity"]').val($(this).attr('data-fAvaQuantity')); //可用量
        $(this).closest('.details').find('input[name="cangku"]').val($(this).attr('data-cangku')); //仓库名称
        $(this).closest('.details').find('input[name="cangku"]').attr('data-cknumber',$(this).attr('data-cknumber')); //仓库编码
        $(this).closest('.details').find('input[name="huojia"]').val($(this).attr('data-hjnumber')); //货架编码
        $(this).closest('.details').find('input[name="huojiahuowu"]').val($(this).attr('data-hjcount')); //货架货物数量
        $(this).closest('.details').find('input[name="contract_quantity"]').val($(this).attr('data-cQuantity')); //合同数量
        $(this).closest('.details').find('input[name="inventory_quantity"]').val($(this).attr('data-iQuantity')); //库存数量
        $(this).closest('.details').find('input[name="item_offer"]').val($(this).attr('data-offer')); //物品报价
        //$(this).closest('.details').find('input[name="remark"]').val($(this).attr('data-remark')); //备注
        //$(this).closest('.details').find('input[name="administrative_office"]').val($(this).attr('data-office')); //使用科室
        $(this).closest('.details').find('input[name="product_manufacturer"]').val($(this).attr('data-manufacturer')); //设备厂家
        $(this).closest('.details').find('input[name="unit_price"]').val($(this).attr('data-offer')); //单价
        $(this).closest('.details').find('input[name="anticipated_price"]').val($(this).attr('data-anticipated-price')); //预计价格
        //根据存货编码获取最近日期商品价格
        var $recentPriceDemo = $(this).closest('.details').find('input[name="recent_price"]'); //最近日期商品价格jquery对象
        $.ajax({
            url:'System/selectCost.action',
            type:'post',
            data:{'cInvCode':$(this).attr('data-id')},
            dataType:'JSON',
            success:function(res){
                var iUnitCost = 0;
                if(res.data.length > 0) iUnitCost = res.data[0].iUnitCost;
                $recentPriceDemo.val(iUnitCost); //最近日期商品价格
            }
        });
        //保存明细信息当前行的商品名称input框值
        var n = Number( $demo.attr('id').replace('container','') );
        currentProductValues[n] = $(this).closest('.details').find('input[name="product_name"]').val();
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');
    });
}
//判断是否已存在相同项
function judgeItems($demo,product,equipmentId){
	//当前要添加的项
	var currentItem = product + equipmentId;
	//遍历获取所有项
	var items = [];
	$.each($('.details').not($demo),function(index,item){
		var str = $(item).find('input[name="product_name"]').val()
		+ $(item).find('input[name="runproduct_id"]').val();
		items.push(str);
	});
	if($.inArray(currentItem,items) == -1) return true;
	else {
		layer.msg('相同信息已经存在，请不要重复添加！');
		return false;
	}
}
//给下拉列表框绑定隐藏事件
function hideListContainer(Id){
	$(document).bind('click', function(e) {  
	    var e = e || window.event; //浏览器兼容性   
	    var elem = e.target || e.srcElement;  
	    while (elem) { //循环判断至跟节点，防止点击的是div子元素   
	        if (elem.id && elem.id == Id) {  
	            return;  
	        }  
	        elem = elem.parentNode;  
	    }  
	    //点击的不是div或其子元素  
	    $('#'+Id+' .list-container').css('display', 'none');
	    //没有重新选择,重置明细信息当前行的商品名称input框值
	    var n = Number( Id.replace('container','') );
	    $('#'+Id+' input').val(currentProductValues[n]);
	});
}
//表单填写过程三 : 合同编号 - 合同名称+合同签订日期+(合同金额+已收金额+欠款金额)+合同条款
//表单填写过程三 - 自定义搜索选择框查询合同编号 -> 设置相关信息
var currentContractId = '';//记录当前合同编号
function searchProcessOfContract($demo,c1,c2,callback){
	// 过程三第一级 - 获取合同编号
	//过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
	$('.contract-search-box').bind("input propertychange",function(event){
		var currentKey = $(event.target).val();//搜索框值
		if(currentKey == ''){
			$demo.find('.list-container>ul').html('');
			$demo.find('.list-container').css('display','none');
		}else{
        	$.ajax({
        		url:'System/selectAllContract.action',
        		type:'post',
        		data:{'cName':currentKey},
        		dataType:'JSON',
        		success:function(res){
        			var html = '<li value="" class="list-this">请选择销售合同编号</li>';
        			$.each(res.data,function(index,item){
        				html += '<li value="'+item.strContractID+'" data-id="'+item.strContractID
        				+'" data-name="'+item.cCusName
						+'" data-money="'+item.dblTotalCurrency+'" data-moneyBegin="'+item.cDefine14+'" data-cusCode="'+item.cCusCode+'" data_time="'+item.strContractOrderDate+'">名称：'+item.strContractName
						+'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate
						+'</li>';
        			});
        			$demo.find('.list-container>ul').html(html);
        			$demo.find('.list-container').css('display','block');
        			//给合同编号下拉列表框绑定隐藏事件
        			hideListContainerOfContract('contract');
        		}
        	});
		}
	});
	//过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
	//给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
    	var value = $(this).val();//number类型
    	var text = $(this).text();
    	var strContractID = $(this).attr('data-id');
    	var contractAmount = $(this).attr('data-money');
        var moneyBegin = $(this).attr('data-moneyBegin');
        $('#moneyBegin').val(moneyBegin);//期初已收款金额
    	var contractName = $(this).attr('data-name');
    	var strContractOrderDate = $(this).attr('data_time');
      	$('#contract_id').val(strContractID);  //合同编号
      	$("#contract_amount").val(contractAmount);//合同金额
      	$('#customer_name').val(contractName);//客户名称
		$('#contract_date').val(strContractOrderDate);
		$('#customer').val($(this).attr("data-cusCode"));
        //查询合同收款计划
		$.ajax({
			url:'System/selectReceivables.action',
			type:'post',
			data:{'strContractID':strContractID},
			dataType:'JSON',
			success:function(result){
				var acceptAmount = 0;
				$.each(result.data,function(index,item){
					acceptAmount += Number(item.dblPayCurrency);
				});
				$('#actual_receipt').val(acceptAmount);//已收金额
				$('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
			}
		});
		//重置合同条款
		$('.contract-details').remove();
		//查询合同条款
		$.ajax({
			url:'System/selectContractAll.action',
			type:'post',
			data:{'strContractID':strContractID},
			dataType:'JSON',
			success:function(res){
				var value = '';//手机端
				$.each(res.data,function(index,item){
					//电脑端
					var html = '<tr class="contract-details">'
							 + 	'<td colspan='+c1+'><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
							 +	'<td colspan='+c2+'><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
							 + '</tr>';
					$('.contract').after(html);
					$('#contract_str_name').val(item.strName);
                    $('#contract_str_memo').val(item.strMemo);
					callback();//回调函数//inputRender();//input框自定义渲染
					//手机端
					value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
				});
				//手机端
				$('textarea[name="contract"]').val(value);
				
			}
		});
        //重置下拉列表框
		$(this).parent().empty();
		$demo.find('.list-container').css('display','none');
		//保存当前选择的合同编号
		currentContractId = strContractID;
	});
}

//信泽
function searchXZProcessOfContract($demo,c1,c2,callback){
    // 过程三第一级 - 获取合同编号
    //过程三-第一级 - 即时监听搜索框,形成合同编号下拉列表框(附带其它内容)
    $('.contract-search-box').bind("input propertychange",function(event){
        var currentKey = $(event.target).val();//搜索框值
        if(currentKey == ''){
            $demo.find('.list-container>ul').html('');
            $demo.find('.list-container').css('display','none');
        }else{
            $.ajax({
                url:'System/selectXZAllContract.action',
                type:'post',
                data:{'cName':currentKey},
                dataType:'JSON',
                success:function(res){
                    var html = '<li value="" class="list-this">请选择销售合同编号</li>';
                    $.each(res.data,function(index,item){
                        html += '<li value="'+item.strContractID+'" data-id="'+item.strContractID
                            +'" data-name="'+item.cCusName
                            +'" data-money="'+item.dblTotalCurrency+'" data-cusCode="'+item.cCusCode+'" data_time="'+item.strContractOrderDate+'">名称：'+item.strContractName
                            +'；编号:'+item.strContractID+'；￥'+item.dblTotalCurrency+'；时间：'+item.strContractStartDate
                            +'</li>';
                    });
                    $demo.find('.list-container>ul').html(html);
                    $demo.find('.list-container').css('display','block');
                    //给合同编号下拉列表框绑定隐藏事件
                    hideListContainerOfContract('contract');
                }
            });
        }
    });
    //过程三第二级 - 根据销售合同编号设置合同金额 / 获取并计算已收金额 / 计算欠款金额(合同金额-已收金额) / 获取合同条款
    //给下拉列表框绑定点击事件
    $demo.find(".list-container>ul").on("click","li",function(){      //只需要找到你点击的是哪个ul里面的就行
        var value = $(this).val();//number类型
        var text = $(this).text();
        var strContractID = $(this).attr('data-id');
        var contractAmount = $(this).attr('data-money');
        var contractName = $(this).attr('data-name');
        var strContractOrderDate = $(this).attr('data_time');
        $('#contract_id').val(strContractID);  //合同编号
        $("#contract_amount").val(contractAmount);//合同金额
        $('#customer_name').val(contractName);//客户名称
        $('#contract_date').val(strContractOrderDate);
        //查询合同收款计划
        $.ajax({
            url:'System/selectXZReceivables.action',
            type:'post',
            data:{'strContractID':strContractID},
            dataType:'JSON',
            success:function(result){
                var acceptAmount = 0;
                $.each(result.data,function(index,item){
                    acceptAmount += Number(item.dblPayCurrency);
                });
                $('#actual_receipt').val(acceptAmount);//已收金额
                $('#outstanding_receipt').val(contractAmount-acceptAmount);//欠款金额
            }
        });
        //重置合同条款
        $('.contract-details').remove();
        //查询合同条款
        $.ajax({
            url:'System/selectXZContractAll.action',
            type:'post',
            data:{'strContractID':strContractID},
            dataType:'JSON',
            success:function(res){
                var value = '';//手机端
                $.each(res.data,function(index,item){
                    //电脑端
                    var html = '<tr class="contract-details">'
                        + 	'<td colspan='+c1+'><input type="text" name="contract_str_name" value="'+item.strName+'" readonly></td>'
                        +	'<td colspan='+c2+'><input type="text" name="contract_str_memo" value="'+item.strMemo+'" readonly></td>'
                        + '</tr>';
                    $('.contract').after(html);
                    $('#contract_str_name').val(item.strName);
                    $('#contract_str_memo').val(item.strMemo);
                    callback();//回调函数//inputRender();//input框自定义渲染
                    //手机端
                    value += '【合同条款名称】：《'+item.strName+'》【 合同条款内容】：'+item.strMemo+'\n';
                });
                //手机端
                $('textarea[name="contract"]').val(value);

            }
        });
        //重置下拉列表框
        $(this).parent().empty();
        $demo.find('.list-container').css('display','none');
        //保存当前选择的合同编号
        currentContractId = strContractID;
    });
}

//给合同编号下拉列表框绑定隐藏事件
function hideListContainerOfContract(Id){
	$(document).bind('click', function(e) {  
	    var e = e || window.event; //浏览器兼容性   
	    var elem = e.target || e.srcElement;  
	    while (elem) { //循环判断至跟节点，防止点击的是div子元素   
	        if (elem.id && elem.id == Id) {  
	            return;  
	        }  
	        elem = elem.parentNode;  
	    }  
	    //点击的不是div或其子元素  
	    $('#'+Id+' .list-container').css('display', 'none');
	    //没有重新选择,重置合同编号的input框值
	    $('#'+Id+' input').val(currentContractId);
	});
}

//渲染
//明细信息每行自定义渲染事件
//行删除事件
//行删除事件-电脑端无序号
function deleteDetailsItem1($demo){
	$demo.click(function(e){
		layer.confirm('确认删除该项？',function(index){
			$(e.target).closest('tr').remove();
			layer.close(index);
		});
	});
}
//行删除事件-电脑端有序号(需更新序号)
var n_count = 1; //序号
function deleteDetailsItem2($demo){
	$demo.click(function(e){
		layer.confirm('确认删除该项？',function(index){
			$(e.target).closest('tr').remove();
			//重置序号
			n_count = 0;
			$.each($('.details'),function(index,item){
				$(item).find('input[name="number"]').val(++n_count);
			});
			layer.close(index);
		});
	});
}
//行删除事件-手机端(默认含序号)
//序号使用 n_count
function deleteDetailsItem3($demo){
	$demo.click(function(e){
		layer.confirm('确认删除该项？',function(index){
        	$(e.target).closest('.apply-detail').remove();
        	//重置序号
			n_count = 0;
			$.each($('.details-title'),function(index,item){
				$(item).html('明细信息#'+(++n_count)+'<span class="layui-icon layui-icon-up"></span>');
			});
			
        	layer.close(index);
		});
	});
}
//行滑动事件
function slideToggleDetailsItem($demo){
	$demo.click(function(e){
		//切换滑动状态
    	$(e.target).siblings('.details').slideToggle();
    	//切换图标样式
        if($(e.target).find('span').hasClass('layui-icon-down')){ 
        	$(e.target).find('span').removeClass('layui-icon-down').addClass('layui-icon-up');; 
        }else{ 
        	$(e.target).find('span').removeClass('layui-icon-up').addClass('layui-icon-down'); 
        }
	});
}


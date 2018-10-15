
<!DOCTYPE html>
<html lang="zh">
<head>
<title>提交订单页 </title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<script type="text/javascript" src="${base}/res/js/cart/goods_cart.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/cart/area_array.js" charset="utf-8"></script>
<script>
jQuery(document).ready(function() {
	
	//加载运费
	addShipping();
	
	//如果修改收货地址需要重新计算邮费
	 $("input[name='address_options']").change(function(){
	 	addShipping();
	 });
	
	//选择是否使用余额
    $("input[name='isPd']").click(function(){
    	if($(this).is(':checked')){
    		$(this).val(1);
    	}else{
    		$(this).val(0);
    	}
    	//getTotalPrice();
    });
    var isSubmit=false;
	//提交订单事件
	$('#submitToPay').click(function(){
		if ($('input[name="address_options"]:checked').val() == null){
			layer.open({content:'请设置收货地址', time: 1});
			return false;
		}
		if(isSubmit){
			return false;
		}
		isSubmit=true;
		var cartIds = $("#cartIds").val();
		var cityId = "";
		//收货地址信息
		var city = $("input[name='address_options']:checked");
		//是否使用余额
		var isPd = 0;
		//判断是否勾选
		if($("input[name='isPd']").is(':checked')){//选中
			isPd = 1;
		}
		//若选择收货地址,获取城市id
		if (typeof(city) != "undefined"){
			
			cityId = city.attr("city_id");
		}
		
		var shipeeValue = $("select[name='transport_type']").val();
		//判断需不需要付邮费
		//if(typeof(shipeeValue) != "undefined"){
		//	if(isPd == 0){
		//		layer.open({content:'需要支付邮费', time: 1});
		//		return false;
		//	}
		//}
		$.ajax({
        	url:'${base}/points/validatePointsOrder',
            type:'post',
            data : {'cartIds' : cartIds,'shipeeValue':shipeeValue,'cityId':cityId},
            dataType:'json',
            success:function(data){
            	if(data.result=='true'){
            		$.ajax({
        	        	url:'${base}/points/submitOrder',
        	            type:'post',
        	            data:$("#porder_form").serialize(),
        	            dataType:'json',
        	            success:function(data){
        	            	if(data.result=='true'){
        	            		location.href="${base}/points/payOrder?orderid="+data.orderid+"&isPd="+isPd;
        	            	}else{
        	            		layer.open(data.msg,{icon:2});
        	            		return false;
        	            	}
        	            },error:function(){
        	            	layer.open('二层程序出错',{icon:2});
        	            }
        		    });
            	}else{
            		isSubmit=false;
            		layer.open(data.msg,{icon:2});
            		return false;
            	}
            },error:function(){
            	layer.open('一层程序出错',{icon:2});
            }
	    });
	});
});	 
//地址删除
function deleteAddress(id){
    var url = "${base}/m/authc/buyer/deleteAddress?id="+id+"&cartIds="+$("#cartIds").val();
    //layer.confirm('确定删除?', function(){
        $.ajax({
            type: "post",
            url: url,
            data: null,
            dataType: "json",
            async:false,
            success:function(data) {
                if(data.success == "true"){
                    //layer.msg('删除成功', {icon: 1});
                	window.location.href = "${base}/points/cartOrder?cartIds="+data.cartIds;
                }else{
                	layer.open({content:'删除失败', time: 1});
                }
            }
        });
   // });
}
var amounttotal = number_format(0,2);
	//加载运费
function addShipping(){
		//市级id
		var cityId = "";
		//收货地址信息
		var city = $("input[name='address_options']:checked");
		//若选择收货地址,获取城市id
		if (typeof(city) != "undefined"){
			cityId = city.attr("city_id");
		}
		//var cartIds = $("#cartIds").val();
		$.ajax({
    	url:'${base}/points/addShipping',
    	type:'post',
        data : {'cityId':cityId},
        dataType:'json',
        success:function(data){
        	if(data.success){
        			var str='';
        			var num = 0; //循环次数
				    str+='<span>配送方式：<select name="transport_type" onChange="shipUpdate(this);" >';
				    $.each(data.result,function(key1,values1){  //遍历运费模板map
				    	num += 1;
				    	str+='<option value="';
				    	str+=key1+'">';
				    	if(key1=='py'){
				    		str+='平邮  '+toDecimal2(values1);
				    	}else if(key1=='kd'){
				    		str+='快递  '+toDecimal2(values1);
				    	}else if(key1=='es'){
				    		str+='EMS  '+toDecimal2(values1);
				    	}
				    	str+='</option>';
				    });   
				    str+='</select></span>';
				    //将运费加入页面
				    if(num!=0){
				    	$("#ship").html(str);
				    	/* var freight = $("#ship_"+key).find("select[name='transport_type']").val().split("|");
			    		$("#ship_"+key).parent().find("#trans_total").html("&yen;"+toDecimal2(freight[1])); */
				    }
				getTotalShipeeValue();
            }
        },error:function(data){
        	layer.open({content:'通信失败' , time: 1});
        }
    }); 
}

function getTotalShipeeValue(){
	var ship = $("select[name='transport_type']");
	var shipeeValue = "";
	if (typeof(ship) != "undefined"){
 		ship.each(function(){
 			shipeeValue += $("select[name='transport_type']").val()+",";
 			//freight += $(this).val() + ",";
 		});
	}
}

//修改订单运费显示
function shipUpdate(obj){
	var freight = $(obj).val().split("|");
	$(obj).parent().parent().parent().find("#trans_total").html("&yen;"+toDecimal2(freight[1]));
	//重新加载订单金额信息
	//getTotalPrice();
}

//准换价格格式
function toDecimal2(x) {   
    var f = parseFloat(x);   
    if (isNaN(f)) {   
        return false;   
    }   
    var f = Math.round(x*100)/100;   
    var s = f.toString();   
    var rs = s.indexOf('.');   
    if (rs < 0) {   
        rs = s.length;   
        s += '.';   
    }   
    while (s.length <= rs + 2) {   
        s += '0';   
    }   
    return s;   
}

	//计算应付金额
function getTotalPrice(){
		//优惠券id
		//var couponId = "";	
		//获取优惠券信息
		//var couponMember = $("#couponMember");
		//if (typeof(couponMember) != "undefined"){
		//	if(couponMember.val()!=0){
		//		couponId = couponMember.val();
		//	}
		//}
		//运费信息
		var freight = "";
		//运费模块
		var ship = $("select[name='transport_type']");
		var shipeeValue = "";
		if (typeof(ship) != "undefined"){
 		ship.each(function(){
 			shipeeValue += $("select[name='transport_type']").val()+",";
 			//freight += $(this).val() + ",";
 		});
		}
		//市级id
		var cityId = "";
		//收货地址信息
		var city = $("input[name='address_options']:checked");
		//若选择收货地址,获取城市id
		if (typeof(city) != "undefined"){
			cityId = city.attr("city_id");
		}
		
		//是否使用余额
		var isPd = 0;
		//判断是否勾选
		if($("input[name='isPd']").is(':checked')){//选中
			isPd = 1;
		}
		//多个购物车的id
		var cartIds = $("#cartIds").val();
		$.ajax({
    	url:'${base}/points/queryTotalPrice',
        type:'post',
        data : {'cartIds':cartIds,'cityId':cityId,'shipeeValue':shipeeValue,'isPd':isPd},
        dataType:'json',
        success:function(data){
        	if(data.success){
        		//$("#order_amount").html("&yen;"+toDecimal2(data.result.totalPrice));
        		//$("#order_shipp").html("&yen;"+toDecimal2(data.result.totalFreight));
        		//$("#coupon_price").html("&yen;"+toDecimal2(data.result.couponPrice));
        		//$("#condition_price").html("&yen;"+toDecimal2(data.result.conditionPrice));
        		//$("#predeposit_amount").html("&yen;"+toDecimal2(data.result.predepositAmount));
            }
        },error:function(data){
        	layer.open({content:'通信失败', time: 1});
        }
    });
}
</script>
</head>
<body>
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>填写订单<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="mt50"></div>
<form method="post" id="porder_form" name="porder_form" action="${base}/points/pointsCartStep3">
<input type="hidden" name="cartIds" value="${cartIds}" id="cartIds" /> 
  <div class="fill_order" id="form_div">    
 	 <section>
     	<div class="add_address" style="margin-top:0px;">
     		<a href="${base}/m/authc/buyer/addressAdd?page=2&cartIds=${cartIds}">添加收货地址</a>
     	</div>
	 </section>
	 <h2>收货人信息</h2>
	 <#assign pointsCartTag = newTag("pointsCartTag") />
	 <#assign cartMap = pointsCartTag("{'cartIds':'${cartIds}'}") />
	 <#if cartMap.get("addressList")??>
		 <#list cartMap.get("addressList") as address>
		 
			 <div class="phone_address" id="addr_207">
		    	<ul>
		        	<li class="tel">${address.trueName}<span>${address.mobPhone}</span></li>
		            <li class="site bd">${address.areaInfo}</li>
		            <li class="site bd">${address.address}</li>
		            <li class="check">
			            <span class="fl" mark="207">
				            <i>
				            <#if address.isDefault == 1>
				            	<input id="address_${address.addressId}" type="radio" city_id="${address.cityId}" name="address_options" value="${address.addressId}" checked="checked"/>
				            <#else>
				            	<input id="address_${address.addressId}" type="radio" city_id="${address.cityId}" name="address_options" value="${address.addressId}" />
				            </#if>
				            </i>到这里去
			            </span>
			            <span class="fr">
				            <a href="${base}/m/authc/buyer/updateAddress?page=2&cartIds=${cartIds}&id=${address.addressId}">
					            <i>
					            	<img  src="${base}/res/html5/images/mod.pnghd" width="20" height="20" />
					            </i>修改
				            </a>
				            <a href="javascript:void(0);" onClick="deleteAddress('${address.addressId}');">
					            <i>
					            	<img  src="${base}/res/html5/images/del.png" width="20" height="20" />
					            </i>删除
				            </a>
			            </span> 
		            </li>
		        </ul>
		     </div>
			
		</#list>
	</#if>
     <h2>支付方式</h2>
     <#assign availablePredeposit = cartMap.get("member").availablePredeposit/>
     <div class="pay_infro">
	     <ul>
	       <li> 
		       <span class="fl">支付方式 
			       <span class="gray">
				       <label>
					       <span>
					       	    <input type="radio" name="paytype" value="1" checked/>
					       </span>
					       <i>在线支付</i>
				       </label>
				     <#--  <label>
					        <span>
					        	<input type="radio" name="paytype" value="2"/>
					        </span>
					        <i>货到付款</i> 
				       </label> -->
			       </span>
		       </span>
	       </li>
	          
	          <li> 
		          <span class="fl">余额支付
			          <span class="gray">
				          <label>
					          <span>
					          	 <input type="checkbox" name="isPd" value="0" <#if availablePredeposit==0>disabled="disabled"</#if> />
					          </span>
					          <i>余额支付
					          	 （账户当前余额：<script type="text/javascript">
	    							var pd = number_format(${availablePredeposit},2);
	    							document.write("&yen;"+pd);
	    						</script>
      							元）
					          </i>
					          
				          </label>
			          </span>
		          </span>
	          </li> 
	     </ul>
	 </div>
	<#if cartMap.get("cartVoList")??>
	<#list cartMap.get("cartVoList") as pointsCart>
    <div class="pay_shop">
	      <input type="hidden" name="storeId" value="${pointsCart.storeId}" />
		      <ul>
		      <li id="cart_item_${cart.cartId}">
			      <a href="${base }/points/pointsDetail?id=${pointsCart.pgoodsId}">
				      <div class="com_li">
					      <span class="img">
					      	<img src="${imgServer}${pointsCart.pgoodsImage}" width="60" height="60" />
					      </span>
					      <span class="mid">
						      <p class="name">${pointsCart.pgoodsName}</p>
						      <p class="gray"></p>
					      </span>
					      <span class="fr">
						      <p class="red"> 
						      	<script type="text/javascript">
						      		var price = number_format(${pointsCart.pgoodsPoints},2);
						      		document.write(price);
						      	</script>
						      	分
						      </p>
						      <p>X${pointsCart.pgoodsChoosenum}</p>
						      <p>小计:
						      	<script type="text/javascript">
						      		var amount = number_format(${pointsCart.pgoodsPoints*pointsCart.pgoodsChoosenum},2);
						      		amounttotal = parseFloat(amounttotal)+parseFloat(amount);
						      		document.write(amount);
						      	</script>
						      	分
						      </p>
					      </span>
				      </div>
			      	</a>
		      	</li>
		      </ul>
	    	</#list>
	  	</#if>
	  	<ul class="check_ul">
          <li>
	          <label align="right">
	          	<span class="red" id= "ship">免运费</span>
	          </label>
   		  </li>
          <li>
	          <script type="text/javascript">
	       	  		function postscript_activation(tt){{tt.value = '';tt.name = 'shopPointsOrderMessage';}}
	       	  </script>
			  <label>给卖家留言：            
			  		<input type="text" id="postscript" onclick="postscript_activation(this);" name="shopPointsOrderMessage" value="选填"  maxlength="200"/>
			  </label>
       	  </li>
      </ul> 
    </div>

    <input name="cart_session" type="hidden" id="cart_session" value="w1okWFU9Vo1G01h3ekWBs1CHLV15mIJY" />
    <input name="goods_amount" type="hidden" id="goods_amount" value="194.4" />
    <input name="addr_id" id="addr_id" type="hidden" value="" />
    <input name="delivery_id" id="delivery_id" type="hidden"/>
    <input name="gcs" type="hidden" id="gcs" value="1413," />
    <input name="gifts" type="hidden" id="gifts" value="" />
    <div class="car_pay order_tt">
      <div class="total">
        <p class="price" id="order_amount">所需积分:
        	<em id="order_amount">
				<script type="text/javascript">
					var totalprice = number_format(${cartMap.get('map')},2);
					document.write(totalprice);
				</script>
	    	</em>        
	    </p>
      </div>
      <a class="paymen_btn" href="javascript:void(0);"  id='submitToPay' >提交订单</a> </div>
  </div>
 <!--  <div class="fill_order" id="fp_div" style="display:none">
    <div class="pay_infro">
      <ul class="invoice">
        <li>发票类型：
          <label>
            <input id="invoiceType" name="invoiceType"  type="radio" value="0" checked="checked" mark="普通发票"  />
            普通发票</label>
           </li>
        <li>发票抬头：
          <input name="invoice" type="text" class="ip150" id="invoice" value="" />
          <span class="gray"><a class="red" href="javascript:void(0);" onClick="invoice_save();">保存</a>为常用发票</span></li>
        <li>
          <label>
            <input name="invoice_agree" type="checkbox" value="true" checked="checked" id="invoice_agree" />
            我已阅读并同意<a class="red" href="">《发票须知》</a></label>
        </li>
      </ul>
    </div>
    <div class="red_submit"><a href="javascript:void(0);" onClick="submit_fp();">确定</a></div>
  </div> -->
    <input name="store_id" id="store_id" type="hidden" value="self" />
  </form>
<div class="mt50"></div>
</body>
</html>


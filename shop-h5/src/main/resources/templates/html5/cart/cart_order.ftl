
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
	//选择是否使用余额
    $("input[name='isPd']").click(function(){
    	if($(this).is(':checked')){
    		$(this).val(1);
    	}else{
    		$(this).val(0);
    	}
    	getTotalPrice();
    });
	
	//提交订单事件
		$('#submitToPay').click(function(){
		ifsubmit = true;
		if ($('input[name="address_options"]:checked').val() == null){
			layer.open({content:'请设置收货地址', time: 1});
			return false;
		}
		if (ifsubmit == true){
			var cartIds = $("#cartIds").val();
			$.ajax({
		    	url : "${base}/m/authc/cart/orderVal",
		        type : 'post',
		        data : {'cartIds' : cartIds},
		        dataType : 'json',
		        success : function(data){
		            if(data.success){
		            	//获取返回的map集合
		            	var result = data.result;
		            	if(result.specnotfund.length!=0){ //判断商品是否存在
		            		//新建一个字符串,存储价格变动的商品名称
		            		var str = "";
		            		result.specnotfund.forEach(function(s){
		            			str += s.goodsName + "&nbsp;&nbsp;&nbsp;";
		            		});
		            		layer.open({content:"您购买的商品:"+str+"不存在,请您重新提交订单!", time: 1});
		            	}else if(result.goodsshow.length!=0){ //先判断商品状态
		           			//新建一个字符串,存储库存不足的商品名称
		            		var str = "";
		            		result.goodsshow.forEach(function(s){
		            			str += s.goodsName + "&nbsp;&nbsp;&nbsp;";
		            		});
		            		layer.open({content:"您购买的商品:"+str+"状态异常,请您重新提交订单!", time: 1});
		            	}else if(result.understock.length!=0){ //判断库存量
		           			//新建一个字符串,存储库存不足的商品名称
		            		var str = "";
		            		result.understock.forEach(function(s){
		            			str += s.goodsName + "&nbsp;&nbsp;&nbsp;";
		            		});
		            		layer.open({content:"您购买的商品:"+str+"库存量不足,请您重新提交订单!", time: 1});
		            	}else if(result.pricechange.length!=0){ //然后判断价格是否变动
		            		//新建一个字符串,存储价格变动的商品名称
		            		var str = "";
		            		result.pricechange.forEach(function(s){
		            			str += s.goodsName + "&nbsp;&nbsp;&nbsp;";
		            		});
		            		layer.open({content:"您购买的商品:"+str+"价格出现变动,请您重新提交订单!", time: 1});
		            	}
		            }else{
		            	$('#cart_form').submit(); 
		            } 
		        }
		    }); 
		}
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
                	window.location.href = "${base}/m/authc/cart/cartOrder?cartIds="+data.cartIds;
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
		var cartIds = $("#cartIds").val();
		$.ajax({
    	url:'${base}/m/authc/cart/addShipping',
        type:'post',
        data : {'cartIds':cartIds,'cityId':cityId},
        dataType:'json',
        success:function(data){
        	if(data.success){
        		$.each(data.result,function(key,values){   //遍历map
        			var str='';
        			var num = 0; //循环次数
				    str+='<span>配送方式：<select name="transport_type" onChange="shipUpdate(this);" >';
				    $.each(values,function(key1,values1){  //遍历运费模板map
				    	num += 1;
				    	str+='<option value="';
				    	str+=key1+'|'+key+'">';
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
				    	$("#ship_"+key).html(str);
				    	var freight = $("#ship_"+key).find("select[name='transport_type']").val().split("|");
			    		$("#ship_"+key).parent().find("#trans_total").html("&yen;"+toDecimal2(freight[1]));
				    }
				});  
				getTotalPrice();
            }
        },error:function(data){
        	layer.open({content:'通信失败' , time: 1});
        }
    }); 
}

//修改订单运费显示
function shipUpdate(obj){
	var freight = $(obj).val().split("|");
	$(obj).parent().parent().parent().find("#trans_total").html("&yen;"+toDecimal2(freight[1]));
	//重新加载订单金额信息
	getTotalPrice();
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
		var couponId = "";	
		//获取优惠券信息
		var couponMember = $("#couponMember");
		if (typeof(couponMember) != "undefined"){
			if(couponMember.val()!=0){
				couponId = couponMember.val();
			}
		}
		//运费信息
		var freight = "";
		//运费模块
		var ship = $("select[name='transport_type']");
		if (typeof(ship) != "undefined"){
 		ship.each(function(){
 			freight += $(this).val() + ",";
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
    	url:'${base}/m/authc/cart/getTotalPrice',
        type:'post',
        data : {'cartIds':cartIds,'cityId':cityId,'couponId':couponId,'freight':freight,'isPd':isPd},
        dataType:'json',
        success:function(data){
        	if(data.success){
        		$("#order_amount").html("&yen;"+toDecimal2(data.result.totalPrice));
        		$("#order_shipp").html("&yen;"+toDecimal2(data.result.totalFreight));
        		$("#coupon_price").html("&yen;"+toDecimal2(data.result.couponPrice));
        		$("#condition_price").html("&yen;"+toDecimal2(data.result.conditionPrice));
        		$("#predeposit_amount").html("&yen;"+toDecimal2(data.result.predepositAmount));
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
<form action="${base}/m/authc/cart/subOrder" method="post" name="cart_form"  id="cart_form">
<input type="hidden" name="cartIds" value="${cartIds}" id="cartIds" /> 
  <div class="fill_order" id="form_div">    
 	 <section>
     	<div class="add_address" style="margin-top:0px;">
     		<a href="${base}/m/authc/buyer/addressAdd?page=1&cartIds=${cartIds}">添加收货地址</a>
     	</div>
	 </section>
	 <h2>收货人信息</h2>
	 <#assign cartTag = newTag("cartTag") />
	 <#assign cartMap = cartTag("{'cartIds':'${cartIds}'}") />
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
				            	<input id="address_${address.addressId}" type="radio" city_id="${address.cityId}" name="address_options" value="${address.addressId}" checked/>
				            <#else>
				            	<input id="address_${address.addressId}" type="radio" city_id="${address.cityId}" name="address_options" value="${address.addressId}" />
				            </#if>
				            </i>到这里去
			            </span>
			            <span class="fr">
				            <a href="${base}/m/authc/buyer/updateAddress?page=1&cartIds=${cartIds}&id=${address.addressId}">
					            <i>
					            	<img  src="${base}/res/html5/images/mod.png" width="20" height="20" />
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
	       <!-- <li><a href="javascript:void(0);" onClick="choose_day();"><span class="fl">配送时间<span class="gray" id="delivery_time_html"> 工作日、双休日、法定节假日 </span></span><span class="fr"><img  src="${base}/res/html5/images/other_arrow.png" width="30" height="30" /></span></a>
	         <input name="delivery_time" type="hidden" id="delivery_time"     />
	       </li>
	       <li><a  href="javascript:void(0);" onClick="choose_ship();"><span class="fl">配送方式<span class="gray" id="ship_html">快递配送</span></span><span class="fr"><img  src="${base}/res/html5/images/other_arrow.png" width="30" height="30" /></span></a></li> -->
	       <li> 
		       <span class="fl">支付方式 
			       <span class="gray">
				       <label>
					       <span>
					       	    <input type="radio" name="paytype" value="1" checked/>
					       </span>
					       <i>在线支付</i>
				       </label>
				      
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
	          
	       <!-- <li><a href="javascript:void(0);" onClick="choose_fp();"><span class="fl">发票信息<span class="gray" id="fp_html">普通发票</span></span><span class="fr"><img  src="${base}/res/html5/images/other_arrow.png" width="30" height="30" /></span></a></li> -->
	     </ul>
	 </div>
	<#if cartMap.get("cartVoList")??>
	<#list cartMap.get("cartVoList") as cartVo>
    <div class="pay_shop">
	   
	      <input type="hidden" name="storeId" value="${cartVo.storeId}" />
		      <h3>
			      <span class="fl">
			      	<img src="${base}/res/html5/images/shop.png" width="25" height="25" />
			      </span>        
			       ${cartVo.storeName}
		      </h3>
		      <ul>
		      <#if cartVo.list??>
	      	  	<#list cartVo.list as cart>
				      <li id="cart_item_${cart.cartId}">
					      <a href="${base}/m/goods/goodsdetail?id=${cart.goodsId}">
						      <div class="com_li">
							      <span class="img">
							      	<img src="${imgServer}${cart.goodsImages}" width="60" height="60" />
							      </span>
							      <span class="mid">
								      <p class="name">${cart.goodsName} </p>
								      <p class="gray"></p>
								      <!--  <p class="red"> (促销)</p>-->
							      </span>
							      <span class="fr">
								      <p class="red"> ¥
								      	<script type="text/javascript">
								      		var price = number_format(${cart.goodsPrice},2);
								      		document.write(price);
								      	</script>
								      </p>
								      <p>X${cart.goodsNum }</p>
								      <p>小计:¥
								      	<script type="text/javascript">
								      		var amount = number_format(${cart.goodsPrice*cart.goodsNum},2);
								      		amounttotal = parseFloat(amounttotal)+parseFloat(amount);
								      		document.write(amount);
								      	</script>
								      </p>
							      </span>
						      </div>
					      	</a>
				      	</li>
				      	<li>
				            <label align="right">
					            <span class="red" id= "ship_${cartVo.storeId}"><!-- 显示运费 -->免运费</span>
				            </label>
          				</li>
				 	</#list>
	  			 </#if>
		      </ul>
	    
     <ul class="check_ul">
                <!--<li>  <span class="fl">无优惠券可使用</span>  </li> -->
               <!--   <li><span class="fl">运送方式 <span class="red">
          <select name="ship_price_self" style="width:110px;" id="ship_price_self" mark="self">
            
                                                                               
          </select>
          ¥<strong> 0.0</strong>
          </span></span> 
          <span class="fr">
          <img  src="${base}/res/html5/images/other_arrow.png" width="30" height="30" />
          </span>
          </li> -->
          <li>
	          <script type="text/javascript">
	       	  		function postscript_activation(tt){{tt.value = '';tt.name = 'order_message';}}
	       	  </script>
			  <label>给卖家留言：            
			  		<input type="text" id="postscript" onclick="postscript_activation(this);" name="orderMessage_${cartVo.storeId}" value="选填"  maxlength="200"/>
			  </label>
       	  </li>
      </ul> 
    <!--   <div class="money">         </span></p>
        <p>应付金额：<span class="red" id="store_total_price_self" price="194.4">194.4</span></p>
      </div> -->
    </div>
    </#list>
    </#if>
   	<#assign couponMemberTag = newTag("couponMemberTag") />
	<#assign map = couponMemberTag("{'cartIds':'${cartIds}'}") />
    <div class="total_price">
      <table cellpadding="0" cellspacing="0">
        <tbody>
      
          <tr>
            <td align="left">选择优惠券</td>
            <td align="right">
	            <#if map.couponMemberList??>
  					<select id="couponMember" onchange="getTotalPrice();" name="couponId">
  						<option value="0">未选择</option>
						<#list map.couponMemberList as couponMember>
  							<option value="${couponMember.couponId}" <#if couponMember.couponSuc==1> disabled="disabled"</#if>>满${couponMember.couponLimit}元 - ${couponMember.couponPrice}元</option>
  						</#list>
  					</select>
	  			<#else>
  					<span class="red" nc_type="shipping_fee" value="0">无可用优惠券</span>
	        	</#if>
	        </td>
          </tr>
          <tr>
            <td width="50%" align="left">优惠券金额</td>
            <td align="right">
	            <span class="red">
	            	<em id="coupon_price"></em>
	            </span>
            </td>
          </tr> 
          <tr>
            <td width="50%" align="left">促销金额</td>
            <td align="right">
	            <span class="red">
	            	<em id="condition_price"></em>
	            </span>
            </td>
          </tr> 
          <tr>
            <td align="left">运费</td>
            <td align="right">
	            <em class="red" id="order_shipp"></em>
            </td>
          </tr>
          
          <tr>
            <td align="left">使用余额</td>
            <td align="right">
	            <span class="red" id="predeposit_amount"></span>
            </td>
          </tr>      
        
      </table>
    </div> 

    <input name="cart_session" type="hidden" id="cart_session" value="w1okWFU9Vo1G01h3ekWBs1CHLV15mIJY" />
    <input name="goods_amount" type="hidden" id="goods_amount" value="194.4" />
    <input name="addr_id" id="addr_id" type="hidden" value="" />
    <input name="delivery_id" id="delivery_id" type="hidden"/>
    <input name="gcs" type="hidden" id="gcs" value="1413," />
    <input name="gifts" type="hidden" id="gifts" value="" />
    <div class="car_pay order_tt">
      <div class="total">
        <p class="price" id="order_amount">应付金额:
        	<em id="order_amount">
				<script type="text/javascript">
					var totalprice = number_format(${cartMap.get('map').get('goodsTotalPrice')},2);
					document.write("&yen;"+totalprice);
				</script>
	    	</em>        
	    </p>
      </div>
      <a class="paymen_btn" href="javascript:void(0);"  id='submitToPay' >提交订单</a> </div>
  </div>
  <div class="fill_order" id="fp_div" style="display:none">
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
  </div>
    <input name="store_id" id="store_id" type="hidden" value="self" />
  </form>
<div class="mt50"></div>
</body>
</html>


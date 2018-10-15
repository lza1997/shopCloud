<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>订单支付</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script>
jQuery(document).ready(function(e) {
    jQuery(".pay_style").click(function(){
		jQuery(".pay_style").removeClass("this");
		jQuery(this).addClass("this");
		var index = jQuery(this).index(".pay_style");
		jQuery(" input[name=payType]").get(index).checked=true;
	});
	 if(isWeiXin()){
		 $("#weixindiv").css('display', 'inline'); 
     }else{
    	 $("#zfbdiv").css('display', 'inline'); 
	 }
});<!--end-->
var type="goods";
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
</script>
</head>

<body>
<div class="phone_hd">
	订单支付
	<a class="menu home" href="${base}/m/index/index">
		<img src="${base}/res/html5/images/home.png" width="25" height="25" />
	</a>
</div>
<div>
</div>
<div class="pd5">
  <div class="payment">
    <div class="pay_detail">
      <dl>
        <dt><img src="${base}/res/html5/images/dun.png" width="62"></dt>
        <dd>
          <ul>
	          	<!-- 判断应付金额大小 -->
	          	<#if ordersAmount=="">
	      			<li id="payOrderFinally" style="font-size:20px; margin-bottom:10px;">下单成功！等待卖家发货！</li>
	      		<#else>
	          		<li style="font-size:20px; margin-bottom:10px;">订单支付</li>
	          		<li>应付金额：<span class="red">¥ ${ordersAmount}</span></li>
	      		</#if>
            <li></li>
          </ul>
        </dd>
      </dl>
    </div>
    <form id="theForm" method="post" action="">
    <input type="hidden" name="order_id" id="order_id" value="287">
    </form>
    <#if ordersAmount!="">
    	<div class="pay_btn" id="weixindiv" style="display:none;"><a href="${base}/weChatpayment/submitOrder?paySn=${ordersn}" >微信支付</a></div>
    	<div class="pay_btn" id="zfbdiv" style="display:none;"><a href="${base}/points/user/html5/orderpay?ordersn=${ordersn}&paymentCode=ZFB&paymentId=5" >支付宝支付</a></div>
    </#if>
  </div>
</div>


</body>
</html>

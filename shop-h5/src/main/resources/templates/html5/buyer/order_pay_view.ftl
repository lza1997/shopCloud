
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
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>订单支付<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="pd5">
  <div class="payment">
    <div class="pay_detail">
      <dl>
        <dt><img src="${base}/res/html5/images/dun.png" width="62"></dt>
        <dd>
          <ul>
          	<#if 1=='${paytype}'><!-- 在线支付 -->
	          	<!-- 判断应付金额大小 -->
	          	<#if ordersAmount==0>
	      			<li style="font-size:20px; margin-bottom:10px;">下单成功！等待卖家发货！</li>
	      		<#else>
	          		<li style="font-size:20px; margin-bottom:10px;">订单支付</li>
	      		</#if>
          	<#else><!-- 货到付款 -->
          		<li style="font-size:20px; margin-bottom:10px;">下单成功！等待卖家确认！</li>
          	</#if>
          	
      		<!-- <#if ordersAmount==0>
      			<li style="font-size:20px; margin-bottom:10px;">下单成功！等待卖家确认！</li>
      		<#else>
      			<#if 1=='${paytype}'>
          			<li style="font-size:20px; margin-bottom:10px;">订单支付</li>
          		<#else>
          			<li style="font-size:20px; margin-bottom:10px;">下单成功！等待卖家确认！</li>
          		</#if>
      		</#if> -->
            <li>应付金额：<span class="red">¥ ${ordersAmount}</span></li>
            <li></li>
          </ul>
        </dd>
      </dl>
    </div>
   
    <form id="theForm" method="post" action="">
    <input type="hidden" name="order_id" id="order_id" value="287">
<!--     <div class="payfor">
      <h1>请选择支付方式：</h1>
                              <table class="pay_table">
        <tbody>
          <tr>
            <td colspan="2"><span style="border-bottom:1px solid #F00">预存款支付</span></td>
          </tr>
          <tr>
            <td width="12%" align="center"><input type="radio" name="payType" id="payType" value="balance"></td>
            <td><div class="pay_style"><a href="javascript:void(0)">预存款</a></div></td>
          </tr>
        </tbody>
      </table>
       </div> -->
    </form>
    <#if 1=='${paytype}' && ordersAmount!=0>
    	<div class="pay_btn" id="weixindiv" style="display:none;"><a href="${base}/weChatpayment/submitOrder?paySn=${orderPaySn}" >微信支付</a></div>
    	<div class="pay_btn" id="zfbdiv" style="display:none;"><a href="${base}/alipayh5ment/topay?paySn=${orderPaySn}" >支付宝支付</a></div>
    </#if>
  </div>
</div>


</body>
</html>

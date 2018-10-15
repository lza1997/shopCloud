
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
<title>余额充值 - 瑞华信通 B2B2C V3.0 2015版商城系统</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/js/common.js" charset="utf-8"></script>
<script>
jQuery(document).ready(function(e) {
	 if(isWeiXin()){
		 $("#weixindiv").css('display', 'inline'); 
     }else{
    	 $("#zfbdiv").css('display', 'inline'); 
	 }
});
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
	          	<li style="font-size:20px; margin-bottom:10px;">您已申请账户余额充值，请立即在线支付!</li>
	            <li>充值金额：
		            <span class="red">
			            <script type="text/javascript">
			      			var amount = number_format('${predepositRecharge.pdrAmount}',2);
							document.write("&yen;"+amount);
		      			</script>
	      			</span>
	            </li>
            	<li></li>
          </ul>
        </dd>
      </dl>
    </div>
   	<div class="pay_btn" id="weixindiv" style="display:none;"><a href="${base}/weChatpayment/submitOrder?paySn=${predepositRecharge.pdrSn}" >微信支付</a></div>
   	<div class="pay_btn" id="zfbdiv" style="display:none;"><a href="${base}/alipayh5ment/topay?paySn=${predepositRecharge.pdrSn}" >支付宝支付</a></div>
  </div>
</div>


</body>
</html>

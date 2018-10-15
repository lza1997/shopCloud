<!DOCTYPE html>
<html lang="zh">
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
<title>订单支付成功</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.6.2.js"></script>
</head>

<body class="index_bg">
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>订单支付<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="main">
  <div class="mt50" style="height:49px;"></div>
  <div class="error_page1">
    <p>
        	支付成功！
    </p>
  </div>

</div>
<div class="red_submit"><a class="back" href="${base}/m/index/index">继续购物</a><a class="back" href="${base}/m/authc/buyer/orderList?orderState=99">查看订单页面</a></div>
<!--底部-->
<@f.foot/>	

<!--按钮-->

</body>
</html>

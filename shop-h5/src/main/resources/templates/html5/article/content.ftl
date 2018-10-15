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
<title>关于我们</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.6.2.js"></script>
<!--添加代码开始-->
  <style>
*{ margin:0; padding:0;list-style: none;}
body {font:12px/1.5 Tahoma; color: white;}
#outer {margin:45px auto;}
#outer h1{font-size: 24px; text-align: center; color: black;}
#content {border-top-width:0; color: black;}
#content ul {line-height:25px;display:none;	margin:0 30px;padding:10px 0;}
</style>
<!--添加代码结束-->
</head>

<body class="index_bg">
<div class="phone_main">
	<#assign articleTag = newTag("articleTag") />
	<#assign article = articleTag("{'articleId':'33'}") />
  	<!--添加代码开始-->
  	<div id="outer">
	    <div>
	    	<h1>${article.articleTitle!''}</h1>
	    </div>
	    <div id="content">
	        <ul style="display:block;">
	          ${article.articleContent!''}
	        </ul>
	    </div>
	</div>
	<!--添加代码结束-->
  	<!--底部-->
<!--按钮-->
 </div>
<!--悬浮层-->
<!--添加代码开始-->
<script src="${base}/res/html5/js/jquery.min.js"></script>
<!--添加代码开始-->

</body>
</html>

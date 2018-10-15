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
<title>商品详细介绍页 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.6.2.js"></script>
<!--添加代码开始-->
  <style>
*{ margin:0; padding:0;list-style: none;}
body {font:12px/1.5 Tahoma;}
#outer {margin:45px auto;}
#tab {overflow:hidden;zoom:1;background:#000;}
#tab li {float:left;color:#fff;height:30px;	cursor:pointer;	line-height:30px;width: 33%; text-align: center;}
#tab li.current {color:#000;background:#ccc;}
#content {border-top-width:0;}
#content ul {line-height:25px;display:none;padding:10px 0;}
#content ul img{width:90%;padding:0 5%}
</style>
<!--添加代码结束-->
</head>

<body class="index_bg">
<div class="phone_main">
  <!--0元试用详细页-->
  <#if 1=='${isShow}'>
    <div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>商品详细<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
  </#if>

  <!--添加代码开始-->
  <div id="outer">
    <ul id="tab">
        <li class="current">商品介绍</li>
        <li>规格参数</li>
        <li>包装售后</li>
    </ul>
    <#assign goodsAttrTag =newTag("goodsAttrTag")>
	<#assign goodsAttr =goodsAttrTag("{'goodsid':'${goodsId}'}")>
	<#assign attrList = goodsAttr.get("goodsattr")>
    <div id="content">
        <ul style="display:block;width:100%;max-width: 100%;">
          ${goodsAttr.get("goodsbody")}
        </ul>
        <ul>
          <li>品牌：${goodsAttr.get("goodsbrandname")}</li>
			<#if attrList?? && attrList!''>
				<#list attrList as ga>
				<li>
					${ga.attrName}：${ga.attrValueName}
				</li>
				</#list>
			</#if>
        </ul>
        <ul>
           css3
        </ul>
    </div>
</div>
<!--添加代码结束-->
  <!--底部-->
  		<#if 1=='${isShow}'>
  			<@f.foot/>
  		</#if>


<!--按钮-->
 </div>
<!--悬浮层-->
<!--添加代码开始-->
<script src="${base}/res/html5/js/jquery.min.js"></script>
<script>
	$(function(){
		window.onload = function()
		{
			var $li = $('#tab li');
			var $ul = $('#content ul');

			$li.mouseover(function(){
				var $this = $(this);
				var $t = $this.index();
				$li.removeClass();
				$this.addClass('current');
				$ul.css('display','none');
				$ul.eq($t).css('display','block');
			})
		}
	});
</script>
<!--添加代码开始-->




</body>
</html>

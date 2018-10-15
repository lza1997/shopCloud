<!doctype html>
<html>
<head>
	<title>甜园云家-我的足迹</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${base}/res/css/css.css">
	<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
<!-- 清除缓存 -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<!-- 清除缓存 -->
	 <!--<script type="text/javascript" src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>-->
	 <script type="text/javascript" src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
	 <script type="text/javascript" src="${base}/res/js/jquery.cookie.js"></script>
    <script type="text/javascript">
    	;!function(window){
			var win=window,
				doc=win.document,
				docEle=doc.documentElement,
				objhtml=doc.getElementsByTagName('html')[0],
				width=docEle.clientWidth,
				size='fontSize',
				html=function(obj,key,value){return obj.style[key]=value+'px';};
				html(objhtml,size,width/7.5);
			win.onresize=function(){
				var objDoc=win.document,
					objDocEle=objDoc.documentElement,
					objHtml=objDoc.getElementsByTagName('html')[0],
					objWidth=objDocEle.clientWidth;
				html(objHtml,size,objWidth/7.5);	
			};
		}(window);
    </script>
</head>
<body style="background:#f7f7f7">
	<div class="user_bar"><a class="back" href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">我的足迹</span><a href="${base}/m/authc/buyer/clearMyFootprint" style="float:right;font-size:12px;color:#b61d1d;line-height:45px;padding-right:10px">清空足迹</a></div>
	<ul class="Collect_goods">
	  <#assign favoriteGoodsListTag = newTag("myFrontGoodsListTag")/>
	  <#assign myFrontGoodsList =favoriteGoodsListTag("{}")>
	  <div class="content" id="hisgoods">
	  <#if myFrontGoodsList?exists && myFrontGoodsList?size gt 0>
		<#list myFrontGoodsList as goods>
			<li>
				<a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}">
					<div>
						<img src="<#if goods.goodsImage!=null>${imgServer}${goods.goodsImage}<#else>${base}/res/images/shop/defaultStore.png</#if>"  />
					</div>
					<div>
						<p>${goods.goodsName}</p>
						<p>￥${goods.goodsStorePrice}</p>
					</div>
				</a>
			</li>
		</#list>
		</#if>
	</ul>
	  
	<@f.foot/>
</body>

</html>
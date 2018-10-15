<!doctype html>
<html>
<head>
	<title>甜园云家-商品收藏</title>
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
	<div class="user_bar"><a class="back" href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">已收藏的商品</span></div>
	<ul class="Collect_goods">
	<#assign favoriteGoodsListTag = newTag("favoriteGoodsListTag")/>
		 <#assign favoriteGoodsList =favoriteGoodsListTag("{'tagDataType':'2','flags':'goods'}")>
		   <#if (favoriteGoodsList?size>0)>
			 <#list favoriteGoodsList as favoritegoods>
                 <li>
				<a href="${base}/m/goods/goodsdetail?id=${favoritegoods.favId}">
					<div>
						<img src="${imgServer}${favoritegoods.goods.goodsImage}" />
					</div>
					<div>
						<p>${favoritegoods.goods.goodsName}</p>
						<p>¥${favoritegoods.goods.goodsStorePrice}</p>
					</div>
					<div>
						<img src="${base}/images/star.png">
						<p>已收藏</p>
					</div>
				</a>
			</li>
		</#list>
		</#if>
	</ul>
	
	  
	<@f.foot/>
</body>
</html>
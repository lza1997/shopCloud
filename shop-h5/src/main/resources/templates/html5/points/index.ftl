<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,maximum-scale=1" charset="UTF-8">
<title>积分商城</title>
<link type="text/css" href="${base}/res/html5/points/css/reset.css" rel="stylesheet"/>
<link type="text/css" href="${base}/res/html5/points/css/index.css" rel="stylesheet"/>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.touchSlider.js"></script>
<link rel="stylesheet" href="${base}/res/css/swiper-3.4.0.min.css">
<script src="${base}/res/js/swiper-3.4.0.jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/css/css.css">
<script>
	;!function(window){
		var win=window,
				doc=win.document,
				docEle=doc.documentElement,
				objhtml=doc.getElementsByTagName('html')[0],
				width=docEle.clientWidth,
				size='fontSize',
				html=function(obj,key,value){return obj.style[key]=value+'px';};
		html(objhtml,size,width/7.5);
		console.log(docEle);
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

<body>
<div class="user_bar"><a class="back" href="${base}/m/index"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" style="margin-top:10px"/></a><span class="fl">积分商城</span></div>

<!--轮播图片start-->

<div class="swiper-container pointsImg">
    <div class="swiper-wrapper">
        
    <#assign advPositionTag = newTag("advTag") />
        <#assign topPosition = advPositionTag("{'apId':'16'}") />
        <#if topPosition?? && topPosition!''>
            <#assign apList = topPosition.advList />
            <#list apList as advs >
                <div class="swiper-slide"><a href="${advs.advUrl}"><img src="${imgServer}${advs.resUrl}" ></a></div>
            </#list>
        </#if>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>
</div>
<script>
    var mySwiper = new Swiper('.swiper-container',{
        autoplay : 2000,
        autoplayDisableOnInteraction : false,
        pagination : '.swiper-pagination',
        paginationClickable :true,
        loop : true,
    })
</script>

<!--轮播图片end-->
<div style="padding:10px">
    <div class="duihuan">
        <p>推荐商品兑换</p>
    </div>
    <div class="gengduo">
        <a href="${base}/points/html5More">更多...</a>
    </div>
</div>
<div id="content" style="margin-left:-0.125rem;clear:both;padding-bottom:70px;overflow:hidden">
<#assign recommendPointsGoodsTag = newTag("recommendPointsGoodsTag") />
<#assign pager = recommendPointsGoodsTag("") />
<#list pager.result as pointsGoods >
	<div class="pointdet">
		<a href="${base}/points/pointsDetail?id=${pointsGoods.id}">
			<img src="${imgServer}${pointsGoods.pointsGoodsImage}">
		</a>
		<p style="height: 37px;overflow: hidden;">${pointsGoods.pointsGoodsName}</p>
		<p style="color:#C81316;font-size:14px">需要积分${pointsGoods.pointsnums}</p>
	</div>
</#list>
</div>
<!-- 分享 -->
<div class="jiathis_style_m"></div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_m.js" charset="utf-8"></script>
<div class="black"></div>
<!-- 分享 -->
<div class="footer-nav">
    <div class="flex-item"><a href="${base}/m/index/index"><img src="${base}/res/html5/images/layer_01.png" width="20" height="20"/><br>首页</a></div>
    <div class="flex-item"><a href="tel:18810028189"><img src="${base}/images/tel.png" width="20" height="20"/><br>联系我们</a></div>
    <div class="flex-item flex-item1"><a><img src="${base}/images/fenxiang.png" width="20" height="20"/><br>分享</a></div>
</div>

<div id="backTop" style="display:none">
    <img src="${base}/res/html5/images/backTop.png" alt="" style="width:40px;height:40px">
</div>
<script>
    $(window).scroll(function(){
        var height = $(window).scrollTop();
        $('#backTop').hide();

        if(height >= 500){
            $('#backTop').show();
        }
    })
    $('#backTop').click(function(){
        $('body,html').animate({scrollTop:0},500);
    })
</script>
<script>
	$('.flex-item1').click(function(){
        $('.black').css('display','block');
		$('.jiathis_style_m').css('display','block');
	})
	$('.black').click(function(){
        $(this).css('display','none');
        $('.jiathis_style_m').css('display','none');
	})
</script>
</body>
</html>

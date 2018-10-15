<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>商品评价列表</title>
<meta name="description" content="简介">
<meta name="keywords" content="关键字">
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/evaluatelist.css">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-    scalable=0;" name="viewport” />  
<meta content="yes" name="apple-mobile-web-app-capable" />
<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
<meta content="telephone=no" name="format-detection" />
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.raty/jquery.raty.min.js" ></script>
<!-- 上拉刷新 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/scrollbar.css">
<script type="application/javascript" src="${base}/res/html5/js/iscroll.js"></script>
<!-- end -->
<script>
	$(document).ready(function() {
		$(".creditevaluate").raty({
			path : "${base}/res/js/jquery.raty/img",
			hints : [ '一般', '不错', "很好", '满意', '非常满意' ],
			readOnly : true,
			width : 100,
			score : function() {
				return $(this).attr("data-score")
			}
		})
	});
</script>
<style type="text/css" media="all">
 #wrapper {
	position:absolute; z-index:1;
	top:40px; bottom:48px; left:0;
	width:100%;
	background:#F5F6F7;
	overflow:auto;
} 

#scroller {
	position:relative;
	-webkit-tap-highlight-color:rgba(0,0,0,0);

	float:left;
	width:100%;
	padding:0;
}

/**
 *
 * 下拉样式 Pull down styles
 *
 */
#pullDown, #pullUp {
	background:#F5F6F7;
	height:40px;
	line-height:40px;
	padding:5px 10px;
	border-bottom:1px solid #ccc;
	font-weight:bold;
	font-size:14px;
	color:#888;
}
#pullDown .pullDownIcon, #pullUp .pullUpIcon  {
	display:block; float:left;
	width:40px; 
	//background:url(../images/pull-icon@2x.png) 0 0 no-repeat;
	-webkit-background-size:40px 80px; background-size:40px 80px;
	-webkit-transition-property:-webkit-transform;
	-webkit-transition-duration:250ms;	
}
#pullDown .pullDownIcon {
	-webkit-transform:rotate(0deg) translateZ(0);
}
#pullUp .pullUpIcon  {
	-webkit-transform:rotate(-180deg) translateZ(0);
}

#pullDown.flip .pullDownIcon {
	-webkit-transform:rotate(-180deg) translateZ(0);
}

#pullUp.flip .pullUpIcon {
	-webkit-transform:rotate(0deg) translateZ(0);
}

#pullDown.loading .pullDownIcon, #pullUp.loading .pullUpIcon {
	background-position:0 100%;
	-webkit-transform:rotate(0deg) translateZ(0);
	-webkit-transition-duration:0ms;

	-webkit-animation-name:loading;
	-webkit-animation-duration:2s;
	-webkit-animation-iteration-count:infinite;
	-webkit-animation-timing-function:linear;
}

@-webkit-keyframes loading {
	from { -webkit-transform:rotate(0deg) translateZ(0); }
	to { -webkit-transform:rotate(360deg) translateZ(0); }
}

#wrapper {
    position: absolute;
    z-index: 1;
    top: 40px;
    bottom: 0px;
    left: 0;
    width: 100%;
    background: #F5F6F7;
    overflow: auto;
}

</style>
<!-- end -->
<script type="text/javascript">
	var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
	<!--上拉刷新开始-->
	var pageNo = ${pageNo};
	function pullUpAction () {
		pageNo = pageNo + 1;
		var url = "${base}/m/goods/goodsEvalutePage";
		var args = {
				"goodsId":"${goodsId}",
				"pageNo":pageNo,
		};
		 //ajax
		 $.post(url, args, function(data){
			$("#thelist").append(data);
			myScroll.refresh();
		 });
	 }
	<!--上拉刷新结束-->
	/**
	 * 初始化iScroll控件
	 */
	function loaded() {
		pullDownEl = document.getElementById('pullDown');
		pullDownOffset = pullDownEl.offsetHeight;
		pullUpEl = document.getElementById('pullUp');	
		pullUpOffset = pullUpEl.offsetHeight;
		
		myScroll = new iScroll('wrapper', {
			scrollbarClass: 'myScrollbar', /* 重要样式 */
			useTransition: false, /* 此属性不知用意，本人从true改为false */
			topOffset: pullDownOffset,
			onRefresh: function () {
				if (pullDownEl.className.match('loading')) {
					pullDownEl.className = '';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
				} else if (pullUpEl.className.match('loading')) {
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
				}
			},
			onScrollMove: function () {
				if (this.y > 5 && !pullDownEl.className.match('flip')) {
					pullDownEl.className = 'flip';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '松手开始更新...';
					this.minScrollY = 0;
				} else if (this.y < 5 && pullDownEl.className.match('flip')) {
					pullDownEl.className = '';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
					this.minScrollY = -pullDownOffset;
				} else if (this.y < (this.maxScrollY - 5) && !pullUpEl.className.match('flip')) {
					pullUpEl.className = 'flip';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '松手开始更新...';
					this.maxScrollY = this.maxScrollY;
				} else if (this.y > (this.maxScrollY + 5) && pullUpEl.className.match('flip')) {
					pullUpEl.className = '';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
					this.maxScrollY = pullUpOffset;
				}
			},
			onScrollEnd: function () {
				if (pullDownEl.className.match('flip')) {
					pullDownEl.className = 'loading';
					pullDownEl.querySelector('.pullDownLabel').innerHTML = '加载中...';				
					pullDownAction();	// Execute custom function (ajax call?)
				} else if (pullUpEl.className.match('flip')) {
					pullUpEl.className = 'loading';
					pullUpEl.querySelector('.pullUpLabel').innerHTML = '加载中...';				
					pullUpAction();	// Execute custom function (ajax call?)
				}
			}
		});
		
		setTimeout(function () { document.getElementById('wrapper').style.left = '0'; }, 800);
	}

	//初始化绑定iScroll控件 
	document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
	document.addEventListener('DOMContentLoaded', loaded, false); 
</script>
</head>
<body class="index_bg">
	<div class="phone_hd">
		<a class="back" href="javascript:history.go(-1);">
			<img src="${base}/res/html5/images/back.png" width="25" height="25" />
		</a>
	    <p style="font-size:25px;">商品评价</p>
	</div>
	
	<div class="order_page">
		<div id="wrapper">
			<div id="scroller">
				<div id="pullDown">
				</div>
				<div class="order_page_box" id="thelist">
				<#assign goodsEvalutebyGoodsIdTag =newTag("goodsEvalutebyGoodsIdTag")>
				<#assign goodsEvalutes =goodsEvalutebyGoodsIdTag("{'goodsId':'${goodsId}','pageNo':'${pageNo}','toUrl':'${toUrl}'}")>
				<#if goodsEvalutes??>
					<#list goodsEvalutes.result as goodsEV>
						<div class="pingjia_01">
							<div <#if  goodsEV_index==0>class="p_left01"<#else>class="p_left02"</#if>>
							  <p>${goodsEV.gevalFrommembername}</p>
							</div>
						</div>
						<div class="xing">
							<span class="creditevaluate" id="descraty" data-score="${goodsEV.gevalScore}"></span>
						</div>
						<div class="pingjia">
							${goodsEV.gevalContent}
						</div>
						<div class="shaitu">
						<#if goodsEV.gevalImage??>
							<#list goodsEV.gevalImage?split(",") as gevalImage>  
								<img src="${imgServer}${gevalImage}"  width="20%" height="20%" />
							</#list>
						</#if>
						</div>
						<div class="xiangqing">
							<p>${goodsEV.specInfo}</p>
							<span>评价日期：${goodsEV.createTimeStr}</span>
						</div>
					</#list>
				</#if>  
			    </div>
				<div id="pullUp">
					<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
				</div>
			</div>
		</div>
	</div>
 
<#if isShow == 0>
<!--底部-->
<@f.foot/>	
<!--按钮-->
</#if>
</body>
</html>

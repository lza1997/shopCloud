<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,maximum-scale=1" charset="UTF-8">
<title>积分中心</title>
<link type="text/css" href="${base}/res/html5/points/css/reset.css" rel="stylesheet"/>
<link type="text/css" href="${base}/res/html5/points/css/index.css" rel="stylesheet"/>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.touchSlider.js"></script>
<!-- 上拉刷新 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/scrollbar.css">
<script type="application/javascript" src="${base}/res/html5/js/iscroll.js"></script>
<script type="text/javascript" src="${base}/res/js/nc-sideMenu.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="${base}/res/css/font-icons/style.css"  rel="stylesheet" />
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
		win.onresize=function(){
			var objDoc=win.document,
					objDocEle=objDoc.documentElement,
					objHtml=objDoc.getElementsByTagName('html')[0],
					objWidth=objDocEle.clientWidth;
			html(objHtml,size,objWidth/7.5);
		};
	}(window);
</script>
<style type="text/css" media="all">
#wrapper {
	position:absolute; z-index:1;
	top:0px; bottom:0px; left:0;
	width:100%;
	background:#F5F6F7;
	overflow:auto;
} 

#scroller {
	position:relative;
/*	-webkit-touch-callout:none;*/
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
	width:40px; height:40px;
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

</style>
<!-- end -->
<script type="text/javascript">
	var myScroll,
	pullDownEl, pullDownOffset,
	pullUpEl, pullUpOffset,
	generatedCount = 0;
	
	<!--按钮样式变换的开始-->
		jQuery(document).ready(function(){
			var orderState = '${orderState}';
			if(orderState==99){
				jQuery("#order_status_0").addClass("this");
			}else if(orderState==10){
				jQuery("#order_status_order_nopay").addClass("this");
			}else if(orderState==20){
				jQuery("#order_status_order_noship").addClass("this");
			}else if(orderState==30){
				jQuery("#order_status_order_notake").addClass("this");
			}else if(orderState==40){
				jQuery("#order_status_order_over").addClass("this");
			}
				 
			
		});
	
	<!--按钮样式变换的结束-->
	<!--上拉刷新开始-->
	var pageNo = ${pageNo};
	function pullUpAction () {
		pageNo = pageNo + 1;
		var url = "${base}/points/html5MorePage";
		var args = {
				"pageNo":pageNo
		}; 
		 //ajax
		 $.post(url, args, function(data){
			$("#content").append(data);
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

<body>
<div class="user_bar"><a class="back" href="${base}/points/html5PointsIndex"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" style="margin-top:10px"/></a><span class="fl">积分兑换商品</span></div>
<div id="wrapper" style="margin-top:45px">
	<div id="scroller">
        <div id="pullDown">
        </div>
			<div id="content" style="margin-left:-0.125rem;clear:both;overflow:hidden">
	<#assign recommendPointsGoodsTag = newTag("recommendPointsGoodsTag") />
	<#assign pager = recommendPointsGoodsTag("{'pageNo':'${pageNo}','pagesize':'${pageSize}'}") />
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
		<script>
			var height = 0;
			var length = $("#content div").length;
			if(length%2==0){
				height = length*135;
			}else{
				height = (length/2+1)*210;
			}
			$("#content").css("height",height);
		</script>

		<div id="pullUp" style="position:absolute; bottom:0; left:0px;width: 100%;">
			<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
		</div>
	</div>
</div>
</script>
</body>
</html>

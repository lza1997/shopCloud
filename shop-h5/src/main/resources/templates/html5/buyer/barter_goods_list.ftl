<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <title>返修/退换货</title>
    <meta name="apple-mobile-webC-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
	<link combofile="service/service.shtml" rel="stylesheet" href="${base}/res/html5/css/base.s.min.css">
	<link type="text/css" rel="stylesheet" href="${base}/res/html5/css/qq_menu_layer.s.min.css">
	<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
	<!-- 上拉刷新 -->
	<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/scrollbar.css">
	<script type="application/javascript" src="${base}/res/html5/js/iscroll.js"></script>
	<script type="text/javascript" src="${base}/res/js/nc-sideMenu.js" charset="utf-8"></script>
	<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
	<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
	<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	<link href="${base}/res/css/font-icons/style.css"  rel="stylesheet" />
</head>
<style type="text/css" media="all">
.refund_btn {
    height: 35px;
    line-height: 35px;
    text-align: center;
    color: #333;
    font-size: 12px;
    border: 1px solid #e3e3e3;
    border-radius: 3px;
    width: 55px;
    float:left;
}
 #wrapper {
	position:absolute; z-index:1;
	top:0px; bottom:48px; left:0;
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

.button-one{float:left;width:40%;padding-left:20px;}
.button-two {float:left;width:40%;}

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
		var url = "${base}/m/authc/buyer/barterListPage";
		var args = {
				"pageNo":pageNo
				
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
<body>
<div id="wrapper">
	<div id="scroller">
		<div id="pullDown">
		</div>	
	    <div class="my_refund">
	    	<div style="width:100%;height:46px;border-bottom:solid #e4393c 3px;">
	    		<div style=" width: 10%; height: 30px; float: left;">
		    		<a href="${base}/m/authc/buyer/center">
		    			<img src="${base}/res/html5/images/back_black.png" width="30" height="30" style="margin-top:10px;margin-left:10px;">
		    		</a>
	    		</div>
	    		<div style=" width: 90%; float: left; text-align: center; line-height: 45px;">
		    		<ul>
		    			<li class="button-one"><a  href="${base}/m/authc/buyer/returnList">退货记录</a></li>
		    			<li  class="button-two"><a style="color:#e4393c;" href="${base}/m/authc/buyer/barterList">换货记录</a></li>
		    		</ul>
	    		</div>
	    		<!-- <p style="text-align:center;margin-top:-25px;font-size:16px;color:#e4393c;">进度查询</p> -->
		    </div>
	        <div class="refund_status" id="thelist" style="width:100%">
	        	<#if list??>
        			<#list list as shopbarter>
				        <div class="item">
				            <p class="title">订单编号：${shopbarter.orderSn}</p>
				            <p class="title">换货编号：${shopbarter.barterSn}</p>
				            <div class="content">
				                <a href="${base}/m/authc/buyer/barterDetail?barterId=${shopbarter.barterId}">
				                    <p>店铺名称：${shopbarter.storeName}</p>
				                    <p>换货数量：${shopbarter.goodsNum}</p>
				                    <p>换货时间：${shopbarter.createTimeStr?string('yyyy-MM-dd')}</p>
				                    <p>审核状态：
				                    	<#if shopbarter.barterState==20>
	        								待审核
	        							<#elseif shopbarter.barterState==30>
	        								同意
	        							<#elseif shopbarter.barterState==40>
	        								不同意
	        							</#if>
				                    </p>
				                    <p>物流状态：
				                    	<#if shopbarter.goodsState ??&& shopbarter.goodsState!=null>
		        							<#if shopbarter.goodsState==1>
		        								买家待发货
		        							<#elseif shopbarter.goodsState==2>
		        								待卖家收货
		        							<#elseif shopbarter.goodsState==3>
		        								卖家已收货
		        							<#elseif shopbarter.goodsState==4>
		        								买家待收货
		        							<#elseif shopbarter.goodsState==5>
		        								换货完成
		        							<#else>
		        							    暂无物流信息
		        							</#if>
	        							</#if>
				                    </p>
				                </a>
				                <p>
					                <a class="refund_btn" href="${base}/m/authc/buyer/barterDetail?barterId=${shopbarter.barterId}" target="_blank">查看</a>
					                <#if shopbarter.sellerState==30&&shopbarter.goodsState==1>
	       								<a class="refund_btn" href="${base}/m/authc/buyer/barterDeliveryIndex?barterId=${shopbarter.barterId}">发货</a>
	       							</#if>
	       							<#if shopbarter.goodsState==4>
	       								<a class="refund_btn" href="${base}/m/authc/buyer/finishBarterIndex?barterId=${shopbarter.barterId}"  >确认收货</a>
	       								<!-- <a class="refund_btn" href="javascript:void(0)" onclick="finishReturn('${shopbarter.barterId}')" >确认收货</a> -->
	       							</#if>
				                </p>
				            </div>
				        </div>
			        </#list>
		        </#if>
		    </div>
	    </div>
		<div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
		</div>
   	</div>
 </div>
</body>
</html>
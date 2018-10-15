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
<title>咨询列表</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/js/layer/layer.js"></script>
<link href="${base}/res/css/mycart.css" rel="stylesheet" type="text/css" />
<link href="${base}/res/css/global.css" rel="stylesheet" type="text/css" />
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
</head>
<style type="text/css" media="all">
 #wrapper {
	position:absolute; z-index:1;
	top:43px; bottom:0px; left:0;
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
	<!--上拉刷新开始-->
	var pageNo = ${pageNo};
	function pullUpAction () {
		pageNo = pageNo + 1;
		var url = "${base}/m/goods/goodsConsultPage";
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
	
	/*  //咨询
	function showConsult() {
	    $(".form-consult").show();
	} */
	//提交
</script>
<body class="user_bg">
<div class="user_bar">
	<a class="back" href="${base}/m/goods/goodsdetail?id=${goodsId}">
		<img src="${base}/res/html5/images/back_black.png" width="30" height="30" />
	</a>
	<span class="fl"></span>
</div>
<div class="order_page">
<div id="wrapper">
	<div id="scroller">	
		<div id="pullDown">
		</div>
		<#assign goodsBaseTag =newTag("goodsBaseInfoTag")>
		<#assign goodsInfo =goodsBaseTag("{'goodsid':'${goodsId}'}")>
		<div class="product-consult" id="kfzx">
            <p class="explain">购买之前，如有问题，瑞华信通。
                <a href="${base}/m/goods/goodsConsult?goodsId=${goodsId}" style="color: #3366CC;">我要咨询</a>
            </p>
            <!-- <dl class="form-consult" style="display:none">
                <form id="consultForm" method="post" action="${base}/product/consult" name="queryListForm">

                    <input type="hidden" name="goodsId" value="${goodsInfo.goodsId}"/>
                    <input type="hidden" name="cgoodsName" value="${goodsInfo.goodsName}"/>
                    <input type="hidden" name="storeId" value="${goodsInfo.storeId}"/>
                    <input type="hidden" name="div" id="div" value="#kfzxData"/>
                    <dt>内容：</dt>
                    <dd><textarea class="textarea" name="consultContent" id="consultContent" style="width: 600px; height: 100px;"></textarea>

                        <p class="text-note">※ 请输入不要超过 <b>150</b> 个字</p>
                        <button type="button" class="btng" onclick="subConsult()">提交</button>
                    </dd>
                </form>
            </dl> -->
        </div>
		<div class="order_page_box" id="thelist">
		<#assign consultInfoTag =newTag("consultInfoTag")>
		<#assign consultInfo =consultInfoTag("{'goodsId':'${goodsId}','pageNo':'${pageNo}'}")>
			<#if consultInfo?size gt 0>
				<#list consultInfo.result as consult>
			    	<h1><span class="fl">
			    		
			    		<#if consult.memberId==0>
								游客
						</#if>
						<#if consult.memberId!=0>
							<#if consult.isanonymous>
										匿名
							<#else>
								${consult.cmemberName}
							</#if>                                	
						</#if>
			    	
			    	</span>
		    		<span class="fr">时间:${consult.createTimeStr}</span></h1>
				        <div class="order_goods_much">
				            <ul>
				            	${consult.consultContent}
				            </ul>
				            <ul>
				            	回复: ${consult.consultReply}
				            </ul>
				        </div>
			        <div class="order_total">店铺名称：<b>${consult.storeName}</b></div>
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

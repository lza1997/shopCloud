<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>积分中心</title>
<!-- 上拉刷新 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/scrollbar.css">
<script type="application/javascript" src="${base}/res/html5/js/iscroll.js"></script>
<!-- end -->
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<link href="${base}/res/html5/points/css/pointsDetailList.css" type='text/css' />
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<style>
   body{font-family:Geneva, Arial, Helvetica, sans-serif;  margin:0px; padding:0px; font-size:12px; background:#ffffff;}
  img{ border:0px;}
  a{ color:#000000; text-decoration:none;}
  ul,li,dl,dd,dt,p{ margin:0px; padding:0px; list-style:none;margin-top: 25px;}
  cite,em{ font-style:normal;}
  /*全局声明结束*/
  .con_list ul li{float:left;width:25%;height:15%;text-align:center;font-size:15px;}
  .con_list1 ul li{padding-top:0px;float:left;line-height:10px;width:25%;height:auto;text-align:center;font-size:10px;color:#999;border-bottom:#CCC solid 1px;}
  .con_list1 .two{color:#000;font-weight:bold;}
</style>
<style type="text/css" media="all">

 #wrapper {
	position:absolute; z-index:1;
	top:80px; bottom:0px; left:0;
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
		if(orderState==''){
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
		var url = "${base}/points/user/pointsDetailListPage";
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
</head>

<body>
	<div class="phone_hd" style="font-size: 20px;">
		<a class="back" href="${base}/points/myPointsIndex">
			<img src="${base}/res/html5/images/back.png" width="25" height="25" />
		</a>积分明细 
	</div>
    <div class="con_list">
     <ul>
      <li class="one" style="width: 30%;">添加时间</li>
      <li class="two" style="width: 23%;">积分变更</li>
      <li class="three" style="width: 19%;">操作</li>
      <li class="four" style="width: 28%;">描述</li>
      </ul>
    </div>
  <div id="wrapper">
	  <div id="scroller">
		  <div id="pullDown">
		  </div>	
		  <div class="order_page_box" id="thelist" style="margin-top: -40px;">
			  <#assign shopPointsLogListTag = newTag("shopPointsLogListTag")/>
			  <#assign shopPointsLogList =shopPointsLogListTag("{'tagDataType':'2','pageSize':'${pageSize}','pageNo':'${pageNo}'}")>
			  <#if shopPointsLogList?? && shopPointsLogList?size gt 0>
			  <#list shopPointsLogList as shopPointsLog>
			  <div class="con_list1">
			     <ul>
			      <li class="one" style="width: 30%;height: 35px;">${shopPointsLog.createTimeStr}</li>
			      <li class="two" style="width: 23%;height: 35px;">${shopPointsLog.points}</li>
			      <li class="three" style="width: 19%;height: 35px;">${shopPointsLog.stage}</li>
			      <li class="four" style="width: 28%;height: 35px;">${shopPointsLog.desc}</li>
			      </ul>
			  </div>
			  </#list>
			  </#if>
		  </div>
		  <div id="pullUp">
			<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
		  </div>
	  </div>
  </div>
</body>
</html>

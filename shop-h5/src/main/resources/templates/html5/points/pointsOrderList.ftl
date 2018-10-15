<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<title>积分列表 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<!-- 上拉刷新 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<link rel="stylesheet" type="text/css" href="${base}/res/html5/css/scrollbar.css">
<script type="application/javascript" src="${base}/res/html5/js/iscroll.js"></script>
<script type="text/javascript" src="${base}/res/js/nc-sideMenu.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<link href="${base}/res/css/font-icons/style.css"  rel="stylesheet" />
<style type="text/css" media="all">

 #wrapper {
	position:absolute; z-index:1;
	top:87px; bottom:0px; left:0;
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
		}else if(orderState==50){
			jQuery("#order_status_order_over").addClass("this");
		}
			 
		
	});
	
	<!--按钮样式变换的结束-->
	<!--上拉刷新开始-->
	var pageNo = ${pageNo};
	function pullUpAction () {
		pageNo = pageNo + 1;
		var url = "${base}/points/user/html5/orderListPage";
		var args = {
				"state":"${orderState}",
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
	
	/**取消订单**/
	function cancelOrder(orderSn,id) {
		layer.open({
		    content: '您确认取消订单吗？',
		    btn: ['是', '否'],
		    shadeClose: false,
		    yes: function(){
		        var fmUrl = '${base}/points/user/html5/cancelOrder';
				$.ajax({
		             type: "post",
		             url: fmUrl,
		             data: {orderid:id},
		             dataType: "json",
					 success:function(data) {
						if(data.success){
							layer.open({content:'订单取消成功', time: 1});
				            window.location.reload(); 
						}else{
							layer.open({content:'订单取消失败', time: 1});
				            window.location.reload(); 	
						}
					}
		         });
		    }, no: function(){
		    }
		});
	}
	
	/**确认收货**/
	function finishOrder(ordersn,id) {
		layer.open({
		    content: '您确定要收货吗？',
		    btn: ['是', '否'],
		    shadeClose: false,
		    yes: function(){
				var fmUrl = '${base}/points/user/html5/finishOrder';
				$.ajax({
		             type: "post",
		             url: fmUrl,
		             data: {orderid:id},
		             dataType: "json",
					 success:function(data) {
						if(data.success){
							layer.open({content:'确认收货成功', time: 1});
				            window.location.reload(); 
						}else{
							layer.open({content:'确认收货失败', time: 1});
				            window.location.reload(); 
						}
					}
		         }); 
		    }, no: function(){
		    }
		});
	}
</script>
</head>

<body class="user_bg">

<div class="user_bar"><a class="back" href="${base}/points/myPointsIndex"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">积分列表</span></div>


<div class="order_page">
	<div class="order_hd">
	    <ul>
	      <li id="order_status_0">
	      	<a href="${base}/points/user/html5/orderList">全 部</a>
	      </li>
	      <li id="order_status_order_nopay">
	      	<a href="${base}/points/user/html5/orderList?state=10">待付款</a>
	      </li>
	      <li id="order_status_order_noship">
	      	<a href="${base}/points/user/html5/orderList?state=20">待发货</a>
	      </li>
	      <li id="order_status_order_notake">
	      	<a href="${base}/points/user/html5/orderList?state=30">待收货</a>
	      </li>
	      <li id="order_status_order_over">
	      	<a href="${base}/points/user/html5/orderList?state=40">已收货</a>
	      </li>
	    </ul>
	    <input type="hidden" name="url" id="url">
	</div>


	<div id="wrapper">
		<div id="scroller">
			<div id="pullDown">
			</div>	
			<div class="order_page_box" id="thelist">
			<#assign pointsOrderTag = newTag("pointsOrderTag")/>
			<#assign pointsOrderGoodsTag = newTag("pointsOrderGoodsTag")/>
			<#assign dateFormatTag = newTag("dateFormatTag")/>
			<#assign orderLists = pointsOrderTag("{'orderSn':'${orderSn}','startTime':'${startTime}','endTime':'${endTime}','orderState':'${orderState}','returnDataType':'2','pageNo':'${pageNo}','pageSize':'${pageSize}'}") />
			<#if orderLists??>
	     	<#list orderLists as order>
		    	<h1><span class="fl">订单号：${order.pointOrdersn}</span>
		    	<#if order.pointOrderstate==70>
		   			<span class="fr">订单已取消</span></h1>
		   		<#elseif order.pointOrderstate==10>
		   			<span class="fr">待买家付款</span></h1>
		   		<#elseif order.pointOrderstate==20>
		   			<span class="fr">买家已付款</span></h1>
		   		<#elseif order.pointOrderstate==30>
		   			<span class="fr">卖家已发货</span></h1>
		   		<#elseif order.pointOrderstate==40>
		   			<span class="fr">买家已收货</span></h1>
		   		<#elseif order.pointOrderstate==50>
		   			<span class="fr">订单已完成</span></h1>
			    </#if>
	    	    <#assign orderGoodsLists = pointsOrderGoodsTag("{'orderid':'${order.id }'}") />
				<#if orderGoodsLists?size gt 0>
			    <#assign rowsize = orderGoodsLists?size>
		 			<#list orderGoodsLists as orderGoods>
						<div class="order_goods_much" >
							<div style="width: 80px; float: left;">
					   			<a href="${base}/points/pointsDetail?id=${orderGoods.pointGoodsid}">
					           		<img src="${imgServer}${orderGoods.pointGoodsimage}" width="50" height="50" />
					            </a>
				       		</div>
				   			<div style=" float: left;">
				        		<a href="${base}/points/pointsDetail?id=${orderGoods.pointGoodsid}">
				        			<span style="line-height: 24px">${orderGoods.pointGoodsname}</span>
				        		</a><br>
				  			</div>	        			
						</div> 	            	
					</#list>
				</#if>
		        <div class="order_total">
			        共 
			        <script type="text/javascript">
	      					var amount = number_format(${order.pointAllpoint},2);
	        			    document.write(amount);
					</script> 分 
					<#if order.shippingFee??>
						<#if order.shippingFee!=0>
							运费：
							<b>¥
								<script type="text/javascript">
		           					var shipFee = number_format(${order.shippingFee},2);
		           					document.write(shipFee);
		           				</script>
							</b>
						<#else>
	             				<b>免运费</b>
		          		</#if>
	          		</#if>
				</div>
		        <div class="order_box_bt">
			        <a href="${base}/points/user/html5/orderdetail?orderId=${order.id}" >查看订单</a>
			        <#if order.pointOrderstate==10>
			        	<a href="javascript:void(0)" onclick="cancelOrder('${order.pointOrdersn}','${order.id}')">取消订单</a>
						<a class="bg_orange" href="">付款</a>
			        <#elseif order.pointOrderstate==30>
			        	<a class="bg_orange" href="javascript:void(0)"  onclick="finishOrder('${order.pointOrdersn}','${order.id }')" >确认收货</a>
			        </#if>
		    	</div>
				</#list>
				</#if>
		    </div>
			<div id="pullUp">
				<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
			</div>
			
			<!--底部-->
	      <@f.foot/>	
	
	<!--按钮-->
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function url(url){
	var type = jQuery("#url").val();
	url = url+"&&type="+type;
	window.location.href=url;
}
</script>
</html>

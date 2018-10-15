<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<title>商品列表 </title>
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

 <style type="text/css" media="all">

 #wrapper {
	position:absolute; z-index:1;
	top:-6px; bottom:48px; left:0;
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

jQuery(document).ready(function(){
	var order = '${sortOrder}';
	if("${sortField}"=="salenum"){
		jQuery("#top_goods_salenum").addClass("this");
	  if("desc"==order){
		  jQuery("#top_goods_salenum img").attr("src","${base}/res/html5/images/goodsclass_down.png");
	  }else{
	  	  jQuery("#top_goods_salenum img").attr("src","${base}/res/html5/images/goodsclass_up.png");
	  }
   }else if("${sortField}"=="goodsClick"){
	   jQuery("#top_goods_collect").addClass("this");
	  if("desc"==order){
		  jQuery("#top_goods_collect img").attr("src","${base}/res/html5/images/goodsclass_down.png");
	  }else{
	  	  jQuery("#top_goods_collect img").attr("src","${base}/res/html5/images/goodsclass_up.png");
	  }
   }else if("${sortField}"=="goodsStorePrice"){
	   jQuery("#top_store_price").addClass("this");
	  if("desc"==order){
		  jQuery("#top_store_price img").attr("src","${base}/res/html5/images/goodsclass_down.png");
	  }else{
	  	  jQuery("#top_store_price img").attr("src","${base}/res/html5/images/goodsclass_up.png");
	  }
   }

   	
	jQuery(".group_top li").click(function(){
		var searchtype = jQuery(this).attr("sortField");
		var order = '${sortOrder}';
		if(order == "desc"){
			order = "asc";
		}else{
			order = "desc";
		}
		window.location.href="${base}/m/goods/goodslist?searchType=${searchType}&keyword=${keyword}&sortField="+ searchtype + "&sortOrder=" + order;
	}) 	  
});<!--end-->

var pageNo = ${pageNo};
function pullUpAction () {
	pageNo = pageNo + 1;
	var url = "${base}/m/goods/goodsListPage";
	var args = {
			"searchType":"${searchType}",
			"keyword":"${keyword}",
			"pageNo":pageNo,
			"keyword":"${keyword}",
			"sortField":"${sortField}",
			"sortOrder":"${sortOrder}"
	};
	 //ajax
	 $.post(url, args, function(data){
		$("#thelist").append(data);
		myScroll.refresh();
	 });
 }

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
<#assign goodsListTag = newTag("goodsListTag")/>
	<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>商品列表<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
	<div class="main">
  	<div class="mt50"></div>
  	<#--
  	<div class="group_top">
	    <ul>
	      <li id="top_goods_salenum" sortField="salenum">
	      	<a href="javascript:void(0)">
	      		<span><b><img src="${base}/res/html5/images/group_down.png"></b>销量</span>
	      	</a>
	      </li>
	      <li id="top_goods_collect" sortField="goodsClick"><a href="javascript:void(0)"><span><b><img src="${base}/res/html5/images/group_down.png"></b>人气</span></a></li>
	      <li id="top_store_price" sortField="goodsStorePrice"><a href="javascript:void(0)"><span><b><img src="${base}/res/html5/images/group_sort.png"></b>价格</span></a></li>
	    </ul>
 	 </div>
 	 -->
	<div id="wrapper">
		<div id="scroller">
	  		<div id="pullDown">
	  		</div>
			<div class="group_list" id="thelist"> 
			  	<#assign recommendgoodslist =goodsListTag("{'storeid':'${storeId}','commend':'1','tagDataType':'2','pagesize':'4'}")>
							  <#if recommendgoodslist?exists && recommendgoodslist?size gt 0>
							      <#list recommendgoodslist as recommendgoods>
					
							  	<a href="${base}/m/goods/goodsdetail?id=${recommendgoods.goodsId}">
							    <dl>
							      <dt><img width="90" height="90" src=<#if recommendgoods.goodsImage!''>"${imgServer}${recommendgoods.goodsImage}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> title="${recommendgoods.goodsName}" alt="${recommendgoods.goodsName}"></dt>
							      <dd>
							        <h3><b>${recommendgoods.goodsName}</b></h3>
							        <span><strong>¥${recommendgoods.goodsStorePrice}</strong></span> <em>${recommendgoods.commentnum}人评价，${recommendgoods.salenum}人已购买</em> 
							      </dd>
							    </dl>
							    </a> 
			 				</#list>
						  
				    </#if>
				    
				    
		  		</div>
		  		<div id="pullUp">
	  				<span class="pullUpIcon"></span><span class="pullUpLabel">上拉加载更多...</span>
	  			</div>
		</div>
	</div>

</div>
</body>
</html>

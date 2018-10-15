
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
<title>分类</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script>
jQuery(document).ready(function(e) {
    jQuery(".category_center_list li").click(function(){
		var id = jQuery(this).attr("id");
		var mark = jQuery(this).attr("mark");	
		if(mark=="true"){
			jQuery(this).find("img").attr("src","${base}/res/html5/images/search_on_bg.png");
			jQuery("#class2_"+id).fadeOut();
			jQuery(this).attr("mark","false");
		}else{
			jQuery(this).find("img").attr("src","${base}/res/html5/images/search_off_bg.png");
			jQuery("#class2_"+id).fadeIn();
			jQuery(this).attr("mark","true");
		}	
	})
});
</script>
</head>

<body class="index_bg">
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>商品分类<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>




<#--<div class="category">
  <div class="category_center">
    <div class="category_center_list">
      <ul>
      	<#assign goodsClassTag =newTag("goodsClassTag")>
		<#assign goodsList =goodsClassTag("")>
		<#if goodsList?exists && goodsList?size gt 0>
		<#list goodsList as class>

	      	<li id="${class.gcId}" mark="false">
		        <div class="category_center_list_left">${class.gcName}</div>
		        <i><img src="${base}/res/html5/images/search_on_bg.png"></i>
	       	</li>

	       	<#assign goodsLi =goodsClassTag("{'parentid':'${class.gcId}'}")>
	       	<#assign href ='m/category/categoryList?'>
			
	       	<div class="category_center_list_right" style="display:none" id="class2_${class.gcId}">
	       		<#list goodsLi as classtwo>
	       			<#if classtwo.hasChild gt 0>
			       		<span><a href="${base}/${href}keyword=${classtwo.gcId}">${classtwo.gcName}</a></span>
	       			<#else>
	       				<span><a href="${base}/m/goods/goodslist?searchType=gcIdSearch&keyword=${classtwo.gcId}">${classtwo.gcName}</a></span>
	       			</#if>
	        	</#list>
	       	</div>
       	
       	</#list>
		</#if>
        
       </ul>
    </div>
  </div>-->


<#--左侧菜单-->
<div id="left_Menu">
    <div class="ot-menu" id="scroller" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
        <ul>
            <li id="bf4604623f8649deb5102350c7740da5" advid="class5" class=""><a href="javascript:;">鞋靴箱包</a></li>
            <li id="a1ff2f849e62485ebe3b5c4ed09fa721" advid="class3" class="active"><a href="javascript:;">数码电子</a></li>
            <li id="29f85871851a4bf3b6c199cdf0b1f619" advid="class1"><a href="javascript:;">珠宝首饰</a></li>
            <li id="9fbf9399d2894e30b3d7496cb9be8aaf" advid="class2"><a href="javascript:;">图书音像</a></li>
            <li id="de5d5424e0314885b7344628230a3afb" advid="class8"><a href="javascript:;">食品饮料</a></li>
            <li id="b02fba9ca3f94cbfbb6e35e3fd55d93c" advid="class4"><a href="javascript:;">家装家纺</a></li>
            <li id="c1f381d52fa44b978dfe9c3e5a5fb1bb" advid="class6"><a href="javascript:;">户外乐器</a></li>
            <li id="d857fd66d8974ff88e89bcf208c8d121" advid="class7"><a href="javascript:;">服饰内衣</a></li>
        </ul>
    </div>
</div>

<#--右侧菜单-->
<div id="right_Menu" class="ot-maininfo">
    <div style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);" id="scroller2">
        <!--新品上市-->
        <div class="r_menu_box">
			<ul>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
				<li><a href="#"><img src="${base}/res/html5/images/detail/xie.jpg" alt="青春潮流"><br><span>青春潮流</span></a></li>
			</ul>

		</div>
    </div>
</div>















  <!--底部-->
       <@f.foot/>

<!--按钮-->
 </div>
<!--悬浮层-->

<#--<script>
function click_layer(){
	var ret = jQuery("#show").attr("mark");
	if(ret=="show"){
		jQuery("#show").hide();
		jQuery("#show").attr("mark","hide");
		}else{
		jQuery("#show").show();
		jQuery("#show").attr("mark","show");	
			}
	}
</script>
<div class="layer">
	<a class="layer_menu" href="javascript:void(0);" onclick="click_layer();"><img src="${base}/res/html5/images/layer_05.png" width="35" height="35" /><span class="black_bg"></span></a>
    <div class="layer_show" id="show" mark="hide" style="display:none">
    	<ul>
        	<li><a href="${base}/m/index/index"><img src="${base}/res/html5/images/layer_01.png" width="20" height="20" /><p>首页</p></a></li>
            <li><a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="${base}/res/html5/images/layer_02.png" width="20" height="20" /><p>订单</p></a></li>
            <li><a href="${base}/m/authc/cart/cartGoodsList"><img src="${base}/res/html5/images/layer_03.png" width="20" height="20" /><p>购物车</p></a></li>
            <li><a href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/layer_04.png" width="20" height="20" /><p>用户中心</p></a></li>
        </ul>
        <div class="show_bg"></div>
    </div>
</div>-->




</body>
</html>

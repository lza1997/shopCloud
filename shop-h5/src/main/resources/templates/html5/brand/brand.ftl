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
<title>品牌 </title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script>
jQuery(document).ready(function(e) {
	jQuery(".brand_nav_fixed a:first").addClass("this");
   jQuery(window).scroll(function(){
	var top = 0;
	var id;
	 top = jQuery(document).scrollTop();
		 jQuery(".brand_list h2").each(function(){
	    var top=jQuery(this).offset().top - jQuery(window).scrollTop();
		if(top<=10 && top>0){
		  id = jQuery(this).attr("id");
		  jQuery(".brand_nav_fixed a").removeClass("this");
		  jQuery("#word_"+id).addClass("this");
		}
	  });	
		
	});	
});<!--end-->
</script>
</head>
<body>
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>品牌街<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="phone_main">
  <!--品牌街-->
  <div class="brand_page">
    <div class="brand_list">
    	<#assign brandTag =newTag("brandTag")>
		<#assign brandList =brandTag("")>
    	<ul>
    		<#if brandList?exists && brandList?size gt 0>
			<#list brandList as brand>
		       	<li >
			       	<a href="${base}/m/goods/goodslist?searchType=BrandIdSearch&keyword=${brand.brandId}">
				       	<span class="lg">
				       		<img src=<#if brand.brandPic!=''>"${imgServer}${brand.brandPic}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> style="width:100px;"/>
				       	</span>
				        <p class="name">${brand.brandName}</p>
			        </a>
		        </li>
	       	</#list>
		   	</#if>
        </ul>
    </div>
  </div>
  
  <!--底部-->
<@f.foot/>		

<!--按钮-->
 </div>
<!--悬浮层-->
<script>
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
	<a class="layer_menu" href="javascript:void(0);" onclick="click_layer();"><img src="${base}/res/html5/images/layer_05.png" width="35" height="35" />
		<#--<span class="black_bg"></span>-->
	</a>
    <div class="layer_show" id="show" mark="hide" style="display:none">
    	<ul>
        	<li><a href="${base}/m/index/index"><img src="${base}/res/html5/images/layer_01.png" width="20" height="20" /><p style="display:inline-block">首页</p></a></li>
            <li><a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="${base}/res/html5/images/layer_02.png" width="20" height="20" /><p style="display:inline-block">订单</p></a></li>
            <li><a href="${base}/m/authc/cart/cartGoodsList"><img src="${base}/res/html5/images/layer_03.png" width="20" height="20" /><p style="display:inline-block">购物车</p></a></li>
            <li><a href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/layer_04.png" width="20" height="20" /><p style="display:inline-block">用户中心</p></a></li>
        </ul>
        <#--<div class="show_bg"></div>-->
    </div>
</div>

</body>
</html>

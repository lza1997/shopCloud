
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-touch-fullscreen" content="no" />
<meta name="format-detection" content="telephone=no,address=no" />
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>退货列表</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script>
jQuery(document).ready(function(){
	var currentPage = 2;
	var  ret = 1;
	var totalPage = "0";
	
   jQuery(window).scroll(function(){								  
	 if (jQuery(document).scrollTop() >= jQuery(document).height() - jQuery(window).height()&&ret==1) {
		if(currentPage<=totalPage){
		jQuery("#loading").hide();
		jQuery.ajax({type:'POST',
	              url:'http://lza/wap/buyer/group_life_return.htm',
				  data:{"currentPage":currentPage,"beginTime":"","endTime":"","order_id":""},
				beforeSend:function(){
				  jQuery("#loading_none").hide();
				  jQuery("#loading").show();
				  ret = 2;
				},
			   success:function(data){
				   currentPage = currentPage+1;
				 
				 ret = 1;
	             if(data){ 
				  jQuery(".goods_resturn").append(data);
			 	 }else{
				 jQuery("#loading_none").show();
				  }    
              	}
	    });
	 }
	 }else{
		jQuery("#loading_none").show();
	}
	});
	
});<!--end-->
</script>
</head>

<body>
<div class="user_bar"><a class="back" href="${base}/m/authc/buyer/serviceCenter"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">商品退货</span></div>
<div class="phone_main">
	
    <div class="order_return_list">
    	<ul class="resturn_tab">
        	<li><a href="${base}/m/authc/buyer/orderReturnList">商品退货</a></li>
            <li class="this"><a href="#">生活购退款</a></li>
            <li><a href="${base}/m/authc/buyer/orderReturnListlog">查看返修/退换货记录</a></li>	
        </ul>
        <!--商品退货-->
                <div class="main">
  <div class="mt50" style="height:49px;"></div>
  <div class="error_page1">
  	<span class="error_img"><img src="${base}/res/html5/images/nothing.png" /></span>
    <p>暂无记录！</p>
  </div>

	</div>
                
        <!--查看返修/退换货记录-->
<div class="loading" id="loading" style="display:none">
<ul>
  <li><img src="${base}/res/html5/images/loading.gif" width="16" height="16" /></li>
  <li>正在加载....</li>
</ul>
</div>
<div class="loading" id="loading_none" style="display:none">
<ul>
  <li>没有更多了....</li>
</ul>
</div>        
    </div>
    
    
    
    <!--底部-->
   <@f.foot/>	

<!--按钮-->

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
</div>

</div>
</body>
</html>

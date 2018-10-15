<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-wap-web-app-capable" content="yes">
<meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>首页</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script src="${base}/res/html5/js/TouchSlide.1.1.js"></script>
<script src="${base}/res/html5/js/jquery.SuperSlide.2.1.1.js"></script>
<script>
function timeCount(remain_id){
   function _fresh(){
      var nowDate = new Date(),                                    //当前时间
      endDate = new Date($('#'+remain_id).attr('endtime')),    //截止时间
      totalS  = parseInt((endDate.getTime() - nowDate.getTime()) / 1000);     //总秒数
      _day    = parseInt(totalS / 3600 / 24)+"";
      _hour   = parseInt(totalS / 3600% 24)+"";
      _minute = parseInt((totalS / 60) % 60)+"";
      _second = parseInt(totalS % 60)+"";
	  d_html = "";
	  if(_day.length<2){
			d_html = "<b>0</b>";
			}
	  for(var n = 0;n<_day.length;n++){
     		var q = _day.substring(n,n+1);
			d_html = d_html+'<b>'+q+'</b>';
		}
		d_html = d_html+"<b>天</b>"
	  h_html = "";
	  if(_hour.length<2){
			h_html = "<b>0</b>";
			}
	  for(var n = 0;n<_hour.length;n++){
     		var q = _hour.substring(n,n+1);
			h_html = h_html+'<b>'+q+'</b>';
		}
		m_html = "";
		if(_minute.length<2){
			m_html = "<b>0</b>";
			}
	  for(var n = 0;n<_minute.length;n++){
     		var q = _minute.substring(n,n+1);
			m_html =m_html+ '<b>'+q+'</b>'
		}
		s_html = "";
		if(_second.length<2){
			s_html = "<b>0</b>";
			}
	  for(var n = 0;n<_second.length;n++){
     		var q = _second.substring(n,n+1);
			s_html =s_html+ '<b>'+q+'</b>'
		}
     jQuery('#'+remain_id).html(d_html+'<strong>:</strong>'+h_html+'<strong>:</strong>'+m_html+'<strong>:</strong>'+s_html);
     if( totalS <= 0){
       jQuery('#'+remain_id).html('该0元试用已结束');
       clearInterval(sh);
     }
  }
  _fresh();
  var sh = setInterval(_fresh,1000);
}
jQuery(document).ready(function() {
	jQuery("li[id=gc_]").each(function(index, element) {
		if(jQuery(this).find(".fl").html().length>5){
			var a=jQuery(this).find(".fl").html().substring(0,5);
			jQuery(this).find(".fl").html(a);
			}	
    });
	
	
	
timeCount("time_down_info");
 if(isWeiXin()){
       jQuery(".phone_top").hide();
     }else{
		 jQuery(".phone_top").show();
		 }
});
function search_form(){
	jQuery("#theForm").submit();
}
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}

function searcht(){
    var keyword=$("#keyword").val();
    window.location.href='${base}/m/goods/goodslist?searchType='+'keywordSearch'+'&keyword='+keyword;
 }
</script>
</head>
<body class="index_bg">
<div class="phone_main">
  <!--顶部-->
   <div class="phone_top"><a href=""> <img src="${base}/res/html5/images/download.jpg" /> </a><a class="close" href="javascript:void(0);" onClick="jQuery('.phone_top').remove();"><img src="${base}/res/html5/images/close.png" width="30" height="30" /></a></div>  
  <div class="logo_line">
	  <img src="${base}/res/html5/images/logo.png" width="250" height="33"/> 
	  	<@shiro.guest>
	    	<a class="log" href="${base}/m/seller/login">登陆</a>
	    </@shiro.guest>
	   	<@shiro.user>
	   		<a class="log" href="${base}/m/authc/buyer/center"><@shiro.principal/></a>
	   		<a class="log" href="${base}/m/seller/logout">退出</a>
 		</@shiro.user>
  </div>
  <form name="theForm" id="theForm" action="" method="post">
    <div class="search_line"><span>
      <input type="text"  placeholder="搜索商品" name="keyword" id="keyword" />
      </span>
      <b>
        <a href="javascript:void(0)" onclick="searcht();"><img src="${base}/res/html5/images/search_icon.png" value="${store.storeName}" width="25" height="25" id="search" /></a>
       </b>
      </div>
  </form>
  <!--幻灯-->
 
  <div class="focusBox" id="focusBox">
    <script type="text/javascript">jQuery(function(){jQuery('.slideBox').slide({mainCell:'.bd ul',effect:'fold',autoPlay:true});});</script>
    <div class="slideBox" id="iskyshop_advert">
    <#assign advPositionTag = newTag("advTag") />
 	<#assign topPosition = advPositionTag("{'apId':'6'}") />
 	<#if topPosition?? && topPosition!''>
 	<#assign apList = topPosition.advList />
	    <div class="hd">
		    <ul style="z-index:0;">
		    	<#list apList as advs >
			       <li class="<#if (advs_index==0)>on</#if>">1</li>
			    </#list>
		    </ul>
	    </div>
	    <div class="bd">
	        <ul style="z-index: 0; position: relative; width: 100%; height: 153px;">
		        <#list apList as advs >
					    <li style="position: absolute; width: 100%; left: 0px; top: 0px; display: list-item; opacity: 0.574896;">
						    <a href="${advs.advUrl}" target="_blank">
						    	<img src="${imgServer}${advs.resUrl}" width="100%" height="150">
						    </a>
					    </li>
				</#list>
        	</ul>
      </div>
      </#if>
      </div>
  </div>
  <!--导航菜单-->
  <div class="nav">
    <ul>
      <li><a href="${base}/m/category/category"><img src="${base}/res/html5/images/nav_01.png" />
        <p>${allorderCount}</p>
        </a></li>
      <li><a href="${base}/m/brand/brand"><img src="${base}/res/html5/images/nav_02.png" />
        <p>品牌街${dayAmount}</p>
        </a></li>
      <li><a href="${base}/m/authc/cart/cartGoodsList"><img src="${base}/res/html5/images/nav_car.png" />
        <p>购物车${dayOrder}</p>
        </a></li>
      <li><a href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/nav_user.png" />
        <p>用户中心</p>
        </a></li>
             <li><a href=""><img src="${base}/res/html5/images/nav_03.png" />
        <p>积分专区</p>
        </a></li>
                      <li><a href=""><img src="${base}/res/html5/images/nav_shi.png" />
        <p>0元试用</p>
        </a></li>
                      <li><a href=""><img src="${base}/res/html5/images/nav_life.png" />
        <p>生活购</p>
        </a></li>
      <li><a href=""><img src="${base}/res/html5/images/nav_good.png" />
        <p>商品购</p>
        </a></li>
            </ul>
  </div>
  <!--新品上市-->
     <#assign recommendGoodsTag = newTag("recommendGoodsTag") />
     <#assign recommendGoodslist = recommendGoodsTag("{'goodsflagsname':'newgoods'}") />
    <div class="phone_floor">
    <h1><span class="fl">新品上市</span></h1>
    <div class="recom">
      <div class="ohbox">
	        <ul class="piclist">
	            <#if recommendGoodslist??>
                	<#list recommendGoodslist as recommendGoods>
	                         <li>
		                         <a href="${base}/m/goods/goodsdetail?id=${recommendGoods.goods.goodsId}">
			                         <img src="${imgServer}${recommendGoods.goods.goodsImage}" style="width: 160px;height: 160px;"/>
			                         <span class="re_name">
			                         	<#if recommendGoods.goods.goodsName?length lt 11>   
											${recommendGoods.goods.goodsName}
									    <#else> 
											${recommendGoods.goods.goodsName[0..12]}... 
									   </#if>
			                         </span>
			                         <span class="bg">
			                         </span>
		                         </a>
	                         </li>
	                         <#if (recommendGoods_index==2)>
	               			      <#break/>
				             </#if>
                    </#list>
                 </#if>
	        </ul>
      </div>
    </div>
  </div>
    <!--首页分类，后台设置-->
	<#assign webCodeTag = newTag("webCodeTag") />
	<#assign taglist = webCodeTag("{'webCodeType':'mobile_list'}") /> 
	<#if taglist??>
	<#list taglist as webCode>
		<#assign json = webCode.codeInfo?eval />
		<#if (webCode_index==0)>
		<#list json as item>
		    <div class="phone_floor">
				<div class="phone_activity">
			      	<h1><span class="fl">${item.floorName}</span><span class="fr"><a href="${base}/m/goods/goodslist?searchType=gcIdSearch&keyword=${item.gcId}">更多</a></span></h1>
			      	<ul>
			      	<#list json.goodsList as goods >
			      	<#if (goods_index<3)>
			        	<li>
			        		<a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}">
			        			<img src="${imgServer}${goods.goodsImage}" />
					          	<p class="price">
					          	    <#if goods.goodsName?length lt 20>   
									 	${goods.goodsName}
									<#else> 
									     ${goods.goodsName[0..19]}... 
									</#if>
					          	</p>
					    	</a>
			        	</li>
		        	<#else>
			           <#break/>
			        </#if>
			        </#list>                 
			        </ul>
			    </div>
			</div>
			</#list>
		<#else>
			<#list json as item>
			<div class="phone_floor">
			    <div class="phone_group">
			      <h1><span class="fl">${item.floorName}</span><span class="fr"><a href="${base}/m/goods/goodslist?searchType=gcIdSearch&keyword=${item.gcId}">更多</a></span></h1>
			      <ul>
			         <#list json.goodsList as goods >
			           <#if (goods_index<4)>
				            <li>
					         <a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}">
						          <p class="g_name">
						               <#if goods.goodsName?length lt 19>   
											${goods.goodsName}
									    <#else> 
											${goods.goodsName[0..20]}... 
									   </#if>
						          </p>
						          <!-- <p class="price"><b>¥178.00</b><s>¥178.00</s></p> -->
						          <img src="${imgServer}${goods.goodsImage}" />
					          </a>
				           </li>
				      <#else>
				           <#break/>
			          </#if>
			        </#list> 
			      </ul>
			    </div>
			 </div>
			 </#list>
		</#if>
	</#list>
	</#if> 

	
  <!--品牌街-->
   <div class="phone_floor" id="phone_floor">
	    <h1><span class="fl">品牌街</span><span class="fr"><a href="${base}/m/brand/brand">更多</a></span></h1>
	    <div class="phone_brand" >
	      <ul  id="banners" >
	        <#assign brandTag = newTag("brandTag") />
			<#assign brandlist = brandTag("{'classid':'${gcId}'}") />
			<#if brandlist??>
				<#list brandlist as brands>
				 <li>
				 	<a href="${base}/m/goods/goodslist?searchType=BrandIdSearch&keyword=${brands.brandId}" target="_blank">
	                 <img src="${imgServer}${brands.brandPic}" alt="${brands.brandName}"  width="142" height="66">
	                </a>
	              </li>
	            <#if (brands_index>2)><#break/></#if>
				</#list>
			</#if>
	      </ul>
	    </div>
  	</div>
    <!--精选市场-->
    <#assign goodsClassTag =newTag("goodsClassTag")>
	<#assign goodsList =goodsClassTag("")>
    <div class="phone_floor">
	    <div class="phone_menu">
            <h1><span class="fl">精选市场</span><span class="fr"><a href="${base}/m/category/category">更多</a></span></h1>
			<#if goodsList?exists && goodsList?size gt 0>
			   <ul>
				<#list goodsList as class>
					<#if class.gcshow == 1>
	                    <li id="gc_"><a href="${base}/m/category/categoryList?keyword=${class.gcId}"><span class="fl">${class.gcName}</span><span class="fr"><img src="${imgServer}${class.gcpic}" width="50" height="50" /></span></a></li>
	                </#if>
	                <#if (class_index>2)><#break/></#if>
				</#list>
               </ul>
			</#if>
	    </div>
  	</div>
	<!--底部-->
 	<@f.foot/>
    </div>	
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

</body>
</html>

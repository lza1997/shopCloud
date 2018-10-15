
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>买家个人中心</title>
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-wap-web-app-capable" content="yes" />
<meta name="apple-wap-web-app-status-bar-style" content="black-translucent" />
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
    <script src="${base}/res/html5/js/location.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<#assign memberInfoTag =newTag("memberInfoTag")>
<#assign member =memberInfoTag("")>
<div class="phone_main">
    	<!--头部-->
            	<div class="user_hd">
        	<dl>
            	<dt>
            	<a href="${base}/m/authc/buyer/queryFace">
            	<#if member.memberAvatar??>
            	   <#if member.memberType??>
            		<img src="${member.memberAvatar}" />
            		<#else>
            		 <img src="${imgServer}/${member.memberAvatar}" />
            	  </#if>
            	  
            	<#else>
            		<img src="upload/common/default_user_portrait.gif" />
            	</#if>
            	</a>
            	</dt>
                <dd><p class="name">${member.memberName}</p>
                <p>可用余额：
     	            <script type="text/javascript">
		    			var available = number_format(${member.availablePredeposit},2);
		    			document.write("&yen;" + available);
				    </script>
                </p>
                <p>锁定余额：
     	            <script type="text/javascript">
	                    var available = number_format(${member.freezePredeposit},2);
						document.write("&yen;" + available);
				    </script>
                </p>
                <!-- <p>
	                <img src="${base}/res/html5/images/userlevel_0.png" width="25" />
	                <span>铜牌会员</span>
                </p> --!>
                </dd>
           
       		 </div>
        <!--导航-->
        <div class="user_nav">
        	<ul>
            	<li class="color_01">
	            	<a href="${base}/m/authc/buyer/orderList?orderState=10">
		            	<img src="${base}/res/html5/images/user_icon_01.png" />
		            	<p>未付款</p>
	            	</a>
	            	<b>${member.noPayOrder}</b>
            	</li>
                <li class="color_02">
	                <a href="${base}/m/authc/buyer/orderList?orderState=20">
		                <img src="${base}/res/html5/images/user_icon_02.png"/>
		                <p>未发货</p>
	                </a>
	                <b>${member.noFilledOrder}</b>
                </li>
                <li class="color_03">
	                <a href="${base}/m/authc/buyer/orderList?orderState=30&lockState=0">
		                <img src="${base}/res/html5/images/user_icon_03.png" />
		                <p>未收货</p>
	                </a>
	                <b>${member.noReceiveOrder}</b>
                </li>
                <li class="color_01">
	            	<a href="${base}/m/authc/buyer/orderList?orderState=40">
		            	<img src="${base}/res/html5/images/user_icon_05.png" />
		            	<p>已收货</p>
	            	</a>
	            	<!--<b>${member.noPayOrder}</b>-->
            	</li>
                <li class="color_04"><a href="${base}/m/authc/buyer/returnList"><img src="${base}/res/html5/images/user_icon_04.png" /><p>退货记录</p></a></li>
              <!--  <li class="color_05"><a href=""><img src="${base}/res/html5/images/user_icon_05.png" /><p>团购码</p></a></li>-->
                <li class="color_06"><a href="${base}/m/authc/buyer/couponIndex"><img src="${base}/res/html5/images/user_icon_06.png" /><p>优惠劵</p></a></li>
                <li class="color_07"><a href=""><img src="${base}/res/html5/images/user_icon_07.png" /><p>积分兑换</p></a></li>
                <li class="color_08"><a href="${base}/m/authc/buyer/serviceCenter"><img src="${base}/res/html5/images/user_icon_08.png" /><p>服务中心</p></a></li>
            </ul>
        </div>
        <!--收藏商品-->
        <div class="collect">
        	<div class="tab">
            	<ul>
                	<li class="this"><a href="javascript:void(0);" onclick="shouchang('favorite_goods',this);">收藏商品</a></li>
                    <li><a href="javascript:void(0);" onclick="shouchang('favorite_store',this);">收藏店铺</a></li>
                   <!--  <li><a href="javascript:void(0);" onclick="shouchang('your_like_goods',this);" id="cai">猜你喜欢</a></li> -->
                </ul>
            </div>
            <script>
            	function shouchang(id,obj){
					jQuery(".tab ul li").each(function(index, element) {
                        jQuery(element).removeClass("this");
                    });
					jQuery(obj).parent().addClass("this");
					jQuery(".collect_list ul").each(function(index, element) {
                        jQuery(element).hide();
                    });
					jQuery("#"+id).show();
				}

				
				jQuery(function(){
					jQuery("#cai").click();
				});
					
            </script>
             <#assign favoriteGoodsListTag = newTag("favoriteGoodsListTag")/>
             <!-- 我的商品-->
    	     <#assign favoriteGoodsList =favoriteGoodsListTag("{'tagDataType':'2','flags':'goods'}")>
            <div class="collect_list">
            	<ul id="favorite_goods" class="collect_ul">
            	   <#if (favoriteGoodsList?size>0)>
			       <#list favoriteGoodsList as favoritegoods>
	            		<li style="line-height:20px">
		            		<a href="${base}/m/goods/goodsdetail?id=${favoritegoods.favId}">
			            		<img src="${imgServer}${favoritegoods.goods.goodsImage}" style="width:2.235rem;height:2.235rem;"/>
			            		<p class="name">${favoritegoods.goods.goodsName}</p>
			            		<p class="price">¥<b>${favoritegoods.goods.goodsStorePrice}</b></p>
		            		</a>
	            		</li>
            		</#list>
            		</#if>
                </ul>
                <!-- 我的店铺 -->
               	<#assign favoriteStoreList =favoriteGoodsListTag("{'tagDataType':'2','flags':'store'}")>
                <ul class="collect_store" id="favorite_store" style="display:none;">
                  <#if favoriteStoreList?exists && favoriteStoreList?size gt 0>
			         <#list favoriteStoreList as favoriteStore>
                     	<li><a href="${base}/m/index/shop?storeId=${favoriteStore.store.storeId}">
							<div style="width:2.235rem;height:2.235rem;border:1px solid #eee;border-radius:5px;display: table-cell;vertical-align: middle;text-align: center">
                                <img src="<#if favoriteStore.store.storeLogo!=null>${imgServer}${favoriteStore.store.storeLogo}<#else>${base}/res/images/shop/defaultStore.png</#if>"  style="width:2.23rem;max-height:2.235rem;vertical-align: middle;"/>
							</div><p class="name">${favoriteStore.store.storeName} </p></a></li>
                   	 </#list>
                  </#if>
               	</ul>
                
            </div>
        </div>
        
<!--底部-->
    <@f.foot/>	
<!--按钮-->

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

            <#--底部菜单-->
                <div class="footer-nav">
                    <div class="flex-item"><a href="${base}/m/index/index"><img src="${base}/res/html5/images/layer_01.png" width="20" height="20"/><br>首页</a></div>
                    <div class="flex-item"><a href="${base}/m/category/category"><img src="${base}/res/html5/images/layer_05.png" width="20" height="20"/><br>分类</a></div>
                    <div class="flex-item"><a href="${base}/m/authc/cart/cartGoodsList"><img src="${base}/res/html5/images/layer_03.png" width="20" height="20"/><br>购物车</a>
                    </div>
                    <div class="flex-item"><a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="${base}/res/html5/images/layer_02.png" width="20" height="20"/><br>订单</a>
                    </div>
                    <div class="flex-item active"><a href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/layer_04.png" width="20" height="20"/><br>我的</a></div>
                </div>

        
</div>
</body>
</html>

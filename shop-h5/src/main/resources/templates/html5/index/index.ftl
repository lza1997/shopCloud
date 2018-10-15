<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
    <title>甜园云家</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="/js/jquery-1.10.2.min.js"></script>
    <script src="/js/TouchSlide.1.1.js"></script>
    <script src="/js/jquery.SuperSlide.2.1.1.js"></script>
    <script src="/js/location.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://3gimg.qq.com/lightmap/components/geolocation/geolocation.min.js"></script>
    <script>


        function isWeiXin() {
            var ua = window.navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return true;
            } else {
                return false;
            }
        }
//顶部搜索
        function searcht() {
            var keyword = $("#keyword").val();
            window.location.href = '/m/goods/goodslist?searchType=' + 'keywordSearch' + '&keyword=' + keyword;
        }
    </script>
   <script>
    	$(function(){
    		if(isWeiXin()){
    			$.ajax({
                    type: "post",
                    dataType: "JSON", 
                    async: false,
                    url: "/m/index/SingleSignOn",
                    success: function (result) {
                    	if(result.weixinurl != null){
                    		window.location.href = result.weixinurl;
                    	}
                    }
            	});
    		}
    	});
    </script>
</head>
<body class="index_bg">
<!--顶部-->
<div class="logo_line">
    <div class="logoin_box">
        <img src="/images/waxiansheng_logo.png" width="56" height="35"/>
    </div>
    <div class="seolocation">
        <form name="theForm" id="theForm" action="/m/goods/goodslist" method="get">
            <div class="search_line">
                <span>
                    <input type="text" name="searchType" value="keywordSearch" hidden/>
                    <input type="text" placeholder="搜索商品" name="keyword" id="keyword"/>
                  </span>
                <b>
                    <a href="javascript:void(0)" onclick="searcht();"><img src="/images/s_btn.png" width="18" height="18" id="search"/></a>
                </b>
                <button type="submit" style="display:none"></button>
            </div>
        </form>
    </div>
<@shiro.guest>
    <a  class="login_btn" href="/m/index/login">登录</a>
</@shiro.guest>
<@shiro.user>
    <a  class="login_btn" href="/m/authc/buyer/center"><img src="/images/eame.png" alt=""></a>
</@shiro.user>
</div>
<div class="phone_main">
    <!--幻灯-->

    <div class="focusBox" id="focusBox">
        <script type="text/javascript">
            jQuery(function () {
                jQuery('.slideBox').slide({mainCell: '.bd ul', effect: 'fold', autoPlay: true});
            });
        </script>
        <div class="slideBox" id="iskyshop_advert">
        <#assign advPositionTag = newTag("advTag") />
        <#assign topPosition = advPositionTag("{'apId':'17'}") />
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
                <ul style="z-index: 0; position: relative; width: 100%; height: 200px;">
                    <#list apList as advs >
                        <li style="position: absolute; width: 100%; left: 0px; top: 0px; display: list-item; opacity: 0.874896;">
                            <a href="${advs.advUrl}" target="_blank">
                                <img src="${imgServer}${advs.resUrl}" width="100%" height="200">
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
            <li><a href="${base}/m/category/category"><img src="/images/nav_01.png"/>
                <p>类目</p>
            </a></li>
            <li><a href="${base}/m/brand/brand"><img src="/images/nav_02.png"/>
                <p>品牌街</p>
            </a></li>
            <li><a href="${base}/m/authc/cart/cartGoodsList"><img src="/images/nav_car.png"/>
                <p>购物车</p>
            </a></li>
            <li><a href="${base}/m/authc/buyer/center"><img src="/images/nav_user.png"/>
                <p>用户中心</p>
            </a></li>
            <li><a href="${base}/m/authc/buyer/myCouponList"><img src="/images/nav_03.png"/>
                <p>优惠券</p>
            </a></li>
            <li><a href="${base}/points/html5PointsIndex"><img src="/images/nav_shi.png"/>
                <p>积分商城</p>
            </a></li>
            <li><a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="/images/nav_good.png"/>
                <p>订单</p>
            </a></li>
            <li><a href="${base}/m/authc/buyer/predeposit"><img src="/images/nav_life.png"/>
                <p>充值中心</p>
            </a></li>
        </ul>
    </div>
<#--快报-->
    <script>
        jQuery(function(){
            jQuery(".picMarquee-top").slide({mainCell:".bd ul",autoPlay:true,effect:"topMarquee",vis:3,interTime:50,trigger:"click"});
        })
    </script>
    <div class="picMarquee-top">
        <div class="kuaibaoimg">
            <img src="/images/kuaibao.png" alt="">
        </div>
        <div class="bd">
            <ul>
                <#assign articleTag = newTag("articleTag") />
                <#assign noticeList = articleTag("{'tagDataType':'2','acId':'8','pageSize':'5'}") />
                <#if noticeList??>
                	<#list noticeList as notices >
                		<li><a href="/help/h5Content?acId=${notices.acId}&articleId=${notices.articleId}" title="${notices.articleTitle}" target="_blank"><p>${notices.articleTitle}</p></a></li>
                    </#list>
                </#if>
            </ul>
        </div>
    </div>
<#--快报-->
    <!--新品上市-->
    <div class="tu_title"><img src="/images/title0.png" alt="" class="title_img"></div>
    <#assign recommendGoodsTag = newTag("recommendGoodsTag") />
    <#assign recommendGoodslist = recommendGoodsTag("{'goodsflagsname':'newgoods'}") />
    <div class="phone_floor">
        <div class="recom">
            <div class="ohbox">
                <ul class="piclist">
                <#if recommendGoodslist??>
                    <#list recommendGoodslist as recommendGoods>
                        <li>
                            <a href="/m/goods/goodsdetail?id=${recommendGoods.goods.goodsId}">
                                <img src="${imgServer}${recommendGoods.goods.goodsImage}" style="width: 2.4rem;height: 2.4rem;"/>
                                <span class="re_name">
                                    <#if recommendGoods.goods.goodsName?length lt 11>
                                    ${recommendGoods.goods.goodsName}
                                    <#else>
                              
                                    </#if>
			                         </span>
                                <span class="bg">
			                         </span>
                            </a>
                        </li>
                        <#if (recommendGoods_index==5)>
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
                        <h1><span class="fl">${item.floorName}</span><span class="fr"><a
                                href="/m/goods/goodslist?searchType=gcIdSearch&keyword=${item.gcId}">更多</a></span></h1>
                        <ul>
                            <#list json.goodsList as goods >
                                <#if (goods_index<3)>
                                    <li>
                                        <a href="/m/goods/goodsdetail?id=${goods.goodsId}">
                                            <img src="${imgServer}${goods.goodsImage}"/>
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
                        <h1><span class="fl">${item.floorName}</span><span class="fr"><a
                                href="/m/goods/goodslist?searchType=gcIdSearch&keyword=${item.gcId}">更多</a></span></h1>
                        <ul>
                            <#list json.goodsList as goods >
                                <#if (goods_index<4)>
                                    <li>
                                        <a href="/m/goods/goodsdetail?id=${goods.goodsId}">
                                            <p class="g_name">
                                                <#if goods.goodsName?length lt 19>
                                                ${goods.goodsName}
                                                <#else>
                                                ${goods.goodsName[0..20]}...
                                                </#if>
                                            </p>
                                            <!-- <p class="price"><b>¥178.00</b><s>¥178.00</s></p> -->
                                            <img src="${imgServer}${goods.goodsImage}"/>
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
    <div class="tu_title"><span class="fr"><a href="/m/brand/brand">更多<i class="fa fa-angle-right"></i></a></span><img src="/images/title1.png" alt="" class="title_img"> </div>
    <div class="phone_floor" id="phone_floor">
        <#--<h1><span class="fl">品牌街</span><span class="fr"><a href="${base}/m/brand/brand">更多 </a></span></h1>-->
        <div class="phone_brand">
            <ul id="banners" style="margin:1px 0 0 1px;">
            <#assign brandTag = newTag("brandTag") />
            <#assign brandlist = brandTag("{'classid':'${gcId}'}") />
            <#if brandlist??>
                <#list brandlist as brands>
                    <li>
                        <a href="/m/goods/goodslist?searchType=BrandIdSearch&keyword=${brands.brandId}" target="_blank">
                            <img src="${imgServer}${brands.brandPic}" alt="${brands.brandName}" style="height:1rem;padding:0.01rem">
                        </a>
                    </li>
                    <#if (brands_index>2)><#break/></#if>
                </#list>
            </#if>
            </ul>
        </div>
    </div>
    <!--推荐商品-->
    <div class="tu_title"><img src="/images/title2.png" alt="" class="title_img"> </div>
    <div class="phone_floor" >
        <div class="phone_store_recom">
            <#--<h1><span class="fl">推荐商品</span><span class="fr"><a href="${base}/m/category/category">更多</a></span></h1>-->
            <ul class="box-flex">
              <#assign newGoodslist = recommendGoodsTag("{'goodsflagsname':'recommend'}") />
              <#if newGoodslist??>
               	<#list newGoodslist as newGoods >
                <li style="font-size: 14px">
                    <a href="/m/goods/goodsdetail?id=${newGoods.goods.goodsId}">
                        <img src="${imgServer}${newGoods.goods.goodsImage}"/>
                        <span  class="titlebox"><#if recommendGoods1.goods.goodsName?length lt 11>
                            ${newGoods.goods.goodsName}
                            <#else>
                            ${newGoods.goods.goodsName[0..12]}...
                            </#if></span>
                        <span style="color:red;margin-left:5px">¥<i>${newGoods.goods.goodsStorePrice}</i></span>
                    </a>
                </li>
                  <#if (newGoods_index==5)>
                            <#break/>
                        </#if>
                </#list>
			</#if>
            </ul>
        </div>
    </div>

    <!--精选市场-->
    <div class="tu_title"><span class="fr"><a href="/m/category/category">更多 <i class="fa fa-angle-right"></i></a></span><img src="${base}/res/html5/images/title3.png" alt="" class="title_img"> </div>
<#assign goodsClassTag =newTag("goodsClassTag")>
<#assign goodsList =goodsClassTag("")>
    <div class="phone_floor">
        <div class="phone_menu">
        <#if goodsList?exists && goodsList?size gt 0>
            <ul>
                <#list goodsList as class>
                    <#if class.gcshow == 1>
                        <li id="gc_">
                           <#--  <a href="${base}/m/category/categoryList?keyword=${class.gcId}">-->
                           <a href="/m/category/category1?gcId=${class.gcId}">
                                <span class="fl">${class.gcName}</span>
                                <span class="fr">
									<img src="${imgServer}${class.gcpic}" width="50" height="50"/>
								</span>
                            </a>
                        </li>
                    </#if>
                    <#if (class_index>2)><#break/></#if>
                </#list>
            </ul>
        </#if>
        </div>
    </div>
    <!--推荐店铺-->
    <div class="tu_title"><span class="fr"><a href="/m/category/category">更多 <i class="fa fa-angle-right"></i></a></span><img src="${base}/res/html5/images/title4.png" alt="" class="title_img"> </div>
    <div class="phone_floor">
        <div class="phone_store">
            <ul>
            <#assign storeListTag =newTag("storeListTag")>
			<#assign storeList =storeListTag("")>
               <#list storeList as store>
                <li>
                    <div class="tj_bd">
						<span class="flimg">
                            <a href="/m/index/shop?storeId=${store.storeId}"><img  style="width:1.5rem;vertical-align: middle" src="<#if store.storeLogo!=null>${imgServer}${store.storeLogo}<#else>${base}/res/images/shop/defaultStore.png</#if>" title="${store.storeName}" alt="${store.storeName}" /></a>
						</span>
                        <span class="fl"><h2 style="font-size: 16px;margin-top: 5px;">${store.storeName}</h2> 月销${store.storeSales}单</span>
                        <span class="looklook"><a href="/m/index/shop?storeId=${store.storeId}">进店看看</a></span>
                    </div>
                    <div class="tj_wrap">
                    <#assign goodsListTag = newTag("goodsSimpleListTag")/>
                    <#assign recommendgoodslist =goodsListTag("{'storeid':'${store.storeId}','commend':'1','tagDataType':'2','pagesize':'4','orderField':'createTime','order':'desc'}")>
							  <#if recommendgoodslist?exists && recommendgoodslist?size gt 0>
							      <#list recommendgoodslist as recommendgoods>
                        <a href="/m/goods/goodsdetail?id=${recommendgoods.goodsId}">
                            <span><img src=<#if recommendgoods.goodsImage!''>"${imgServer}${recommendgoods.goodsImage}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> title="${recommendgoods.goodsName}" alt="${recommendgoods.goodsName}" /></span>
                            <span style="font-size: 14px">¥${recommendgoods.goodsStorePrice}</span>
                        </a>
                        </#list>
				    </#if>
                    </div>
                </li>
                  </#list>
            </ul>
        </div>
    </div>
    <!--底部-->
<@f.foot/>
</div>
<!--按钮-->
</div>
<div class="footer-nav">
    <div class="flex-item active"><a href="/m/index/index" style="color:#b61d1d"><img src="/images/layer_11.png" width="20" height="20"/><br>首页</a></div>
    <div class="flex-item"><a href="/m/category/category"><img src="/images/layer_05.png" width="20" height="20"/><br>分类</a></div>
    <div class="flex-item"><a href="/m/authc/cart/cartGoodsList"><img src="/images/layer_03.png" width="20" height="20"/><br>购物车</a>
    </div>
    <div class="flex-item"><a href="/m/authc/buyer/orderList?orderState=99"><img src="/images/layer_02.png" width="20" height="20"/><br>订单</a>
    </div>
    <div class="flex-item"><a href="/m/authc/buyer/center"><img src="/images/layer_04.png" width="20" height="20"/><br>我的</a></div>
</div>

<div id="backTop">
    <img src="/images/backTop.png" alt="" style="width:40px;height:40px">
</div>
<script>
    $(window).scroll(function(){
        var height = $(window).scrollTop();
        $('#backTop').hide();

        if(height >= 500){
            $('#backTop').show();
        }
    })
    $('#backTop').click(function(){
        $('body,html').animate({scrollTop:0},500);
    })
</script>


</body>
</html>

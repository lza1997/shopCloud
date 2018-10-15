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
    <title>${store.storeName}</title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
    <script src="${base}/res/html5/js/TouchSlide.1.1.js"></script>
    <script src="${base}/res/html5/js/jquery.SuperSlide.2.1.1.js"></script>
    <!-- 手机端弹出框开始 -->
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
    <!-- 手机端弹出框结束 -->
    <script>
        function timeCount(remain_id) {
            function _fresh() {
                var nowDate = new Date(),                                    //当前时间
                        endDate = new Date($('#' + remain_id).attr('endtime')),    //截止时间
                        totalS = parseInt((endDate.getTime() - nowDate.getTime()) / 1000);     //总秒数
                _day = parseInt(totalS / 3600 / 24) + "";
                _hour = parseInt(totalS / 3600 % 24) + "";
                _minute = parseInt((totalS / 60) % 60) + "";
                _second = parseInt(totalS % 60) + "";
                d_html = "";
                if (_day.length < 2) {
                    d_html = "<b>0</b>";
                }
                for (var n = 0; n < _day.length; n++) {
                    var q = _day.substring(n, n + 1);
                    d_html = d_html + '<b>' + q + '</b>';
                }
                d_html = d_html + "<b>天</b>"
                h_html = "";
                if (_hour.length < 2) {
                    h_html = "<b>0</b>";
                }
                for (var n = 0; n < _hour.length; n++) {
                    var q = _hour.substring(n, n + 1);
                    h_html = h_html + '<b>' + q + '</b>';
                }
                m_html = "";
                if (_minute.length < 2) {
                    m_html = "<b>0</b>";
                }
                for (var n = 0; n < _minute.length; n++) {
                    var q = _minute.substring(n, n + 1);
                    m_html = m_html + '<b>' + q + '</b>'
                }
                s_html = "";
                if (_second.length < 2) {
                    s_html = "<b>0</b>";
                }
                for (var n = 0; n < _second.length; n++) {
                    var q = _second.substring(n, n + 1);
                    s_html = s_html + '<b>' + q + '</b>'
                }
                jQuery('#' + remain_id).html(d_html + '<strong>:</strong>' + h_html + '<strong>:</strong>' + m_html + '<strong>:</strong>' + s_html);
                if (totalS <= 0) {
                    jQuery('#' + remain_id).html('该0元试用已结束');
                    clearInterval(sh);
                }
            }

            _fresh();
            var sh = setInterval(_fresh, 1000);
        }
        jQuery(document).ready(function () {
            jQuery("li[id=gc_]").each(function (index, element) {
                if (jQuery(this).find(".fl").html().length > 5) {
                    var a = jQuery(this).find(".fl").html().substring(0, 5);
                    jQuery(this).find(".fl").html(a);
                }
            });


            timeCount("time_down_info");
            if (isWeiXin()) {
                jQuery(".phone_top").hide();
            } else {
                jQuery(".phone_top").show();
            }
        });
        function search_form() {
            jQuery("#theForm").submit();
        }
        function isWeiXin() {
            var ua = window.navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return true;
            } else {
                return false;
            }
        }

        function searcht() {
            var keyword = $("#keyword").val();
             window.location.href='${base}/m/goods/goodslist?searchType='+'keywordSearch'+'&keyword='+keyword;
           
        }
    </script>
</head>
<body style="background:#fff">

<div class="">
<#assign goodsListTag = newTag("goodsListTag")/>
<!--获得该店铺下的商品数量-->
<#assign storegoodscount =goodsListTag("{'storeid':'${storeId}','tagDataType':'5'}")>
    <div class="banbg">
        <!--Begin Header Begin-->
        <div class="top">
            <div id="logo"><a href="${base}/m/index/index"><img src="${base}/res/html5/images/waxiansheng_logo.png" style="max-width: 100%;"></a></div>
            <div class="search">
                <form method="post" action="" name="formSearch" id="formSearch">
                    <input type="button" onclick="searcht();" value="" class="s_btn">
                    <input name="searchType" id="search_act" value="keywordSearch" type="hidden">
                    <input name="storeId" id="storeId" value="${storeId}" type="hidden">
                    <input type="text" id="keyword" name="keyword" class="s_ipt" value="搜索你想要的商品" onfocus="if(value==defaultValue){value='';this.style.color='#000'}"
                           onblur="if(!value){value=defaultValue;this.style.color='#999'}">
                </form>

            </div>
        </div>
    </div>
    <div class="logn_star">
        <div style="position:relative;">
            <img src="${imgServer}${store.storeBanner}" class="img_lodo" style="width: 100%;height:200px">
            <div class="dipu_lsit" style="height:60px">
                <ul>
                <a href="${base}/m/index/info?storeId=${store.storeId}"> <li class="one_list"><img src="<#if store.storeLogo!=null>${imgServer}${store.storeLogo}<#else>${base}/res/images/shop/defaultStore.png</#if>" style="height:56px;width:56px"></li></a>
                    <li class="two_list" style="display:inline-block;color:#fff;">
                       <a href="${base}/m/index/info?storeId=${store.storeId}"> <p class="biaot1 f14 pl5" style="color:#fff;">${store.storeName}</p></a>
                    <p class="biaot2 f12 pl5" id="zCount" style="color:#fff;">${store.storeCollect}人收藏</p>
                    </li>
                    <li class="three_list">
                        <div class="button_anniu" style="padding-right:10px;">
                            <div id="goods-button" class="goods-button" style="padding:2px 3px;width:60px;margin-top: 23%;" mark="${isCollection}" storeId="${store.storeId}">
                            <#if '${isCollection}'==0>
                                <img id="img_store" src="${base}/res/html5/images/star_bg2.png" style="width: 18px;height:15px; margin-bottom:1px;">
                                <a href="javascript:void(0)"  style="color: #fff;"> 收藏 </a>
                            <#else>
                                <img id="img_store" src="${base}/res/html5/images/star.png" style="width: 18px;height:15px; margin-bottom:1px;">
                                <a href="javascript:void(0)" style="color: #fff;">收藏 </a>
                            </#if>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div style="width:100%;height:10px;background: #f6f6f6"></div>
        <div class="border-grids total-section">
            <div class="ui-flex total-centent">
                <a style="width:24.5%;" href="#">
                    <#--<span class="total-num">${storegoodscount}</span>-->
                    <span class="total-text">全部商品</span>
                </a>
                <a style="width:24.5%;" href="${base}/m/index/goodslist2?storeId=${store.storeId}">
                    <#--<span class="total-num"></span>-->
                    <span class="total-text">上新</span>
                </a>
                <a style="width:24.5%;" href="${base}/m/index/goodslist1?storeId=${store.storeId}">
                    <#--<span class="total-num h_color"></span><!--暂时写死&ndash;&gt;-->
                    <span class="total-text h_color">推荐商品</span>
                </a>
                <a style="width:24.5%;"
                   href="${base}/m/index/coupon?storeId=${store.storeId}">
                    <#--<span class="total-num h_color">0</span>-->
                    <span class="total-text h_color">优惠劵</span>
                </a>
            </div>
        </div>
        <div style="width:100%;height:10px;background: #f6f6f6"></div>
        <!--获取该店铺下关灯片-->
        <div class="focusBox" id="focusBox" style="margin-top:10px;">
            <script type="text/javascript">jQuery(function () {
                jQuery('.slideBox').slide({mainCell: '.bd ul', effect: 'fold', autoPlay: true});
            });</script>
            <div class="slideBox" id="iskyshop_advert">
            <#assign storeInfoSlideTag = newTag("storeInfoSlideTag")/>
            <#assign storelistside =storeInfoSlideTag("{'storeId':'${storeId}'}")>
            <#if storelistside?? && storelistside!''>
                <div class="hd">
                    <ul style="z-index:0;">
                        <#list storelistside as advs >
                            <li class="<#if (advs_index==0)>on</#if>">1</li>
                        </#list>
                    </ul>
                </div>
                <div class="bd">
                    <ul style="z-index: 0; position: relative; width: 100%; height: 200px;">
                        <#list storelistside as upslide >
                            <li style="position: absolute; width: 100%; left: 0px; top: 0px; display: list-item; opacity: 0.874896;">
                                <a href="${upslide.imgUrl!'javascript:void(0)'}" target="_blank">
                                    <img src="<#if upslide.fileName!=null>${imgServer}${upslide.fileName}<#else>${base}/res/images/noslide.png</#if>" style="width: 100%;height:200px">
                                </a>
                            </li>
                        </#list>
                    </ul>
                </div>
            </#if>
            </div>
        </div>
        <!--获取该店铺下关灯片-->
		<!--幻灯片-->
    </div>


    <div class="goods_titles like" style="padding-bottom: 70px;">
        <p class="goods_title">商品展示</p>
        <#assign goodsListTag = newTag("goodsListTag")/>
		<#assign goodsList = goodsListTag("{'storeid':'${store.storeId}','tagDataType':'2'}")>
        <ul id="bottenlist">
        <#if goodsList??>
            <#list goodsList as goods>
                <li>
                    <div class="img listing"><a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}"><img
                            src="${imgServer}${goods.goodsImage}" width="185"></a></div>
                    <div class="name_list" style="padding:0px;">
                        <a style="padding-left:10px;padding-right:10px;" href="${base}/m/goods/goodsdetail?id=${goods.goodsId}">${goods.goodsName}</a>
                    </div>
                    <div class="price_two" style="line-height: 20px;">
                        <span>¥ ${goods.goodsStorePrice} </span>
                         <span style="float:right;color:#666;font-size:12px">已销售：${goods.salenum}</span>
                    </div>
                </li>
            </#list>
        </#if>
        </ul>
    </div>
     <div class="ftm-store">
        <a  href="${base}/m/index/info?storeId=${store.storeId}">店铺详情</a>
        <div class="btm-menu-box" href="${base}/m/index/category?storeid=${store.storeId}" style="position:relative;display: block;" >热门分类
            <span class="category_pos" mark="hide">
            <#assign storeGoodsClassTag =newTag("storeGoodsClassTag")>
		    <#assign storeList =storeGoodsClassTag("{'storeid':'${store.storeId}','parentId':'0'}")>
            <#if storeList?exists && storeList?size gt 0>
            <#list storeList as class>
                    <a href="${base}/m/index/goodslistByStore?stcId=${class.stcId}">${class.stcName}</a>
             </#list>
            </#if>
            </span>
        </div>
        <a class="lianxi">联系卖家</a>
    </div>
</div>
<!--按钮-->
</div>

<!--悬浮层-->
<script>
$(function () {
    $(".layer_menu").on('click',function () {
        var obj = $("#show");
        var ret = obj.attr("mark");
        if (ret == "hide") {
            obj.addClass('layer_show_down');
            obj.attr("mark", "show");
        } else {
            obj.removeClass('layer_show_down');
            obj.attr("mark", "hide");
        }
    })

    $(".btm-menu-box").on('click',function () {
        var obj = $(".category_pos");
        var ret = obj.attr("mark");
        if (ret == "hide") {
            obj.addClass('layer_show_down');
            obj.attr("mark", "show");
        } else {
            obj.removeClass('layer_show_down');
            obj.attr("mark", "hide");
        }
    })
})

</script>
<div class="layer">
    <a class="layer_menu" href="javascript:void(0);" onclick="click_layer();">
        <img src="${base}/res/html5/images/layer_05.png" width="30" height="30"/>
    <#--<span class="black_bg"></span>-->
    </a>
    <div class="layer_show" id="show" mark="hide">
        <ul style="font-size: 14px">
            <li><a href="${base}/m/index/index"><img src="${base}/res/html5/images/layer_01.png" width="18" height="18"/><span style="margin-left: 4px">首页</span></a></li>
            <li><a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="${base}/res/html5/images/layer_02.png" width="18" height="18"/>
                <span>订单</span></a></li>
            <li><a href="${base}/m/authc/cart/cartGoodsList"><img src="${base}/res/html5/images/layer_03.png" width="18" height="18"/>
                <span>购物车</span></a></li>
            <li><a href="${base}/m/authc/buyer/center"><img src="${base}/res/html5/images/layer_04.png" width="18" height="18"/>
                <span>我的</span></a></li>
        </ul>
    </div>
</div>

<!-- 引入幻灯片JS -->
<script type="text/javascript" src="${base}/res/js/jquery.flexslider-min.js"></script>
<!-- 绑定幻灯片事件 -->
<script type="text/javascript">
    $(window).load(function () {
        $('.flexslider').flexslider();
    });

    $("#goods-button").on('click', function () {
        var _this = $(this);
        var favType = 2;
        var storeId = _this.attr('storeId');
        var goodsId = _this.attr('mark') == 0 ? -9 : storeId;
        var favid = goodsId;

        if(_this.attr('mark') == 0){
            _this.attr('mark',1);
            collect_storeorgoods(goodsId, favType, storeId)
        }else{
            _this.attr('mark',0);
            deletefavotitegoods(favid, favType, storeId);
        }
    })
    <!-- 商品或店铺收藏开始-->
    function collect_storeorgoods(goodsId, favType, storeId) {
        $.ajax({
            url: "${base}/Favorite/saveCollection",
            type: 'post',
            data: {'goodsId': goodsId, 'favType': favType, 'storeId': storeId},
            dataType: 'json',
            success: function (data) {
                if (data.success) {
                    layer.open({content: data.msg, time: 1});
                    if (data.favType == 1) {
                        $("#img_product").attr("src", "${base}/res/html5/images/star.png");
                        $("#a_product").attr("onclick", "deletefavotitegoods(" + goodsId + "," + favType + "," + storeId + ");");
                    } else {
                        $("#img_store").attr("src", "${base}/res/html5/images/star.png");
                    }
                } else {
                    if('请登录后收藏'== data.msg){
		                 window.location.href="${base}/m/index/login";
		                 return false;
		                }
                    layer.open({content: data.msg, time: 1});
                    }
            }
        });
    }
    <!--商品或店铺收藏结束-->
    <!--商品或店铺收藏取消开始-->
    //准备删除
    function deletefavotitegoods(favid, favtype, storeId) {
        var url = '${base}/Favorite/deleteAllFav';
        $.ajax({
            type: "post",
            url: url,
            data: {'favIds': favid, 'favType': favtype},
            dataType: "json",
            async: false,
            success: function (data) {
                if (data.success) {
                    layer.open({content: data.msg, time: 1});
                    if (data.favType == 1) {
                        $("#img_product").attr("src", "${base}/res/html5/images/star_bg.png");
                        $("#a_product").attr("onclick", "collect_storeorgoods(" + favid + "," + favtype + "," + storeId + ");");
                    } else {
                        $("#img_store").attr("src", "${base}/res/html5/images/star_bg.png");
                    }
                } else {
                   if('请登录后收藏'== data.msg){
		                 window.location.href="${base}/m/index/login";
		                 return false;
		                }
		                layer.open({content: data.msg, time: 1});
	                    }
            }
        });
    }
    <!--商品或店铺收藏取消结束-->
</script>

<#--二维码加好友-->
<div class="erweima" style="display:none">
    <div class="erweimacon">
        <p class="erweimap1">微信联系卖家</p>
        <img src="${imgServer}${store.weChantUrl}" alt="" class="erweimaimg1">
        <img src="${base}/images/close11.png" alt="" class="close11">
        <p class="erweimap2">长按二维码识别 添加卖家微信</p>
    </div>
</div>

<script>
    $(function(){
        var lianxi = $('.lianxi'),
            erweima = $('.erweima'),
            close11 = $('.close11');
        lianxi.on('click',function(){
            erweima.css({display:'block'})
        });
        close11.on('click',function(){
            erweima.css({display:'none'})
        });
    })
</script>
<#--二维码加好友-->
</body>
</html>

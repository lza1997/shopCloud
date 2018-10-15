<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
    <title>${store.storeName} </title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="${base}/res/html5/js/raty/jquery.raty.css">
    <script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
    <#--<script type="text/javascript" src="${base}/res/js/waypoints.js"></script>-->
    <!-- 手机端弹出框开始 -->
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
    <!-- 手机端弹出框结束 -->
    <#--<script type="text/javascript" charset="utf-8" src="${base}/res/js/area.js"></script>-->
    <script src="${base}/res/html5/js/raty/jquery.raty.js"></script>
</head>

<body class="index_bg" style="font-size: 14px">
<!--根据店铺id获取店铺内容  -->
<#assign storeInfoTag =newTag("storeInfoTag")>  
<#assign storeVo =storeInfoTag("{'storeId':'${storeId}'}")>
 <!--根据店铺id取评分内容-->
<#assign evaluateStorebyStoreIdTag =newTag("evaluateStorebyStoreIdTag")>  
<#assign evaluateStore =evaluateStorebyStoreIdTag("{'storeId':'${storeId}'}")>
<div class="phone_hd">
    <a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25"/></a>
    店铺详情
</div>


<div class="logn_star clear store_detail_wrap" style="padding-top:46px;">
    <div class="sku-group_two tm10">

        <div class="shop_logo_22">
            <ul>
                 <li class="shop_img"><img src="<#if storeVo.storeLogo!=null>${imgServer}${storeVo.storeLogo}<#else>${base}/res/images/shop/defaultStore.png</#if>"></li>
                <li class="shop_logo_p" style="width: 41%; padding-left:3%;">
                    <p style="color:#252525;text-align: left;">${storeVo.storeName}</p>
                    <p style="color:#9d9c9c;text-align: left;">${storeVo.storeCollect}人收藏</p>
                </li>
                <li class="shop_logo_p3">
                    <div class="button_anniuu">
                        <div class="goods-buttonu mt4" style="padding:1px 6px;width: 60px;">
                            <div id="goods-button" class="goods-button" style="padding:2px 3px;width:60px;" mark="${isCollection}" storeId="${storeVo.storeId}">
                            <#if '${isCollection}'==0>
                                <img id="img_store" src="${base}/res/html5/images/star_bg2.png" mark="${isCollection}" style="width: 18px;height:15px; margin-bottom:1px;">
                                <a href="javascript:void(0)" style="color: #fff;"> 收藏 </a>
                            <#else>
                                <img id="img_store" src="${base}/res/html5/images/star.png" mark="${isCollection}" style="width: 18px;height:15px; margin-bottom:1px;">
                                <a href="javascript:void(0)" style="color: #fff;">收藏 </a>
                            </#if>

                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>

         <div class="border-grids total-section">
            <div class="ui-flex total-centent">
                <a style="width:24.5%;" href="${base}/m/index/shop?storeId=${storeVo.storeId}">
                    <#--<span class="total-num">${storegoodscount}</span>-->
                    <span class="total-text">全部商品</span>
                </a>
                <a style="width:24.5%;" href="${base}/m/index/goodslist2?storeId=${storeVo.storeId}">
                    <#--<span class="total-num"></span>-->
                    <span class="total-text">上新</span>
                </a>
                <a style="width:24.5%;" href="${base}/m/index/goodslist1?storeId=${storeVo.storeId}">
                    <#--<span class="total-num h_color"></span><!--暂时写死&ndash;&gt;-->
                    <span class="total-text h_color">推荐商品</span>
                </a>
                <a style="width:24.5%;"
                   href="${base}/m/index/coupon?storeId=${storeVo.storeId}">
                    <#--<span class="total-num h_color">0</span>-->
                    <span class="total-text h_color">优惠劵</span>
                </a>

            </div>
        </div>
    </div>
    <div class="star f12" style="background-color: #fff;">
        <ul>
            <li>描述相符<span class="red_color pr5 pl5 creditevaluate" data-score="${evaluateStore.sevalDesccredit}" title="满意" style="width: 100px;"></span>
            </li>
            <li>服务态度<span class="red_color pr5 pl5 creditevaluate" data-score="${evaluateStore.sevalServicecredit}" title="很好" style="width: 100px;"></span>
            </li>
            <li>发货速度<span class="red_color pr5 pl5 creditevaluate" data-score="${evaluateStore.sevalDeliverycredit}" title="满意" style="width: 100px;"></span>
            </li>
        </ul>

    </div>
    <div class="detail-item border-grids"> 
        <a href="tel:${storeVo.storeTel}" class="item-cell">
            <div class="ui-flex cell-left  f12 ff">
                <span class="cell-title">商家电话：${storeVo.storeTel}</span>
            </div>
            <div class="cell-right">
                <i class="fa fa-phone"></i>
            </div>
        </a>
        <a onclick="payy('${imgServer}','${storeVo.storeCode}');" href="javascript:void(0);" class="item-cell">
            <div class="ui-flex cell-left f12 ff">
                <span class="cell-title" onclick="payy('${imgServer}','${storeVo.storeCode}');">店铺二维码</span>
            </div>
            <div class="cell-right" onclick="payy('${imgServer}','${storeVo.storeCode}');">
                <i class="fa fa-qrcode"></i>
            </div>
        </a>
    </div>
    <!-- detail-item start-->

    <div class="detail-item border-grids">
        <a href="#" class="item-cell">
            <div class="ui-flex cell-left">
                <span class="cell-title f12 ff">店铺简介<span class="w10">${storeVo.description}</span></span>

            </div>
        </a>
        <a href="#" class="item-cell">
            <div class="ui-flex cell-left">
                <span class="cell-title f12 ff">开店时间<span class="w10">
	           <#if storeVo.createTimeStr??>
		                         ${storeVo.createTimeStr?string('yyyy-MM-dd')}
		       </#if>
				  <span class="cell-title f12 ff">上次登录<span class="w10">
		                      <#if storeVo.storeLastLogintimestr??>
		                          ${storeVo.storeLastLogintimestr?string('yyyy-MM-dd')}
		                      </#if>
            </span></span></div>
        </a>
    </div>

</div>


<div class="details_index">
    <div class="loading" id="loading" style="display:none">
        <ul>
            <li><img src="${base}/res/html5/images/loading.gif" width="16" height="16"></li>
            <li>正在加载....</li>
        </ul>
    </div>
    <div style="height:10px;"></div>
</div>

<script>
    function payy(imgserver,storeCode) {
        var srcimg = imgserver+storeCode;
        layer.open({
            content: '<img src="'+srcimg+'" style="width:100%;height:100%;">',
            time: 20 //2秒后自动关闭
        });
    }
    $.fn.raty.defaults.path = '${base}/res/html5/js/raty/images';
    $(".creditevaluate").raty({
        score: function () {
            return $(this).attr('data-score');
        },
        readOnly:true
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
                            $("#img_product").attr("src", "${base}/res/html5/images/star_bg2.png");
                            $("#a_product").attr("onclick", "collect_storeorgoods(" + favid + "," + favtype + "," + storeId + ");");
                        } else {
                            $("#img_store").attr("src", "${base}/res/html5/images/star_bg2.png");
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

</body>
</html>

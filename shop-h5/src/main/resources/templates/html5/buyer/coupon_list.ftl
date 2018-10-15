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
    <title>优惠券</title>
    <link rel="stylesheet" type="text/css" href="${base}/res/css/css.css">
    <script src="${base}/res/js/jquery.js"></script>
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
</head>
<style>
    *{padding:0;margin:0}
    .coupon{margin-top:55px}
    .coupon_list{position:relative;text-align:center;margin-top:10px;height:100px}
    .coupon_img{position:absolute;top:0;left:0;display:inline-block;width:90%;height:100px;margin:0 5%;}
    .coupon_img img{width:100%;height:100px;}
    .coupon_con{position:absolute;top:0;left:5%;width:90%}
    .coupon_con p{color:#fff;}
    .coupon_con .coupon_con_img{width:80px;height:80px;float:left;margin:10px}
    .coupon_con .coupon_con_img a{width:80px;height:80px;display:block;}
    .coupon_con .coupon_con_img a img{width:80px;height:80px;}
    .coupon_con .coupon_con_p{float:right;margin-right:10px;width:170px;height:100px}
    .coupon_con .coupon_con_p .title{margin-top:10px}
    #recoupon{border:1px solid #fff;padding:2px 10px;border-radius:10px;color:#fff;margin-top:20px;display:inline-block;}
    .titlecon{font-size:12px;margin-top:10px}
</style>
<body>
<div class="user_bar"><a class="back" href="${base}/m/index"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" style="margin-top:10px"/></a><span class="fl">优惠券</span></div>

<#assign storeInfoTag =newTag("storeInfoTag")>
<#assign storeVo =storeInfoTag("{'storeId':'${storeId}'}")>
<div class="coupon">

    <#--之定义数据-->
    <#if couponList??>
        <#list couponList as coupon >
            <#if coupon.couponId ??&& coupon.endTime>
            <div class="coupon_list">
                <div class="coupon_img">
                    <img src="${base}/res/html5/images/juan_red.png" />
                </div>
                <div class="coupon_con">
                    <div class="coupon_con_img">
                        <a href="${base}/m/index/shop?storeId=${coupon.storeId}">
                            <img src="${imgServer}/${coupon.couponPic}" alt="">
                        </a>
                    </div>
                    <div class="coupon_con_p">
                        <p class="title">${coupon.couponTitle}</p>
                        <p class="titlecon">
                            <#if coupon.startTimeStr??>
                            ${coupon.startTimeStr?string("yyyy-MM-dd")}
                            </#if>
                            ~
                            <#if coupon.endTimeStr??>
                            ${coupon.endTimeStr?string("yyyy-MM-dd")}
                            </#if>
                        </p>
                        <span  id="recoupon" class="recoupon" onclick="receiveCoupon('${coupon.storeId }','${coupon.couponId}')" />领取</span>
                    </div>
                </div>
            </div>
            </#if>
        </#list>
    </#if>

</div>
<script type="text/javascript">
    //领取优惠券
    function receiveCoupon(storeId, couponId) {
        $.ajax({
            type: "post",
            url: "${base}/store/receiveCoupon?storeId=" + storeId + "&couponId=" + couponId,
            dataType: "json",
            async: false,
            success: function (data) {
                layer.open({content: data.msg, time: 1});
            }
        });
    }
</script>
<@f.foot/>
</body>

</html>
			
	



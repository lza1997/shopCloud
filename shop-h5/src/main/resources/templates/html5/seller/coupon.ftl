<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
    <title>优惠券列表页</title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${base}/res/html5/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${base}/res/html5/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="${base}/res/html5/js/jQuery.fontFlex.js" type="text/javascript"></script>
    <script src="${base}/res/html5/js/font.js" type="text/javascript"></script>
    <!-- 手机端弹出框开始 -->
    <script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
    <!-- 手机端弹出框结束 -->
</head>
<body class="index_bg">

<div class="phone_hd">
    <a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25"/></a>
    最新优惠券
</div>

<div class="phone_main phone-top-distance">

    <div class="coupon-wrap">

        <#--coupon-list-wrap start -->
        <#assign couponTag =newTag("couponTag")>
        <#assign couponlist =couponTag("{'storeId':'${storeId}'}")>
        <#if couponlist?size gt 0>
            <#list couponlist as coupon>
        <div class="coupon-list-wrap <#if coupon.couponstorage gt 0> active </#if>" onclick="receiveCoupon('${coupon.storeId }','${coupon.couponId}')">
            <div class="coupon-l">
            <span class="pull-left re left10">
                <font class="f20 bottomer">￥</font>
                <font class="f60 impact">${coupon.couponPrice}</font>
                <font class="f12 bottomer1 left10">优惠券</font>
            </span>

            </div>
            <div  class="coupon-r">
                <p><span class="f20 white text-center heiti left10 padding5">${coupon.couponTitle}</span></p>
                <p class="f16 top5 white text-left heiti">过期时间：${coupon.endTimeStr?string("yyyy-MM-dd")}</p>
            </div>
            <div  id="recoupon" class="coupon-btn-box" onclick="receiveCoupon('${coupon.storeId }','${coupon.couponId}')" />领取优惠劵</div>
        </div>
        
            </#list>
             </#if>
        <#--coupon-list-wrap end -->

      

    </div>
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
                if (data.success) {
                layer.open({content: data.msg, time: 1});
                    //layer.msg(data.msg, {icon: 1, time: 1000}, function () {
                   //     $("#recoupon").val("已领取");
                  //  });
                } else {
              if('请先登录'== data.msg){
		                 window.location.href="${base}/m/index/login";
		                 return false;
		         }
   					layer.open({content: data.msg, time: 1});
               //  layer.msg(data.msg, {icon: 2, time: 1000}, function () {});
                }
            }
        });
    }
</script>
</body>
</html>

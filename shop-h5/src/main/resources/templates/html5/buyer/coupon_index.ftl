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
<link href="${base}/res/html5/css/bootstrap.min.css" type=text/css rel=stylesheet>
<link href="${base}/res/html5/css/reset.css" type=text/css rel=stylesheet>
<link href="${base}/res/html5/css/base.css" type=text/css rel=stylesheet>
<script src="${base}/res/html5/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${base}/res/html5/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${base}/res/html5/js/jQuery.fontFlex.js" type="text/javascript"></script>
<script src="${base}/res/html5/js/font.js" type="text/javascript"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
</head>
<style>
    .coupon_list{position:relative;text-align:center;margin-top:10px;height:100px}
    .coupon_img{position:absolute;top:0;left:0;display:inline-block;width:90%;height:100px;margin:0 5%;}
    .coupon_img img{width:100%;height:100px;}
    .coupon_con{position:absolute;top:0;left:5%;width:90%}
    .coupon_con p{color:#fff;}
    .coupon_con .coupon_con_img{width:80px;height:80px;float:left;margin:10px}
    .coupon_con .coupon_con_img img{width:80px;height:80px;}
    .coupon_con .coupon_con_p{float:right;margin-right:10px;width:170px;height:100px}
    .coupon_con .coupon_con_p .title{margin-top:20px}
    .titlecon{font-size:12px;margin-top:30px}
</style>
<body>
<div class="container-fluid tcolor bgtop">
	<div class="row padding5 stitle">
    <div class="col-sm-3 col-xs-3">
    	<a href="${base}/m/authc/buyer/center" class="f36"><i class="glyphicon glyphicon-menu-left tcolor"></i></a>
    </div>
    <div class="col-sm-6  col-xs-6 text-center">
    	 <span class="f36">优惠卷</span>
    </div>
    </div>
</div>

<div class="container-fluid bgwhite text-center">
	<div class="row juantab rowborder padding10">
    	<div <#if couponIsUser == "0">class="col-xs-4 col-sm-4 cur"<#else> class="col-xs-4 col-sm-4"</#if> >
        	<a href="${base}/m/authc/buyer/couponIndex?couponIsUser=0" class="f26" >未使用</a>
        </div>
        <div <#if couponIsUser == "1">class="col-xs-4 col-sm-4 cur"<#else> class="col-xs-4 col-sm-4"</#if> >
        	<a href="${base}/m/authc/buyer/couponIndex?couponIsUser=1" class="f26">已使用</a>
        </div>
        <div <#if couponIsUser == "2">class="col-xs-4 col-sm-4 cur"<#else> class="col-xs-4 col-sm-4"</#if> >
        	<a href="${base}/m/authc/buyer/couponIndex?couponIsUser=2" class="f26">已过期</a>
        </div>
    </div>
</div>


<div id="dataListDiv"> 

   </div>
<script type="text/javascript">
 
$(function(){
	initDataList();
});
/*界面初始化*/
function initDataList(){
    $.ajax({
        async:false,
        url:"${base}/m/authc/buyer/coupon_portion",//默认加载coupon_portion 页面
        data:{
        	 couponIsUser:"${couponIsUser}",
        	 time:"${time}"
        	 },
        error:function(){
        	 layer.open({content: '通信失败', time: 1});
        },
        dataType:'html',
        type: "POST",
        contentType:"application/x-www-form-urlencoded; charset=utf-8",
        success: function(data){
            $("#dataListDiv").empty();
            $("#dataListDiv").html(data);
            $("#dataListDiv").hide();
            $("#dataListDiv").fadeIn(300);
        }
    });
}
</script>
</body>
</html>

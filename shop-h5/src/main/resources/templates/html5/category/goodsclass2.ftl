
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <title>分类</title>
    <link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
    <script>
        jQuery(document).ready(function(e) {
            jQuery(".category_center_list li").click(function(){
                var id = jQuery(this).attr("id");
                var mark = jQuery(this).attr("mark");
                if(mark=="true"){
                    jQuery(this).find("img").attr("src","${base}/res/html5/images/search_on_bg.png");
                    jQuery("#class2_"+id).fadeOut();
                    jQuery(this).attr("mark","false");
                }else{
                    jQuery(this).find("img").attr("src","${base}/res/html5/images/search_off_bg.png");
                    jQuery("#class2_"+id).fadeIn();
                    jQuery(this).attr("mark","true");
                }
            })
        });
    </script>
</head>
<body class="index_bg">
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>类别分类<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<#--左侧菜单-->
<div id="left_Menu">
    <div class="ot-menu" id="scroller" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
        <ul>
        <#assign goodsClassTag =newTag("goodsClassTag")>
        <#assign goodsList =goodsClassTag("")>
        <#if goodsList?exists && goodsList?size gt 0>
            <#list goodsList as class>
                <#if (class_index==0)>
                    <#assign gcIdVar =class.gcId>
                    <li id="${class.gcId}" advid="class5" class="active"><a onclick="bna('${class.gcId}',this)">${class.gcName}</a></li>
                </#if>
                <#if (class_index>0)>
                    <li id="${class.gcId}" advid="class5" class=""><a onclick="bna('${class.gcId}',this)">${class.gcName}</a></li>
                </#if>
            </#list>
        </#if>
        </ul>
    </div>
</div>
<#--右侧菜单-->
<div id="right_Menu" class="ot-maininfo">
    <div style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);" id="scroller2">
        <!--新品上市-->
        <div class="r_menu_box">
            <ul id="ban">

            </ul>
        </div>
    </div>
</div>
<!--底部-->
<@f.foot/>
<!--按钮-->
</div>
<script>

bna(${gcIdVar});
function bna(type,obj) {
$(obj).parent().addClass('active').siblings().removeClass('active');
var lodingHtml = '<div class="tac" style="text-align:center;margin-top:30px"><img src="${base}/res/loading.gif"></div>' , _timer = null;
$.ajax({
url :"${base!}/m/category/goodsList2",
data : {
"order" : type
},
type : 'post',
dataType : 'text',
beforeSend:function(){
$("#ban").html(lodingHtml);
clearTimeout(_timer);

},
success : function(result) {
_timer = setTimeout(function(){
$("#ban").html(result);

}, 300);
}
});
}
</script>



</body>
</html>

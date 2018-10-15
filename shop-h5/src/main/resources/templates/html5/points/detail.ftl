<!doctype html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,maximum-scale=1" charset="UTF-8">
<title>积分中心</title>
<link type="text/css" href="${base}/res/html5/points/css/reset.css" rel="stylesheet"/>
<link type="text/css" href="${base}/res/html5/points/css/detail.css" rel="stylesheet"/>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="${base}/res/html5/points/js/jquery.touchSlider.js"></script>
<!-- 手机端弹出框开始 -->
<script src="${base}/res/html5/js/mobile/layer.m.js" charset="utf-8"></script>
<!-- 手机端弹出框结束 -->
<link rel="stylesheet" type="text/css" href="${base}/res/css/css.css">
<link rel="stylesheet" href="${base}/res/css/swiper-3.4.0.min.css">
<script src="${base}/res/js/swiper-3.4.0.jquery.min.js"></script>
</head>
<body>
<#assign pointsGoodsTag = newTag("pointsGoodsTag") />
<#assign pointsGoods = pointsGoodsTag("{'id':'${id}'}") />
<#assign dateFormatTag = newTag("dateFormatTag") />
<#assign hotPointsGoodsTag = newTag("hotPointsGoodsTag") />
<#assign hotPointsOrderGoods = hotPointsGoodsTag("{'id':'${pointsGoods.id }'}") />
<div class="user_bar"><a class="back" href="${base}/points/html5PointsIndex"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" style="margin-top:10px"/></a><span class="fl">积分兑换商品详情</span></div>
<!--轮播图片start-->
<div class="swiper-container" style="margin-top:45px">
    <div class="swiper-wrapper">
		<div class="swiper-slide"><a href="${pointsGoods.pointsGoodsImage}"><img src="${imgServer}${pointsGoods.pointsGoodsImage}" style="width:100%"></a></div>
    </div>
    <!-- 如果需要分页器 -->
    <div class="swiper-pagination"></div>
</div>
<script>
    var mySwiper = new Swiper('.swiper-container',{
        autoplay : 2000,
        autoplayDisableOnInteraction : false,
        pagination : '.swiper-pagination',
        paginationClickable :true,
        loop : true,
    })
</script>
<!--轮播图片end-->

<!--轮播图片end-->
<div class="biaoti">
	所需积分:<span>&nbsp ${pointsGoods.pointsnums}积分</span><span>&nbsp V${pointsGoods.memberGradeId }会员</span>
</div>
<div class="jiage">
	<p>
		商品名称:<b>${pointsGoods.pointsGoodsName}</b>
	</p>
	<p>
		市场价格:<b><strike>${pointsGoods.pointsGoodsStorePrice}</strike>   |   礼品编号：${pointsGoods.pointsGoodsSerial}</b>
	</p>
    <#if pointsGoods.pointsGoodsStarttime??&&pointsGoods.pointsGoodsEndtime?? >
    <#assign pointsGoodsStarttime = dateFormatTag("{'date':'${pointsGoods.pointsGoodsStarttime }'}") />
    <#assign pointsGoodsEndtime = dateFormatTag("{'date':'${pointsGoods.pointsGoodsEndtime }'}") />
		<p>兑换开始:${pointsGoodsStarttime }至${pointsGoodsEndtime }</p>
	</#if>
	<p>
	剩余数量:
		<#if pointsGoods.pointsGoodsStorage??>
			<#if hotPointsOrderGoods?? && (hotPointsOrderGoods!="null") && (hotPointsOrderGoods!="")>
				${pointsGoods.pointsGoodsStorage-hotPointsOrderGoods.pointGoodscount}
				<input type="hidden" id="storagenum" 
					value="${pointsGoods.pointsGoodsStorage-hotPointsOrderGoods.pointGoodscount }"/>
			<#else>
				${pointsGoods.pointsGoodsStorage}
				<input type="hidden" id="storagenum" value="${pointsGoods.pointsGoodsStorage}"/>
			</#if>
		<#else>
			暂无
		</#if>
	</p>
	<p>	
		每个会员最多兑换:<b>${pointsGoods.exchangeCount}个</b>
		<input name="limitnum" type="hidden" class="text" id="limitnum" value='${pointsGoods.exchangeCount}' size="4"/>
	</p>
	<div class="num">
        <p>兑换数量:<span class="jian">-</span><input class="put"  type="text"  name="exnum"  id="exnum" value='1' size="4"/><span class="add">+</span></p>
	</div>

    <div class="xiangqing">
        <h2 style="font-size: 18px;padding-bottom:10px">礼品介绍</h2>
        <P>${pointsGoods.pointsGoodsBody }</P>
    </div>
</div>
<#--按钮-->
<div class="button">
	<#assign nowTime=.now?long/>
		<#if pointsGoods.pointsGoodsShow==0>
			<input name= "anniu" type="button"  disabled="disabled" value="商品已下架"/>
		<#elseif  pointsGoods.pointsGoodsStorage?? && hotPointsOrderGoods?? && (hotPointsOrderGoods!="")
		&& (pointsGoods.pointsGoodsStorage==hotPointsOrderGoods.pointGoodscount)>
			<input name= "anniu" type="button"  disabled="disabled" value="商品已售罄">
		<#elseif ((pointsGoods.pointsGoodsStarttime &gt;=nowTime) ||
		(pointsGoods.pointsGoodsEndtime &lt;=nowTime))	&&
		(pointsGoods.pointsGoodsEndtime??)>
			<input name= "anniu" type="button"  disabled="disabled" value="非活动时间">
		<#else>
			<input name= "anniu" type="button"  value="我要兑换" onclick="add_to_cart();" >
		</#if>
</div>
<#--按钮-->
<#--购物车加减数量-->
<script>
    $('.add').on('click',function(){
        var $total = $('.put');
        var num = parseInt($total.val());
        num++;
        $total.val(num);

    });
    $('.jian').on('click',function(){
        var $total = $('.put');
        var num = parseInt($total.val());
        if(num > 1){
            num--;
            $total.val(num);

        }else{
            num = 1;
            $total.val(num);
        }
    });
</script>
<#--加入购物车-->
<script type="text/javascript">
var isLogin = false;
<@shiro.user>
	isLogin = true;
</@shiro.user>
function add_to_cart(){
	if(!isLogin){
		layer.open({content:'请先登录', time: 1});
		location.href="${base}/m/index/login";
	}else{
		var storagenum = parseInt($("#storagenum").val());//库存数量
		var limitnum = parseInt($("#limitnum").val());//限制兑换数量
		var quantity = parseInt($("#exnum").val());//兑换数量	
		//验证数量是否合法
		var checkresult = true;
		var msg = '';
		if(!quantity >=1 ){//如果兑换数量小于1则重新设置兑换数量为1
			quantity = 1;
		}
		if(limitnum > 0 && quantity > limitnum){
			checkresult = false;
			msg = '兑换数量不能大于限兑数量';
		}
		if(storagenum > 0 && quantity > storagenum){
			checkresult = false;
			msg = '兑换数量不能大于剩余数量';
		}
		if(checkresult == false){
			layer.open({content:msg, time: 1});
			//layer.alert(msg,{icon:2});
			return false;
		}else{
			//异步地址
			var url = '${base}/points/addCart';
			//参数
			var args = {"shopPointsGoodsId":'${pointsGoods.id}',"pointsGoodsNum":quantity};
			//异步加载table
			$.post(url, args, function(result){
				if(result.result=='true'){
					//layer.open({content:'加入购物车成功', time: 1});
					window.location.href = '${base}/points/pointsCart';
				}else{
					layer.open({content:result.msg, time: 1});
					//layer.alert(result.msg,{icon:2});
				}
				return false;
			});
			
		}
	}
}
</script> 
</body>
</html>

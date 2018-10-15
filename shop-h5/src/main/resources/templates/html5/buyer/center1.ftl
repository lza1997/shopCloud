<!doctype html>
<html>
<head>
	<title>甜园云家-用户中心</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="${base}/res/css/css.css">
	<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="apple-wap-web-app-capable" content="yes">
    <meta name="apple-wap-web-app-status-bar-style" content="black-translucent">
<!-- 清除缓存 -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<!-- 清除缓存 -->
	 <script src="${base}/res/js/jquery.js"></script>
    <script type="text/javascript">
    	;!function(window){
			var win=window,
				doc=win.document,
				docEle=doc.documentElement,
				objhtml=doc.getElementsByTagName('html')[0],
				width=docEle.clientWidth,
				size='fontSize',
				html=function(obj,key,value){return obj.style[key]=value+'px';};
				html(objhtml,size,width/7.5);
			win.onresize=function(){
				var objDoc=win.document,
					objDocEle=objDoc.documentElement,
					objHtml=objDoc.getElementsByTagName('html')[0],
					objWidth=objDocEle.clientWidth;
				html(objHtml,size,objWidth/7.5);
			};
		}(window);
    </script>
</head>
<body style="background:#f7f7f7">
	<div id="user_banner">
		<div class="user_background">
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="banner_bj"></div>
		<div class="user_banner_top">
			<a href="${base}/m/authc/buyer/serviceCenter"><img src="${base}/res/images/user_icon_081.png"></a>
			<a href="${base}/m/index/index"><img src="${base}/res/images/layer_011.png"></a>
		</div>
		<div class="user_header">
		<#assign memberInfoTag =newTag("memberInfoTag")>
        <#assign member =memberInfoTag("")>
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
               <p class="name">${member.memberName}</p>
			</a>
		</div>
		<div class="user_list1">
			<ul>
				<li>
					<a href="${base}/m/authc/buyer/Collect_goods">
						<img src="${base}/res/images/star_bg1.png">
						<p>商品收藏</p>
					</a>
				</li>
				<li>
					<a href="${base}/m/authc/buyer/Collect_shop">
						<img src="${base}/res/images/user_icon_041.png">
						<p>店铺收藏</p>
					</a>
				</li>
				<li>
					<a href="${base}/m/authc/buyer/myFootprint">
						<img src="${base}/res/images/goods-browse_w.png">
						<p>我的足迹</p>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="user_zichan">
		<div class="user_zichantitle">
			<a href="${base}/m/authc/buyer/orderList?orderState=99"><img src="${base}/res/images/mc_01.png"></a>
			<a href="${base}/m/authc/buyer/orderList?orderState=99"><span>我的订单</span></a>
		</div>
		<ul class="user_zichanliste">
			<li><a href="${base}/m/authc/buyer/orderList?orderState=10">
					<img src="${base}/res/images/user_icon_01.png">
					<p>未付款</p>
					<b>${member.noPayOrder}</b>
				</a>
			</li>
			<li>
				<a href="${base}/m/authc/buyer/orderList?orderState=20">
					<img src="${base}/res/images/user_icon_02.png">
					<p>未发货</p>
					 <b>${member.noFilledOrder}</b>
				</a>
			</li>
			<li>
				<a href="${base}/m/authc/buyer/orderList?orderState=30&lockState=0">
					<img src="${base}/res/images/user_icon_03.png">
					<p>未收货</p>
					  <b>${member.noReceiveOrder}</b>
				</a>
			</li>
			<li>
				<a href="${base}/m/authc/buyer/orderList?orderState=40">
					<img src="${base}/res/images/user_icon_05.png">
					<p>已收货</p>
				</a>
			</li>
			<li>
				<a href="${base}/m/authc/buyer/returnList">
					<img src="${base}/res/images/user_icon_04.png">
					<p>退换货</p>
				</a>
			</li>
		</ul>
	</div>
	<div class="user_zichan">
		<div class="user_zichantitle">
			<img src="${base}/res/images/mc_02.png">
			<span>我的财产</span>
		</div>
		<ul class="user_zichanliste user_zichanliste1">
			<li>
				<a href="${base}/m/authc/buyer/couponIndex">
					<img src="${base}/res/images/mcc_08_b.png">
					<p>优惠券</p>
				</a>
			</li>
			<li>
				<a href="${base}/points/myPointsIndex">
					<img src="${base}/res/images/mcc_10_b.png">
					<p>积分</p>
				</a>
			</li>
			<!--<li>
				<a href="">
					<img src="${base}/res/images/mcc_09_b.png">
					<p>红包</p>
				</a>
			</li>
			<li>

                </p>
					<img src="${base}/res/images/mcc_06_b.png">
					<p>可用额</p>
				</a>
			</li>
			-->
			<li>

				<a href="${base}/m/authc/buyer/predeposit">
					<img src="${base}/res/images/mcc_07_b.png">
					<p>余额充值</p>
				</a>
			</li>
		</ul>
	</div>
	<div class="user_zichan">
		<a href="${base}/m/authc/buyer/address">
			<div class="user_zichantitle">
				<img src="${base}/res/images/mc_03.png">
				<span>收货地址管理</span>
			</div>
		</a>
	</div>
	<div class="user_zichan">
		<a href="${base}/m/authc/buyer/editPassword">
			<div class="user_zichantitle">
				<img src="${base}/res/images/mc_04.png">
				<span>用户设置</span>
			</div>
        </a>
	</div>
	<@f.foot/>

    <script type="text/javascript">
	$('.user_header').animate({top:'0.7rem'},1000);
    	var picTotal = 3,
    		no = 1,
    		banner_bj = $('.user_background li');
    	setInterval(function(){
    		$(banner_bj).eq(no).animate({opacity:'0'});
    		$(banner_bj).eq(no+1).animate({opacity:'1'});
    		no = (no+1)%picTotal;
    		if(no == 2){
    			$(banner_bj).eq(0).animate({opacity:'1'});
    		}
    	},2000)
    </script>

</body>
</html>
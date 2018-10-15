<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,inital-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<#--清除缓存	-->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
<#--清除缓存	-->
<title>订单详情 -</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
</head>
<body class="user_bg">
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<#if shopPointsOrder!=''>
<div class="order_page">
	<!--交易成功-->
	<table class="trade_table" cellpadding="0" cellspacing="0">
    	<tbody>
        	<tr>
            	<td class="td_left"><img src="${base}/res/html5/images/order_info_01.png" width="30" height="30" /></td>
                <td>
                	<ul>
                		<#if shopPointsOrder.pointOrderstate==60>
		                    <li class="big"><span class="fl">订单已取消</span></li>
		                <#elseif shopPointsOrder.pointOrderstate==10>
	                    	<li class="big"><span class="fl">待买家付款</span></li>
		                <#elseif shopPointsOrder.pointOrderstate==20>
		                    <li class="big"><span class="fl">买家已付款</span></li>
		                <#elseif shopPointsOrder.pointOrderstate==30>
		                	<li class="big"><span class="fl">卖家已发货</span></li>
		                <#elseif shopPointsOrder.pointOrderstate==40>
		                	<li class="big"><span class="fl">买家已收货</span></li>
		                <#elseif shopPointsOrder.pointOrderstate==50>
		                	<li class="big"><span class="fl">交易完成</span></li>>
		                </#if>
                        <li>运费价格：
                        	<b>¥
								<script type="text/javascript">
	              					var shippingFee = number_format(${shopPointsOrder.shippingFee},2);
	              					document.write(shippingFee);
	              				</script>
							</b>
                        </li>
                        <#assign dateFormatTag = newTag("dateFormatTag")/>
  						<#assign  pointAddtime= dateFormatTag("{'date':'${shopPointsOrder.pointAddtime }'}")/>
                        <li>下单时间：${pointAddtime}</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
	<!--收货人-->
	<#assign pointsOrderAddressTag = newTag("pointsOrderAddressTag")/>
	<#assign pointsorderAddress = pointsOrderAddressTag('{"orderid":"${shopPointsOrder.pointOrderid }"}')/>
	<#if pointsorderAddress??>
    <table class="trade_table cnee_table" cellpadding="0" cellspacing="0">
    	<tbody>
        	<tr>
            	<td class="td_left"><img src="${base}/res/html5/images/order_info_02.png" width="30" height="30" /></td>
                <td>
                	<ul>
	                    	<li class="big">
		                    	<span class="fl">收货人: ${pointsorderAddress.pointTruename}</span>
		                    	<span class="fr">${pointsorderAddress.pointMobphone}</span>
	                    	</li>
	                        <li>收货地址：${pointsorderAddress.pointAreainfo}&nbsp;&nbsp;${pointsorderAddress.pointAddress}</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    </#if>
	<div class="order_page_box">
    	<h1><span class="fl">订单号：${shopPointsOrder.pointOrdersn}</span></h1>
    	<#assign pointsOrderGoodsTag = newTag("pointsOrderGoodsTag")/>
		<#assign orderGoodsList = pointsOrderGoodsTag('{"orderid":"${shopPointsOrder.id }"}')/>
		<#if orderGoodsList?size gt 0>
			<#list orderGoodsList as orderGoods>
				<div class="order_goods">
			       	<div class="dt">
				       	<a href="points/pointsDetail?id=${orderGoods.pointGoodsid}">
				       		<img src="${imgServer}${orderGoods.pointGoodsimage}" width="50" height="50" />
				       	</a>
			       	</div>
			        <ul>
				        <li>
					        <b>
					        	单价：${orderGoods.pointGoodspoints}分
					        </b>
				        </li>
				        <li>X ${orderGoods.pointGoodsnum}</li>
				        <li>
					        <b>小计： 
					        	<script type="text/javascript">
	              					var goodsAmount = number_format(${orderGoods.pointGoodspoints}*${orderGoods.pointGoodsnum},2);
	              					document.write(goodsAmount);
	              				</script>分
					        </b>
				        </li>
			        </ul>
			        <div class="dd dd_01">
				        <span class="name">
				        	<a href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}" title="${orderGoods.goodsName}">${orderGoods.pointGoodsname}...</a>
				        </span>
				        <span class="size"> </span>
			        </div>
		        </div>  
		        </#list>  
		        </#if>
    </div>
    </div>
    </#if>
</body>
</html>

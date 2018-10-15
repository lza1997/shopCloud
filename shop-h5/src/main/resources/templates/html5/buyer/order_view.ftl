
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
<title>订单详情 - 瑞华信通 B2B2C V3.0 2015版商城系统</title>
<link href="${base}/res/html5/css/style.css" rel="stylesheet" type="text/css" />
<script src="${base}/res/html5/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="${base}/res/js/utils.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common.js" charset="utf-8"></script>
</head>
<body class="user_bg">
<!-- <div class="user_bar"><a class="back" href="${base}/m/authc/buyer/orderList?type=order_nopay"><img src="${base}/res/html5/images/back_black.png" width="30" height="30" /></a><span class="fl">订单详情</span> <input class="del" type="button" id="cond" value="取消订单"> </div> -->
<#assign orderDetailTag = newTag("orderDetailTag")/>
<#assign order = orderDetailTag("{'orderId':'${orderId}'}") />   
<div class="phone_hd"><a class="back" href="javascript:history.go(-1);"><img src="${base}/res/html5/images/back.png" width="25" height="25" /></a>返回<a class="menu home" href="${base}/m/index/index"><img src="${base}/res/html5/images/home.png" width="25" height="25" /></a></div>
<div class="order_page">
	<!--交易成功-->
	<table class="trade_table" cellpadding="0" cellspacing="0">
    	<tbody>
        	<tr>
            	<td class="td_left"><img src="${base}/res/html5/images/order_info_01.png" width="30" height="30" /></td>
                <td>
                	<ul>
                		<#if order.orderState==0>
		                    <li class="big"><span class="fl">订单已取消</span></li>
		                <#elseif order.orderState==10>
	                    	<li class="big"><span class="fl">待买家付款</span></li>
		                <#elseif order.orderState==20>
		                    <li class="big"><span class="fl">买家已付款</span></li>
		                <#elseif order.orderState==30>
		                	<li class="big"><span class="fl">卖家已发货</span></li>
		                <#elseif order.orderState==40>
		                	<li class="big"><span class="fl">交易完成</span></li>
		                <#elseif order.orderState==50>
		                	<li class="big"><span class="fl">已提交，待确认</span></li>
		                <#elseif order.orderState==60>
		                	<li class="big"><span class="fl">已确认，待发货</span></li>
		                </#if>
                        <li>订单总价：
                        	<b>¥
								<script type="text/javascript">
	              					var amount = number_format(${order.orderAmount},2);
	              					document.write(amount);
	              				</script>
							</b>
                        </li>
                        <li>支付方式：${order.paymentName }</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
	<!--收货人-->
    <table class="trade_table cnee_table" cellpadding="0" cellspacing="0">
    	<tbody>
        	<tr>
            	<td class="td_left"><img src="${base}/res/html5/images/order_info_02.png" width="30" height="30" /></td>
                <td>
                	<ul>
	                    	<li class="big">
		                    	<span class="fl">收货人: ${order.address.trueName}	</span>
		                    	<span class="fr">${order.address.mobPhone}</span>
	                    	</li>
	                        <li>收货地址：${order.address.areaInfo}</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    

	
	<div class="order_page_box">
    	<h1><span class="fl">订单号：${order.orderSn}</span></h1>
    	<#if order.orderGoodsList?size gt 0>
			<#list order.orderGoodsList as orderGoods>
				<div class="order_goods">
			       	<div class="dt">
				       	<a href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}">
				       		<img src="${imgServer}${orderGoods.goodsImage}" width="50" height="50" />
				       	</a>
			       	</div>
			        <ul>
				        <li>
					        <b>单价：¥ 
					        	<script type="text/javascript">
	              					var price = number_format(${orderGoods.goodsPrice},2);
	              					document.write(price);
	              				</script>
					        </b>
				        </li>
				        <li>X ${orderGoods.goodsNum}</li>
				        <li>
					        <b>小计：¥ 
					        	<script type="text/javascript">
	              					var goodsAmount = number_format(${orderGoods.goodsPrice}*${orderGoods.goodsNum},2);
	              					document.write(goodsAmount);
	              				</script>
					        </b>
				        </li>
			        </ul>
			        <div class="dd dd_01">
				        <span class="name">
				        	<a href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}" title="${orderGoods.goodsName}">${orderGoods.goodsName}</a>
				        </span>
				        <span class="size"> </span>
			        </div>
		        </div>    
	       	</#list>
		</#if>        
                
            <!--             <table class="fre_table" cellpadding="0" cellspacing="0">
        	<tbody>
            	<tr>
                	<td width="50%" align="left">运费：</td>
                    <td align="right">￥ 0.00</td>
                </tr>
                
                <tr>
                	<td align="left"><span class="big">实付款：</span></td>
                    <td align="right"><span class="big red">￥ 327.40</span></td>
                </tr>
            </tbody>
        </table> -->
        
    </div>
        </div>
<!--订单详细底部-->

</body>
</html>

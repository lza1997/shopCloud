		<#assign pointsOrderTag = newTag("pointsOrderTag")/>
		<#assign pointsOrderGoodsTag = newTag("pointsOrderGoodsTag")/>
		<#assign dateFormatTag = newTag("dateFormatTag")/>
		<#assign orderLists = pointsOrderTag("{'orderSn':'${orderSn}','startTime':'${startTime}','endTime':'${endTime}','orderState':'${orderState}','returnDataType':'2','pageNo':'${pageNo}','pageSize':'${pageSize}'}") />
		<#if orderLists??>
     	<#list orderLists as order>
	    	<h1><span class="fl">订单号：${order.pointOrdersn}</span>
	    	<#if order.pointOrderstate==60>
	   			<span class="fr">订单已取消</span></h1>
	   		<#elseif order.pointOrderstate==10>
	   			<span class="fr">待买家付款</span></h1>
	   		<#elseif order.pointOrderstate==20>
	   			<span class="fr">买家已付款</span></h1>
	   		<#elseif order.pointOrderstate==30>
	   			<span class="fr">卖家已发货</span></h1>
	   		<#elseif order.pointOrderstate==40>
	   			<span class="fr">买家已收货</span></h1>
	   		<#elseif order.pointOrderstate==50>
	   			<span class="fr">订单已完成</span></h1>
		    </#if>			
    	    <#assign orderGoodsLists = pointsOrderGoodsTag("{'orderid':'${order.id }'}") />
			<#if orderGoodsLists?size gt 0>
		    <#assign rowsize = orderGoodsLists?size>
	 			<#list orderGoodsLists as orderGoods>
					<div class="order_goods_much" >
						<div style="width: 80px; float: left;">
				   			<a href="${base}/points/pointsDetail?id=${orderGoods.pointGoodsid}">
				           		<img src="${imgServer}${orderGoods.pointGoodsimage}" width="50" height="50" />
				            </a>
			       		</div>
			   			<div style=" float: left;">
			        		<a href="${base}/points/pointsDetail?id=${orderGoods.pointGoodsid}">
			        			<span style="line-height: 24px">${orderGoods.pointGoodsname}</span>
			        		</a><br>
			  			</div>	        			
					</div> 	            	
				</#list>
			</#if>
	        <div class="order_total">
		        共 ${order.pointAllpoint} 分 
				<#if order.shippingFee??>
					<#if order.shippingFee!=0>
						运费：
						<b>¥${order.shippingFee}</b>
					<#else>
             			<b>免运费</b>
	          		</#if>
          		</#if>
			</div>
	        <div class="order_box_bt">
		        <a href="${base}/points/user/html5/orderdetail?orderId=${order.id}" >查看订单</a>
		        <#if order.pointOrderstate==10>
		        	<a href="javascript:void(0)" onclick="cancelOrder('${order.pointOrdersn}','${order.id}')">取消订单</a>
					<a class="bg_orange" href="">付款</a>
		        <#elseif order.pointOrderstate==30>
		        	<a class="bg_orange" href="javascript:void(0)"  onclick="finishOrder('${order.pointOrdersn}','${order.id }')" >确认收货</a>
		        </#if>
	    	</div>
			</#list>
			</#if>
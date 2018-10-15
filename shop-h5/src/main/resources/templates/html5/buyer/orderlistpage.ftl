	<#assign orderTag = newTag("orderTag")/>
	<#assign orderLists = orderTag("{'orderSn':'${orderSn}','startTime':'${startTime}','endTime':'${endTime}','orderState':'${orderState}','returnDataType':'2','pageNo':'${pageNo}','pageSize':'${pageSize}'}") />
    	<#if orderLists??>
	   	    <#list orderLists as order>
            <div style="background: #f7f7f7;margin-bottom:5px" class="newdata">
		    	<h1><span class="fl">订单号：${order.orderSn}</span>
		    	<#assign orderState = order.orderState/>
		    	<#if orderState??>
			    	<#if order.lockState!=0>
			    		<span class="fr">订单退换货中</span></h1>
			    	<#elseif orderState==10>
			    		<span class="fr">待买家付款</span></h1>
			    	<#elseif orderState==20>
			    		<span class="fr">买家已付款</span></h1>
			    	<#elseif orderState==30>
			    		<span class="fr">卖家已发货</span></h1>
			    	<#elseif orderState==40>
			    		<span class="fr">买家已收货</span></h1>
			    	<#elseif orderState==50>
			    		<span class="fr">等待卖家确认</span></h1>
			    	<#elseif orderState==60>
			    		<span class="fr">确认成功</span></h1>
			    	<#elseif orderState==0>
			    		<span class="fr">订单已取消</span></h1>
			    	</#if>
		    	</#if>
            	<#if order.orderGoodsList?size gt 0>
	      			<#assign rowsize = 0>
		  				<#list order.orderGoodsList as orderGoods>
		  					<#assign rowsize = rowsize + orderGoods.goodsNum>
			            	<div class="order_goods_much" >
			        			<div style="width: 80px; float: left;">
				          			<a href="${base}/m/goods/goodsdetail?id=${orderGoods.goodsId}">
						            	<img src="${imgServer}${orderGoods.goodsImage}" width="50" height="50" />
						            </a>
					       		</div>
			        			<div style=" float: left;">
				            		<span style="line-height: 24px">${orderGoods.goodsName}</span><br>
				           		    <#if orderState??>
							            <#if order.orderState==40&& orderGoods.evaluationStatus == 0&&order.lockState==0>
					                		<a href="${base}/m/authc/buyer/reviews?orderSn=${order.orderSn}&recId=${orderGoods.recId}"  style="color:red;">我要评价</a>
					                	<#elseif orderGoods.evaluationStatus == 1>
					                		已评价
					                	</#if>
					            	</#if>
						            <#if (order.orderState==30||order.orderState==40)&&(orderGoods.goodsReturnNum==0||orderGoods.goodsReturnNum==null)&&order.lockState==0>
				                		<a href="${base}/m/authc/buyer/returnOrderIndex?orderGoodsId=${orderGoods.recId}" >退货</a>
				                	</#if>
				                	<#if (order.orderState==30||order.orderState==40)&&(orderGoods.goodsReturnNum!=0&&orderGoods.goodsReturnNum!=null)&&order.lockState==1>
				                		<a href="${base}/m/authc/buyer/returnList" >查询</a>
				                	</#if>

			       			    </div>
		      				</div> 
			            </#list>
			   </#if>
		        <div class="order_total">共 ${rowsize} 件商品 实付：<b>¥ ${order.orderAmount}</b></div>
		        <div class="order_box_bt">
		        <#if orderState??>
			    	<#if orderState==10>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>
				        <!--<a href="${base}/m/authc/buyer/shipDetail" >查看物流</a>-->
				        <a href="${base}/m/authc/buyer/cancelOrderIndex?orderSn=${order.orderSn}"  >取消订单</a>
				        <a class="bg_orange" href="${base}/weChatpayment/submitOrder?paySn=${order.paySn}&ordersAmount=${order.orderAmount}&paytype=1">付款</a>
		    		<#elseif orderState==20>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>
			    		<!-- <#if order.refundLog??>
      						<#if order.refundLog.refundState == 1>
								<a class="bg_orange" href="javascript:void(0)" >退款审核中</a></p>
							<#elseif order.refundLog.refundState == 2>
								<a class="bg_orange" href="javascript:void(0)" >退款
									<script type="text/javascript">
		              					var refund = number_format(${order.refundLog.orderRefund},2);
		              					document.write(refund);
             							</script>
             						</a>
							</#if>
						<#else>
							<a class="bg_orange" href="${base}/m/authc/buyer/refundOrderIndex?orderId=${order.orderId}">退款</a>
							</#if> -->
					<#elseif orderState==30>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>
			    		<#if order.lockState==0>
			    			<a class="bg_orange" href="${base}/m/authc/buyer/finishOrderIndex?orderSn=${order.orderSn}" >确认收货</a>
			    		</#if>
			    			<!-- <#if order.refundLog??>
	      						<#if order.refundLog.refundState == 1>
									<a class="bg_orange" href="javascript:void(0)" >退款审核中</a></p>
								<#elseif order.refundLog.refundState == 2>
									<a class="bg_orange" href="javascript:void(0)" >退款
										<script type="text/javascript">
			              					var refund = number_format(${order.refundLog.orderRefund},2);
			              					document.write(refund);
              							</script>
              						</a>
								</#if>
							<#else>
								<a class="bg_orange" href="${base}/m/authc/buyer/refundOrderIndex?orderId=${order.orderId}">退款</a>
 							</#if>
 							<#if order.returnOrder??>
 									<#if order.returnOrder.returnState == 1>
 											<a class="bg_orange" href="javascript:void(0)" >退货审核中</a>
 									<#elseif order.returnOrder.returnState == 2>
 								
 									</#if>
 								<#else>
		                		<a class="bg_orange" href="${base}/m/authc/buyer/returnOrderIndex?orderId=${order.orderId}" >退货</a>        	
					       	</#if> -->
		    		<#elseif orderState==40>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>	
		    		<#elseif orderState==50>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>
					<#elseif orderState==60>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>
			    	<#elseif orderState==0>
			    		<a href="${base}/m/authc/buyer/orderView?orderId=${order.orderId}" >查看订单</a>   
		    	</#if>
		    	</#if>
		    	</div>
            </div>
			</#list>
   		</#if>
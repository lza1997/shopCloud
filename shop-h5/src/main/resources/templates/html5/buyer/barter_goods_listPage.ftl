	        	<#if list??>
        			<#list list as shopbarter>
				        <div class="item">
				            <p class="title">订单编号：${shopbarter.orderSn}</p>
				            <p class="title">换货编号：${shopbarter.barterSn}</p>
				            <div class="content">
				                <a href="${base}/m/authc/buyer/barterDetail?barterId=${shopbarter.barterId}">
				                    <p>店铺名称：${shopbarter.storeName}</p>
				                    <p>换货数量：${shopbarter.goodsNum}</p>
				                    <p>换货时间：${shopbarter.createTimeStr?string('yyyy-MM-dd')}</p>
				                    <p>审核状态：
				                    	<#if shopbarter.sellerState==20>
	        								待审核
	        							<#elseif shopbarter.sellerState==30>
	        								同意
	        							<#elseif shopbarter.sellerState==40>
	        								不同意
	        							</#if>
				                    </p>
				                    <p>物流状态：
				                    	<#if shopbarter.goodsState ??&& shopbarter.goodsState!=null>
		        							<#if shopbarter.goodsState==1>
		        								买家待发货
		        							<#elseif shopbarter.goodsState==2>
		        								待卖家收货
		        							<#elseif shopbarter.goodsState==3>
		        								卖家已收货
		        							<#elseif shopbarter.goodsState==4>
		        								买家待收货
		        							<#elseif shopbarter.goodsState==5>
		        								换货完成
		        							<#else>
		        							    暂无物流信息
		        							</#if>
	        							</#if>
				                    </p>
				                </a>
				                <p>
					                <a class="refund_btn" href="${base}/m/authc/buyer/barterDetail?barterId=${shopbarter.barterId}" target="_blank">查看</a>
					                <#if shopbarter.sellerState==30&&shopbarter.goodsState==1>
	       								<a class="refund_btn" href="${base}/m/authc/buyer/barterDeliveryIndex?barterId=${shopbarter.barterId}">发货</a>
	       							</#if>
	       							<#if shopbarter.goodsState==4>
	       								<a class="refund_btn" href="${base}/m/authc/buyer/finishBarterIndex?barterId=${shopbarter.barterId}"  >确认收货</a>
	       								<!-- <a class="refund_btn" href="javascript:void(0)" onclick="finishReturn('${shopbarter.barterId}')" >确认收货</a> -->
	       							</#if>
				                </p>
				            </div>
				        </div>
			        </#list>
		        </#if>
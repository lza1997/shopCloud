   	<#if list??>
   		<#list list as refundReturn>
	     <div class="item">
	         <p class="title">订单编号：${refundReturn.orderSn}</p>
	         <p class="title">退货编号：${refundReturn.refundSn}</p>
	         <div class="content">
	             <a href="${base}/m/authc/buyer/refundReturnDetail?refundId=${refundReturn.refundId}">
	                 <p>店铺名称：${refundReturn.storeName}</p>
	                 <p>退货数量：${refundReturn.goodsNum}</p>
	                 <p>退货时间：${refundReturn.createTimeStr?string('yyyy-MM-dd')}</p>
	                 <p>审核状态：
	                 	<#if refundReturn.sellerState==1>
	  								待审核
	  							<#elseif refundReturn.sellerState==2>
	  								同意
	  							<#elseif refundReturn.sellerState==3>
	  								不同意
	  							</#if>
	                 </p>
	                 <p>平台确认：
	                 	<#if refundReturn.refundState??>
	  								<#if refundReturn.refundState==1>
	  									未申请
	  								<#elseif refundReturn.refundState==2>
	  									待处理
	  								<#elseif refundReturn.refundState==3>
	  									已完成
	  								</#if>
	  							<#else>
	  								无
	  							</#if>
	                 </p>
	             </a>
	             <p>
		             <a class="refund_btn" href="${base}/m/authc/buyer/refundReturnDetail?refundId=${refundReturn.refundId}" target="_blank">查看</a>
		             <#if refundReturn.sellerState==2&&refundReturn.goodsState==1>
						<a class="refund_btn" href="${base}/m/authc/buyer/refundReturnDeliveryIndex?refundId=${refundReturn.refundId}">发货</a>
					 </#if>
					 <#if refundReturn.sellerState==5>
						<a class="refund_btn" href="javascript:void(0)" onclick="finishReturn('${refundReturn.refundId}')" >确认收款</a>
					 </#if>
	             </p>
	         </div>
	     </div>
    	</#list>
    </#if>

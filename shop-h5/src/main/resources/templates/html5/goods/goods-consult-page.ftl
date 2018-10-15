<#assign consultInfoTag =newTag("consultInfoTag")>
		<#assign consultInfo =consultInfoTag("{'goodsId':'${goodsId}','pageNo':'${pageNo}'}")>
		<#if consultInfo?size gt 0>
			<#list consultInfo.result as consult>
			    	<h1><span class="fl">
			    		
			    		<#if consult.memberId==0>
								游客
						</#if>
						<#if consult.memberId!=0>
							<#if consult.isanonymous>
										匿名
							<#else>
								${consult.cmemberName}
							</#if>                                	
						</#if>
			    	
			    	</span>
		    		<span class="fr">时间:${consult.createTimeStr}</span></h1>
				        <div class="order_goods_much">
				            <ul>
				            	${consult.consultContent}
				            </ul>
				            <ul>
				            	回复: ${consult.consultReply}
				            </ul>
				        </div>
			        <div class="order_total">店铺名称：<b>${consult.storeName}</b></div>
				</#list>
	   		</#if>
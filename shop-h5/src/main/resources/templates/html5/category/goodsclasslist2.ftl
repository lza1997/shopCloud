<#list goodsClassList as classtwo>
	<#if classtwo.hasChild gt 0>
		<li>
		<div class="bancate">
				<a href="${base}/m/category/categoryList?keyword=${classtwo.gcId}"><h2>${classtwo.gcName}</h2></a>
				 <div>
					<#assign goodsClassTag =newTag("goodsClassTag")>
					<#assign goodsList =goodsClassTag("{'parentid':'${classtwo.gcId}'}")>
					<#assign href ='m/category/categoryList?'>
					<#list goodsList as class>
						<div class="catetwo">
							<a href="${base}/m/goods/goodslist?searchType=gcIdSearch&keyword=${class.gcId}">
								<img src=<#if class.gcpic!''>"${imgServer}${class.gcpic}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if>/>

								<p>${class.gcName}</p>
							</a>
                        </div>
					</#list>
				 </div>
		</div>
	</li>



	<#else>
		<li style="float:left;width:33.33%;padding:5px 0;background:#fff">
			<a href="${base}/m/goods/goodslist?searchType=gcIdSearch&keyword=${classtwo.gcId}">
				<div style="width:100%;overflow:hidden;text-align:center;">
					 <p style="line-height:50px;width:100%;white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${classtwo.gcName}</p>
					 <img src=<#if classtwo.gcpic!''>"${imgServer}${classtwo.gcpic}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> title="${classtwo.goodsName}" alt="${classtwo.gcName}" />
				</div>
			</a>
		</li>

	</#if>
</#list>

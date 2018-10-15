<#assign goodsListTag = newTag("goodsListTag")/>
<#assign storeGoodsClassbyIdTag = newTag("storeGoodsClassbyIdTag")/>
<#assign storeGoodsClass =storeGoodsClassbyIdTag("{'Stid':'${storeClassId}'}")>
<div class="nc-s-c-s3 ncg-list">
	<div class="title pngFix">
		<h4>
		   <#if storeGoodsClass?exists && storeGoodsClass!=''>
		      ${storeGoodsClass.stcName}
		   <#else>
		                全部商品
		   </#if>
		</h4>
	</div>
	
	<div class="content">
		<ul>
		      <#assign recommendallgoodslist =goodsListTag("{'storeid':'${storeId}','tagDataType':'2','pagesize':'${pageSize}','pageno':'${pageNo}','storeClassId':'${storeClassId}','goodsName':'${goodsName}','orderField':'${orderField}','order':'${order}'}")>
			  <#if recommendallgoodslist?exists && recommendallgoodslist?size gt 0>
			      <#list recommendallgoodslist as recommendgoods>
			          <li>
		                <dl>
		                  <dt><a href="${base}/m/goods/goodsdetail?id=${recommendgoods.goodsId}" target="_blank">${recommendgoods.goodsName}</a></dt>
		                  <dd class="ncg-pic pngFix"><a href="${base}/m/goods/goodsdetail?id=${recommendgoods.goodsId}" target="_blank" class="thumb"><i></i><img src="<#if recommendgoods.goodsImage!=null>${imgServer}${recommendgoods.goodsImage}<#else>${base}/res/images/member/default_image.png</#if>" onload="javascript:DrawImage(this,160,160);" title="${recommendgoods.goodsName}" alt="${recommendgoods.goodsName}" /></a></dd>
		                  <dd class="ncg-price">
		                                        <em class="price">
		                                        <i>&yen;</i>
		                                           ${recommendgoods.goodsStorePrice}    
		                                        </em></dd>
		                  <dd class="ncg-sold">已销售：<strong> ${recommendgoods.salenum}</strong> 件</dd>
		                </dl>
                     </li>
			      </#list>
			  </#if>
		</ul>
		
		<div class="clear"></div>
	</div>
</div>

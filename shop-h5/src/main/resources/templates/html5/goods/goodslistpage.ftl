<#assign goodsSearchTag = newTag("goodsSearchTag")>
<#assign lucenePage = goodsSearchTag("{'searchType':'${searchType}','keyword':'${keyword}','pageNo':'${pageNo}','filterConditions':'${filterConditions}','specFilter':'${specFilter}','sortField':'${sortField}','sortOrder':'${sortOrder}'}")>
<#if lucenePage??>
	<#if lucenePage.result??>
		<#list lucenePage.result as goods>
		  	<a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}">
		    <dl>
		      <dt><img width="90" height="90" src=<#if goods.goodsImage!''>"${imgServer}${goods.goodsImage}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> title="${goods.goodsName}" alt="${goods.goodsName}"></dt>
		      <dd>
		        <h3><b>${goods.goodsName}</b></h3>
		        <span><strong>¥${goods.goodsStorePrice}</strong></span> <em>${goods.commentnum}人评价，${goods.salenum}人已购买</em> 
		      </dd>
		    </dl>
		    </a> 
		</#list>
	</#if>  
</#if>

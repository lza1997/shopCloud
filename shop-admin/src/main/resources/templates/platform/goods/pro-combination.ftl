<script type="text/javascript" src="${base}/res/js/jquery.js"></script>
<script type="text/javascript" src="${base}/js/layer/layer.js"></script>
<style>
.buuon{line-height: 20px;height: 25px;padding: 3px 3px;border: 1px solid #344a62;
 border-bottom-color: #344a62;
  background-color: #0c2d51;border-radius: 3px; color: #fff; text-decoration: none; font-size: 12px;}
.buuon:hover{
line-height: 20px;height: 25px;padding: 3px 3px;border: 1px solid #344a62;
 border-bottom-color: #344a62;font-size: 12px;
  background-color:#344a62;border-radius: 3px; color: #ccc; text-decoration: none;
}
</style>
<div style="margin-left:15px;">
	<div style="overflow-y:auto; height: 200px;">
		<table id="showPrice"  style="font-size: 12px;">
			<input type="hidden" id="goodsId" value="${goodsId}">
			<#if goodsList?size gt 0>
				<#list goodsList as goods>
					<#if goodsId != goods.goodsId>
						<tr height="60px;">
							<td>
								<a href="javascript:void(0);" target="_blank"><img alt="商品封面" src="${imgServer}${goods.goodsImage}" height="50px;"></a>
							</td>
							<td>
								${goods.goodsName}
							</td>
							<td>
								&yen;${goods.goodsStorePrice}
							</td>
							<td>
								<input type="checkbox" name="goodsCombination" value="${goods.goodsId}"
									 <#if goodsCombinations?size gt 0> 
									 	<#list goodsCombinations as goodsCombination>
									 		<#if goods.goodsId == goodsCombination.combinationGoodsId>
									 			 checked="checked"
									 		</#if>
									 	</#list>
									 </#if>
									 />
							</td>
						</tr>
					</#if>
				</#list>
			</#if>
		</table>
	</div>
</div>
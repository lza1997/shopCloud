<input type="hidden" name="goodsId" value="${goodsId}"/>
<#assign goodsEvalutebyGoodsIdTag =newTag("goodsEvalutebyGoodsIdTag")>
<#assign goodsEvalutes =goodsEvalutebyGoodsIdTag("{'goodsId':'${goodsId}','pageNo':'${pageNo}','toUrl':'${toUrl}'}")>
<#if goodsEvalutes??>
	<#list goodsEvalutes.result as goodsEV>
		<div class="pingjia_01">
			<div <#if  goodsEV_index==0>class="p_left01"<#else>class="p_left02"</#if>>
			  <p>${goodsEV.gevalFrommembername}</p>
			</div>
		</div>
		<div class="xing">
			<span class="creditevaluate" id="descraty" data-score="${goodsEV.gevalScore}"></span>
		</div>
		<div class="pingjia">
			${goodsEV.gevalContent}
		</div>
		<div class="shaitu">
		<#if goodsEV.gevalImage??>
			<#list goodsEV.gevalImage?split(",") as gevalImage>  
				<img src="${imgServer}${gevalImage}"  width="20%" height="20%" />
			</#list>
		</#if>
		</div>
		<div class="xiangqing">
			<p>${goodsEV.specInfo}</p>
			<span>评价日期：${goodsEV.createTimeStr}</span>
		</div>
	</#list>
</#if>  
<script>
	$(document).ready(function() {
		$(".creditevaluate").raty({
			path : "${base}/res/js/jquery.raty/img",
			hints : [ '一般', '不错', "很好", '满意', '非常满意' ],
			readOnly : true,
			width : 100,
			score : function() {
				return $(this).attr("data-score")
			}
		})
	});
</script>
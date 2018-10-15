<ul class="dialog-goodslist-s2">
<!-- 弹出框分页附加条件 -->
<input type="hidden" id="gcId" name="gcId" value="${gcId}"/>
<input type="hidden" id="goodsName" name="goodsName" value="${goodsName}"/>
<input type="hidden" id="goodsShow" name="goodsShow" value = "${goodsShow}"/>
<input type="hidden" id="goodsState" name="goodsState" value = "${goodsState}"/>
    <#list datas as good>
        <li>
            <div onclick="select_recommend_goods(${good.goodsId});" class="goods-pic"><span class="ac-ico"></span><span class="thumb size-72x72"><i></i>
        <img goods_id="${good.goodsId}" goods_price="${good.goodsPrice}" market_price="${good.goodsMarketprice}"
             title="${good.goodsName}" src="${imgServer}${good.goodsImage}" onload="javascript:DrawImage(this,72,72);" /></span></div>
            <div class="goods-name"><a href="javascript:;" target="_blank">${good.goodsName}</a></div>
        </li>
    </#list>
        <div class="clear"></div>
</ul>
<div class="clear"></div>
<#import "/commons/page.ftl" as q><!--引入分页-->
<#if recordCount??>
    <@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="${toUrl}"/>
</#if>
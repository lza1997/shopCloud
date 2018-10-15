 <#list goodsList as goods>
<li class="list1li"><a href="${base}/m/goods/goodsdetail?id=${goods.goodsId}"><img src=<#if goods.goodsImage!''>"${imgServer}${goods.goodsImage}"<#else>"${base}/res/images/common/default_goods_image.gif_small.gif"</#if> title="${goods.goodsName}" alt="${goods.goodsName}" /> <br><span>${goods.goodsName}</span></a></li>
</#list>
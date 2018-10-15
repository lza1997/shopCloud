<#if goodsClasss?exists && goodsClasss?size gt 0>
<#list goodsClasss as goodsClass>
    <tr class="hover edit row${id}">
        <td>
        	<input value="${goodsClass.id}" class="checkitem" type="checkbox" name="ids">
			<img fieldid="${goodsClass.id}" status="open" loadUrl="${base}/unionGoodsClass/loadChildList?&id=${goodsClass.id}" nc_type="flex" src="${base}/res/images/<#if goodsClass.hasChild != 0>tv-expandable.gif<#else>tv-item.gif</#if>"> 
        </td>
        <td class="sort">
            <span class=" editable"  nc_type="inline_edit" fieldname="sort" fieldid="${goodsClass.id}" datatype="pint" modUrl="${base}/unionGoodsClass/modifySort"maxvalue="255" title="可编辑">
                  ${goodsClass.sort}
            </span>
        </td>
        <td class="name">
        	
        	<#if goodsClass.levels == 2>
        	<img src="${base}/res/images/tv-item1.gif" />
        	</#if>
        	<#if goodsClass.levels == 3>
        	<img class="preimg" src="${base}/res/images/vertline.gif"/><img src="${base}/res/images/tv-expandable1.gif" />
        	</#if>
        	<span class="editable" nc_type="inline_edit" fieldname="name" modUrl="${base}/unionGoodsClass/modifyName" fieldid="${goodsClass.id}" required="1" title="可编辑">${goodsClass.name}</span>
        	<#if goodsClass.levels lt 3>
        	<a class="btn-add-nofloat marginleft" href="${base}/unionGoodsClass/forward?&pid=${goodsClass.id}"><span> 新增下级</span>
        	</#if>
        </td>
        <td class="picture">
        	<div class="brand-picture">
        	    <img src="${imgServer}${goodsClass.icon}"/>
        	</div>
        </td>
        <td>
        	<#if goodsClass.showFlag ??&& goodsClass.showFlag==1>
        		显示
           <#else>
         		不显示
           </#if>
	    </td>
        <td class="align-center">
            <a href="${base}/unionGoodsClass/forward?id=${goodsClass.id}">编辑</a>
            &nbsp;|&nbsp;
            <a href="javascript:;" onclick="delRow(this)" >删除</a>
        </td>
    </tr>
</#list>
</#if>
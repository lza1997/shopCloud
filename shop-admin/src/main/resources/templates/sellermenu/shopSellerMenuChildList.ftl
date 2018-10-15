<#if shopSellerMenuList?exists && shopSellerMenuList?size gt 0>
<#list shopSellerMenuList as shopSellerMenu>
    <tr class="hover edit row${mId}" rowid="${mId}">
        <td>
        	<input value="${shopSellerMenu.mId}" class="checkitem" type="checkbox" name="mIds">
			<img fieldid="${shopSellerMenu.mId}" class="img_btn" rowid="${mId}${tree.mId}" status="close" loadUrl="${base}/shopSellerMenu/loadChildList?&mId=${shopSellerMenu.mId}" nc_type="flex" src="${base}/res/images/<#if tree.treeList?exists && tree.treeList?size gt 0>tv-collapsable.gif<#else>tv-item.gif</#if>"> 
        </td>
        <td class="name">
        	
        	<#if shopSellerMenu.levels == 2>
        	<img src="${base}/res/images/tv-item1.gif" />
        	</#if>
        	<#if shopSellerMenu.levels gt 2>
        	<#assign size=shopSellerMenu.levels-2>
        	<#list 1..size as ss>
        	<img class="preimg" src="${base}/res/images/vertline.gif"/>
        	</#list>
        	<img src="${base}/res/images/tv-expandable1.gif" />
        	</#if>
        	<span class="editable" nc_type="inline_edit" fieldname="name" modUrl="${base}/shopSellerMenu/modifyName" fieldid="${shopSellerMenu.mId}" required="1" title="可编辑">${shopSellerMenu.name}</span>
        	<a class="btn-add-nofloat marginleft" style="vertical-align: top;" href="${base}/shopSellerMenu/forward?&pid=${shopSellerMenu.mId}"><span> 新增下级</span>
        </td>
        <td class="sort">
            <span class=" editable"  nc_type="inline_edit" fieldname="sort" fieldid="${shopSellerMenu.mId}" datatype="pint" modUrl="${base}/shopSellerMenu/modifySort"maxvalue="255" title="可编辑">
                  ${shopSellerMenu.sort!'1'}
            </span>
        </td>
	    <td>
	        ${shopSellerMenu.mName}
	    </td>
	    <td>
	        ${shopSellerMenu.mUrl}
	    </td>
	    <td>
	        ${shopSellerMenu.mSort}
	    </td>
	    <td>
	        ${shopSellerMenu.mPermission}
	    </td>
	    <td>
	        ${shopSellerMenu.mIsshow}
	    </td>
        <td class="align-center">
            <a href="${base}/shopSellerMenu/forward?mId=${shopSellerMenu.mId}">编辑</a>
            &nbsp;|&nbsp;
            <a href="javascript:;" onclick="delRow(this)" >删除</a>
        </td>
    </tr>
    <#assign shopSellerMenuList=shopSellerMenu.shopSellerMenuList>
    <#if shopSellerMenuList?exists && shopSellerMenuList?size gt 0>
    <#assign test=mId>
	<#assign mId=mId+shopSellerMenu.mId+"_">
	<#include "/sellermenu/shopSellerMenuChildList.ftl"/>
	<#assign mId=test>
	</#if>
</#list>
</#if>
<#list shopSellerMenuList as a>
	<#if shopSellerMenu.mId!=a.mId>
	<option <#if shopSellerMenu.pid==a.id>selected="selected"</#if> value="${a.mId}">
	<#assign size=a.levels*2>
	<#list 1..size as ss>&nbsp;</#list>
	${a.name}
	</option>
	<#if a.shopSellerMenuList?exists && a.shopSellerMenuList?size gt 0>
		<#assign shopSellerMenuList=a.shopSellerMenuList>
		<#include "/sellermenu/shopSellerMenuChildOption.ftl"/>
	</#if>
	</#if>
</#list>
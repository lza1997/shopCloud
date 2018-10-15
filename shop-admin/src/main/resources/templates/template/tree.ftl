<#if isRoot>
[{
	"text": "<a href='v_list?root=${root }' target='rightFrame'>模板根目录</a>",
	"classes": "folder"
	<#if tplList?size gt 0>,
	"expanded": true,
	"children": [
	<#list tplList as tpl>
		{
		"id": "${tpl.name}",
		"text": "<a href='${tpl.directory?string("v_list?root=${tpl.name?url}'","v_edit?root=${tpl.path?url}&name=${tpl.name?url}'")} target='rightFrame'>${tpl.filename}</a>",
		"classes": "${tpl.directory?string('folder','file')}",
		"hasChildren": ${tpl.directory?string('true','false')}
		}<#if tpl_has_next>,</#if>
	</#list>
	]
	</#if>
}]
<#else>
[
	<#list tplList as tpl>
	{
	"id": "${tpl.name}",
	"text": "<a href='${tpl.directory?string("v_list?root=${tpl.name?url}'","v_edit?root=${tpl.path?url}&name=${tpl.name?url}'")} target='rightFrame'>${tpl.filename}</a>",
	"classes": "${tpl.directory?string('folder','file')}",
	"hasChildren": ${tpl.directory?string('true','false')}
	}<#if tpl_has_next>,</#if>
	</#list>
]
</#if>

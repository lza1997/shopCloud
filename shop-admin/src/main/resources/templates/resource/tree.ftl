<#if isRoot>
[{
	"text": "<a href='v_list?root=' target='rightFrame'>资源根路径</a>",
	"classes": "folder"
	<#if resList?size gt 0>,
	"expanded": true,
	"children": [
	<#list resList as res>
		{
		"id": "${res.name}",
		"text": "<a href='${res.directory?string("v_list?root=${res.name?url}'","v_edit?root=${res.path?url}&name=${res.name?url}'")} target='rightFrame'>${res.filename}</a>",
		"classes": "${res.directory?string('folder','file')}",
		"hasChildren": ${res.directory?string('true','false')}
		}<#if res_has_next>,</#if>
	</#list>
	]
	</#if>
}]
<#else>
[
	<#list resList as res>
	{
	"id": "${res.name}",
	"text": "<a href='${res.directory?string("v_list?root=${res.name?url}'","v_edit?root=${res.path?url}&name=${res.name?url}'")} target='rightFrame'>${res.filename}</a>",
	"classes": "${res.directory?string('folder','file')}",
	"hasChildren": ${res.directory?string('true','false')}
	}<#if res_has_next>,</#if>
	</#list>
]
</#if>

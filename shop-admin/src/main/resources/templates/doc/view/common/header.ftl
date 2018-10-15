<!-- 文档管理头部开始 -->
<#macro header title="">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="/doc/image/favicon.ico" />
<link href="/doc/css/stylecss.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/doc/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var SITEURL = '${base}';
    </script>
</head>
<body>
	

	<!--头部结束-->
	<!--手册开始-->
	<div id="top_nav">
		<h1>
			文档使用手册
		</h1>
	</div>
</#macro>
<!-- 文档管理头部结束 -->

<!-- 文档管理尾部开始 -->
<#macro footer title="">
</body>
</html>
</#macro>
<!-- 文档管理尾部结束 -->


<!-- 文档管理左侧菜单开始 -->
<#macro left title="">
<div class="menu">
	<h3><a href="${base}/doc/view/index">API</a></h3>
	<#assign docTag =newTag("docTag")>
	<#assign docListT =docTag("{'typeid':'1','pid':'0'}")>
	<#if docListT?exists && docListT?size gt 0>
		<ul>
			<#list docListT as doc>
				<li>
					<a href="${base}/doc/view/docapilist?id=${doc.id}&typeid=${doc.typeid}"
						alt="${doc.name}API" title="${doc.name}API">${doc.name}API</a>
				</li>
			</#list>
		</ul>
	</#if>
	
	<h3><a href="${base}/doc/view/index">标签</a></h3>
	<#assign docListT =docTag("{'typeid':'2','pid':'0'}")>
	<#if docListT?exists && docListT?size gt 0>
		<ul>
			<#list docListT as doc>
				<li>
					<a href="${base}/doc/view/doctagdetail?id=${doc.id}&typeid=${doc.typeid}"
						alt="${doc.name}API" title="${doc.name}标签">${doc.name}</a>
				</li>
			</#list>
		</ul>
	</#if>
</div>
</#macro>
<!-- 文档管理左侧菜单结束 -->

<@c.header title="b2b2c文档管理"/>
	
	
	<!--正文-->
	<div id="main">
		<div class="menu">
			<@c.left/>
		</div>
		<div class="right_list">
			<h1>${docApi.name}API</h1>
			<p class="api_intro">${docApi.description!'描述空'}</p>
			<h2>API列表</h2>
			<#if doclist?exists>
				<ul class="list">
					<#list doclist as doc>
						<li>
							<div class="api_func"><a href="${base}/doc/view/docapidetail?id=${doc.id}">${doc.tag!''}</a></div>
							<span>${doc.name}</span>
						</li>
					</#list>
				</ul>
			</#if>
			<#if refList?exists && refList?size gt 0>
			<h2>数据结构列表</h2>
			<ul class="list">
				<#list refList as docEnRef>
						<li>
							<div class="api_func">
								<a href="${base}/doc/view/docentitydetail?entityid=${docEnRef['entityid']}&docid=${docApi.id}">${docEnRef['code']}</a>
							</div>
							<span>${docEnRef['name']}</span>
						</li>
				</#list>
			</ul>
			</#if>
		</div>
	</div>
	
	<!--正文结束-->
<@c.footer/>






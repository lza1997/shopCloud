<@c.header title="b2b2c文档管理"/>
	<!--正文-->
	<div id="main">
		<div class="menu_list">
			<h1>
				<a href="javascript:void(0);" onclick="window.history.go(-1)" >返回
					<span>API</span>
				</a>
			</h1>
			<#assign docTag =newTag("docTag")>
			<#assign pid = doc.id>
			<#assign docListT =docTag("{'typeid':'1','pid':'${docApi.pid}'}")>
			<#if docListT?exists && docListT?size gt 0>
				<ul>
					<#list docListT as doc>
						<li>
							<a href="${base}/doc/view/docapidetail?id=${doc.id}&typeid=${doc.typeid}"
								alt="${doc.name}API" title="${doc.name}API">
								<div>${doc.tag}</div>
								<div><p>${doc.name}</p></div>
							</a>
						</li>
					</#list>
				</ul>
			</#if>
		</div>
		<div class="right_list">
			<h3>${docApi.tag!''} ${docApi.name!''}API</h3>
			<!--锚点-->
			<div class="anchor">
				<ul>
					<li><a href="#parameter">输入参数</a></li>
					<li><a href="#finally">返回结果</a></li>
					<li><a href="#example">返回示例</a></li>
					<li><a href="#try">API工具</a></li>
				</ul>
			</div>
			<!--锚点结束-->
			<h6>
				<p>${docApi.description!'描述空'}</p>
			</h6>
			<div class="intro">	
				<div class="same">
					<h2>API地址：</h2>
					<table cellspacing="0">
						<tr>
							<td style="text-align:left;padding:10px;font-size:14px">${docApi.apiAddress!''}</td>
						</tr>
					</table>
				</div>
				<div class="same" id="parameter">
					<h2>输入参数</h2>
					<table cellspacing="0" class="doctable">
						<tr>
							<th width="150">名称</th>
							<th width="50">类型</th>
							<th width="70">是否必须</th>
							<th width="150">示例值</th>
							<th width="150">默认值</th>
							<th>描述</th>
						</tr>
						<#if paramList?exists && paramList?size gt 0 >
							<#list paramList as docParam>
								<tr>
									<td>${docParam.name!''}</td>
									<td><#if docParam.type==1>String<#else>Integer</#if></td>
									<td><#if docParam.isrequired==1>必填<#else>选填</#if></td>
									<td>${docParam.exampleValue!''}</td>
									<td>${docParam.defalutValue!''}</td>
									<td class="leftalign">${docParam.description!''}</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>	
						</#if>
					</table>
				</div>
				<div class="same" id="finally">
					<h2>返回结果</h2>
					<table cellspacing="0" class="doctable">
						<tr>
							<th width="150">名称</th>
							<th width="100">类型</th>
							<th width="70">是否必须</th>
							<th width="150">默认值</th>
							<th>描述</th>
						</tr>
						<#if returnValue?exists && returnValue?size gt 0 >
							<#list returnValue as docReturnValue>
								<tr>
									<td>${docReturnValue.name}</td>
									<td>
									<#if docReturnValue.type == 6>
									${docReturnValue.typename}
									<a href="${base}/doc/view/docentitydetail?docid=${id}&entityid=${docReturnValue.docEntityId}">${docReturnValue.code}</a>
									<#else>
									${docReturnValue.typename}
									</#if>
									</td>
									<td>
										
										${docReturnValue.requiredvalue}
									</td>
									<td>${docReturnValue.defaultValue}</td>
									<td class="line_intro">${docReturnValue.description}</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</#if>
					</table>
				</div>
				<div class="same" id="example">
					<h2>返回示例</h2>
					<textarea style="height:500px;">${docApi.returnExampleValue!''}</textarea>
				</div>
				<div class="same" id="try">
					<h2>试一试</h2>
					<a href="${base}/${docApi.apiAddress!''}" target="_blank">亲自试一试</a>
				</div>
			</div>
		</div>
	</div>
	
	<!--正文结束-->
<@c.footer/>






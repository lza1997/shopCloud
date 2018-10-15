<@c.header title="b2b2c文档管理"/>
	
	
	<!--正文-->
	<div id="main">
		<div class="menu_list">
			<h1>
				<a href="${base}/doc/view/index" >返回
				</a>
			</h1>
			<@c.left/>
		</div>
		<div class="right_list">
			<h3>${docEn.code}  ${docEn.name}</h3>
			<h2>需要简述</h2>
			<h6>${docEn.description!''}</h6>
			<div class="intro">	
				<div class="same" id="parameter">
					<h2>输入参数</h2>
					<table cellspacing="0">
						<tr>
							<th style="width:35%">名称</th>
							<th style="width:80px;">类型</th>
							<th>描述</th>
						</tr>
						<#if docEnProList?exists && docEnProList?size gt 0>
							<#list docEnProList as docPro>
								<tr>
									<td>${docPro.name}</td>
									<td>${docPro.type}</td>
									<td>${docPro.description!''}</td>
								</tr>
							</#list>
						<#else>
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
							</tr>
						</#if>
					</table>
				</div>
			</div>
		</div>
	</div>
	
<@c.footer/>






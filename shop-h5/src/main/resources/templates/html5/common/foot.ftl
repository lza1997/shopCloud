<#macro foot>
<div class="phone_foot">
 	<div class="foot_top">
 		<span class="fl">
 			
 				<@shiro.user>
			      	您好，<@shiro.principal/>|
			      	<a href="${base}/m/index/logout">退出!</a> 
			  	</@shiro.user>
			  	
	 			<@shiro.guest>
 					<a href="${base}/m/index/login" style="padding-right:8px;">登陆</a>
 				</@shiro.guest>
 				
	 			<@shiro.guest>
					<a href="${base}/m/index/register">注册</a>
				</@shiro.guest>
		</span>
		
	</div>
	<#--<div class="foot_nav">-->
			<#--<a style="color: #000;padding: 0px 0px;" href="${base}">电脑版</href>&nbsp;|&nbsp;-->
			<#--<a style="color: #000;padding: 0px 0px;" href="${base}/m/index/index">触屏版</href></div>-->
    <div class="foot_nav">甜园科技</div>
</div>

</#macro>
 
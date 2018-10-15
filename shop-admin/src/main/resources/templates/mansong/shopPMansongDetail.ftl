<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3 style="color:#0099CC">满就减</h3>
            <ul class="tab-base">
            	<li><a href="${base}/shopPMansong/list"><span>活动列表</span></a></li>
            	<!-- <li><a href="${base}/shopPMansongQuota/list"><span>套餐管理</span></a></li> -->
                <li><a href="JavaScript:void(0);" class="current"><span>活动详情</span></a></li>
            </ul>
        </div>
    </div>
    
    <!-- 提示栏 -->
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);" class="odd">
            <td>
            <strong>满就减活动的详细信息</strong>
            </td>
        </tr>
        </tbody>
    </table>
    
    <form method="post" id='form_list'>
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="align-center"><font size="3">活动名称</font></th>
                <th class="align-center"><font size="3">开始时间</font></th>
                <th class="align-center"><font size="3">结束时间</font></th>
                <th class="align-center"><font size="3">活动内容</font></th>
                <th class="align-center"><font size="3">状态</font></th>
            </tr>
            </thead>
            <tbody>
				<td class="align-center" width="140">
					${shopPMansong.mansongName}
				</td>
				<td class="align-center" width="250">
					<#if shopPMansong.startTimeStr??>
	                	${shopPMansong.startTimeStr?string("yyyy-MM-dd hh:mm")}
                	</#if>
                </td>
                <td class="align-center" width="250">  
					<#if shopPMansong.endTimeStr??>
	                	${shopPMansong.endTimeStr?string("yyyy-MM-dd hh:mm")}
                	</#if>
				</td>
				<!-- 送礼品这个还要分情况显示 -->
				<td class="align-left" width="440">
					<#list shopPMansongRuleList as shopPMansongRule>
						<table class="align-left" width="440">
							<td width="10"></td>
							<td class="align-left" width="430">
								<font color="#3A87AD">单笔订单满</font> <font color="#FF3300" style="font-weight:bold;">${shopPMansongRule.price }</font>
								<font color="#3A87AD">元  ，立减现金 </font> <font color="#FF3300" style="font-weight:bold;">${shopPMansongRule.discount } </font>
								<font color="#3A87AD">元  ，送礼品  ${shopPMansongRule.giftName } </font>
							</td>
						</table>
					</#list>
				</td>
				<td class="align-center">
					<!-- 活动状态(1-未发布/2-正常/3-取消/4-失效/5-结束) -->
					<#if shopPMansong.state == 1>未发布</#if>
					<#if shopPMansong.state == 2>正常</#if>
					<#if shopPMansong.state == 3>取消</#if>
					<#if shopPMansong.state == 4>失效</#if>
					<#if shopPMansong.state == 5>结束</#if>
				</td>
            </tbody>
        </table>
    </form>
</div>
</@layout.body>
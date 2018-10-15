<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <table class="table tb-type2 order">
        <tbody>
        <tr class="space">
            <th colspan="15">订单状态</th>
        </tr>
        <tr>
            <td colspan="2">
                <ul>
                    <li>
                        <strong>订单号:</strong>${shopPointsOrder.pointOrdersn}
                    </li>
                    <li><strong>订单状态:</strong>
                        <#if shopPointsOrder.pointOrderstate==10> 待付款 <#elseif
						shopPointsOrder.pointOrderstate==20> 待发货 <#elseif
						shopPointsOrder.pointOrderstate==30> 待收获 <#elseif
						shopPointsOrder.pointOrderstate==40> 已收货 <#elseif
						shopPointsOrder.pointOrderstate==50> 已完成 <#elseif
						shopPointsOrder.pointOrderstate==60> 已取消 </#if>
                    </li>
                    
                    <li><strong>礼品总积分:</strong>
                    	${shopPointsOrder.pointAllpoint }
                    </li>
                    <li><strong>运费:</strong>
                    	<#if shopPointsOrder.shippingFee??>
					    	<#if order.shopPointsOrder!=0>
					    		¥
		                    	<script type="text/javascript">
		    						var ship = number_format(${shopPointsOrder.shippingFee},2);
		    						document.write(ship);
		    					</script>
		    				<#else>
	              				（免运费）
			          		</#if>
			          	<#else>
			          		（免运费）
			          	</#if>
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="space">
            <th colspan="2">订单详情</th>
        </tr>
        <tr>
            <th>订单信息</th>
        </tr>
        <tr>
            <td><ul>
            <#assign dateFormatTag = newTag("dateFormatTag")/>
                  <#assign pointAddtime = dateFormatTag("{'date':'${shopPointsOrder.pointAddtime }'}")/>
                    <#assign pointFinnshedtime = dateFormatTag("{'date':'${shopPointsOrder.pointFinnshedtime }'}")/>
            	
                <li><strong>买家：</strong>${shopPointsOrder.pointBuyername}</li>
                <li><strong>下单时间：</strong>${pointAddtime}</li>
                <#if pointFinnshedtime??>
                    <li><strong>完成时间：</strong>${pointFinnshedtime}</li>
                </#if>
                <#if shopPointsOrder.pointOrdermessage != null && shopPointsOrder.pointOrdermessage != ''>
                    <li><strong>买家附言：</strong>${shopPointsOrder.pointOrdermessage}</li>
                </#if>
            </ul></td>
        </tr>
        <tr>
            <th>收货人及发货信息</th>
        </tr>
        <tr>
            <td>
                <ul>
                	<#if shoppointsOrderAddress??>
               			<li><strong>收货人姓名：</strong>${shoppointsOrderAddress.pointTruename}</li>
               			<li><strong>收货人手机：</strong>${shoppointsOrderAddress.pointMobphone}</li>
               			<li><strong>收货人电话：</strong>${shoppointsOrderAddress.pointTelphone}</li>
               			<li><strong>收货地址：</strong>${shoppointsOrderAddress.pointAreainfo}&nbsp;${shoppointsOrderAddress.pointAddress}</li>
               			<li><strong>邮编：</strong>${shoppointsOrderAddress.pointZipcode}</li>
                	</#if>
                </ul>
            </td>
        </tr>
        <tr>
            <th>礼品信息</th>
        </tr>
        <tr>
            <td><table class="table tb-type2 goods ">
                <tbody>
                <tr>
                    <th></th>
                    <th>礼品信息</th>
                    <th class="align-center">所需积分</th>
                    <th class="align-center">数量</th>
                    <th class="align-center">小计</th>
                </tr>
                <#list shopPointsOrderGoodsList as goods>
                    <tr>
                        <td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56"><i></i><a href="javascript:;" target="_blank"><img src="${imgServer}${goods.pointGoodsimage}" onload="javascript:DrawImage(this,60,60);" /> </a></span></div></td>
                        <td class="w50pre"><p><a href="${frontServer}/points/detail?id=${goods.pointGoodsid}" target="_blank">${goods.pointGoodsname}</a></p></td>
                        <td class="w96 align-center">
                        	<span class="red_common">
                        		${goods.pointGoodspoints}
                        	</span>
                        </td>
                        <td class="w96 align-center">${goods.pointGoodsnum}</td>
                        <td class="w96 align-center">
                        	<span class="red_common">
		    						${goods.pointGoodspoints*goods.pointGoodsnum}
                        	</span>
                        </td>
                        
                    </tr>
                </#list>
                </tbody>
            </table></td>
        </tr>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><a href="JavaScript:void(0);" class="btn" onclick="history.go(-1)"><span>返回</span></a></td>
        </tr>
        </tfoot>
    </table>
</div>
</@layout.body>
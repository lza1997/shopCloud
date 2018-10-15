<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
	<div class="fixed-bar">
        <div class="item-title">
            <h3>退货管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/orders/returnList"><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form action="${base}/orders/auditing" method="post" id="adForm" target="_blank">
    <table class="table tb-type2 order">
    	<input name="id" value="${refundReturn.refundId}" type="hidden"/>
    	<input name="orderpaytype" value="${orderpaytype}" type="hidden"/>
        <tbody>
        <tr class="space">
            <th colspan="15">退货状态</th>
        </tr>
        <tr>
            <td colspan="2">
                <ul>
                    <li>
                        <strong>退货编号：</strong>${refundReturn.refundSn}
                    </li>
                    <li><strong>审核状态：</strong>
                        <#if refundReturn.sellerState==1>
	                    	待审核
		                <#elseif refundReturn.sellerState==2>
		                                        同意
		                <#elseif refundReturn.sellerState==3>
		                	不同意
		                </#if>
                    </li>
                    <li><strong>平台确认：</strong>
                        <#if refundReturn.refundState??>
							<#if refundReturn.refundState==1>
								未申请
							<#elseif refundReturn.refundState==2>
								待处理
							<#elseif refundReturn.refundState==3>
								已完成
							</#if>
						<#else>
							无
						</#if>
                    </li>
                </ul>
            </td>
        </tr>
        <tr class="space">
            <th colspan="2">退货详情</th>
        </tr>
        <tr>
            <th>商品信息</th>
        </tr>
        <tr>
            <td><table class="table tb-type2 goods ">
                <tbody>
                <tr>
                    <th></th>
                    <th>商品信息</th>
                    <th class="align-center">退货金额</th>
                    <th class="align-center">退货数量</th>
                </tr>
                <tr>
                    <td class="w60 picture"><div class="size-56x56"><span class="thumb size-56x56"><i></i><a href="javascript:;" target="_blank"><img src="${imgServer}${refundReturn.goodsImage}" onload="javascript:DrawImage(this,60,60);" /> </a></span></div></td>
                    <td class="w50pre"><p><a href="${frontServer}/product/detail?id=${refundReturn.goodsId}" target="_blank">${refundReturn.goodsName}</a></p></td>
                    <td class="w96 align-center">
                    	<span class="red_common">￥
                    		<script type="text/javascript">
		  						var price = number_format('${refundReturn.refundAmount}',2);
		  						document.write(price);
		  					</script>
                    	</span>
                    </td>
                    <td class="w96 align-center">${refundReturn.goodsNum}</td>
                </tr>
                </tbody>
            </table></td>
        </tr>
        <tr>
            <th>退货信息</th>
        </tr>
        <tr>
            <td><ul>
                <li><strong>买家：</strong>${refundReturn.buyerName}</li>
                <li><strong>店铺：</strong>${refundReturn.storeName}</li>
                <li>
					退货原因：${refundReturn.buyerMessage}
				</li>
				<#if refundReturn.sellerMessage??>
					<li>
						卖家备注：${refundReturn.sellerMessage}
					</li>
				</#if>
				<#if refundReturn.adminMessage??>
					<li>
						管理员备注：${refundReturn.adminMessage}
					</li>
				</#if>
				<#if refundReturn.picInfo!=''>
					<li>
						图片信息：
						<#list refundReturn.picInfo?split(',') as img>
				     		<#if img!=''>
				     			<img width="80px" height="80px" src="${imgServer}${img}"/>
				     		</#if>
				     	</#list>
					</li>
				</#if>
            </ul></td>
        </tr>
        <tr>
            <th>订单发货信息</th>
        </tr>
        <tr>
            <td>
                <ul>
                	<#if refundReturn.orderDaddress??>
               			<li><strong>收货人姓名：</strong>${refundReturn.orderDaddress.trueName}</li>
               			<li><strong>收货人手机：</strong>${refundReturn.orderDaddress.mobPhone}</li>
               			<li><strong>收货人电话：</strong>${refundReturn.orderDaddress.telPhone}</li>
               			<li><strong>收货地址：</strong>${refundReturn.orderDaddress.areaInfo}&nbsp;${refundReturn.orderDaddress.address}</li>
               			<li><strong>邮编：</strong>${refundReturn.orderDaddress.zipCode}</li>
                	</#if>
                </ul>
            </td>
        </tr>
        <#if refundReturn.returnLogList?? && refundReturn.returnLogList?size != 0>
        <tr>
            <th>操作历史</th>
        </tr>
            <#list refundReturn.returnLogList as log>
            <tr>
                <td>
                    ${log.operator}&emsp;于&emsp;${log.createTimeStr?string("yyyy-MM-dd HH:mm:ss")}&emsp;${log.stateInfo}
                </td>
            </tr>
            </#list>
        </#if>
        <tr>
        	<th>备注信息:</th>
        </tr>
        <tr>
        	<td>
        		<textarea cols="50" name="adminMessage" id="adminMessage"></textarea>
        	</td>
        </tr>
         <tr>
             <th>
                	返回方式
             </th>
         </tr>
         <tr>
             <td>
                                                              原路返回:<input type="radio" name="returntype" value="1" checked="checked">
              		  人工返回:<input type="radio" name="returntype" value="0">
             </td>
         </tr>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><a href="javaScript:void(0)" class="btn" onclick="auditing()"><span>提交</span></a></td>
        </tr>
        </tfoot>
    </table>
    </form>
</div>
<script type="text/javascript">
	function auditing(){
	   if($("input[name='returntype']:checked").val()=='0'){
            layer.confirm("你选择了人工返回，请确认是否已线下退款成功！",function(){
                $("#adForm").submit();
            })
       }else{
           layer.confirm("你选择了原路返回，请确认是否已线下退款成功！",function(){
                $("#adForm").submit();
            })
       }
	}
</script>
</@layout.body>
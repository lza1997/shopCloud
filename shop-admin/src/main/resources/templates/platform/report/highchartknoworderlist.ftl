 <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>订单号</th>
			<th>买家名称</th>
			<th>订单金额</th>
			<th>支付金额</th>
			<th>支付方式</th>
			<th>订单状态</th>
			<th>生成时间</th>
        </tr>
        </thead>
        <tbody>
        <#if highcharorderList??>
			<#list highcharorderList as item>
        <tr class="hover">
            <td>
						${item.orderSn}
					</td>
					<td>
						${item.membername}
					</td>
					<td>
						${item.orderTotalPrice}
					</td>
					<td>
						${item.orderAmount}
					</td>
					<td>
						<#if item.paymentCode ??&& item.paymentCode!=''>
						    <#if item.paymentCode=='2'>
						                          货到付款
						     <#elseif (item.paymentCode=='YL'||item.paymentCode=='pc_unionpay'||item.paymentCode=='mobile_unionpay')>
						    	   银联支付
						     <#elseif (item.paymentCode=='ZFB')>
						                         支付宝
						     <#elseif (item.paymentCode=='weiscan')>
						       	  微信支付  
						     <#elseif (item.paymentCode=='open_weichatpay')>
						                         微信支付 
						     <#elseif (item.paymentCode=='mp_weichatpay')>
						                        微信支付  
						     <#else>
						      	  待付款
						    </#if>
						</#if>
					</td>
					<td>
						<#if item.orderState!=null>
						    <#if item.orderState==40>
		              			     交易完成
						    </#if>
						</#if>
					</td>
					<td>
						${item.createTimeStr?string('yyyy-MM-dd HH:mm:ss')}
					</td>
        </tr>
        </#list>
		<#else>
				<tr>
					<td colspan="20" class="norecord"><i>&nbsp;</i><span>暂无符合条件的数据记录</span>
					</td>
				</tr>
		</#if>
        </tbody>
         <tfoot>
	        <tr class="tfoot">
	            <td colspan="15" id="dataFuncs">
	                <#import "/commons/page.ftl" as q><!--引入分页-->
		              <#if recordCount??>
		                  <@q.pager pageNo=pageNo pageSize=pageSize recordCount=recordCount toURL="${toUrl}"/>
		              </#if>
	            </td>
	        </tr>
        </tfoot>
    </table>

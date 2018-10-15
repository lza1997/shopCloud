<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js"></script>
<script src="${base}/res/js/area.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<style>
	.transinput{
		background-color: transparent;border:none; outline:none;
	}
	.select{width: 100px;height: 26px;}
</style>
</@layout.head>
<@layout.body>
<div class="page">
    <table class="table tb-type2 order">
        <tbody>
        <tr class="space">
            <th colspan="15">结算详情</th>
        </tr>
        <tr>
            <td colspan="2">
                <ul>
                    <li>
                        <strong>账单编号:</strong>${orderBill.obNo}
                    </li>
                    <li><strong>账单状态:</strong>
                        <#if orderBill.obState == 10>
							默认
						<#elseif orderBill.obState == 20>
							卖家已确认
						<#elseif orderBill.obState == 30>
							平台已审核
						<#elseif orderBill.obState == 40>
							结算完成
						</#if>
                    </li>
                    <li>
                    	<strong>出账日期:</strong>
                    	${orderBill.createTimeStr?string('yyyy-MM-dd')}
                    </li>
                    <li>
                    	<strong>店铺:</strong>
                    	${orderBill.obStoreName}:${orderBill.obStoreId}
                    </li>
                    <li>
                    	<strong>结算单年月份:</strong>
                    	${orderBill.osMonth}
                    </li>
                    <#if orderBill.obPayTime??>
                    	<li>
							<strong>付款日期：</strong>
							${orderBill.obPayTime?string('yyyy-MM-dd')}
						</li>
					</#if>
					<#if orderBill.obPayContent??&&orderBill.obPayContent!=''>
						<li>
							<strong>支付备注：</strong>
							${orderBill.obPayContent}	
						</li>
					</#if>
                </ul>
            </td>
        </tr>
        <tr class="space">
            <th colspan="2">金额详情</th>
        </tr>
        <tr>
            <td><ul>
                <li><strong>订单金额：</strong>¥
                	<script type="text/javascript">
	   					var obOrderTotals = number_format(${orderBill.obOrderTotals},2);
	   					document.write(obOrderTotals);
	   				</script>
                </li>
                <li><strong>运费：</strong>¥
                	<script type="text/javascript">
	   					var obShippingTotals = number_format(${orderBill.obShippingTotals},2);
	   					document.write(obShippingTotals);
	   				</script>
                </li>
                <li><strong>佣金金额：</strong>¥
                	<script type="text/javascript">
	   					var obCommisTotals = number_format(${orderBill.obCommisTotals},2);
	   					document.write(obCommisTotals);
	   				</script>
                </li>
                <li><strong>退款金额：</strong>¥
                	<script type="text/javascript">
	   					var obOrderReturnTotals = number_format(${orderBill.obOrderReturnTotals},2);
	   					document.write(obOrderReturnTotals);
	   				</script>
                </li>
                <li><strong>退还佣金：</strong>¥
                	<script type="text/javascript">
	   					var obCommisReturnTotals = number_format(${orderBill.obCommisReturnTotals},2);
	   					document.write(obCommisReturnTotals);
	   				</script>
                </li>
                <li><strong>店铺费用：</strong>¥
                	<script type="text/javascript">
	   					var obStoreCostTotals = number_format(${orderBill.obStoreCostTotals},2);
	   					document.write(obStoreCostTotals);
	   				</script>
                </li>
            	<li><strong>本期应结：</strong>
            		<span class="red_common">¥
            		<script type="text/javascript">
	   					var obResultTotals = number_format(${orderBill.obResultTotals},2);
	   					document.write(obResultTotals);
	   				</script>
	   				</span>
            	</li>
            </ul></td>
        </tr>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td><a href="JavaScript:void(0);" class="btn" onclick="history.go(-1)"><span>返回</span></a></td>
        </tr>
        </tfoot>
    </table>
</div>
<script>
</script>
</@layout.body>
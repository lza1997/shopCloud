<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
	<form method="post" action="${base}/bill/detailList" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}" />
        <input type="hidden" name="storeId" value="${storeId}" />
        <input type="hidden" name="obStartTime" value="${obStartTime}" />
        <input type="hidden" name="obEndTime" value="${obEndTime}" />
    </form>
	<table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th class="align-center">账单编号</th>
            <th class="align-center">订单金额</th>
            <th class="align-center">运费</th>
            <th class="align-center">佣金金额</th>
            <th class="align-center">退款金额</th>
            <th class="align-center">退还佣金</th>
            <th class="align-center">店铺费用</th>
            <th class="align-center">本期应结</th>
            <th class="align-center">出账日期</th>
          	<th class="align-center">账单状态</th>
          	<th class="align-center">店铺</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as billVo>
        <tr class="hover">
            <td class="align-center">${billVo.obNo}</td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obOrderTotals = number_format(${billVo.obOrderTotals},2);
   					document.write(obOrderTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obShippingTotals = number_format(${billVo.obShippingTotals},2);
   					document.write(obShippingTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obCommisTotals = number_format(${billVo.obCommisTotals},2);
   					document.write(obCommisTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obOrderReturnTotals = number_format(${billVo.obOrderReturnTotals},2);
   					document.write(obOrderReturnTotals);
   				</script>
   			</td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obCommisReturnTotals = number_format(${billVo.obCommisReturnTotals},2);
   					document.write(obCommisReturnTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obStoreCostTotals = number_format(${billVo.obStoreCostTotals},2);
   					document.write(obStoreCostTotals);
   				</script>
            </td>
            <td class="align-center">
            	<script type="text/javascript">
   					var obResultTotals = number_format(${billVo.obResultTotals},2);
   					document.write(obResultTotals);
   				</script>
            </td>
            <td class="align-center">
            	${billVo.createTimeStr?string('yyyy-MM-dd')}
            </td>
            <td class="align-center">
				<#if billVo.obState == 10>
					已出账
				<#elseif billVo.obState == 20>
					卖家已确认
				<#elseif billVo.obState == 30>
					平台已审核
				<#elseif billVo.obState == 40>
					结算完成
				</#if>
			</td>
			<td class="align-center">
				${billVo.obStoreName}:${billVo.obStoreId}
			</td>
        </tr>
        </#list>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
                <@layout.pager pager/>
            </td>
        </tr>
        </tfoot>
    </table>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
</@layout.head>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>结算管理</h3>
            <ul class="tab-base">
            	<li><a href="JavaScript:void(0);" class="current"><span>结算管理</span></a></li>
                <li><a href="${base}/bill/orderBillList"><span>商家账单列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/bill/list" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
				<th><label for="query_start_time">开始时间</th>
                <td><input class="txt Wdate" type="text"  id="query_start_time" name="obStartTime" value="${obStartTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'query_end_time\')}'});"/>
                	<label for="query_start_time">~</label>
                </td>
                <th><label for="query_start_time">结束时间</th>
                <td><input class="txt Wdate" type="text" id="query_end_time" name="obEndTime" value="${obEndTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'query_start_time\')}'});"/></td>
                <th>店铺</th>
                <td><input class="txt" type="text" name="storeName" value="${billVo.storeName}" /></td>
                <td>
                	<a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>此处列出了平台每期的结算信息汇总，点击查看可以查看本期详细的店铺账单信息列表</li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th class="align-center">店铺</th>
            <th class="align-center">开始时间</th>
            <th class="align-center">结束时间</th>
            <th class="align-center">订单金额</th>
            <th class="align-center">运费</th>
            <th class="align-center">收取佣金</th>
            <th class="align-center">退单金额</th>
            <th class="align-center">退还佣金</th>
            <th class="align-center">店铺费用</th>
            <th class="align-center">本期应结</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#if count != 0>
        <#list pager.result as billVo>
        <tr class="hover">
            <td class="align-center">${billVo.storeName}</td>
            <td class="align-center">${billVo.obStartTimeStr?string('yyyy-MM-dd')}</td>
            <td class="align-center">${billVo.obEndTimeStr?string('yyyy-MM-dd')}</td>
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
            <td class="w144 align-center">
           		<a href="javascript:void(0);" onclick="detail('${billVo.storeId}','${billVo.obStartTime}','${billVo.obEndTime}')">查看账单明细</a>
            </td>
        </tr>
        </#list>
        </#if>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
                <@layout.pager pager/>
                <#if count != 0>
               		<a href="javascript:void(0);" onclick="exportExcel();" class="btn">导出excel</a>
            	</#if>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
	function detail(storeId,obStartTime,obEndTime){
		layer.open({
			type:2,
            move: false,
            shade: false,
            title: '账单明细列表',
            content:['${base}/bill/detailList?storeId='+storeId+'&obStartTime='+obStartTime+'&obEndTime='+obEndTime, 'no'],
            area: ['1000px', '550px'],
		});
	}
	
	function exportExcel(){
		location.href="${base}/bill/exportBillVoExcel";
	}
</script>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>退货管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/orders/returnList" name="formSearch" id="formSearch">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
				<td>&nbsp;</td>
				<th style="width:115px">
					<select name="type" class="querySelect">
						<option value="orderSn" <#if type=="orderSn">selected="selected"</#if>>订单编号</option>
						<option value="returnSn" <#if type=="returnSn">selected="selected"</#if>>退货编号</option>
						<option value="storeName" <#if type=="storeName">selected="selected"</#if>>店铺名</option>
					</select>：
				</th>
				<td class="w160"><input type="text" class="txt2" name="key" value="${key}" /></td>
                <th><label for="query_start_time">申请时间</th>
                <td><input class="txt date" type="text"  id="query_start_time" name="startTime" value="${startTime}"/>
                    <label for="query_start_time">~</label>
                    <input class="txt date" type="text" id="query_end_time" name="endTime" value="${endTime}"/></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>

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
                    <li>点击查看操作将显示退货申请的详细信息</li>
                    <li>点击审核操作将调到商家申请退款的审核页面</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>订单号</th>
            <th>退货编号</th>
            <th>店铺</th>
            <th>买家</th>
            <th class="align-center">下单时间</th>
            <th class="align-center">退款金额</th>
            <th class="align-center">退货数量</th>
            <th class="align-center">审核状态</th>
            <th class="align-center">平台确认</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
            <td>${str.orderSn}</td>
            <td>${str.refundSn}</td>
            <td>${str.storeName}</td>
            <td>${str.buyerName}</td>
            <td class="nowrap align-center">${str.createTimeStr?string("yyyy-MM-dd")}</td>
            <td class="align-center">${str.refundAmount}</td>
            <td class="align-center">${str.goodsNum}</td>
            <td class="align-center">
            	<#if str.sellerState==1>
					待审核
				<#elseif str.sellerState==2>
					同意
				<#elseif str.sellerState==3>
					不同意
				</#if>
            </td>
            <td class="align-center">
            	<#if str.refundState??>
					<#if str.refundState==1>
						未申请
					<#elseif str.refundState==2>
						待处理
					<#elseif str.refundState==3>
						已完成
					</#if>
				<#else>
					无
				</#if>
            </td>
            <td class="w144 align-center">
            	<a href="${base}/orders/returnDetail?id=${str.refundId}">查看</a>
            	<#if str.sellerState==2 && str.refundState==1 && str.rerefundType!=3>
            		| <a href="${base}/orders/refundReturnAuditing?id=${str.refundId}">审核</a>
            	</#if>
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
</div>
<script type="text/javascript">
    $(function(){
        $('#query_start_time').datepicker({dateFormat: 'yy-mm-dd'});
        $('#query_end_time').datepicker({dateFormat: 'yy-mm-dd'});
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.body>
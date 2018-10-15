<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
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
            <h3>退款记录</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/platformOrder/refundOrderList" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>订单号</label></th>
                <td><input class="txt2" type="text" name="orderSn" value="${refundLog.orderSn}" /></td>
                <th><label>退款编号</label></th>
                <td><input class="txt2" type="text" name="refundSn" value="${refundLog.refundSn}" /></td>
            </tr>
            <tr>
                <th><label for="query_start_time">退款时间</th>
                <td><input class="txt date" type="text"  id="query_start_time" name="startTime" value="${refundLog.startTime}"/>
                    <label for="query_start_time">~</label>
                    <input class="txt date" type="text" id="query_end_time" name="endTime" value="${refundLog.endTime}"/></td>
                <th>买家</th>
                <td><input class="txt-short" type="text" name="buyerName" value="${refundLog.buyerName}" /></td>
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
                    <li>点击查看操作将显示订单（包括订单物品）的详细信息</li>
                    <li>点击取消操作可以取消订单（在线支付但未付款的订单和货到付款但未发货的订单）</li>
                    <li>如果平台已确认收到买家的付款，但系统支付状态并未变更，可以点击收到货款操作，并填写相关信息后更改订单支付状态</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>订单号</th>
            <th>退款编号</th>
            <th class="align-center">买家会员名</th>
            <th class="align-center">退款金额</th>
            <th class="align-center">退款时间</th>
            <th class="align-center">状态</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
            <td>${str.orderSn}</td>
            <td>${str.refundSn}</td>
            <td>${str.buyerName}</td>
            <td>
            	<script type="text/javascript">
  					var refund = number_format(${str.orderRefund},2);
  					document.write(refund);
  				</script>
            </td>
            <td class="nowrap align-center">${str.createTimeStr?string("yyyy-MM-dd  HH:mm:ss")}</td>
            <td>
				<#if str.refundState==1>
					待审核
				<#elseif str.refundState==2>
					审核通过
				<#elseif str.refundState==3>
					已拒绝
				</#if>
			</td>
            <td class="w144 align-center">
            	<a href="javascript:void(0)" onclick="refundLogDetail('${str.logId}')">查看</a>
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
	//查看退款信息
	function refundLogDetail(id){
	   	layer.open({
		    type: 2,
		    area: ['400px', '270px'],
		    skin: 'layui-layer-rim',
		    title: '退款详情',
		    content :  ['${base}/platformOrder/refundLogDetail?logId=' + id, 'no']
		});
	}
</script>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
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
            <h3>订单管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/orders/list" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label>订单号</label></th>
                <td><input class="txt2" type="text" name="orderSn" value="${order.orderSn}" /></td>
                <th><label>支付单号</label></th>
                <td><input class="txt2" type="text" name="paySn" value="${order.paySn}" /></td>
                <th>店铺</th>
                <td><input class="txt-short" type="text" name="storeName" value="${order.storeName}" /></td>
                <th><label>订单状态</label></th>
                <td colspan="4"><select name="orderState" class="querySelect">
                    <option value="" <#if order.orderState == null>selected="selected" </#if>>请选择</option>
                    <option value="10" <#if order.orderState == '10'>selected="selected" </#if>>待付款</option>
                    <option value="20" <#if order.orderState == '20'>selected="selected" </#if>>待发货</option>
                    <option value="30" <#if order.orderState == '30'>selected="selected" </#if>>待收货</option>
                    <option value="40" <#if order.orderState == '40'>selected="selected" </#if>>交易完成</option>
                    <option value="50" <#if order.orderState == '50'>selected="selected" </#if>>已提交</option>
					<option value="60" <#if order.orderState == '60'>selected="selected" </#if>>已确认</option>
                    <option value="0" <#if order.orderState == '0'>selected="selected" </#if>>已取消</option>
                </select></td>

            </tr>
            <tr>
                <th><label for="query_start_time">下单时间</th>
                <td><input class="txt Wdate" type="text"  id="query_start_time" name="searchStartTime" value="${searchStartTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'query_end_time\')}'});"/>
                    <label for="query_start_time">~</label>
                    <input class="txt Wdate" type="text" id="query_end_time" name="searchEndTime" value="${searchEndTime}" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'query_start_time\')}'});"/></td>
                <th>买家</th>
                <td><input class="txt-short" type="text" name="buyerName" value="${order.buyerName}" /></td> <th>付款方式</th>
                <td>
                    <select name="paymentCode" class="w100">
                        <option value="">请选择</option>
                            <#list datas as str>
                                <option value="${str.paymentCode}" <#if order.paymentCode == str.paymentCode>selected="selected" </#if>>${str.paymentName}</option>
                            </#list>
                    </select>
                </td>
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
            <th>店铺</th>
            <th>买家</th>
            <th class="align-center">下单时间</th>
            <th class="align-center">订单总额</th>
            <th class="align-center">支付方式</th>
            <th class="align-center">订单状态</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
        <tr class="hover">
            <td>${str.orderSn}</td>
            <td>${str.storeName}</td>
            <td>${str.buyerName}</td>
            <td class="nowrap align-center"><#if str.createTimeStr??>${str.createTimeStr?string("yyyy-MM-dd  HH:mm:ss")}</#if></td>
            <td class="align-center">${str.orderAmount}</td>
            <td class="align-center">${str.paymentName}</td>
            <td class="align-center">
                <#if str.orderState==10>待付款</#if>
                <#if str.orderState==20>待发货</#if>
                <#if str.orderState==30>待收货</#if>
                <#if str.orderState==40>交易完成</#if>
                <#if str.orderState==50>已提交</#if>
                <#if str.orderState==60>已确认</#if>
                <#if str.orderState==0>已取消</#if>
            </td>
            <td class="w144 align-center"><a href="${base}/orders/show?id=${str.orderId}">查看</a>
                <!-- 取消订单 -->
                <#if str.cancel>
                | <a href="javascript:void(0)" onclick="if(confirm('您确实要取消该订单吗？')){location.href=APP_BASE+'/orders/cancleOrder?id=${str.orderId}'}">
                    取消</a>
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
</script>
</@layout.body>
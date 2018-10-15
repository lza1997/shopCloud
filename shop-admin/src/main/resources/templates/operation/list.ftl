<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>结算管理</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>结算管理</span></a></li>
                <li><a href="#?act=bill&op=show_statis"><span>商家账单列表</span></a></li></ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" action="${base}/orderstatis/list" target="" name="formSearch" id="formSearch">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th>按年份搜索</th>
                <td>
                    <select name="osYear" class="querySelect">
                        <option value="">请选择</option>
                        <#list years as year>
                            <option value="${year}" <#if osYear == year>selected="selected" </#if>>${year}</option>
                        </#list>
                    </select>
                </td>
                <td><a href="javascript:viod(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td><ul>
                <li>此处列出了平台每月的结算信息汇总，点击查看可以查看本月详细的店铺账单信息列表</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 nobdb">
        <thead>
        <tr class="thead">
            <th>账单（月）</th>
            <th class="align-center">开始日期</th>
            <th class="align-center">结束日期</th>
            <th class="align-center">订单金额</th>
            <th class="align-center">运费</th>
            <th class="align-center">收取佣金</th>
            <th class="align-center">退单金额</th>
            <th class="align-center">退还佣金</th>
            <th class="align-center">店铺费用</th>
            <th class="align-center">本期应结</th>
            <#--<th class="align-center">操作</th>-->
        </tr>
        </thead>
        <tbody>
        <#list pager.result as str>
            <tr class="hover">
                <td>
                    ${str.osMonth?substring(0,4)}-${str.osMonth?substring(4)}
                </td>
                <td class="nowrap align-center">${str.osStartDate?string("yyyy-MM-dd")}</td>
                <td class="nowrap align-center">${str.osEndDate?string("yyyy-MM-dd")}</td>
                <td class="align-center">${str.osOrderTotals}</td>
                <td class="align-center">${str.osShippingTotals}</td>
                <td class="align-center">${str.osCommisTotals}</td>
                <td class="align-center">${str.osOrderReturnTotals}</td>
                <td class="align-center">${str.osCommisReturnTotals}</td>
                <td class="align-center">${str.osStoreCostTotals}</td>
                <td class="align-center">${str.osResultTotals}</td>
                <#--<td class="align-center">-->
                    <#--<a href="#?act=bill&op=show_statis&os_month=${str.osMonth}">查看</a>-->
                <#--</td>-->
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
        $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
        $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
        $('#ncsubmit').click(function(){
            $('input[name="op"]').val('index');$('#formSearch').submit();
        });
    });
</script>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.raty/jquery.raty.min.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>评价管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/trade/evalGoods/list" ><span>来自买家的评价</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>店铺动态评价</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" action="${base}/trade/evalStore/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="sevalStoreName">店铺名称</label></th>
                <td><input class="txt" type="text" name="sevalStoreName" id="store_name" value="${seval.sevalStoreName}" /></td>
                <th><label for="sevalMemberName">评价人</label></th>
                <td><input class="txt" type="text" name="sevalMemberName" id="from_name" value="${seval.sevalMemberName}" /></td>
                <td>评价时间</td>
                <td><input class="txt date" type="text" name="startTime" id="stime" value="${seval.startTime}" />~
                    <input class="txt date" type="text" name="endTime" id="etime" value="${seval.endTime}" />
                </td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a></td>
            </tr>
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div>
             </th>
        </tr>
        <tr>
            <td><ul>
                <li>买家可在订单完成后对店铺进行动态评价操作</li>
                <li>评价统计信息将显示在对应的店铺相应页面</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2 evallist">
        <thead>
        <tr class="thead">
            <th>店铺名称</th>
            <th class="w150 align-center">订单编号</th>
            <th class="w150 align-center">评价人</th>
            <th class="w150 align-center">评价分数</th>
            <th class="w150 align-center">评价时间</th>
            <th class="w72 align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as eval>
            <tr class="hover">
                <td>${eval.sevalStoreName}</td>
                <td class="align-center">${eval.sevalOrderNo}</td>
                <td class="align-center">${eval.sevalMemberName}</td>
                <td class="align-center">
                    描述相符<div class="raty" style="display:inline-block;" data-score="${eval.sevalDesccredit}"></div>
                    服务态度<div class="raty" style="display:inline-block;" data-score="${eval.sevalServicecredit}"></div>
                    发货速度<div class="raty" style="display:inline-block;" data-score="${eval.sevalDeliverycredit}"></div>
                </td>
                <td class="align-center">${eval.sevalAddTime?string("yyyy-MM-dd")}</td>
                <td class="align-center">
                    <a nctype="btn_del" href="javascript:void(0)" data-seval-id="${eval.sevalId}">删除</a>
                </td>
            </tr>
        </#list>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15" id="dataFuncs">
                <@layout.pager pager/>
            </td>
        </tr>
        </tfoot>
    </table>
</div>
<form id="submit_form" action="${base}/trade/evalStore/delete" method="post">
    <input id="seval_id" name="id" type="hidden">
</form>
<script type="text/javascript">
    $(document).ready(function(){
        $('#stime').datepicker({dateFormat: 'yy-mm-dd'});
        $('#etime').datepicker({dateFormat: 'yy-mm-dd'});

        $('.raty').raty({
            path: APP_BASE+"/res/js/jquery.raty/img",
            readOnly: true,
            score: function() {
                return $(this).attr('data-score');
            }
        });

        $('[nctype="btn_del"]').on('click', function() {
            if(confirm("您确定要删除吗?")) {
                var seval_id = $(this).attr('data-seval-id');
                $('#seval_id').val(seval_id);
                $('#submit_form').submit();
            }
        });
    });
</script>
</@layout.body>


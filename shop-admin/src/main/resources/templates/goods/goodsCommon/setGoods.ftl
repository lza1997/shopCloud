<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/goodsCommon/list"><span>所有商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/downList" ><span>违规下架商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/verfiyList"><span>等待审核</span></a></li>
                <li><a href="javascript:;" class="current"><span>商品设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="form_goodsverify" action="${base}/goods/goodsCommon/saveSetting">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label>商品是否需要审核:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="rewrite_enabled"  class="cb-enable <#if goodsVerify == '1'>selected</#if>" title="是"><span>是</span></label>
                    <label for="rewrite_disabled" class="cb-disable <#if goodsVerify == '0'>selected</#if>" title="否"><span>否</span></label>
                    <input id="rewrite_enabled" name="goodsVerify" <#if goodsVerify == '1'>checked="checked"</#if> value="1" type="radio">
                    <input id="rewrite_disabled" name="goodsVerify" <#if goodsVerify == '0'>checked="checked"</#if> value="0" type="radio"></td>
                <td class="vatop tips"></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" ><a href="JavaScript:void(0);" class="btn" onclick="document.form_goodsverify.submit()"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
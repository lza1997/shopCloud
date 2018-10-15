<@layout.head>
</@layout.head>
<@layout.body>
<div class="page">
    <form method="post" name="form1" id="form1" action="${base}/goods/goodsCommon/verfiyGoods">
        <input type="hidden" value="${commonids}" name="commonids"/>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label>审核通过:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="rewrite_enabled"  class="cb-enable selected" title="是"><span>是</span></label>
                    <label for="rewrite_disabled" class="cb-disable" title="否"><span>否</span></label>
                    <input id="rewrite_enabled" name="verifyState" checked="checked" value="1" type="radio">
                    <input id="rewrite_disabled" name="verifyState" value="0" type="radio"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr nctype="reason" style="display: none;">
                <td colspan="2" class="required"><label for="verifyReason">未通过理由:</label></td>
            </tr>
            <tr class="noborder" nctype="reason" style="display :none;">
                <td class="vatop rowform"><textarea rows="6" class="tarea" cols="60" name="verifyReason" id="verify_reason"></textarea></td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2"><a href="javascript:void(0);" class="btn" nctype="btn_submit"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    $(function(){
        $('a[nctype="btn_submit"]').click(function(){
            ajaxpost('form1', '', '', 'onerror');
        });
        $('input[name="verifyState"]').click(function(){
            if ($(this).val() == 1) {
                $('tr[nctype="reason"]').hide();
            } else {
                $('tr[nctype="reason"]').show();
            }
        });
    });
</script>
</@layout.body>
<div class="page">
    <form method="post" name="form1" id="form1" action="${base}/goods/goodsCommon/wgxjGoods">
        <input type="hidden" value="${goodsIds}" name="goodsIds"/>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label for="close_reason">违规下架理由:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><textarea rows="6" class="tarea" cols="60" name="remark" id="close_reason"></textarea></td>
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
    });
</script>

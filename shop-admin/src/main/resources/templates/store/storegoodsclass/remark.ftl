<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<div class="page">
    <form method="post" name="form1" id="form1" action="${base}/storeGoodsClass/updateStoregoodclass">
        <input type="hidden" value="${storeGoodsClass.stcId}" name="stcId"/>
        <table class="table tb-type2 nobdb">
            <tbody>
	            <tr class="noborder">
	                <td colspan="2" class="required"><label for="close_reason">审核结果:</label></td>
	            </tr>
	            <tr class="noborder">
	                <td class="vatop rowform"><textarea rows="6" class="tarea" cols="60" name="reason" id="close_reason"></textarea></td>
	            </tr>
            </tbody>
            <tr>
                 <td colspan="2"><label for="close_reason">审核:</label></td>
            </tr>
            <tr class="noborder">
	                <td class="vatop rowform onoff">
		                <label for="brand_checkState1" class="cb-enable selected"><span>是</span></label>
	                    <label for="brand_checkState2" class="cb-disable"><span>否</span></label>
	                    <input id="brand_checkState1" name="checkState"  value="1" type="radio" checked="checked">
	                    <input id="brand_checkState2" name="checkState" value="2" type="radio">
	                </td>
	        </tr>
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

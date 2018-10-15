<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>满免邮活动规则管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/mianyouRule/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="mianyouRule_form" action="${base}/mianyouRule/saveOrUpdate" method="post">
    <input type="hidden" name="ruleId" value="${mianyouRule.ruleId}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="ruleId" class="validation">规则编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.ruleId}" name="ruleId" id="ruleId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="mianyouId" class="validation">活动编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.mianyouId}" name="mianyouId" id="mianyouId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="level" class="">规则级别(1/2/3):</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.level}" name="level" id="level"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="price" class="validation">级别价格:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.price}" name="price" id="price"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="shippingFree" class="">免邮标志(0-不免邮/1-免邮费):</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.shippingFree}" name="shippingFree" id="shippingFree"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="discount" class="validation">减现金优惠金额:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.discount}" name="discount" id="discount"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="giftName" class="">礼品名称:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.giftName}" name="giftName" id="giftName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="giftLink" class="">礼品链接:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${mianyouRule.giftLink}" name="giftLink" id="giftLink"></td>
	           	<td class="vatop tips"></td>
	        </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td></td>
	            <td colspan="2">
	            	<a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a>
	            	<a href="JavaScript:history.go(-1);" class="btns"><span>返回</span></a>
	            </td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            $("#mianyouRule_form").submit();
        });
    });
</script>
</@layout.body>
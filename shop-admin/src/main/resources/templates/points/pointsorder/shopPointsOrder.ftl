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
        <h3>兑换订单管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsOrder/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsOrder_form" action="${base}/shopPointsOrder/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPointsOrder.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td colspan="2" class="required" ><label for="pointOrdersn" class="validation">兑换订单编号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointOrdersn}" name="pointOrdersn" id="pointOrdersn"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointBuyerid" class="validation">兑换会员id:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointBuyerid}" name="pointBuyerid" id="pointBuyerid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointBuyername" class="validation">兑换会员姓名:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointBuyername}" name="pointBuyername" id="pointBuyername"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointBuyeremail" class="validation">兑换会员email:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointBuyeremail}" name="pointBuyeremail" id="pointBuyeremail"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointAddtime" class="validation">兑换订单生成时间:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointAddtime}" name="pointAddtime" id="pointAddtime"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointShippingtime" class="validation">配送时间:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointShippingtime}" name="pointShippingtime" id="pointShippingtime"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointShippingcode" class="validation">物流单号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointShippingcode}" name="pointShippingcode" id="pointShippingcode"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointShippingEcode" class="validation">物流公司编码:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointShippingEcode}" name="pointShippingEcode" id="pointShippingEcode"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointFinnshedtime" class="validation">订单完成时间:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointFinnshedtime}" name="pointFinnshedtime" id="pointFinnshedtime"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointAllpoint" class="validation">兑换总积分:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointAllpoint}" name="pointAllpoint" id="pointAllpoint"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointOrdermessage" class="validation">订单留言:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointOrdermessage}" name="pointOrdermessage" id="pointOrdermessage"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointOrderstate" class="validation">订单状态：20(默认):已兑换并扣除积分;30:已发货;40:已收货;50已完成;2已取消:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrder.pointOrderstate}" name="pointOrderstate" id="pointOrderstate"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="remarks" class="validation">备注信息:</label></td>
	        </tr>
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
        </tbody>
        <tfoot>
	        <tr>
	            <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            $("#shopPointsOrder_form").submit();
        });
    });
</script>
</@layout.body>
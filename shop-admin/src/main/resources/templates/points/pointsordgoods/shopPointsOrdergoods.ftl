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
        <h3>兑换订单商品表管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsOrdergoods/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsOrdergoods_form" action="${base}/shopPointsOrdergoods/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPointsOrdergoods.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td colspan="2" class="required" ><label for="pointOrderid" class="validation">订单id:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointOrderid}" name="pointOrderid" id="pointOrderid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointGoodsid" class="validation">礼品id:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointGoodsid}" name="pointGoodsid" id="pointGoodsid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointGoodsname" class="validation">礼品名称:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointGoodsname}" name="pointGoodsname" id="pointGoodsname"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointGoodspoints" class="validation">礼品兑换积分:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointGoodspoints}" name="pointGoodspoints" id="pointGoodspoints"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointGoodsnum" class="validation">礼品数量:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointGoodsnum}" name="pointGoodsnum" id="pointGoodsnum"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pointGoodsimage" class="validation">礼品图片:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrdergoods.pointGoodsimage}" name="pointGoodsimage" id="pointGoodsimage"></td>
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
            $("#shopPointsOrdergoods_form").submit();
        });
    });
</script>
</@layout.body>
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
        <h3>积分兑换商品购物车管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsCart/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsCart_form" action="${base}/shopPointsCart/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPointsCart.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td colspan="2" class="required" ><label for="pmemberId" class="validation">会员编号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pmemberId}" name="pmemberId" id="pmemberId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pgoodsId" class="validation">积分礼品序号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pgoodsId}" name="pgoodsId" id="pgoodsId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pgoodsName" class="validation">积分礼品名称:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pgoodsName}" name="pgoodsName" id="pgoodsName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pgoodsPoints" class="validation">积分礼品兑换积分:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pgoodsPoints}" name="pgoodsPoints" id="pgoodsPoints"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pgoodsChoosenum" class="validation">选择积分礼品数量:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pgoodsChoosenum}" name="pgoodsChoosenum" id="pgoodsChoosenum"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="pgoodsImage" class="validation">积分礼品图片:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsCart.pgoodsImage}" name="pgoodsImage" id="pgoodsImage"></td>
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
            $("#shopPointsCart_form").submit();
        });
    });
</script>
</@layout.body>
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
        <h3>满送套餐管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPMansongQuota/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPMansongQuota_form" action="${base}/shopPMansongQuota/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPMansongQuota.id}">
    <table class="table tb-type2">
        <tbody>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="storeId" class="validation">店铺编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongQuota.storeId}" name="storeId" id="storeId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="memberName" class="validation">用户名:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongQuota.memberName}" name="memberName" id="memberName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="storeName" class="validation">店铺名称:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongQuota.storeName}" name="storeName" id="storeName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="state" class="validation">配额状态(1-可用/2-取消/3-结束):</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongQuota.state}" name="state" id="state"></td>
	           	<td class="vatop tips"></td>
	        </tr>
        </tbody>
        <tfoot>
	        <tr>
	            <td></td>
	            <td colspan="2">
	            	<a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a>
	            	<a href="JavaScript:history.go(-1);" class="btn"><span>返回</span></a>
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
            $("#shopPMansongQuota_form").submit();
        });
    });
</script>
</@layout.body>
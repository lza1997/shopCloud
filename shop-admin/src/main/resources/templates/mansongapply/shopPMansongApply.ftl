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
        <h3>pmansongapply管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPMansongApply/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPMansongApply_form" action="${base}/shopPMansongApply/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPMansongApply.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="applyId" class="validation">申请编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.applyId}" name="applyId" id="applyId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="memberId" class="validation">用户编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.memberId}" name="memberId" id="memberId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="memberName" class="validation">用户名:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.memberName}" name="memberName" id="memberName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="storeId" class="validation">店铺编号:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.storeId}" name="storeId" id="storeId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="storeName" class="validation">店铺名称:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.storeName}" name="storeName" id="storeName"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="applyQuantity" class="validation">申请数量:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.applyQuantity}" name="applyQuantity" id="applyQuantity"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="applyDate" class="validation">申请时间:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.applyDate}" name="applyDate" id="applyDate"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="state" class="validation">状态(1-新申请/2-审核通过/3-已取消/4-审核失败):</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${shopPMansongApply.state}" name="state" id="state"></td>
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
            $("#shopPMansongApply_form").submit();
        });
    });
</script>
</@layout.body>
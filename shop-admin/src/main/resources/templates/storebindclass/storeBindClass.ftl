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
        <h3>店铺可发布商品类目表管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/storeBindClass/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="storeBindClass_form" action="${base}/storeBindClass/saveOrUpdate" method="post">
    <input type="hidden" name="bid" value="${storeBindClass.bid}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="bid" class="validation">bid:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.bid}" name="bid" id="bid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="storeId" class="">店铺ID:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.storeId}" name="storeId" id="storeId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="commisRate" class="">佣金比例:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.commisRate}" name="commisRate" id="commisRate"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="class1" class="">一级分类:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.class1}" name="class1" id="class1"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="class2" class="">二级分类:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.class2}" name="class2" id="class2"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="" ><label for="class3" class="">三级分类:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.class3}" name="class3" id="class3"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;" class="required" ><label for="state" class="validation">状态0审核中1已审核 2平台自营店铺:</label></td>
				<td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${storeBindClass.state}" name="state" id="state"></td>
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
            $("#storeBindClass_form").submit();
        });
    });
</script>
</@layout.body>
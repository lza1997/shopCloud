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
        <h3>兑换订单地址表管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsOrderaddress/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsOrderaddress_form" action="${base}/shopPointsOrderaddress/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPointsOrderaddress.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td colspan="2" class="required" ><label for="pointOrderid" class="validation">订单id:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointOrderid}" name="pointOrderid" id="pointOrderid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointTruename" class="validation">收货人姓名:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointTruename}" name="pointTruename" id="pointTruename"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointAreaid" class="validation">地区id:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointAreaid}" name="pointAreaid" id="pointAreaid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointAreainfo" class="validation">地区内容:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointAreainfo}" name="pointAreainfo" id="pointAreainfo"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointAddress" class="validation">详细地址:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointAddress}" name="pointAddress" id="pointAddress"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointZipcode" class="validation">邮政编码:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointZipcode}" name="pointZipcode" id="pointZipcode"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointTelphone" class="validation">电话号码:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointTelphone}" name="pointTelphone" id="pointTelphone"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="pointMobphone" class="validation">手机号码:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsOrderaddress.pointMobphone}" name="pointMobphone" id="pointMobphone"></td>
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
            $("#shopPointsOrderaddress_form").submit();
        });
    });
</script>
</@layout.body>
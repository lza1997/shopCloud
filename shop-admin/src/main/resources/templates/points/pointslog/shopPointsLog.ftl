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
        <h3>会员积分日志表管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopPointsLog/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopPointsLog_form" action="${base}/shopPointsLog/saveOrUpdate" method="post">
    <input type="hidden" name="id" value="${shopPointsLog.id}">
    <table class="table tb-type2">
        <tbody>
        	
			<tr>
	            <td colspan="2" class="required" ><label for="plId" class="validation">积分日志编号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plId}" name="plId" id="plId"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="plMemberid" class="validation">会员编号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plMemberid}" name="plMemberid" id="plMemberid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="plMembername" class="validation">会员名称:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plMembername}" name="plMembername" id="plMembername"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="plAdminid" class="validation">管理员编号:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plAdminid}" name="plAdminid" id="plAdminid"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="plAdminname" class="validation">管理员名称:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plAdminname}" name="plAdminname" id="plAdminname"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="plPoints" class="validation">积分数负数表示扣除:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plPoints}" name="plPoints" id="plPoints"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="" ><label for="createTime" class="validation">添加时间:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.createTime}" name="createTime" id="createTime"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="plDesc" class="validation">操作描述:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plDesc}" name="plDesc" id="plDesc"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr>
	            <td colspan="2" class="required" ><label for="plStage" class="validation">操作阶段:</label></td>
	        </tr>
			<tr class="noborder">
	            <td class="vatop rowform"><input type="text" class="txt" value="${shopPointsLog.plStage}" name="plStage" id="plStage"></td>
	           	<td class="vatop tips"></td>
	        </tr>
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
            $("#shopPointsLog_form").submit();
        });
    });
</script>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>生成方案管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/genScheme/list"><span>管理</span></a></li>
            <#if genScheme.id?exists && genScheme.id!=0>
            	<li><a href="${base}/genScheme/form"><span>新增</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>修改</span></a></li>
            <#else>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </#if>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="genScheme_form" action="${base}/genScheme/save" method="post">
    <input type="hidden" name="id" value="${genScheme.id}">
    <input type="hidden" name="flag" id="flag" value="0">
    <table class="table tb-type2" style="width:auto;">
        <tbody>
        	<tr class="noborder">
	            <td width="120" style="text-align:right;"><label for="type" class="validation">生成策略:</label></td>
	            <td class="vatop rowform" style="width:auto;">
	            	<input type="radio" value="1" name="type" <#if genScheme.type==1>checked="checked"</#if>>单工程
	            	<input type="radio" value="2" name="type" <#if genScheme.type!=1>checked="checked"</#if>>分布式
	            </td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
	            <td width="120" style="text-align:right;"><label for="name" class="validation">方案名称:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.name}" name="name" id="name"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="category" class="validation">模板分类:</label></td>
	            <td class="vatop rowform" style="width:auto;">
	            	<select name="category" id="category" style="width: 295px;">
	            		<#list config.categoryList as category>
	            		<option <#if genScheme.category==category.value>selected="selected"</#if> value="${category.value}">${category.label}</option>
	            		</#list>
	            	</select>
	            </td>
	           	<td class="vatop tips">生成结构：{包名}/{分层(dao,entity,service,web)}/{java类}</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="packageName" class="validation">生成包路径:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.packageName}" name="packageName" id="packageName"></td>
	           	<td class="vatop tips">建议模块包：com.shop.admin</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="moduleName" class="validation">生成模块名:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.moduleName}" name="moduleName" id="moduleName"></td>
	           	<td class="vatop tips">可理解为业务名 </td>
	        </tr>
	        
			<tr class="noborder" style="display:none;">
				<td style="text-align:right;" ><label for="subModuleName">生成子模块名:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.subModuleName}" name="subModuleName" id="subModuleName"></td>
	           	<td class="vatop tips">可选，分层下的文件夹，例如</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="functionName" class="validation">生成功能描述:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.functionName}" name="functionName" id="functionName"></td>
	           	<td class="vatop tips">将设置到类描述</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="functionNameSimple" class="validation">生成功能名:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.functionNameSimple}" name="functionNameSimple" id="functionNameSimple"></td>
	           	<td class="vatop tips">用作功能提示，如：保存“某某”成功</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="functionAuthor" class="validation">生成功能作者:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.functionAuthor}" name="functionAuthor" id="functionAuthor"></td>
	           	<td class="vatop tips">功能开发者</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="genTable.id" class="validation">业务表名:</label></td>
	            <td class="vatop rowform" style="width:auto;">
	            	<select name="genTableId" id="genTableId" style="width: 295px;">
	            		<#list tableList as table>
	            		<option <#if table.id==genScheme.genTableId>selected="selected"</#if> value="${table.id}">${table.name!''} : ${table.comments!''}</option>
	            		</#list>
	            	</select>
            	</td>
	           	<td class="vatop tips">生成的数据表，一对多情况下请选择主表。</td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="remarks">备注:</label></td>
	            <td class="vatop rowform" style="width:auto;"><input type="text" style="width: 285px;" class="txt" value="${genScheme.remarks}" name="remarks" id="remarks"></td>
	           	<td class="vatop tips"></td>
	        </tr>
			<tr class="noborder">
				<td style="text-align:right;" ><label for="replaceFile">生成选项:</label></td>
	            <td class="vatop rowform" style="width:auto;">
	            <input type="checkbox" value="true" <#if genScheme.replaceFile></#if> name="replaceFile" id="replaceFile">是否替换现有文件
	            </td>
	           	<td class="vatop tips"></td>
	        </tr>
	        
        </tbody>
        <tfoot>
	        <tr>
            	<td></td>	
	            <td colspan="2">
	            	<a href="JavaScript:void(0);" flag="0" class="btn submitBtn"><span>保存方案</span></a>
	            	<a href="JavaScript:void(0);" flag="1" class="btn submitBtn"><span>保存并生成代码</span></a>
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
        $(".submitBtn").click(function(){
        	var flag=$(this).attr("flag");
        	$("#flag").val(flag);
            $("#genScheme_form").submit();
        });
    });
</script>
</@layout.body>
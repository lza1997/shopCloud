<@layout.head>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
	<div class="fixed-bar">
	     <div class="item-title">
	         <h3>新增菜单</h3>
	         <ul class="tab-base">
	             <li><a href="${base}/promotion/index"><span>管理</span></a></li>
	             <li><a href="javaScript:;" class="current"><span><#if promotion??>编辑<#else>新增</#if></span></a></li>
	         </ul>
	     </div>
	 </div>
	 <div class="fixed-empty"></div>
		<form action="${base}/promotion/saveOrUpdate" method="post" >
		<input name="Id" value="${promotion.id}" id="Id" type="hidden">
		<table class="table tb-type2 nobdb">
		    <tbody>
		    	<tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="name">分类名称:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="name" class="txt" value="${promotion.name}"></td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="pStartValue">起始值:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="startValue" class="txt" value="${promotion.startValue}"></td>
		           <td class="vatop tips">请填写数字例如：10.00</td>
		        </tr>
		       <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="promoteValue">优惠值:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">
		          	<input type="text" name="promoteValue" class="txt" value="${promotion.promoteValue }">
		          </td>
		          <td class="vatop tips">请填写数字例如：11.00或0.9</td>
		        </tr>
		        
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="promoteValue">分类:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">
		          	<select name="pcId" id="pcId">
		          		<option value＝"">请选择</option>
			          	<#list pclist as pc>
			          	<option value="${pc.pcId}" <#if (pc.pcId==promotion.pcId)>selected</#if> >${pc.pcName}</option>
			          	</#list>
		          	</select>
		          	
		          </td>
		        </tr>
		        
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="status">状态:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">启用：<input type="radio" name="status" value="0" <#if (promotion.status!=1)>checked</#if> />
		          停用：<input type="radio" name="status" value="1" <#if (promotion.status=1)>checked</#if> /></td>
		        </tr>
		       	<tr>
		       		<td><input type="submit" class="btn" value="提交"></td>
		       	</tr>
		   </tbody>
		</table>
		</form>
</div>
<script type="text/javascript">
    $(function(){
        $('#pcStartTime').datetimepicker({});
        $('#pcEndTime').datetimepicker({});
    });
</script>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/shopPlugins/ShopTable.js"></script>
<script type="text/javascript" src="${base}/js/layer/layer.min.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
	<div class="fixed-bar">
	     <div class="item-title">
	         <h3>新增菜单</h3>
	         <ul class="tab-base">
	             <li><a href="${base}/frontMenu/list"><span>管理</span></a></li>
	             <li><a href="javaScript:;" class="current"><span>新增</span></a></li>
	         </ul>
	     </div>
	 </div>
	 <div class="fixed-empty"></div>
		<form action="${base}/frontMenu/save" method="post" >
		<table class="table tb-type2 nobdb">
		    <tbody>
		    	<tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="adminName">菜单名称:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="name" class="txt"></td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="adminName">菜单路径:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="url" class="txt"></td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="adminName">所属菜单分类:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform">
		          	<select name="parentId">
		          		<option value="0">新增分类</option>
		          		<#list list as c>
		          			<option value="${c.id}" <#if pid == c.id>selected="selected" </#if>>${c.name}</option>
		          		</#list>
		          	</select>
		          </td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="adminName">排序:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="sort" class="txt"></td>
		        </tr>
		        <tr class="noborder">
		          <td colspan="2" class="required"><label class="validation" for="adminName">菜单描述:</label></td>
		        </tr>
		        <tr class="noborder">
		          <td class="vatop rowform"><input type="text" name="description" class="txt"></td>
		        </tr>
		       	<tr>
		       		<td><input type="submit" value="提交"></td>
		       	</tr>
		   </tbody>
		</table>
		</form>
</div>
</@layout.body>
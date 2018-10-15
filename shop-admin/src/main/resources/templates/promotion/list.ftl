<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js" charset="utf-8"></script>
<script type="text/javascript">
	function deleteClass() {
		var items = $("input[name='ids']:checked").length;
		if (items == 0) {
			alert("请至少选择一个要删除的项目");
		} else {
			if (confirm('您确定要删除吗?')) {
				$('#form_list').submit();
			}
		}
	}
</script>
</@layout.head>
<@layout.body>
<div class="page">
	<div class="fixed-bar">
		<div class="item-title">
			<h3>促销管理</h3>
			<ul class="tab-base">
				<li><a href="JavaScript:void(0);" class="current"><span>管理</span>
				</a></li>
				<!-- <li><a href="${base}/promotion/add?id=0"><span>新增</span> </a></li> -->
			</ul>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<form id="form_list" method='post' action="${base}/promotion/index" name="formSearch">
	<input type="hidden" name="pageNo" value="${pager.pageNo}">
		<table class="table tb-type2 nobdb">
			<thead>
				<tr class="thead">
					<th><input type="checkbox" class="checkall" id="checkall_1"></th>
					<th class="align-center">优惠名称</th>
					<th class="align-center">起始值</th>
					<th class="align-center">优惠值</th>
					<th class="align-center">分类</th>
					<th class="align-center">状态</th>
					<!-- <th class="align-center">排序</th> -->
					<th class="align-center">操作</th>
				</tr>
			</thead>
			<tbody>
				<#list pager.result as promotes>
				<tr class="hover edit">
					 <td class="w24">
                    <input name="logId" type="checkbox" class="checkitem" value="${promotes.id}">
	                </td>
	                <td class="align-center">${promotes.name}</td>
	                <td class="align-center">${promotes.startValue}</td>
	                <td class="align-center">${promotes.promoteValue}</td>
	                <td class="align-center">${promotes.pcName}</td>
	                <td class="align-center">
	                <#if (promotes.status=0)>启用<#else>停用</#if>
	                </td>
	               <!--  <td class="align-center">${promotes.sort}</td> -->
	                <td class="align-center"><a href="${base}/promotion/add?pId=${promotes.id}" >修改</a>
	                <!-- ｜<a href="${base}/promotion/delete?pId=${promotes.id}">删除</a></td> -->
				</tr>
				</#list>
			</tbody>
			<tfoot>
				<!-- <tr id="batchAction">
					<td><input type="checkbox" class="checkall" id="checkallBottom"></td>
					<td colspan="16" id="dataFuncs"><label for="checkallBottom">全选</label>
						&nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="del()"><span>删除</span> </a></td>
				</tr> -->
				
	            <tr>
	                <td colspan="16">
	                    <@layout.pager pager/>
	                </td>
	            </tr>
			</tfoot>
		</table>
	</form>
</div>
</@layout.body>

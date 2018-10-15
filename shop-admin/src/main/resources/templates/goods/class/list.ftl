<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.goods_class.js"></script>
	
<script type="text/javascript">
	var vadate = false;
	var validate = false;
	function delClass() {
		var items = $("input[name='ids']:checked").length;
		if (items == 0) {
			alert("请至少选择一个要删除的项目");
		} else {
			if (confirm('您确定要删除吗?')) {
				$('#form_list').submit();
			}
		}
	}
	function delRow(obj) {
		if (confirm('您确定要删除吗?')) {
			$(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
			$('#form_list').submit();
		}
	}

	function delClassid(classid) {
		//校验菜单底线是否含有子菜单
		valicountparent(classid);
		//校验此分类下是否有未删除的商品
		validateGoodsByGcId(classid);
		if (vadate&&validate) {
			if (confirm('您确定要删除吗?')) {
				var url = "${base}/goods/class/deleteid";
				var para = {
					"classid" : classid
				};
				$.ajax({
					type : "post",
					url : url,
					data : para,
					dataType : "json",
					async : false,
					success : function(data) {
						if (data.success == "true") {
							alert(data.result);
							window.location = '${base}/goods/class/list'
						} else {
							alert(data.result);
						}
					}
				});
			}
		} 
		if(!vadate){
			alert("请删除子菜单后再进行删除！");
		}
		if(!validate){
			alert("该分类下有未删除商品，无法删除此分类！");
		}	
		
	}

	function validateGoodsByGcId(classid) {
		var url = "${base}/goods/goods/validateGoodsByGcId";
		var para = {
			"id" : classid
		};
		var vali = $.ajax({
			type : "post",
			url : url,
			data : para,
			dataType : "json",
			async : false,
			success : function(data) {
				if (data) {
					validate = true;
					return true;
				} else {
					validate = false;
					return false;
				}
			}
		});
	}
	function valicountparent(classid) {
		var url = "${base}/goods/class/validateparentid";
		var para = {
			"id" : classid
		};
		var va = $.ajax({
			type : "post",
			url : url,
			data : para,
			dataType : "json",
			async : false,
			success : function(data) {
				if (data) {
					vadate = true;
					return true;
				} else {
					vadate = false;
					return false;
				}
			}
		});
	}
</script>
</@layout.head> <@layout.body>
<div class="page">
	<div class="fixed-bar">
		<div class="item-title">
			<h3>分类管理</h3>
			<ul class="tab-base">
				<li><a href="${base}/goods/class/list" class="current"><span>管理</span>
				</a>
				</li>
				<li><a href="${base}/goods/class/forward?gcId=0&gcParentId=0"><span>新增</span>
				</a>
				</li> <#--
				<li><a href="javaScript:;"><span>TAG管理</span>
				</a>
				</li>-->
			</ul>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<table class="table tb-type2" id="prompt">
		<tbody>
			<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);"
				class="space odd">
				<th colspan="12"><div class="title">
						<h5>操作提示</h5>
						<span class="arrow"></span>
					</div>
				</th>
			</tr>
			<tr style="background: none repeat scroll 0% 0% rgb(255, 255, 255);"
				class="odd">
				<td><ul>
						<li>当店主添加商品时可选择商品分类，用户可根据分类查询商品列表</li>
						<li>点击分类名前“+”符号，显示当前分类的下级分类</li>
						<li><a>对分类作任何更改后，都需要到 设置 -> 清理缓存 清理商品分类，新的设置才会生效</a>
						</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<form method="post" id='form_list' action="${base}/goods/class/delete">
		<table class="table tb-type2" id="acct_grid">
			<thead>
				<tr class="thead">
					<th></th>
					<th>排序</th>
					<th>分类名称</th>
					<th>类型</th>
					<th>佣金比例</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<#list list as class>
						<tr class="hover edit">
							       <td class="w48"><input type="checkbox" name="ids" value="${class.gcId}" class="checkitem">
										 <#if class.hasChild != 0>
										    <img fieldid="${class.gcId}" status="open" nc_type="flex" level="1" src="${base}/res/images/tv-expandable.gif">
										 <#else> 
										    <img fieldid="${class.gcId}" status="close" nc_type="flex" src="${base}/res/images/tv-item.gif">
										 </#if>
								   </td>
									<td class="w48 sort">
									   <span title="可编辑" datatype="number" modUrl="${base}/goods/class/modifySort" fieldid="${class.gcId}" fieldname="gcSort" nc_type="inline_edit" class="editable ">
										   ${class.gcSort}
									   </span>
									</td>
									<td class="w50pre name">
										      <span title="可编辑" required="1" fieldid="${class.gcId}" modUrl="${base}/goods/class/modifyName" fieldname="gcName" nc_type="inline_edit" class="editable ">
											   ${class.gcName}
											 </span>
										<a class="btn-add-nofloat marginleft" href="${base}/goods/class/forward?gcId=0&gcParentId=${class.gcId}">
											 <span>
											     新增下级
											 </span>
									   </a>
									</td>
									<td>${class.typename}</td>
									<td>
									   <#if class.expenScale??>
									      ${class.expenScale}&#37;
									   </#if>
									</td>
									<td class="w84">
										<a href="${base}/goods/class/forward?gcId=${class.gcId}&gcParentId=${class.gcId}">编辑</a>
										| <a href="javascript:;" onclick="delClassid('${class.gcId}')">删除</a>
									</td> 
							  </tr>
						  </#list>
					
			</tbody>
			<tfoot>
				<tr class="tfoot">
					<td><input type="checkbox" class="checkall" id="checkall_2">
					</td>
					<td id="batchAction" colspan="15">
						  <span class="all_checkbox">
								<label for="checkall_2">全选</label>
					      </span>&nbsp;&nbsp;
						  <a href="JavaScript:void(0);" class="btn" onclick="delClass()">
						  <span>删除</span>
					   </a>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<!-- content] -->
</@layout.body>

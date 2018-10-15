<@layout.head>
<script type="text/javascript"
	src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript"
	src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css" />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"
	charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.menu.js"
	charset="utf-8"></script>
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
	var vadate=false;
	function delClassid(id){
          //校验菜单底线是否含有子菜单
          valicountparent(id);
          if(vadate){
           if(confirm('您确定要删除吗?')){
		   $.ajax({
	             type: "post",
	             url: "${base}/frontMenu/deleteid",
	             data: {"id":id},
	             dataType: "json",
				 async:false,
				 success:function(data) {
					if(data.success == "true"){
					     alert(data.result);
					     window.location = '${base}/frontMenu/list';
					}else{
						  alert(data.result);
					}
				}	
	         });
	       }
	    }else{
	         alert("请删除子菜单后在进行删除！");
	    }  
     }
     function valicountparent(id){
       $.ajax({
             type: "post",
             url: "${base}/frontMenu/validate",
           	 data: {"id":id},
             dataType: "json",
			 async:false,
			 success:function(data) {
				if(data){
				    vadate=true;
				    return true;
				}else{
				    vadate=false;
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
			<h3>菜单管理</h3>
			<ul class="tab-base">
				<li><a href="JavaScript:void(0);" class="current"><span>管理</span>
				</a></li>
				<li><a href="${base}/frontMenu/add?id=0"><span>新增</span> </a></li>
			</ul>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<form id="form_list" method='post' action="${base}/frontMenu/delete">
		<table class="table tb-type2 nobdb">
			<thead>
				<tr class="thead">
					<th><input type="checkbox" class="checkall" id="checkall_1">
					</th>
					<th>排序</th>
					<th>菜单名</th>
					<th>菜单路径</th>
					<th>菜单描述</th>
					<th class="align-center">操作</th>
				</tr>
			</thead>
			<tbody>
				<#list list as c>
				<tr class="hover edit">
					<td class="w36"><input type="checkbox" name='ids'
						value="${c.id}" class="checkitem"> <#if c.hasChild == 0> <img
						fieldid="${c.id}" status="close" nc_type="flex"
						src="${base}/res/images/tv-item.gif"> <#else> <img
						fieldid="${c.id}" status="open" nc_type="flex" level="1"
						src="${base}/res/images/tv-expandable.gif"> </#if></td>
					<td class="sort"><span class='editable' nc_type='inline_edit'
						required='1' fieldname='sort' fieldid='${c.id}'
						modUrl='${base}/frontMenu/editSort'>${c.sort}</span></td>
					<td class="name"><span class="editable">${c.name}</span></td>
					<td class="name"><span class="editable"></span></td>
					<td class="name"><span class="node_name editable">一级为菜单分类</span>
						<a class='btn-add-nofloat marginleft'
						href="${base}/frontMenu/add?id=${c.id}">新增下级</a></td>
					<td class="w84 align-center"><span> <a
							href="JavaScript:void(0);" onclick="delClassid('${c.id}')">删除</a>
					</span></td>
				</tr>
				</#list>
			</tbody>
			<tfoot>
				<tr id="batchAction">
					<td><input type="checkbox" class="checkall"
						id="checkallBottom"></td>
					<td colspan="16" id="dataFuncs"><label for="checkallBottom">全选</label>
						&nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
						onclick="deleteClass()"><span>删除</span> </a></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
</@layout.body>
<script type="text/javascript">
</script>

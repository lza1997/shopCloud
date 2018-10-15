<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.seller_menu_class.js"></script>
<script type="text/javascript">
var vadate=false;

function delClass(){
    var items = $("input[name='ids']:checked").length;
    if (items==0) {
        alert("请至少选择一个要删除的项目");
    }else{
        if(confirm('您确定要删除吗?')){
            $('#form_list').submit();
        }
    }
}

function delClassid(classid){
       //校验菜单底线是否含有子菜单
       valicountparent(classid);
       if(vadate){
           if(confirm('您确定要删除吗?')){
           var url = "${base}/shopSellerMenu/deleteid";
		   var para = {"classid":classid};
		   $.ajax({
	             type: "post",
	             url: url,
	             data: para,
	             dataType: "json",
				 async:false,
				 success:function(data) {
					if(data.success == "true"){
						 alert(data.result);
					     window.location = '${base}/shopSellerMenu/list'
					}else{
						 alert(data.result);
					}
				}	
	         });
	       }
	     }else{
	         alert("请删除子菜单后再进行删除！");
	     }  
    }
function valicountparent(classid){
   var url = "${base}/shopSellerMenu/validateparentid";
   var para = {"id":classid};
   var va=
   $.ajax({
             type: "post",
             url: url,
             data: para,
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
</@layout.head>

<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺菜单管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
		<@shiro.hasPermission name="sys:sellermenu:edit">
                <li><a href="${base}/shopSellerMenu/forward?menuId=0&menuParentId=0"><span>新增</span></a></li>
		</@shiro.hasPermission>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li></li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="${base}/shopSellerMenu/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
	            <th class="w48"></th>
	            <th class="w50pre">菜单名称</th>
	            <th>链接</th>
	            <th>可见</th>
	            <th>权限标识</th>
	            <th><@shiro.hasPermission name="sys:sellermenu:edit">操作</@shiro.hasPermission></th>
	        </tr>
            </thead>
            <tbody>
            <#list shopSellerMenuList as shopSellerMenu>
	            <tr class="hover edit">
	            	<td class="w48"><@shiro.hasPermission name="sys:sellermenu:edit"><input type="checkbox" name="mIds" value="${shopSellerMenu.menuId}" class="checkitem">
		                <#if shopSellerMenu.hasChild != 0>
		                    <img fieldid="${shopSellerMenu.menuId}" status="open" nc_type="flex" level="1" src="${base}/res/images/tv-expandable.gif">
		                <#else>
		                    <img fieldid="${shopSellerMenu.menuId}" status="close" nc_type="flex" src="${base}/res/images/tv-item.gif">
		                </#if></@shiro.hasPermission>
		            </td>
		            <td class="w50pre name">
		                  ${shopSellerMenu.menuName}
		                <a class="btn-add-nofloat marginleft" href="${base}/shopSellerMenu/forward?menuId=0&menuParentId=${shopSellerMenu.menuId}"><span> 新增下级</span></a>
		            </td>
	                <td>
	                	${shopSellerMenu.menuUrl}
	                </td>
	                <td>
	                	${shopSellerMenu.menuIsshow}
	                </td>
	                <td>
	                	${shopSellerMenu.menuPermission}
	                </td>
	                <td  class="w84"><@shiro.hasPermission name="sys:sellermenu:edit">
	                    <a href="${base}/shopSellerMenu/forward?menuId=${shopSellerMenu.menuId}&menuParentId=${shopSellerMenu.menuParentId}">编辑</a>
	                    &nbsp;|&nbsp;
	                    <a href="javascript:;" onclick="delClassid('${shopSellerMenu.menuId}')" >删除</a></@shiro.hasPermission>
	                </td>
	            </tr>
	        </#list>
            </tbody>
            <tfoot>
	            <tr class="tfoot">
		            <td><@shiro.hasPermission name="sys:sellermenu:edit"><input type="checkbox" class="checkall" id="checkallBottom"></@shiro.hasPermission></td>
		            <td colspan="8"><@shiro.hasPermission name="sys:sellermenu:edit">
		            	<label for="checkallBottom">全选</label>
		                &nbsp;&nbsp;
		                <a href="JavaScript:void(0);" class="btn" onclick="delClass()"><span>删除</span></a></@shiro.hasPermission>
		             </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
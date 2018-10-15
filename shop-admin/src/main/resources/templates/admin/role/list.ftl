<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    function deleteRole(){
  		var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("你还没有选择要删除的对象");
        }else{
            if(confirm('您确定要删除吗?')){              		
                $("#form_list").attr("action",APP_BASE+"/role/delShopRole");
                $('#form_list').submit();
            }
        }
    }    
    
     
    
     function delrole(roleid){
              //校验菜单底线是否含有子菜单
	           if(confirm('您确定要删除吗?')){
	           var url = "${base}/role/deleteid";
			   var para = {"roleid":roleid};
			   $.ajax({
		             type: "post",
		             url: url,
		             data: para,
		             dataType: "json",
					 async:false,
					 success:function(data) {
						if(data.success == "true"){
						     alert(data.result);
						     window.location = '${base}/role/list'
						}else{
							  alert(data.result);
						}
					}	
		         });
		       }
        }   
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>角色管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/role/add"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/role/delShopRole">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            
            </tbody>
        </table>
    </form>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td><ul>
                <li>开启操作日志可以记录管理人员的关键操作，但会轻微加重系统负担</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="">
        <table class="table tb-type2">
           <thead>
				<tr class="thead">
					<th>&nbsp;</th>
					<th class="align-center">角色名称</th>
					<th class="align-center">添加时间</th>
					<th class="align-center">角色描述</th>
					<th class="align-center">角色别名</th>
					<th class="align-center">操作</th>
				</tr>
			</thead>
            <tbody>
			<#if pager.result??>
				<#list pager.result as role>
		            <tr class="hover">
		           	    <td><input type="checkbox" name="ids" value="${role.id}" class="checkitem"></td>	
		                <td class="align-center">${role.name}</td>
		                <td class="align-center">
					        <#if role.createTimeStr??>
				                ${role.createTimeStr?string("yyyy-MM-dd")}
				            </#if>
		                </td>
		                <td class="align-center">${role.description}</td>
		                <td class="align-center">${role.roleAlias}</td>
		                <td class="align-center">
		                <#if role.name=='超级管理员'>
	                       		  超级管理员不能编辑 |                   
                     	</#if>
                     	<#if role.name!='超级管理员'>
                     	     <a href="${base}/role/findShopRoleById?id=${role.id}" title="编辑">编辑 </a>|
	                     	 <#--<a href="JavaScript:void(0);" nctype="del_batch" onclick="deleteRole()"><span>删除</span></a>-->
	                     	 <a href="javascript:void(0)" onclick="delrole('${role.id}');" >删除 </a>|
                     	</#if>
                     	 <a href="${base}/menu/class/roleandmenulist?roleid=${role.id}" title="菜单设置">菜单设置</a>
                    	</td>
		            </tr>
				</#list>
			</#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"> </td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="deleteRole();"><span>删除</span></a>
				<@layout.pager pager/>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    // 获得选中ID
    function getId() {
        var str = '';
        $('#form_roles').find('input[name="id[]"]:checked').each(function(){
            id = parseInt($(this).val());
            if (!isNaN(id)) {
                str += id + ',';
            }
        });
        if (str == '') {
            return false;
        }
        str = str.substr(0, (str.length - 1));
        return str;
    }
</script>
</@layout.body>

<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    function saveRole(){
  		 var items = $("input[name='ids']:checked").length;
  		 var check = $("input[name='ids']:checked"); //得到所有被选中的checkbox  
         var str='';              //定义变量  
         check.each(function(i) {         //循环拼装被选中项的值  
             str += $(this).val() + ',';  
         });
         $("#roleid").val(str);
        if (items==0) {
            alert("请至少关联一个用户");
        }else{
            if(confirm('您确定要关联角色吗?')){              		
                $("#form_list").attr("action",APP_BASE+"/setting/admin/memberroleUpdate");
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
            <h3>角色管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/role/add"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/adminlog/list">
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
    <form method="post" id='form_list' action="${base}/setting/admin/memberroleUpdate">
        <table class="table tb-type2">
           <thead>
				<tr class="thead">
					<th>&nbsp;</th>
					<th class="align-center">角色名称t</th>
					<th class="align-center">添加时间</th>
					<th class="align-center">角色描述</th>
					<th class="align-center">操作</th>
				</tr>
			</thead>
            <tbody>
			<#if pager.result??>
				<#list pager.result as role>
		            <tr class="hover">
		           	    <td><input type="checkbox" name="ids" value="${role.id}" class="checkitem" <#list rolelist as roles><#if role.id=roles.id>checked</#if> </#list>></td>	
		                <td class="align-center">${role.name}</td>
		                <td class="align-center">${role.createtime}</td>
		                <td class="align-center">${role.description}</td>
		                <td class="align-center">
                     	   <a href="${base}/menu/class/roleandmenulist?roleid=${role.id}" title="菜单设置">菜单设置</a>
                    	</td>
		            </tr>
				</#list>
			</#if>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"><input type="hidden" name="adminid" id="adminid" value="${adminid}" /><input type="hidden" name="roleid" id="roleid" value="" /> </td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="saveRole();"><span>保存</span></a>
				<@layout.pager pager/>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    // 获得选中ID
   /*  function getId() {
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
    } */
</script>
</@layout.body>

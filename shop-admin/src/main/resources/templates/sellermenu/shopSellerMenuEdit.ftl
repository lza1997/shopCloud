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
        <h3>分类管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/shopSellerMenu/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>编辑</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="shopSellerMenu_form" action="${base}/shopSellerMenu/saveOrUpdate" method="post">
    <input type="hidden" name="menuId" value="${menu.menuId }">
    <input type="hidden" name="form_submit" value="ok" />
    <table class="table tb-type2" style="width:auto;">
        <tbody>
        	
	        <tr class="noborder">
            	<td colspan="2" class="required"><label class="validation" for="menuName">菜单名称:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="${menu.menuName}" name="menuName" id="menuName" maxlength="20" class="txt"></td>
	            <td class="vatop tips"></td>
	        </tr>
	        
	        <tr>
            <td colspan="2" class="required"><label for="menuParentId">上级分类:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
	                <select name="menuParentId" id="menuParentId">
	                    <option value="0">请选择...</option>
	                    <#list shopSellerMenuList as menuList>
	                        <option value="${menuList.menuId}" <#if flag == menuList.menuId>selected="selected" </#if>>
	                            &nbsp;&nbsp;${menuList.menuName}</option>
	                        <#list menuList.shopSellerMenuList as c>
	                            <option value="${c.menuId}" <#if flag == c.menuId>selected="selected" </#if>>
	                                &nbsp;&nbsp;&nbsp;&nbsp;${c.menuName}</option>
	                        </#list>
	                    </#list>
	                </select>
	            </td>
	            <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>
	        </tr>
	        
	        <tr>
            <td colspan="2" class="required"><label for="menuUrl">url地址:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="${menu.menuUrl}" name="menuUrl" id="menuUrl" class="txt"></td>
	            <td class="vatop tips"></td>
	        </tr>
	        
	        <tr>
                <td colspan="2" class="required"><label for="menuDescription">描述:</label></td>
         	</tr>
     		<tr class="noborder">
            	<td class="vatop rowform"><input type="text" value="${menu.menuDescription}" name="menuDescription" id="menuDescription" class="txt"></td>
        	</tr>
	        <tr>
	            <td colspan="2" class="required"><label for="menuIsshow">可见:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
		            <input type="radio"  name="menuIsshow" value="1" <#if 1 == menu.menuIsshow || menu.menuIsshow==null>checked="checked" </#if>>显示
		            <input type="radio"  name="menuIsshow" value="0" <#if 0 == menu.menuIsshow>checked="checked" </#if>>隐藏
	            </td>
	            <td class="vatop tips">该菜单或操作是否显示到系统菜单中</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required"><label for="menuPermission">权限标识:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="${menu.menuPermission}" name="menuPermission" id="menuPermission" class="txt"></td>
	            <td class="vatop tips">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</td>
	        </tr>
	        <tr>
	            <td colspan="2" class="required" ><label for="menuSort" class="validation">排序:</label></td>
	        </tr>
	        
	        <tr class="noborder">
	            <td class="vatop rowform"><input type="text" value="0" name="menuSort" id="menuSort" class="txt"></td>
	            <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
	        </tr>
        </tbody>
        <tfoot>
	        <tr>
	        	<td colspan="2">
	            	<a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a>
	            </td>
	        </tr>
        </tfoot>
    </table>
</form>
</div>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            if($("#shopSellerMenu_form").valid()){
                $("#shopSellerMenu_form").submit();
            }
        });
        $('#shopSellerMenu_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
            	menuName: {
                    required : true,
                    maxlength: 10,
                    minlength: 1
                },
                /*menuUrl: {
                    required : true,
                    maxlength: 30,
                    minlength: 1
                },*/
                menuSort: {
                    required : true,
                    digits	 : true
                }
            },
            messages : {
            	menuName : {
                    required : '请填写菜单名称',
                    maxlength: '规格菜单名称长度应在1-10个字符之间',
                    minlength: '规格菜单名称长度应在1-10个字符之间'
                },
                /*menuUrl : {
                    required : '请填写菜单路径',
                    maxlength: '规格菜单路径长度应在1-30个字符之间',
                    minlength: '规格菜单路径长度应在1-30个字符之间'
                },*/
                menuSort: {
                    required : '请填写菜单排序',
                    digits   : '请填写整数'
                }
            }
        });

       
    });
</script>
</@layout.body>
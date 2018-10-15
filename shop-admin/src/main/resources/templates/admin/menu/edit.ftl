<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>分类管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/menu/class/list"><span>管理</span></a></li>
                <li><a href="${base}/menu/class/forward?mid=0"><span>新增</span></a></li>
                <li><a href="javascript:void(0)" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th class="nobg" colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>"类型"关系到商品发布时商品规格的添加，没有类型的商品分类的将不能添加规格。</li>
                    <li>默认勾选"关联到子分类"将商品类型附加到子分类，如子分类不同于上级分类的类型，可以取消勾选并单独对子分类的特定类型进行编辑选择。</li>
                    <li>在编辑"类型"和勾选"关联到子分类"时，涉及分类下的商品将会被进行"违规下架"处理，商品在重新编辑后才能正常使用，<span color="color:#F30">请慎重操作</span></li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="menu_class_form" name="menuClassForm" action="${base}/menu/class/edit"  method="post">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="mid" value="${gc.mid}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="gc_name validation" for="mname">菜单名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" maxlength="20" value="${gc.mname}" name="mname" id="mname" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
             <tr>
            <td colspan="2" class="required"><label for="parent_id">上级分类:</label></td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform">
                <select name="mparentid" id="gc_parent_id">
                    <option value="0">请选择...</option>
                    <#list classList as class>
                        <option value="${class.mid}" <#if flag == class.mid>selected="selected" </#if>>
                            &nbsp;&nbsp;${class.mname}</option>
                        <#list class.classList as c>
                            <option value="${c.mid}" <#if flag == c.mid>selected="selected" </#if>>
                                &nbsp;&nbsp;&nbsp;&nbsp;${c.mname}</option>
                        </#list>
                    </#list>
                </select>
            </td>
            <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>
        </tr>
            <tr>
                <td colspan="2" class="required"><label for="msort" class="gc_name validation">排序:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${gc.msort}" name="msort" id="m_sort" class="txt"></td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
             <tr>
                <td colspan="2" class="required"><label for="murl" class="gc_name">url地址:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${gc.murl}" name="murl" id="m_url" class="txt"></td>
            </tr>
             <tr>
                <td colspan="2" class="required"><label for="gcSort">描述:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${gc.mdescription}" name="mdescription" id="m_description" class="txt"></td>
            </tr>
            <tr>
	            <td colspan="2" class="required"><label for="isshow">可见:</label></td>
	        </tr>
	        <tr class="noborder">
	            <td class="vatop rowform">
	            <input type="radio"  name="isshow" value="1" <#if 1 == gc.isshow || gc.isshow==null >checked="checked" </#if>>显示
	            <input type="radio"  name="isshow" value="0" <#if 0 == gc.isshow>checked="checked" </#if>>隐藏
	            </td>
	            <td class="vatop tips">该菜单或操作是否显示到系统菜单中</td>
	        </tr>
            <tr>
                <td colspan="2" class="required"><label for="permission">权限标识:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${gc.permission}" name="permission" id="m_permission" class="txt"></td>
            	 <td class="vatop tips">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</td>
            </tr>
            
            </tbody>
            <tfoot>
            <tr class="tfoot"><td colspan="15" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
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
        if($("#menu_class_form").valid()){
            $("#menu_class_form").submit();
        }
    });

    
   

    $('#menu_class_form').validate({
        errorPlacement: function(error, element){
            error.appendTo(element.parent().parent().prev().find('td:first'));
        },
        rules : {
        	mname: {
                required : true,
                maxlength: 10,
                minlength: 1
            },
            /*murl: {
                required : true,
                maxlength: 30,
                minlength: 1
            },*/
            msort: {
                required : true,
                digits	 : true
            }
        },
        messages : {
        	mname : {
                required : '请填写菜单名称',
                maxlength: '规格菜单名称长度应在1-10个字符之间',
                minlength: '规格菜单名称长度应在1-10个字符之间'
            },
            /*murl : {
                required : '请填写菜单路径',
                maxlength: '规格菜单路径长度应在1-30个字符之间',
                minlength: '规格菜单路径长度应在1-30个字符之间'
            },*/
            msort: {
                required : '请填写菜单排序',
                digits   : '请填写整数'
            }
        }
    });

   
});

gcategoryInit('gcategory');
    gcategoryInit('gcategory');
</script>
</@layout.body>
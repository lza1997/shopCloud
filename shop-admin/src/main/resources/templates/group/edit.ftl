<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>数据字典</h3>
            <ul class="tab-base">
                <li><a href="${base}/group/dictionaryGroup/list"><span>列表</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="store_class_form" method="post" action="${base}/group/dictionaryGroup/save">
    	<input type="hidden" name="groupId" value="${dictionaryGroup.groupId}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="groupName">字典名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${dictionaryGroup.groupName }" name="groupName" id="groupName" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="groupCode">字典编码:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${dictionaryGroup.groupCode }" name="groupCode" id="groupCode" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <#-- <tr>
                <td colspan="2" class="required">上级分类:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                    <select name="parentId" id="sc_parent_id">
                        <option value="0">请选择...</option>
                        <#list ParentList as str>
                            <option value="${str.id}" <#if parentId == str.id>selected="selected" </#if>>&nbsp;&nbsp;${str.name}</option>
                        </#list> 
                    </select>
                </td>
                <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>
            </tr> -->
            
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>

    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#store_class_form").valid()){
            $("#store_class_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#store_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                groupName : {
                    required : true
                },
                groupCode : {
                    required : true
                }
            },
            messages : {
                groupName : {
                    required : '字典名称不能为空',
                },
                groupCode  : {
                    required : '字典编码不能为空'
                }
            }
        });
    });
</script>
</@layout.body>
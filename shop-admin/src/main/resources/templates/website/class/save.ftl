<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>文章分类</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/class/list"><span>管理</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="article_class_form" method="post" action="${base}/website/class/saveOrUpdate">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="acName">分类名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="" name="acName" id="ac_name" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="acParentId">上级分类:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><select name="acParentId" id="ac_parent_id">
                    <option value="0">请选择...</option>
                <#list list as class>
                    <option value="${class.acId}" <#if parentId == class.acId>selected="selected"</#if>>
                        &nbsp;&nbsp;${class.acName}</option>
                </#list>
                </select></td>
                <td class="vatop tips">如果选择上级分类，那么新增的分类则为被选择上级分类的子分类</td>

            </tr>
            <tr>
                <td colspan="2" class="required"><label for="acSort">排序:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="255" name="acSort" id="ac_sort" class="txt"></td>
                <td class="vatop tips">更新排序</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#article_class_form").valid()){
            $("#article_class_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#article_class_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                acName : {
                    required : true,
                    remote   : {
                        url :APP_BASE+'/website/class/validate',
                        type:'post',
                        data:{
                            acName : function(){
                                return $('#ac_name').val();
                            },
                            acParentId : function() {
                                return $('#ac_parent_id').val();
                            },
                            acId : ''
                        }
                    }
                },
                ac_sort : {
                    number   : true
                }
            },
            messages : {
                acName : {
                    required : '分类名称不能为空',
                    remote   : '该分类名称已经存在了，请您换一个'
                },
                ac_sort  : {
                    number   : '分类排序仅能为数字'
                }
            }
        });
    });
</script>
</@layout.body>
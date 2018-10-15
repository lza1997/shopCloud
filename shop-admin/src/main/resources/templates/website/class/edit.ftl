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
                <li><a href="${base}/website/class/findOne?id=0"><span>新增</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="article_class_form" method="post" name="articleClassForm" action="${base}/website/class/saveOrUpdate">
        <input type="hidden" name="acId" value="${class.acId}"/>
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation" for="acName">分类名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${class.acName}" name="acName" id="ac_name" class="txt"></td>
                <td class="vatop tips">分类名称</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="ac_sort">排序:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${class.acSort}" name="acSort" id="ac_sort" class="txt"></td>
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
                            acId : '${class.acId}'
                        }
                    }
                },
                acSort : {
                    number   : true
                }
            },
            messages : {
                acName : {
                    required : '分类名称不能为空',
                    remote   : '该分类名称已经存在了，请您换一个'
                },
                acSort  : {
                    number   : '分类排序仅能为数字'
                }
            }
        });
    });
</script>
</@layout.body>
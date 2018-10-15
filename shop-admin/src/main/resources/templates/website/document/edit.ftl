<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/kindeditor.js"></script>
<script type="text/javascript">
    $(function (){
        KindEditor.create('textarea[id="content"]', {
            allowFileManager: true,
            afterBlur: function(){this.sync();}
        });

    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>系统文章</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/document/list" ><span>管理</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="doc_form" method="post" action="${base}/website/document/edit">
        <input type="hidden" name="docId" value="${document.docId}"/>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr>
                <td colspan="2" class="required"><label class="validation">标题:  </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${document.docTitle}" name="docTitle" id="doc_title" class="infoTableInput"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation">文章内容: </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                    <textarea id="content" style="width:700px;height:300px;resizeType:1;" name="docContent">
                    ${document.docContent}
                    </textarea>
                </td>
                <td class="vatop tips"></td>
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
        if($("#doc_form").valid()){
            $("#doc_form").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        $('#doc_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },
            rules : {
                docTitle : {
                    required   : true
                },
                docContent : {
                    required   : true
                }
            },
            messages : {
                docTitle : {
                    required   : '文章标题不能为空'
                },
                docContent : {
                    required   : '文章内容不能为空'
                }
            }
        });
    });
</script>
</@layout.body>
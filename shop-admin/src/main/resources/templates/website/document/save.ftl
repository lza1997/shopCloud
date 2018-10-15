<@p.header title="系统文章新增页">
<script type="text/javascript" src="${base}/res/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="${base}/res/js/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${base}/res/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    var UEDITOR_HOME_URL = APP_BASE+'/res/js/ueditor';
</script>
</@p.header>
<div class="iframebox">
    <h3 class="cont-tit">新增文章</h3>

    <div class="form-mod">
        <form action="${base}/website/document/edit" method="post"  name="saveForm"
              id="saveForm">
            <p class="item"><label class="tit">标题：</label>
                <input type="text" name="docTitle" class="text" value=""/>
            </p>
            <p class="item"><label class="tit">识别码：</label>
                <input type="text" name="docCode" class="text" value=""/>
            </p>
            <div class="item"><label class="tit">文章内容：</label>
                <script id="editor" name="docContent" type="text/plain" style="width:600px;height:400px;"></script>
                <script type="text/javascript">
                    var editor=new UE.ui.Editor();
                    editor.render("editor");
                </script>
            </div>
            <p class="item-btn"><button type="button" class="btna" onclick="saveUpdate()">保 存</button></p>
        </form>
    </div><!-- form-mod] -->

</div><!-- content] -->
</body>
</html>
<script type="text/javascript">
    /**修改数据*/
    function saveUpdate(){
        /*首先验证表单是否合法*/
        var opFm = $("#saveForm")[0];
        var fmUrl = opFm.action;
        $.ajax({
            type: "post",
            url: fmUrl,
            data: $(opFm).serialize(),
            dataType: "json",
            async:false,
            success:function(data) {
                if(data.success == "true"){
                    $.dialog({
                        time : 2,
                        icon: 'success.gif',
                        content: '操作成功,2秒后关闭',
                        close : function(){
                            frameElement.api.opener.initDataList();
                            frameElement.api.close();
                        }
                    });
                }else{
                    $.dialog({
                        icon: 'error.gif',
                        content: data.message
                    });
                }
            }
        });
    }
</script>
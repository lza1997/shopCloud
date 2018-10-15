<@p.header title="类型页">
<script type="text/javascript" src="${base}/res/js/type.js"></script>
</@p.header>
<body>
<div class="iframebox">
    <h3 class="cont-tit">属性管理</h3>
    <ul class="cont-tab">
        <li class="cur"><a href="${base}/goods/type/index">类型属性</a></li>
        <li><a href="${base}/goods/spec/index">规格属性</a></li>
    </ul>

    <div class="control-mod" >
        <a href="javascript:;" class="btna btn-addto" onclick="openSave(0)"><b>+</b>新增类型</a>
        <form  method="post" name="queryListForm">
                       <span class="col">状态： <select class="select" name="typeStatus" onchange="sbQuery()">
                           <option value="">全部</option>
                           <option value="0" <#if type.typeStatus == 0>selected="selected" </#if>>启用</option>
                           <option value="1" <#if type.typeStatus == 1>selected="selected" </#if>>停用</option>
                       </select>
              <input type="hidden" name="div" id="div" value = "#dataListDiv"/>
        </form>
        </span>
    </div>

    <div class="cont-mod" id="dataListDiv">
    </div>
    <!-- cont-mod] -->

</div>
<!-- content] -->

</body>
</html>
<script type="text/javascript">
    /*界面初始化*/
    $(function(){
        initDataList();
    });

    //初始化
    function initDataList(){
        var div = "#dataListDiv";//显示的list 数据div id 必须传递
        $.ajax({
            async:false,
            url: APP_BASE+"/goods/type/list",//默认加载list 页面
            data:{div:div},
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            success: function(data){
                $(div).empty();
                $(div).html(data);
                $(div).hide();
                $(div).fadeIn(300);
            }
        });
    }

    /**搜索方法***/
    function sbQuery(){
        var parma = $(document.queryListForm).serialize();
        var div = "#dataListDiv";
        $.ajax({
            async:false,
            url:APP_BASE+"/goods/type/list",//默认加载list 页面
            data:parma,
            error:function(){frameControl.lhDgFalInfo("通讯失败!");},
            dataType:'html',
            type: "POST",
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            success: function(data){
                $(div).empty();
                $(div).html(data);
                $(div).hide();
                $(div).fadeIn(300);
            }
        });
    }

</script>
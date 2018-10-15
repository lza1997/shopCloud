<@p.header title="评价管理页">
</@p.header>
<body>
<div class="iframebox">
    <h3 class="cont-tit">评价管理</h3>
    <ul class="cont-tab">
        <li ><a href="${base}/trade/evalGoods/index">来自买家的评价</a></li>
        <li class="cur"><a href="${base}/trade/evalStore/index">店铺动态评价</a></li>
    </ul>

    <div class="control-mod" >
        <form  method="post" name="queryListForm">
            <input type="text" name="sevalStoreName" class="text" placeholder="店铺名称"/>
            <input type="text" name="sevalMemberName" class="text" placeholder="评价人"/>
              <span class="col">时间：
                    <input id="d5221" name="startTime" class="Wdate" style="width: 120px" type="text" onFocus="var d5222=$dp.$('d5222');WdatePicker({onpicked:function(){d5222.focus();},maxDate:'#F{$dp.$D(\'d5222\')}'})"/>
					至
					<input id="d5222" name="endTime" style="width: 120px" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d5221\')}'})"/>
              </span>
            <input type="hidden" name="div" id="div" value = "#dataListDiv"/>
            <button type="button" class="btng" onclick="sbQuery()">搜索</button>
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
            url: APP_BASE+"/trade/evalStore/list",//默认加载list 页面
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
            url:APP_BASE+"/trade/evalStore/list",//默认加载list 页面
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

    /**准备删除*/
    function deleteEvalGoods(bizIdIn){
        /*首先获取主键 - 然获取删除*/
        var bizId = null;
        if(bizIdIn){
            bizId = bizIdIn;
        }

        /*开始删除操作*/
        var url = APP_BASE+"/trade/evalStore/delete";
        var param = {"id":bizId};
        frameControl.lhDgCfmInfo(
                "确定要删除本条数据",
                function(){
                    $.ajax({
                        type: "post",
                        url: url,
                        data: param,
                        dataType: "json",
                        async:false,
                        success:function(data) {
                            if(data.success == "true"){
                                frameControl.lhDgSucInfo("操作成功!",frameElement.api);
                                initDataList();
                            }else{
                                frameControl.lhDgFalInfo(data.result+"!",frameElement.api);
                            }
                        }
                    });
                },
                function(){});
    }
</script>
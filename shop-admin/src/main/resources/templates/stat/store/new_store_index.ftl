<@p.header title="新增店铺统计">
<script type="text/javascript" src="${base}/res/js/commons.js"></script>
<script type="text/javascript" src="${base}/res/js/jsPlugins/echarts/esl.js"></script>
</@p.header>

<body>

<div class="iframebox">
    <h3 class="cont-tit">店铺统计</h3>
    <ul class="cont-tab">
        <li class="cur"><a href="${base}/stat/newStore/index">新增店铺</a></li>
        <li><a href="${base}/stat/storeRank/index">店铺排行</a></li>
    </ul>

    <div class="control-mod">
        <form id="acct-form" method="post" action="" name ="queryListForm">
            <input type="hidden" id="div" value = "#dataListDiv"/>
            	<span class="col" id ="month">
            		<input type="text" id="d243" name="monthendtime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})" class="Wdate"/>
            	</span>

            <button type="button" class="btng" onclick="sbQuery();">搜索</button>
        </form>
    </div>

    <div class="cont-mod" id="dataListDiv">
    </div>
    <!-- cont-mod] -->
</div>

</body>
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
            url:APP_BASE+"/stat/newStore/list",//默认加载list 页面
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

        var val = $("#select").val();
        var url ="";
        url = APP_BASE+"/stat/newStore/list";
        var div = $("#div").val();
        var parma = $("#acct-form").serialize();
        $.ajax({
            async:false,
            url:url,//默认加载list 页面
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


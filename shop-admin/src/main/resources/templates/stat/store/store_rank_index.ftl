<@p.header title="店铺排行统计">
<script type="text/javascript" src="${base}/res/js/commons.js"></script>
<script type="text/javascript" src="${base}/res/js/jsPlugins/echarts/esl.js"></script>
</@p.header>

<body>

<div class="iframebox">
    <h3 class="cont-tit">店铺统计</h3>
    <ul class="cont-tab">
        <li><a href="${base}/stat/newStore/index">新增店铺</a></li>
        <li class="cur"><a href="${base}/stat/storeRank/index">店铺排行</a></li>
    </ul>

    <div class="control-mod">
        <form id="acct-form" method="post" action="" name ="queryListForm">
            <span class="col">订单状态： <select class="select" name="statType"">
                <option value="0">订单量统计</option>
                <option value="1">销售额统计</option>
                </select>
            </span>
            <span class="col">订单状态： <select class="select" name="orderState"">
                <option value="">请选择</option>
                <option value="10">待付款</option>
                <option value="20">待发货</option>
                <option value="30">待收货</option>
                <option value="40">交易完成</option>
                <option value="0">已取消</option>
            </select>
            </span>
            <input type="hidden" id="div" value = "#dataListDiv"/>
            	<span class="col" id ="month">
            		<input type="text" id="d243" name="monthendtime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})" class="Wdate"/>
            	</span>
            <input type="text" name="storeName" class="text" placeholder="输入店铺名称"/>
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
            url:APP_BASE+"/stat/storeRank/topList",//默认加载list 页面
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
        url = APP_BASE+"/stat/storeRank/topList";
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


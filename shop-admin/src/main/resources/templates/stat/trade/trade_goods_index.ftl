<@p.header title="新增店铺统计">
<script type="text/javascript" src="${base}/res/js/shopPlugins/ShopTable.js"></script>
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
        <form id="acct-form" method="post" action="${base}/stat/tradeGoods/list" name ="queryListForm">
             <span class="col">订单状态： <select class="select" name="rankType"">
                <option value="0">按销量排名</option>
                <option value="1">按销售额排名</option>
                 </select>
            </span>
            <input type="hidden" id="div" value = "#dataListDiv"/>
            	<span class="col" id ="month">
            		<input type="text" id="d243" name="monthendtime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy年MM月'})" class="Wdate"/>
            	</span>

            <button type="button" class="btng" id="queryBtn">搜索</button>
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
        $("#dataListDiv").ShopTable({
            url:'/stat/tradeGoods/list',
            formId:'acct-form'
        });
    });


</script>


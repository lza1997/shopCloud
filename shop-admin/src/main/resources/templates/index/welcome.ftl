<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>系统信息</h3>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <div class="info-panel">
        <dl class="member">
            <dt>
            <div class="ico"><i></i><sub title="会员总数"><span><em id="statistics_member">0</em></span></sub></div>
            <h3>会员</h3>
            <h5>新增会员</h5>
            </dt>
            <dd>
                <ul>
                    <li class="w50pre normal" style="width: 100%"><a href="${base}/member/list">本周新增<sub><em id="statistics_week_add_member">0</em></sub></a></li>
                </ul>
            </dd>
        </dl>
        <dl class="shop">
            <dt>
            <div class="ico"><i></i><sub title="新增店铺数"><span><em id="statistics_store">0</em></span></sub></div>
            <h3>店铺</h3>
            <h5>新开店铺审核</h5>
            </dt>
            <dd>
                <ul>
                    <li class="w33pre none"><a href="${base}/store/manager/auditList">开店审核<sub><em id="statistics_store_joinin">0</em></sub></a></li>
                    <li class="w33pre none"><a href="${base}/store/manager/list?storeStatus=expired">已到期<sub><em id="statistics_store_expired">0</em></sub></a></li>
                    <li class="w34pre none"><a href="${base}/store/manager/list?storeStatus=expire">即将到期<sub><em id="statistics_store_expire">0</em></sub></a></li>
                </ul>
            </dd>
        </dl>
        <dl class="goods">
            <dt>
            <div class="ico"><i></i><sub title="商品总数"><span><em id="statistics_goods">0</em></span></sub></div>
            <h3>商品</h3>
            <h5>新增商品/品牌申请审核</h5>
            </dt>
            <dd>
                <ul>
                    <li class="w33pre normal"><a href="${base}/goods/goodsCommon/list">本周新增<sub title><em id="statistics_week_add_product">0</em></sub></a></li>
                    <li class="w33pre none"><a href="${base}/goods/goodsCommon/downList">商品下架<sub><em id="statistics_product_down">0</em></sub></a></li>
                    <li class="w34pre none"><a href="${base}/goods/brand/applyList">品牌申请<sub><em id="statistics_brand_apply">0</em></sub></a></li>
                </ul>
            </dd>
        </dl>
        <div class=" clear"></div>
    </div>
</div>
<script type="text/javascript">
    var normal = ['week_add_member','week_add_product'];
    var work = ['product_down','store_expired','store_expire','brand_apply'];
    $(document).ready(function(){
        $.getJSON(APP_BASE+"/statistics", function(data){
            $.each(data, function(k,v){
                $("#statistics_"+k).html(v);
                if (v!= 0 && $.inArray(k,work) !== -1){
                    $("#statistics_"+k).parent().parent().parent().removeClass('none').addClass('high');
                }else if (v == 0 && $.inArray(k,normal) !== -1){
                    $("#statistics_"+k).parent().parent().parent().removeClass('normal').addClass('none');
                }
            });
        });
        //自定义滚定条
        $('#system-info').perfectScrollbar();
    });
</script>
</@layout.body>
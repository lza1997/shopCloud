<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺</h3>
            <ul class="tab-base">
                <li><a href="${base}/store/manager/list"><span>管理</span></a></li>
                <li><a href="${base}/store/manager/auditList" ><span>开店申请</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>经营类目</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div>
            </th>
        </tr>
        <tr>
            <td><ul>
                <li>删除店铺的经营类目会造成相应商品下架，请谨慎操作</li>
                <li>所有修改即时生效</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2">
        <thead class="thead">
        <tr class="space">
            <th colspan="15">店铺名称：${store.storeName}</th>
        </tr>
        </thead>
        <thead>
        <tr class="thead">
            <th>分类1</th>
            <th>分类2</th>
            <th>分类3</th>
            <th>分佣比例</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list bindList as bind>
            <tr class="hover edit">
                <td class="w25pre">${bind.class1Name}</td>
                <td class="w25pre">${bind.class2Name}</td>
                <td class="w25pre">${bind.class3Name}</td>
                <td class="sort"><span nc_type="commis_rate" column_id="${bind.bid}" title="可编辑" class="editable "
                                  modUrl="${base}/store/manager/updateRate" style="vertical-align: middle; margin-right: 4px;">${bind.commisRate}</span>% </td>
                <td class="w60 align-center"><a nctype="btn_del_store_bind_class" href="javascript:;" data-bid="${bind.bid}">删除</a></td>
            </tr>
        </#list>
    </table>
    <table class="table tb-type2" >
        <thead class="thead">
        <tr class="space">
            <th colspan="15"><span>添加经营类目</span></th>
        </tr>
        </thead>
        <tbody>
        <tr class="noborder">
            <td class="required" colspan="2" >选择分类：</td>
        </tr>
        <tr class="noborder">
            <td id="gcategory" class="vatop rowform"><select id="gcategory_class1" style="width: auto;">
                <option value="0">请选择</option>
                <#list classList as gc>
                    <option value="${gc.gcId}">${gc.gcName}</option>
                </#list>
            </select><span id="error_message" style="color:red;"></span></td>
            <td class="vatop tips"></td>
        </tr>
        <tr>
            <td class="required" colspan="2" >分佣比例(必须为0-100的整数)：</td>
        </tr>
        <tr class="noborder">
            <td class="vatop rowform"><form id="add_form" action="${base}/store/manager/saveBind" method="post">
                <input name="storeId" type="hidden" value="${store.storeId}">
                <input id="goods_class" name="goodsClass" type="hidden" value="">
                <input id="commis_rate" name="commisRate" class="w60" type="text" value="" />
                % <span id="error_message1" style="color:red;"></span>
            </form></td>
            <td class="vatop tips"></td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2"><a id="btn_add_category" class="btn" href="JavaScript:void(0);" /><span>确认</span></a></td>
        </tr>
        </tfoot>
    </table>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        gcategoryInit("gcategory");

        // 提交新添加的类目
        $('#btn_add_category').on('click', function() {
            $('#error_message').hide();
            $('#error_message1').hide();
            var category_id = '';
            var validation = true;
            $('#gcategory').find('select').each(function() {
                if(parseInt($(this).val(), 10) > 0) {
                    category_id += $(this).val() + ',';
                } else {
                    validation = false;
                }
            });
            if(!validation) {
                $('#error_message').text('请选择分类');
                $('#error_message').show();
                return false;
            }

            var commis_rate = parseInt($('#commis_rate').val(), 10);
            if(isNaN(commis_rate) || commis_rate < 0 || commis_rate > 100) {
                $('#error_message1').text('请填写正确的分佣比例');
                $('#error_message1').show();
                return false;
            }

            $('#goods_class').val(category_id.substring(0,category_id.length-1));
            $('#add_form').submit();
        });

        // 删除现有类目
        $('[nctype="btn_del_store_bind_class"]').on('click', function() {
            if(confirm('确认删除？删除后店铺对应分类商品将全部下架')) {
                var bid = $(this).attr('data-bid');
                $this = $(this);
                $.post(APP_BASE+'/store/manager/deleteBind', {id: bid}, function(data) {
                    if(data.result) {
                        $this.parents('tr').hide();
                    } else {
                        showError(data.message);
                    }
                }, 'json');
            }
        });

        // 修改分佣比例
        $('span[nc_type="commis_rate"]').inline_edit({act: APP_BASE+'/store/manager/updateRate'});
    });

</script>
</@layout.body>
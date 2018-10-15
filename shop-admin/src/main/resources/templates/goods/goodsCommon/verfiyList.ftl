<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
<!--[if IE 7]>
<link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"/>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"/>
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
<script type="text/javascript">
    $(function () {
        $('#ncsubmit').click(function () {
            $('#formSearch').submit();
        });
    });

    function deleteGoods() {
        var items = $("input[name='ids']:checked").length;
        if (items == 0) {
            alert("请至少选择一个要删除的项目");
        } else {
            if (confirm('您确定要删除吗?')) {
                $('#form_list').submit();
            }
        }
    }

    function verfiyGoods() {
        var items = $("input[name='ids']:checked").length;
        if (items == 0) {
            alert("请至少选择一个要下架的项目");
        } else {
            var item = "";
            $("input[name='ids']:checked").each(function () {
                item += this.value + ",";
            });
            item = item.substring(0, item.length - 1);
            goods_verify(item);
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>商品</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/goodsCommon/list"><span>所有商品</span></a></li>
                <li><a href="${base}/goods/goodsCommon/downList"><span>违规下架商品</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>等待审核</span></a></li>
                <li><a href="${base}/goods/goodsCommon/setGoods"><span>商品设置</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_goods_name">商品名称</label></th>
                <td><input type="text" value="${gcommon.goodsName}" name="goodsName" id="search_goods_name" class="txt">
                </td>
                <th>审核状态</th>
                <td><select name="search_verify">
                    <option>请选择...</option>
                    <option value="10">等待审核</option>
                    <option value="0">未通过</option>
                </select></td>
                <th><label>分类</label></th>
                <td id="gcategory" colspan="8"><input type="hidden" id="cate_id" name="gcId" value="" class="mls_id"/>
                    <input type="hidden" id="cate_name" name="gcName" value="" class="mls_names"/>
                    <select class="class=" querySelect"">
                    <option value="0">请选择...</option>
                    <#list classList as gc>
                        <option value="${gc.gcId}">${gc.gcName}</option>
                    </#list>
                    </select></td>
            </tr>
            <tr>
                <th><label for="search_store_name">所属店铺</label></th>
                <td><input type="text" value="${gcommon.storeName}" name="storeName" id="search_store_name" class="txt">
                </td>
                <th><label>品牌</label></th>
                <td><select name="brandId">
                    <option value="">请选择...</option>
                    <#list brandList as brand>
                        <option value="${brand.brandId}"
                                <#if gcommon.brandId == brand.brandId>selected="selected" </#if>>${brand.brandName}</option>
                    </#list>
                </select>
                    <a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form method='post' id="form_goods" action="${base}/goods/goodsCommon/delGoods">
        <table class="table tb-type2">
            <thead>
            <tr class="space">
                <th colspan="15">列表</th>
            </tr>
            <tr class="thead">
                <th></th>
                <th class="w24"></th>
                <th>平台货号</th>
                <th colspan="2">商品名称</th>
                <th>品牌&分类</th>
                <th class="align-center">价格</th>
                <th class="align-center">库存</th>
                <th class="align-center">审核状态</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
                <#list pager.result as common>
                <tr class="hover edit">
                    <td class="w24"><input type="checkbox" name="ids" value="${common.goodsCommonid}" class="checkitem">
                    </td>
                    <td><i class="icon-plus-sign" nctype="ajaxGoodsList" data-comminid="${common.goodsCommonid}"
                           style="cursor: pointer;"></i></td>
                    <td>${common.goodsCommonid}</td>
                    <td class="w60 picture">
                        <div class="size-56x56"><span class="thumb size-56x56"><i></i>
                    <img src="${imgServer}${common.goodsImage}" onload="javascript:DrawImage(this,56,56);"/>
                </span></div>
                    </td>
                    <td class="goods-name w270"><p><span>${common.goodsName}</span></p>

                        <p class="store">所属店铺:${common.storeName}</p></td>
                    <td class="w200">
                        <p>${common.brandName}</p>

                        <p>${common.gcName}</p>
                    </td>
                    <td class="align-center">￥${common.goodsPrice}</td>
                    <td class="align-center">${common.goodsStorage}</td>
                    <td class="align-center">
                        <#if common.goodsVerify==0>未通过</#if>
                        <#if common.goodsVerify==1>通过</#if>
                        <#if common.goodsVerify==10>审核中</#if>
                    </td>
                    <td class="w48 align-center">
                        <p><a href="${frontServer}/product/detail?id=${common.goodsCommonid}" target="_blank">查看</a></p>

                        <p><a href="javascript:void(0);" onclick="goods_verify(${common.goodsCommonid});">审核</a></p>
                    </td>
                </tr>
                <tr style="display:none;">
                    <td colspan="20">
                        <div class="ncsc-goods-sku ps-container"></div>
                    </td>
                </tr>
                </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="javascript:void(0);" class="btn" nctype="verify_batch" onclick="verfiyGoods()"><span>审核</span></a>
                    <a href="JavaScript:void(0);" class="btn" nctype="del_batch" onclick="deleteGoods()"><span>删除</span></a>
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function () {
        gcategoryInit("gcategory");
        $('#ncsubmit').click(function () {
            $('input[name="op"]').val('goods');
            $('#formSearch').submit();
        });

        // 批量删除
        $('a[nctype="del_batch"]').click(function () {
            ajaxpost('form_goods', '', '', 'onerror');
        });

        // 审核批量处理
        $('a[nctype="verify_batch"]').click(function () {
            str = getId();
            if (str) {
                goods_verify(str);
            }
        });

        // ajax获取商品列表
        $('i[nctype="ajaxGoodsList"]').toggle(
                function () {
                    $(this).removeClass('icon-plus-sign').addClass('icon-minus-sign');
                    var _parenttr = $(this).parents('tr');
                    var _commonid = $(this).attr('data-comminid');
                    var _div = _parenttr.next().find('.ncsc-goods-sku');
                    if (_div.html() == '') {
                        $.getJSON(APP_BASE + '/goods/goodsCommon/getGoods', {commonids: _commonid}, function (data) {
                            if (data != 'false') {
                                var _ul = $('<ul class="ncsc-goods-sku-list"></ul>');
                                $.each(data, function (i, o) {
                                    $('<li><div class="goods-thumb" title="商家货号：' + o.goodsCommonid + '">' +
                                            '<a href="${frontServer}/product/detail?id=' + o.goodsId + '" target="_blank"><image src="' + APP_BASE + "/upload/goods" + o.goodsImage + '" ></a></div>'
                                            + '<div class="goods_spec">颜色<em title=""></em></div>'
                                            + '<div class="goods-price">价格：<em title="￥' + o.goodsPrice + '">￥' + o.goodsPrice + '</em></div><div class="goods-storage">库存：<em title="' + o.goodsStorage + '">' + o.goodsStorage + '</em></div><a href="${frontServer}/product/detail?id=' + o.goodsId + '" target="_blank" class="ncsc-btn-mini">查看商品详情</a></li>').appendTo(_ul);
                                });
                                _ul.appendTo(_div);
                                _parenttr.next().show();
                                // 计算div的宽度
                                _div.css('width', document.body.clientWidth - 54);
                                _div.perfectScrollbar();
                            }
                        });
                    } else {
                        _parenttr.next().show()
                    }
                },
                function () {
                    $(this).removeClass('icon-minus-sign').addClass('icon-plus-sign');
                    $(this).parents('tr').next().hide();
                }
        );
    });

    // 获得选中哎
    function getId() {
        var str = '';
        $('#form_goods').find('input[name="id[]"]:checked').each(function () {
            id = parseInt($(this).val());
            if (!isNaN(id)) {
                str += id + ',';
            }
        });
        if (str == '') {
            return false;
        }
        str = str.substr(0, (str.length - 1));
        return str;
    }

    // 商品审核
    function goods_verify(ids) {
        _uri = APP_BASE + "/goods/goodsCommon/verfiyRemark?id=" + ids;
        CUR_DIALOG = ajax_form('goods_verify', '审核商品', _uri, 350);
    }
</script>
</@layout.body>
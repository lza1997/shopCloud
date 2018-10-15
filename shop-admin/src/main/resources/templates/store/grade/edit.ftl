<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"/>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>店铺等级</h3>
            <ul class="tab-base">
                <li><a href="${base}/store/grade/list"><span>管理</span></a></li>
                <li><a href="${base}/store/grade/forward?id=0"><span>新增</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="grade_form" method="post" action="${base}/store/grade/edit">
        <input type="hidden" name="sgId" value="${grade.sgId}"/>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="sgName">等级名称:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${grade.sgName}" id="sg_name" name="sgName"
                                                 class="txt"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="sgGoodsLimit">可发布商品数:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${grade.sgGoodsLimit}" id="sg_goods_limit"
                                                 name="sgGoodsLimit" class="txt"></td>
                <td class="vatop tips">0表示没有限制</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation"> 可上传图片数:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${grade.sgAlbumLimit}" id="sg_album_limit"
                                                 name="sgAlbumLimit" class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="sgPrice">收费标准:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${grade.sgPrice}" id="sg_price" name="sgPrice"
                                                 class="txt"></td>
                <td class="vatop tips">收费标准，在会员开通或升级店铺时将显示在前台</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>申请说明:</label></td>
            </tr>
            <tr>
            <tr class="noborder">
                <td class="vatop rowform"><textarea id="sg_description" rows="6" class="tarea"
                                                    name="sgDescription">${grade.sgDescription}</textarea></td>
                <td class="vatop tips">申请说明，在会员开通或升级店铺时将显示在前台</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="sg_sort">级别: </label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                    <#if grade.sgId == 1>
                        <input type="text" value="${grade.sgSort}" id="sg_sort" name="sgSort" class="txt"
                               readonly="readonly">
                    <#else>
                        <input type="text" value="${grade.sgSort}" id="sg_sort" name="sgSort" class="txt">
                    </#if>
                </td>
                <td class="vatop tips">数值越大表明级别越高</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="sgGoodsLimit">可发布商品数:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${grade.sgGoodsLimit}" id="sg_goods_limit"
                                                 name="sgGoodsLimit" class="txt"></td>
                <td class="vatop tips">0表示没有限制</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="sgBrokerageScale">佣金比例:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="sg_BrokerageScale" name="sgBrokerageScale" class="txt" value="${grade.sgBrokerageScale}"></td>
                <td class="vatop tips">店铺等级越高佣金比例越小</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script>

    //按钮先执行验证再提交表单
    $(function () {
        $("#submitBtn").click(function () {
            if ($("#grade_form").valid()) {
                $("#grade_form").submit();
            }
        });
    });
    //
    $(document).ready(function () {
        $('#grade_form').validate({
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules: {
                sgName: {
                    required: true,
                    remote: {
                        url: APP_BASE + '/store/grade/validate',
                        type: 'post',
                        data: {
                            sgName: function () {
                                return $('#sg_name').val();
                            },
                            sgId: '${grade.sgId}'
                        }
                    }
                },
                sgPrice: {
                    required: true
                },
                sgGoodsLimit: {
                    required: true,
                    digits: true
                },
                sgAlbumLimit: {
                    required: true,
                    digits: true
                },
                sgSort: {
                    required: true,
                    digits: true,
                    remote: {
                        url: APP_BASE + '/store/grade/validate',
                        type: 'post',
                        data: {
                            sgSort: function () {
                                return $('#sg_sort').val();
                            },
                            sgId: '${grade.sgId}'
                        }
                    },
                    number   : true,
                    max : 255,
                    min : 0
                },
                 sgBrokerageScale:{
                    required: true,
                    number   : true,
                    max : 1,
                    min : 0.1
                }
            },
            messages: {
                sgName: {
                    required: '等级名称不能为空',
                    remote: '该等级名称已经存在，请您换一个'
                },
                 sgPrice: {
                    required: '收费标准不能为空'
                },
                sgGoodsLimit: {
                    required: '可发布商品数',
                    digits: '仅能为整数'
                },
                sgAlbumLimit: {
                    required: '可上传图片数:',
                    digits: '仅能为整数'
                },
                sgSort: {
                    required: '级别信息不能为空',
                    digits: '仅能为整数',
                    remote: '级别已经存在',
                    number   : '分类排序仅能为数字',
                    max : '最大值为255',
                    min : '最小值为0'
                },
                sgBrokerageScale:{
                    required: '佣金比例不能为空',
                    number   : '佣金比例仅能为数字',
                    max : '最大值为1',
                    min : '最小值为0.1'
                }
            }
        });
    });
</script>
</@layout.body>
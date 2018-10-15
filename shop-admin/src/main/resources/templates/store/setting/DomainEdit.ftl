<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>二级域名</h3>
            <ul class="tab-base">
                <li><a href="${base}/store/setting/index"><span>设置</span></a></li>
                <li><a href="${base}/store/setting/findList"><span>域名列表</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="store_form" method="post" action="${base}/store/setting/updateDomain">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="storeId" value="${storeDetail.storeId}" />
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required">店主账号:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.memberName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label> 店铺：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">${storeDetail.storeName}</td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="storeDomain">二级域名：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeDomain" value="${storeDetail.storeDomain}" id="store_domain"class="txt"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="storeDomainTimes">已修改次数：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="storeDomainTimes" value="${storeDetail.storeDomainTimes}" id="store_domain_times" class="txt"></td>
                <td class="vatop tips"></td>
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
<script type="text/javascript">

    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#store_form").valid()){
            $("#store_form").submit();
        }
    });
        jQuery.validator.addMethod("domain", function(value, element) {
            return this.optional(element) || /^[\w\-]+$/i.test(value);
        }, "");
        $('#store_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                storeDomain: {
                    domain: true,
                    rangelength:[3, 12]
                },
                storeDomainTimes: {
                    digits : true,
                    max:3			}
            },
            messages : {
                storeDomain: {
                    domain: '字母、数字、下划线、中划线为有效字符',
                    rangelength:'二级域名长度为 {0} 到 {1} 个字符之间'
                },
                storeDomainTimes: {
                    digits: '已修改次数仅能为数字',
                    max:'已修改次数最大为 {0}'
                }
            }
        });
    });
</script>
</@layout.body>
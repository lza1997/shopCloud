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
                <li><a href="JavaScript:void(0);" class="current"><span>设置</span></a></li>
                <li><a href="${base}/store/setting/findList"><span>域名列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" id="settingForm" name="settingForm" action="${base}/store/setting/edit">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label>是否启用二级域名:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="enabled_subdomain1" class="cb-enable <#if SettingVo.enabledSubdomain==1>selected</#if>" title="是"><span>是</span></label>
                    <label for="enabled_subdomain0" class="cb-disable <#if SettingVo.enabledSubdomain==0>selected</#if>" title="否"><span>否</span></label>
                    <input type="radio" id="enabled_subdomain1" <#if SettingVo.enabledSubdomain==1>checked="checked"</#if> value="1" name="enabledSubdomain">
                    <input type="radio" id="enabled_subdomain0" <#if SettingVo.enabledSubdomain==0>checked="checked"</#if> value="0" name="enabledSubdomain"></td>
                <td class="vatop tips">启用二级域名需要您的服务器支持泛域名解析</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label>是否可修改:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff"><label for="subdomain_edit1" class="cb-enable <#if SettingVo.subdomainEdit==1>selected</#if>" title="是"><span>是</span></label>
                    <label for="subdomain_edit0" class="cb-disable <#if SettingVo.subdomainEdit==0>selected</#if>" title="否"><span>否</span></label>
                    <input type="radio" id="subdomain_edit1" <#if SettingVo.subdomainEdit==1>checked="checked"</#if> value="1" name="subdomainEdit">
                    <input type="radio" id="subdomain_edit0" <#if SettingVo.subdomainEdit==0>checked="checked"</#if> value="0" name="subdomainEdit"></td>
                <td class="vatop tips">不可修改时店主填写提交后将不可改动</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="subdomainTimes">修改次数:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" value="${SettingVo.subdomainTimes}" name="subdomainTimes" id="subdomain_times" class="txt" style=" width:50px;"></td>
                <td class="vatop tips">可修改时达到设定的次数后将不能再改动</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label for="subdomainReserved">保留域名:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text"  name="subdomainReserved"  value="${SettingVo.subdomainReserved}" id="subdomain_reserved" class="txt"></td>
                <td class="vatop tips">保留的二级域名，多个保留域名之间请用","隔开</td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation" for="subdomainLength">长度限制:</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="subdomainLength" value="${SettingVo.subdomainLength}" id="subdomain_length" class="txt"></td>
                <td class="vatop tips">如"3-12"，代表注册的域名长度限制在3到12个字符之间</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<script>

    //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
        if($("#settingForm").valid()){
            $("#settingForm").submit();
        }
    });
    });
    //
    $(document).ready(function(){
        jQuery.validator.addMethod("domain_length", function(value, element) {
            var success = this.optional(element) || /^(\d+)[\/-](\d+)$/i.test(value);
            return success && (parseInt(RegExp.$1)<parseInt(RegExp.$2)) && (parseInt(RegExp.$1)>0);
        }, "");
        $("#settingForm").validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                subdomainTimes : {
                    required : true,
                    digits   : true,
                    min    :1
                },
                subdomainLength : {
                    required : true,
                    domain_length   : true
                }
            },
            messages : {
                subdomainTimes  : {
                    required : '修改次数不能为空',
                    digits   : '修改次数仅能为数字',
                    min    :'修改次数最少为1'
                },
                subdomainLength  : {
                    required : '长度限制格式不符合要求，请参考右侧说明',
                    domain_length   : '长度限制格式不符合要求，请参考右侧说明'
                }
            }
        });
    });
</script>
</@layout.body>
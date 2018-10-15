<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/ajaxfileupload/ajaxfileupload.js"></script>
<script type="text/javascript" src="${base}/res/js/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
<div class="fixed-bar">
    <div class="item-title">
        <h3>满免邮管理</h3>
        <ul class="tab-base">
            <li><a href="${base}/mianYou/list"><span>管理</span></a></li>
            <li><a href="javascript:void(0)" class="current"><span>新增</span></a></li>
        </ul>
    </div>
</div>
<div class="fixed-empty"></div>
<form id="mianYou_form" action="${base}/mianYou/saveOrUpdate" method="post">
    <input type="hidden" name="mianyouId" value="${mianYou.mianyouId}">
    <table class="table tb-type2">
		<tbody>
            <tr>
                <td width="250" style="text-align:right;" class="required" ><label for="mianyouName">活动名称:</label></td>
                <td class="vatop rowform" style="width:auto;">
					${mianYou.mianyouName}
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td width="250" style="text-align:right;" class="required" ><label for="memberName">开始时间:</label></td>
                <td class="vatop rowform" style="width:auto;">
				${mianYou.startTimeStr}
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td width="250" style="text-align:right;" class="required" ><label for="endTime" >结束时间:</label></td>
                <td class="vatop rowform" style="width:auto;">
				${mianYou.endTimeStr}
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td width="250" style="text-align:right;" class="required" ><label for="state">满就减规则:</label></td>
                <td class="vatop rowform" style="width:auto;">
					<#list mianyouRulesList as mianyouRule>
                        <table class="align-left" width="400">
                            <td class="align-left" width="400">
                                <font color="#3A87AD">单笔订单满</font>
                                <font color="#FF3300" style="font-weight:bold;">${mianyouRule.price }</font>
                                <font color="#3A87AD">元  ，免邮费 </font>

                            </td>
                        </table>
					</#list>
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td width="250" style="text-align:right;" class="required" ><label for="remark">备注:</label></td>
                <td class="vatop rowform" style="width:auto;">
				${mianYou.remark}
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td width="250" style="text-align:right;" class="required"><label class="validation" for="state">审核通过：</label></td>
                <td class="vatop rowform onoff">
                    <label for="store_AllowState1" class="cb-enable <#if mianYou.state == 2>selected</#if>" ><span>通过</span></label>
                    <label for="store_AllowState0" class="cb-disable <#if mianYou.state == 1>selected</#if>" ><span>不通过</span></label>
                    <input id="store_AllowState1" name="state" <#if mianYou.state == 2>checked="checked"</#if>value="2" type="radio"/>
                    <input id="store_AllowState0" name="state" <#if mianYou.state == 1>checked="checked"</#if>value="1" type="radio"/>
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td></td>
                <td colspan="2">
                    <a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a>
                    <a href="JavaScript:history.go(-1);" class="btn"><span>返回</span></a>
                </td>
            </tr>
            </tfoot>
    </table>
</form>
</div>
<script>
    //按钮先执行验证再提交表单
    $(function(){
        $("#submitBtn").click(function(){
            $("#mianYou_form").submit();
        });
    });
</script>
</@layout.body>
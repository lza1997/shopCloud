<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>提现管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/withdraw/list"><span>列表</span></a></li>
                <li><a href="javascript:void(0);" class="current"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form id="spec_form" method="post" action="${base}/withdraw/saveOrUpdate">
        <table class="table tb-type2">
            <tbody>
            <tr class="noborder">
                <td class="required" colspan="2"><label class="validation" for="accountName">账号名：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="accountName" id="accountName" /></td>
                <td class="vatop tips">请填写账号名。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="accountNo">账号：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="accountNo" id="accountNo" /></td>
                <td class="vatop tips">请填写账号。</td>
            </tr>
            
             <tr>
                <td class="required" colspan="2"><label class="validation" for="accountProp">账号属性：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                <#if accountProps??>
		          	 <select name="accountProp" id="accountProp">
		          		<option value＝"">请选择</option>
				          	<#list accountProps as ra>
				          		<option value="${ra.dictionaryValue}">${ra.dictionaryName}</option>
				          	</#list>
			         </select>
		          	</#if>
		        </td>
                <td class="vatop tips">请选择账号属性，默认私人。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="bankCode">支付银行：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform">
                <#if bankCodes??>
		          	 <select name="bankCode" id="bankCode">
		          		<option value＝"">请选择</option>
				          	<#list bankCodes as ra>
				          		<option value="${ra.dictionaryValue}">${ra.dictionaryName}</option>
				          	</#list>
			         </select>
		          	</#if>
		        </td>
                <td class="vatop tips">请选择支付银行。</td>
            </tr>
            
            <tr>
                <td class="required" colspan="2"><label class="validation" for="amount">金额：</label></td>
            </tr>
             <tr class="noborder">
                <td class="vatop rowform"><input type="text" class="txt" name="amount" id="amount" /></td>
                <td class="vatop tips">请填写金额。</td>
            </tr>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="15"><a id="submitBtn" class="btn" href="JavaScript:void(0);"> <span>提交</span> </a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
    $(function(){
        //表单验证
        $('#spec_form').validate({
            errorPlacement: function(error, element){
                error.appendTo(element.parent().parent().prev().find('td:first'));
            },

            rules : {
                accountName: {
                    required : true,
                    maxlength: 50,
                    minlength: 1
                },
                accountNo: {
                    required : true,
                    maxlength: 50,
                    minlength: 1
                },
                amount: {
                    required : true,
                    maxlength: 50,
                    minlength: 1
                }
            }
        });

        //按钮先执行验证再提交表单
        $("#submitBtn").click(function(){
            if($("#spec_form").valid()){
                $("#spec_form").submit();
            }
        });
    });

</script>
</@layout.body>
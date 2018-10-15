<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>支付方式</h3>
            <ul class="tab-base">
                <li>
	                <a class="current">
		                <span>
		                	支付方式
		                </span>
	                </a>
                </li>
                <li>
                   <a href="${base}/setting/payment/addpayment">
                       <span>
                                                                             新增
                       </span>
                   </a>
				</li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>此处列出了系统支持的支付方式，点击编辑可以设置支付参数及开关状态</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2">
        <thead>
        <tr class="thead">
            <th>支付方式</th>
            <th>支付logo</th>
            <th class="align-left">启用</th>
            <th class="align-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list datas as payment>
            <tr>
                <td>${payment.paymentName}</td>
                <td>
                    <img  src="${imgServer}${payment.paymentLogo}" style="width: :100px;height: 50px;">
                </td>
                <td>
                    <#if payment.paymentState??>
                        <#if payment.paymentState=="0">禁用</#if>
                        <#if payment.paymentState=="1">开启中</#if>
                    </#if>
                </td>
                <td class="w156 align-center">
                    <a href="${base}/setting/payment/addpayment?paymentId=${payment.paymentId}">编辑</a>
                </td>
            </tr>
        </#list>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="15"></td>
        </tr>
        </tfoot>
    </table>
</div>
</@layout.body>
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>二级域名</h3>
            <ul class="tab-base">
                <li><a href="${base}/store/setting/index"><span>设置</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>域名列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="get" name="formSearch" action="${base}/store/setting/findList">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="store_name">店铺</label></th>
                <td><input type="text" value="${store.storeName}" name="storeName" id="store_name" class="txt"></td>
                <th><label for="owner_and_name">二级域名</label></th>
                <td><input type="text" value="${store.storeDomain}" name="storeDomain" id="store_domain" class="txt"></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a></td>
            </tr></tbody>
        </table>
    </form>
    <form method="post" id="store_form">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="align-center">二级域名</th>
                <th class="align-center">店铺</th>
                <th class="align-center">已修改次数</th>
                <th class="align-center">店主账号</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as s>
                <tr class="hover edit">
                    <td></td>
                    <td class="align-center">${s.storeDomain}</td>
                    <td class="align-center">${s.storeName}&nbsp;</td>
                    <td class="align-center">${s.storeDomainTimes}</td>
                    <td class="align-center">${s.memberName}</td>
                    <td class="w150 align-center"><a href="${base}/store/setting/findDomainEdit?id=${s.storeId}">修改</a>
                    </td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="16">
                    <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
	
	


	


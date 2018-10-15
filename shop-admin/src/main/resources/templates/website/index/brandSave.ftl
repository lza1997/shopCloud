<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"/>
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>品牌</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/index/list"><span>管理</span></a></li>
                <li><a href="${base}/website/index/forward?id=0"><span>新增楼层</span></a></li>
                <li><a href="${base}/website/index/forwardBanner"><span>新增图片</span></a></li>
                <li><a href="JavaScript:void(0)" class="current"><span>新增品牌</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form action="${base}/website/index/saveBrand" method="post" id="brandForm">
        <table class="table tb-type2" id="brand_table">
            <thead>
            <tr>
                <td><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </thead>
            <#if brandList??>
                <tbody>
                    <#list brandList as brand>
                    <tr class="hover">
                        <td>
                            <h6 class="clear" id="brand_h6_${brand_index}">
                                <#if brand.brandClass == null || !brand.brandClass??>默认<#else>${brand.brandClass}</#if>
                            </h6>
                            <ul class="nofloat">
                                <#list brand.list as b>
                                    <li class="left w33pre h36">
                                        <input type="checkbox" name="brandIds" value="${b.brandId}"/>
                                        <label for="brand_${b.brandId}">${b.brandName}</label>
                                    </li>
                                </#list>
                            </ul>
                        </td>
                    </tr>
                    </#list>
                </tbody>
            </#if>
        </table>
    </form>
</div>
<script type="text/javascript">
    $("#submitBtn").click(function () {
        $("#brandForm").submit();
    })
</script>
</@layout.body>
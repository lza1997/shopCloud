<@layout.head>
<link href="${base}/res/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${base}/res/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/dialog/dialog.js" id="dialog_js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/dialog/dialog.css"  />
<script type="text/javascript" src="${base}/res/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery.mousewheel.js"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>引用实体管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>列表</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    
    <form method='post' id="form_list" >
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th >实体名</th>
                <th >代码</th>
                <th >描述</th>
            </tr>
            </thead>
            <tbody>
            <#if docentity??>
            <#list docentity as data>
            <tr class="hover edit">
                <td ><a href="${base}/doc/api/docentityref/save?entityid=${data.id}&docid=${docid}">${data.name}</a></td>
                <td >${data.code}</td>
                <td >${data.description}</td>
            </tr>
            <tr style="display:none;">
                <td colspan="20"><div class="ncsc-goods-sku ps-container"></div></td>
            </tr>
            </#list>
            </#if>
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
<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js"></script>
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
            $('#formSearch').submit();
        });
    });
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>快递公司</h3>
            <ul class="tab-base"><li><a class="current"><span>快递公司</span></a></li></ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/setting/express/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
    </form>
    <table class="tb-type1 noborder search">
        <tbody>
        <tr>
            <th><label for="search_brand_name">首字母</label></th>
            <td>
                <a href="${base}/setting/express/list?letter=A">A</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=B">B</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=C">C</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=D">D</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=E">E</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=F">F</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=G">G</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=H">H</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=I">I</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=J">J</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=K">K</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=L">L</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=M">M</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=N">N</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=O">O</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=P">P</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=Q">Q</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=R">R</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=S">S</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=T">T</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=U">U</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=V">V</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=W">W</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=X">X</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=Y">Y</a>&nbsp;&nbsp;
                <a href="${base}/setting/express/list?letter=Z">Z</a>&nbsp;&nbsp;
            </td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>系统内置的快递公司不得删除，只可编辑状态，平台可禁用不需要的快递公司，默认按首字母进行排序，常用的快递公司将会排在靠前位置</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <table class="table tb-type2">
        <thead>
        <tr class="thead">
            <th class="w24"></th>
            <th class="w270">快递公司</th>
            <th >首字母</th>
            <th class="w270">网址 (仅供参考)</th>
            <th class="align-center">常用</th>
            <th class="align-center">状态</th>
        </tr>
        </thead>
        <tbody>
        <#list pager.result as express>
            <tr class="hover">
                <td></td>
                <td>${express.seName}</td>
                <td>${express.ELetter}</td>
                <td>${express.EUrl}</td>
                <td class="align-center yes-onoff"><#if express.eorder == 1 >
                    <a href="JavaScript:void(0);" class=" enabled" nc_type="inline_edit" fieldname="eorder" modUrl="${base}/setting/express/updateOrder"
                       fieldid="${express.id}" fieldvalue="1" title="可编辑"><img src="${base}/res/images/transparent.gif">${express.eOrder}</a>
                    <#else>
                    <a href="JavaScript:void(0);" class=" disabled"  nc_type="inline_edit" fieldname="eorder" modUrl="${base}/setting/express/updateOrder"
                       fieldid="${express.id}" fieldvalue="0"  title="可编辑"><img src="${base}/res/images/transparent.gif">${express.eOrder}</a>
                    </#if></td>
                <td class="align-center yes-onoff"><#if express.estate == 0 >
                    <a href="JavaScript:void(0);" class=" disabled" nc_type="inline_edit" fieldname="estate" modUrl="${base}/setting/express/updateState"
                       fieldid="${express.id}" fieldvalue="0" title="可编辑"><img src="${base}/res/images/transparent.gif"></a>
                    <#else>
                    <a href="JavaScript:void(0);" class=" enabled" nc_type="inline_edit" fieldname="estate" modUrl="${base}/setting/express/updateState"
                       fieldid="${express.id}" fieldvalue="1"  title="可编辑"><img src="${base}/res/images/transparent.gif"></a>
                    </#if></td>
            </tr>
        </#list>
        </tbody>
        <tfoot>
        <tr class="tfoot">
            <td colspan="20">
            <@layout.pager pager/>
            </td>
        </tr>
        </tfoot>
    </table>
    <div class="clear"></div>
</div>
</div>
</@layout.body>
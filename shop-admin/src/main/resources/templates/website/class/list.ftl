<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/jquery.edit.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.article_class.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>文章分类</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/website/class/findOne?id=0" ><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th class="nobg" colspan="12"><div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td><ul>
                <li>管理员新增文章时，可选择文章分类。文章分类将在前台文章列表页显示</li>
                <li>默认的文章分类不可以删除</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form method='post' action="${base}/website/class/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w48"></th>
                <th class="w48">排序</th>
                <th>分类名称</th>
                <th class="w96 align-center">操作</th>
            </tr>
            </thead>
            <tbody id="treet1">
            <#list list as class>
                <tr class="hover edit">
                    <td>
                        <#if class.acCode != null && class.acCode != ''>
                            <input name="" type="checkbox" disabled="disabled" value="" />
                        <#else>
                            <input type="checkbox" name='ids' value="${class.acId}" class="checkitem">
                        </#if>
                        <#if (class.hasChildren > 0)>
                            <img src="${base}/res/images/tv-expandable.gif" fieldid="${class.acId}" level="1" status="open" nc_type="flex">
                        <#else>
                            <img fieldid="${class.acId}" status="close" nc_type="flex" src="${base}/res/images/tv-item.gif">
                        </#if>
                    </td>
                    <td class="sort"><span title="可编辑" datatype="number" fieldid="${class.acId}" fieldname="acSort" modUrl="${base}/website/class/modifySort"
                                           nc_type="inline_edit" class="editable">${class.acSort}</span></td>
                    <td class="name"><span title="可编辑" required="1" fieldid="${class.acId}" fieldname="acName"  modUrl="${base}/website/class/modifyName"
                                           nc_type="inline_edit" class="editable ">${class.acName}</span>
                        <a class='btn-add-nofloat marginleft' href="${base}/website/class/findOne?id=${class.acId}"><span>新增下级</span></a></td>
                    <td class="align-center"><a href="${base}/website/class/editFind?id=${class.acId}">编辑</a>
                        <#if class.acCode == null || class.acCode == ''>
                            <a href="javascript:if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗'))window.location = '${base}/website/class/delete?ids=${class.acId}';">删除</a>
                        </#if>
                    </td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr>
                <td><label for="checkall1">
                    <input type="checkbox" class="checkall" id="checkall_2">
                </label></td>
                <td colspan="16"><label for="checkall_2">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗')){$('form:first').submit();}"><span>删除</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

</@layout.body>
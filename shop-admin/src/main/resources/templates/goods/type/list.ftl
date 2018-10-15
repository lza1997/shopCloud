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
    function delType(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function delRow(obj){
        if(confirm('您确定要删除吗?')) {
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').submit();
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>类型管理</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>列表</span></a></li>
                <li><a href="${base}/goods/type/forward?id=0"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/goods/type/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
    </form>
    <table id="prompt" class="table tb-type2">
        <tbody>
        <tr class="space odd">
            <th colspan="12" class="nobg"> <div class="title">
                <h5>操作提示</h5>
                <span class="arrow"></span> </div>
            </th>
        </tr>
        <tr class="odd">
            <td><ul>
                <li>当管理员添加商品分类时需选择类型。前台分类下商品列表页通过类型生成商品检索，方便用户搜索需要的商品。</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="form_list" method="post" action="${base}/goods/type/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th>排序</th>
                <th>类型</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as type>
            <tr class="hover edit">
                <td class="w24"><input type="checkbox" class="checkitem" name="ids" value="${type.typeId}" /></td>
                <td class="w48 sort">
                    <span class=" editable" title="可编辑" maxvalue="255" datatype="pint" modUrl="${base}/goods/type/modifySort"
                          fieldid="${type.typeId}" fieldname="type_sort" nc_type="inline_edit">${type.typeSort}</span></td>
                <td class="">${type.typeName}</td>
                <td class="w96 align-center"><a href="${base}/goods/type/forward?id=${type.typeId}">编辑</a> | <a href="javascript:void(0)" onclick="delRow(this)">删除</a></td>
            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr>
                <td><input type="checkbox" class="checkall" id="checkallBottom" /></td>
                <td id="dataFuncs" colspan="16"><label for="checkallBottom">全选</label>&nbsp;&nbsp;
                    <a class="btn" onclick="delType();" href="JavaScript:void(0);"> <span>删除</span> </a>
                    <@layout.pager pager/>
                </td>
            <tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
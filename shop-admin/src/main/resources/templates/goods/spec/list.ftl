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
    function delSpec(){
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
            <h3>规格管理</h3>
            <ul class="tab-base">
                <li><a class="current" href="JavaScript:void(0);"><span>管理</span></a></li>
                <li><a href="${base}/goods/spec/forward?id=0"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/goods/spec/list">
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
                <li>规格将会对应到商品发布的规格，规格值由店铺自己添加。</li>
                <li>默认安装中会添加一个默认颜色规格，请不要删除，只有这个颜色规格才能在商品详细页显示为图片。</li>
            </ul></td>
        </tr>
        </tbody>
    </table>
    <form id="form_list" method="get" action="${base}/goods/spec/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th></th>
                <th>排序</th>
                <th>规格</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as spec>
            <tr class="hover edit">
                <td class="w24"><input type="checkbox" name="ids" value="${spec.spId}" <#if spec.spId == 1>disabled="disabled"<#else>class="checkitem"</#if>/></td>
                <td class="w48 sort">
                    <span class=" <#if spec.spId != 1>editable</#if>" maxvalue="255" <#if spec.spId != 1> title="可编辑"
                          datatype="pint" fieldid="${spec.spId}" fieldname="spSort" modUrl="${base}/goods/spec/modifySort"
                          nc_type="inline_edit"</#if>>${spec.spSort}</span></td>
                <td class=""><span>${spec.spName}</span></td>
                <td class="w96 align-center"><a href="${base}/goods/spec/forward?id=${spec.spId}">编辑</a> <#if spec.spId != 1>| <a href="javascript:void(0)" onclick="delRow(this)">删除</a></#if> </td>
            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr>
                <td><input type="checkbox" class="checkall" id="checkallBottom" /></td>
                <td id="dataFuncs" colspan="16"><label for="checkallBottom">全选</label>
                    <a class="btn" href="JavaScript:void(0);"> <span>删除</span> </a>
                <@layout.pager pager/></td>
            <tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
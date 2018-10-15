<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    function deleteGrade(){
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
            <h3>店铺等级</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/store/grade/forward?id=0" ><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="like_sg_name">等级名称</label></th>
                <td><input type="text" value="${sgName}" name="sgName" id="like_sg_name" class="txt"></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a>
                    <#if sgName != ''>
                        <a class="btns " href="${base}/store/grade/list" title="撤销检索"><span>撤销检索</span></a>
                    </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form id="form_list" method='post' name="" action="${base}/store/grade/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24">&nbsp;</th>
                <th>级别</th>
                <th>等级名称</th>
                <th class="align-center">可发布商品数</th>
                <th class="align-center">可上传图片数</th>
                <th class="align-center">可选模板套数</th>
                <th class="align-center">收费标准</th>
                <th class="align-center">佣金比例</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <#list list as grade>
                <tr class="hover">
                    <td>
                        <#if grade.sgId != 1>
                            <input type="checkbox" name='ids' value="${grade.sgId}" class="checkitem">
                        </#if>
                    </td>
                    <td class="w36">${grade.sgSort}</td>
                    <td>${grade.sgName}</td>
                    <td class="align-center">${grade.sgGoodsLimit}</td>
                    <td class="align-center">${grade.sgAlbumLimit}</td>
                    <td class="align-center">${grade.sgTemplateNumber}</td>
                    <td class="align-center">${grade.sgPrice}</td>
                    <td class="align-center">${grade.sgBrokerageScale}</td>
                    <td class="w270"><a href="${base}/store/grade/forward?id=${grade.sgId}">编辑</a> |
                        <#if grade.sgId == 1>
                            默认等级不能删除 |
                        <#else>
                            <a href="javascript:;" onclick="delRow(this)">删除</a> |
                        </#if>
                        <a href="JavaScript:;">设置可选模板(暂无)</a></td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="15"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="deleteGrade()"><span>删除</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
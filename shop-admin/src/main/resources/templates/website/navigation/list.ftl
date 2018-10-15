<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/layer/layer.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/jquery.edit.js" charset="utf-8"></script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>页面导航</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/website/navigation/forward?id=0" ><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" action="${base}/website/navigation/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="navTitle">标题</label></th>
                <td><input type="text" value="${navi.navTitle}" name="navTitle" id="search_nav_title" class="txt"></td>
                <th><label>所在位置</label></th>
                <td><select name="navLocation">
                    <option value="">请选择...</option>
                    <option value="0" <#if navi.navLocation == 0>selected="selected" </#if>>头部</option>
                    <option value="1" <#if navi.navLocation == 1>selected="selected" </#if>>中部</option>
                    <option value="2" <#if navi.navLocation == 2>selected="selected" </#if>>底部</option>
                </select></td>
                <td><a href="javascript:document.formSearch.submit();" class="btn-search " title="查询">&nbsp;</a>
                    <#if (navi.navTitle != null && navi.navTitle != '') || (navi.navLocation != null && navi.navLocation != '')>
                        <a class="btns" href="${base}/website/navigation/list"><span>撤销检索</span></a>
                    </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form method='post' id="form_nav" action="${base}/website/navigation/delete">
        <table class="table tb-type2">
            <thead>
            <tr class="space">
                <th colspan="15">页面导航列表</th>
            </tr>
            <tr class="thead">
                <th>&nbsp;</th>
                <th>排序</th>
                <th>标题</th>
                <th>链接</th>
                <th class="align-center">所在位置</th>
                <th class="align-center">新窗口打开</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as nav>
                <tr class="hover">
                    <td class="w24"><input type="checkbox" name="ids" value="${nav.navId}" class="checkitem"></td>
                    <td class="w48 sort"><span title="可编辑" style="cursor:pointer;"  datatype="number" fieldid="${nav.navId}" fieldname="nav_sort" nc_type="inline_edit" class="editable">${nav.navSort}</span></td>
                    <td>${nav.navTitle}</td>
                    <td>${nav.navUrl}</td>
                    <td class="w150 align-center"><#if nav.navLocation == 0>头部</#if><#if nav.navLocation == 1>中部</#if><#if nav.navLocation == 2>底部</#if></td>
                    <td class="w150 align-center"><#if nav.navNewOpen == 0>否</#if><#if nav.navNewOpen == 1>是</#if></td>
                    <td class="w72 align-center"><a href="${base}/website/navigation/forward?id=${nav.navId}">编辑</a> | <a href="javascript:if(confirm('您确定要删除吗'))window.location = '${base}/website/navigation/delete?ids=${nav.navId}';">删除</a></td>
                </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="delarticle();"><span>删除</span></a>
                <@layout.pager pager/>
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
<script type="text/javascript">
function delarticle(){
	if($('input[name="ids"]:checked').length!=0){
		if(confirm('您确定要删除吗')){
			$('#form_nav').submit();
		}
	}else{
		layer.alert('没有数据删除', {icon: 2});
	}
}
</script>

</@layout.body>
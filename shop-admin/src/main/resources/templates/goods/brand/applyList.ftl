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
    function delBrand(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要拒绝的项目");
        }else{
            if(confirm('您确定要拒绝吗?')){
                $('#form_list').attr("action",APP_BASE+"/goods/brand/refuse");
                $('#form_list').submit();
            }
        }
    }
    function passBrand(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要通过的项目");
        }else{
            if(confirm('您确定要通过该品牌吗?')){
                $('#form_list').attr("action",APP_BASE+"/goods/brand/pass");
                $('#form_list').submit();
            }
        }
    }
    function delRow(obj){
        if(confirm('您确定要拒绝该品牌吗?')) {
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').attr("action", APP_BASE + "/goods/brand/refuse");
            $('#form_list').submit();
        }
    }
    function passRow(obj){
        if(confirm('您确定要通过该品牌吗?')){
            $(obj).parents("tr").find("td:eq(0)>input").attr("checked", true);
            $('#form_list').attr("action",APP_BASE+"/goods/brand/pass");
            $('#form_list').submit();
        }
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>品牌</h3>
            <ul class="tab-base">
                <li><a href="${base}/goods/brand/list"><span>管理</span></a></li>
                <li><a href="${base}/goods/brand/forward?id=0"><span>新增</span></a></li>
                <li><a href="JavaScript:void(0);"  class="current"><span>待审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/goods/brand/applyList">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_brand_name">品牌名称</label></th>
                <td><input class="txt" name="brandName" id="search_brand_name" value="${brand.brandName}" type="text"></td>
                <th><label for="search_brand_class">所属分类</label></th>
                <td><input class="txt" name="brandClass" id="search_brand_class" value="${brand.brandClass}" type="text"></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="撤销检索">&nbsp;</a>
                <#if brand.brandClass != '' || brand.brandName != ''>
                    <a class="btns " href="${base}/goods/brand/list"
                       title="撤销检索"><span>撤销检索</span></a>
                </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    <form method='post' id="form_list">
        <input type="hidden" name="form_submit" value="ok" />
        <input type="hidden" name="type" id="type" value="" />
        <table class="table tb-type2 nobdb">
            <thead>
            <tr class="space">
                <th colspan="15">列表</th>
            </tr>
            <tr class="thead">
                <th>&nbsp;</th>
                <th>品牌名称</th>
                <th>所属分类</th>
                <th>品牌图片标识</th>
                <th class="align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as brand>
	            <#if brand.brandApply ??&& brand.brandApply==0>
	                <tr class="hover edit">
		                <td class="w24"><input type="checkbox" class="checkitem" name="ids" value="${brand.brandId}"></td>
		                <td class="name w270"><span>${brand.brandName}</span></td>
		                <td class="class">${brand.brandClass}</td>
		                <td><div class="brand-picture"><img src="${imgServer}${brand.brandPic}"/></div></td>
		                <td class="w96 align-center"><a href="javascript:;"  onclick="passRow(this)">通过</a> | <a href="JavaScript:;"  onclick="delRow(this)">拒绝</a></td>
	            	</tr>     		
	            </#if>
			</#list>
            </tbody>
            <tfoot>
            <tr class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16">
                     <label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="passBrand()"" name="id">
                    <span>
                 		   通过
                    </span>
                    </a>
                    <a href="JavaScript:void(0);" class="btn" onclick="delBrand()" name="id">
	                    <span>
	                 		   拒绝
	                    </span>
                    </a>
                    <@layout.pager pager/>
               </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
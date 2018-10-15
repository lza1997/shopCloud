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
            <h3>品牌</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/goods/brand/forward?id=0"><span>新增</span></a></li>
                <li><a href="${base}/goods/brand/applyList"><span>待审核</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form method="post" name="formSearch" id="formSearch" action="${base}/goods/brand/list">
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
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li>当店主添加商品时可选择商品品牌，用户可根据品牌查询商品列表</li>
                    <li>被推荐品牌，将在前台品牌推荐模块处显示</li>
                    <li>在品牌列表页面，品牌将按类别分组，即具有相同类别的品牌为一组，品牌类别与品牌分类无联系</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    <form method="post" id='form_list' action="${base}/goods/brand/delete">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w24"></th>
                <th class="w48">排序</th>
                <th class="w270">品牌名称</th>
                <th class="w150">所属分类</th>
                <th>品牌图片标识</th>
                <th>品牌状态</th>
                <th class="align-center">推荐</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as brand>
	            <tr class="hover edit">
	                <td>
	                	<input value="${brand.brandId}" class="checkitem" type="checkbox" name="ids">
	                </td>
	                <td class="sort">
	                    <span class=" editable"  nc_type="inline_edit" fieldname="brandSort" fieldid="${brand.brandId}" datatype="pint" modUrl="${base}/goods/brand/modifySort"maxvalue="255" title="可编辑">
	                           
	                          ${brand.brandSort}
	                    </span>
	                </td>
	                <td class="name">
	                    <span  nc_type="inline_edit" fieldname="brandName" modUrl="${base}/goods/brand/modifyName" fieldid="${brand.brandId}" required="1" title="可编辑">${brand.brandName}</span>
	                </td>
	                <td class="class">
	                    ${brand.brandClass}
	                </td>
	                <td class="picture">
	                	<div class="brand-picture">
	                	<#if brand.brandPic!''>
	                	    <img src="${imgServer}${brand.brandPic}"/>
	                	</#if>
	                	</div>
	                </td>
	                <td>
	                       <#if brand.brandApply ??&& brand.brandApply==1>
	                        		审核通过
	                       <#elseif brand.brandApply ??&& brand.brandApply==2>
						   			审核未通过
						   <#elseif brand.brandApply ??&& brand.brandApply==0>
	                         		审核中
	                       </#if>
				    </td>
	                <td class="align-center yes-onoff">
	                    <#if brand.brandRecommend == 0>
		                    <a href="JavaScript:void(0);" class=" disabled"  nc_type="inline_edit" fieldname="brandRecommend" modUrl="${base}/goods/brand/recommond"  fieldid="${brand.brandId}" fieldvalue="0" title="可编辑">
		                        <img src="${base}/res/images/transparent.gif">
		                    </a>
	                    <#else>
		                    <a href="JavaScript:void(0);" class=" enabled" nc_type="inline_edit" fieldname="brandRecommend" fieldid="${brand.brandId}" modUrl="${base}/goods/brand/recommond"  fieldvalue="1"  title="可编辑">
		                      <img src="${base}/res/images/transparent.gif">
		                    </a>
	                    </#if>
	                 </td>
	                <td class="align-center">
	                    <a href="${base}/goods/brand/forward?id=${brand.brandId}">编辑</a>
	                    &nbsp;|&nbsp;
	                    <a href="javascript:;" onclick="delRow(this)" >删除</a>
	                </td>
	            </tr>
            </#list>
            </tbody>
            <tfoot>
            <tr colspan="15" class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
                                   onclick="delBrand()"><span>删除</span></a>
                    <@layout.pager pager/>
                 </td>
            </tr>
            </tfoot>
        </table>
    </form>
    <div class="clear"></div>
</div>
</div>
</@layout.body>
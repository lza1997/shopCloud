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
        
        $("table").on('click', 'img[nc_type="flex"]', function () {
	        var status = $(this).attr('status');
	        if (status == 'open') {
	            var pr = $(this).parent('td').parent('tr');
	            var url =$(this).attr("loadUrl");
	            var id = $(this).attr('fieldid');
	            var obj = $(this);
	            $(this).attr('status', 'none');
	            
	            $.ajax({
	                url: url,
	                success: function (view) {
	                    //插入
	                    pr.after(view);
	                    obj.attr('status', 'close');
	                    obj.attr('src', obj.attr('src').replace("tv-expandable", "tv-collapsable"));
	                    //重现初始化页面
                    	$.getScript(APP_BASE + "/res/js/jquery.edit.js");
	                },
	                error: function () {
	                    alert('获取信息失败');
	                }
	            });
	        }
	        if (status == 'close') {
	            $(".row" + $(this).attr('fieldid')).remove();
	            $(this).attr('src', $(this).attr('src').replace("tv-collapsable", "tv-expandable"));
	            $(this).attr('status', 'open');
	        }
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
            <h3>商品分类</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/unionGoodsClass/forward"><span>新增</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <#--
    <form method="post" name="formSearch" id="formSearch" action="${base}/unionGoodsClass/list">
        <input type="hidden" name="pageNo" value="${pager.pageNo}">
        <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="name">名称</label></th>
                <td><input class="txt" name="name" id="name" value="" type="text"></td>
                <td><a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="查询">&nbsp;</a>
                    <a href="${base}/unionGoodsClass/list" class="btns "><span>撤销检索</span></a>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
    -->
   	<#--
    <table class="table tb-type2" id="prompt">
        <tbody>
        <tr class="space odd">
            <th colspan="12"><div class="title"><h5>操作提示</h5><span class="arrow"></span></div></th>
        </tr>
        <tr>
            <td>
                <ul>
                    <li></li>
                </ul>
            </td>
        </tr>
        </tbody>
    </table>
    -->
    <form method="post" id='form_list' action="${base}/unionGoodsClass/delete">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>
            <tr class="thead">
                <th class="w48"></th>
                <th class="w48">排序</th>
                <th width="500">名称</th>
                <th class="w150">图标</th>
                <th>状态</th>
                <th class="w72 align-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <#list pager.result as goodsClass>
	            <tr class="hover edit">
	                <td>
	                	<input value="${goodsClass.id}" class="checkitem" type="checkbox" name="ids">
						<img fieldid="${goodsClass.id}" status="open" loadUrl="${base}/unionGoodsClass/loadChildList?&id=${goodsClass.id}" nc_type="flex" level="1" src="${base}/res/images/<#if goodsClass.hasChild != 0>tv-expandable.gif<#else>tv-item.gif</#if>"> 
	                </td>
	                <td class="sort">
	                    <span class=" editable"  nc_type="inline_edit" fieldname="sort" fieldid="${goodsClass.id}" datatype="pint" modUrl="${base}/unionGoodsClass/modifySort"maxvalue="255" title="可编辑">
	                          ${goodsClass.sort}
	                    </span>
	                </td>
	                <td class="name">
	                	<span class="editable" nc_type="inline_edit" fieldname="name" modUrl="${base}/unionGoodsClass/modifyName" fieldid="${goodsClass.id}" required="1" title="可编辑">${goodsClass.name}</span>
	                	<a class="btn-add-nofloat marginleft" href="${base}/unionGoodsClass/forward?&pid=${goodsClass.id}"><span> 新增下级</span>
	                </td>
	                <td class="picture">
	                	<div class="brand-picture">
	                	    <img src="${imgServer}${goodsClass.icon}"/>
	                	</div>
	                </td>
	                <td>
	                	<#if goodsClass.showFlag ??&& goodsClass.showFlag==1>
                    		显示
                       <#else>
                     		不显示
                       </#if>
				    </td>
	                <td class="align-center">
	                    <a href="${base}/unionGoodsClass/forward?id=${goodsClass.id}">编辑</a>
	                    &nbsp;|&nbsp;
	                    <a href="javascript:;" onclick="delRow(this)" >删除</a>
	                </td>
	            </tr>
	        </#list>
            </tbody>
            <tfoot>
	            <tr class="tfoot">
		            <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
		            <td colspan="2">
		            	<label for="checkallBottom">全选</label>
		                &nbsp;&nbsp;
		                <a href="JavaScript:void(0);" class="btn" onclick="delBrand()"><span>删除</span></a>
		             </td>
		             <td colspan="3">
		                <@layout.pager pager/>
		              </td>
	            </tr>
            </tfoot>
        </table>
    </form>
</div>
</@layout.body>
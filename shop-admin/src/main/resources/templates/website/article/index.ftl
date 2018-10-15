<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript">
    $(function(){
        $('#ncsubmit').click(function(){
           $('#formSearch').submit();
        });
    });
    function delArticleAll(){
        var items = $("input[name='ids']:checked").length;
        if (items==0) {
            alert("请至少选择一个要删除的项目");
        }else{
            if(confirm('您确定要删除吗?')){
                $('#form_list').submit();
            }
        }
    }
    function deleteArticle(id){
    	
       if(confirm('您确定要删除吗?')){
           $('#'+id).attr("checked",'true');//全选   
           $('#form_list').submit();
       }else{
       	   $('#'+id).attr("checked",'false');//全选
       }
        
    }
</script>
</@layout.head>
<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>文章管理</h3>
            <ul class="tab-base">
                <li><a href="JavaScript:void(0);" class="current"><span>管理</span></a></li>
                <li><a href="${base}/website/article/forward?id=0" ><span>新增文章</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form  method="post" name="formSearch" id="formSearch" action="${base}/website/article/index">
            <input type="hidden" name="pageNo" value="${pager.pageNo}">
            <table class="tb-type1 noborder search">
            <tbody>
            <tr>
                <th><label for="search_brand_name">标题:</label></th>
                <td><input type="text" name="articleTitle" class="text" placeholder="输入关键字搜索" value="${article.articleTitle}"/></td>
                <th><label for="search_brand_class">文章分类：</label></th>
                <td><select class="select" name="acId" style="height:25px">
                        <option value="0">全部</option>
                        <#list classList as class>
                        	<#if class.acParentId=0>
	                            <option value="${class.acId}"
	                            <#if class.acId==article.acId>
	                            	 selected="selected"
	                            </#if>> ${class.acName}
	                            </option>
	                            <#if class.articleClassList??>
	                                <#list class.articleClassList as ac>
	                                    <option value="${ac.acId}"
	                                    <#if ac.acId==article.acId>
	                            	 		selected="selected"
	                            		</#if>
	                                    >&nbsp;&nbsp;  ${ac.acName}</option>
	                                </#list>
	                            </#if>
                             </#if>
                        </#list>
                    </select></td>
                <td>
                	<a href="javascript:void(0);" id="ncsubmit" class="btn-search " title="撤销检索">&nbsp;</a>
                    <#if article.articleTitle != '' || article.acId != ''>
                        <a class="btns " href="${base}/website/article/index"
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
                    <li>区别于系统文章，可在文章列表页点击查看</li>
                </ul></td>
        </tr>
        </tbody>
    </table>
    
    <form method="post" id='form_list' action="${base}/website/article/delete">
        <input type="hidden" name="form_submit" value="ok" />
        <table class="table tb-type2">
            <thead>			
            <tr class="thead">
                <th class="w24"></th>
                <th class="w48">排序</th>
                <th class="w850">标题</th>
                <th class="w470">文章分类</th>
                <th class="w270">显示</th>
                <th class="w270">添加时间</th>
                <th class="w272">操作</th>
            </tr>
            </thead>
            <tbody>
        <#list pager.result as article>

        <tbody>
        <tr>
        	<td><input value="${article.articleId}" class="checkitem" type="checkbox" name="ids" id="${article.articleId}"></td>
        	<td>${article.articleSort}</td>
            <td>${article.articleTitle}</td>
            <td>${article.articleClass.acName}</td>
            <td><#if article.articleShow == 0>否<#else>是</#if></td>
            <td>${article.createTimeStr?string("yyyy-MM-dd HH:mm:ss")}</td>
            <td class="txt-link">
                <a href="${base}/website/article/forward?id=${article.articleId}" title="编辑">编辑</a> ｜
                <a href="javascript:;" title="删除" onclick="deleteArticle('${article.articleId}')">删除</a> </td>
        </tr>
        </tbody>
    </#list>
            </tbody>
            <tfoot>
            <tr colspan="15" class="tfoot">
                <td><input type="checkbox" class="checkall" id="checkallBottom"></td>
                <td colspan="16"><label for="checkallBottom">全选</label>
                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn"
                                   onclick="delArticleAll()"><span>删除</span></a>
                    <@layout.pager pager/>
            </tr>
            </tfoot>
        </table>
    </form>
    <div class="clear"></div>
</div>
</@layout.body>
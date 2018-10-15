<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/admincp.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/kindeditor.js"></script>
<script type="text/javascript">
	
	$(function (){
	  	KindEditor.create('textarea[id="content"]', {
            uploadJson : APP_BASE+'/kind/upload',
            afterCreate : function() {
                var self = this;
            },
		 	allowFileManager: true,
			afterBlur: function(){this.sync();}
		});

	});
    
</script>
</@layout.head>


<@layout.body>
<div class="page">
    <div class="fixed-bar">
        <div class="item-title">
            <h3>文章管理</h3>
            <ul class="tab-base">
                <li><a href="${base}/website/article/index" ><span>管理</span></a></li>
                <li><a href="${base}/website/article/forward?id=0"><span>新增文章</span></a></li>
                <li><a href="JavaScript:void(0);" class="current"><span>编辑</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form action="${base}/website/article/edit" method="post"  name="saveForm" id="saveForm">
        <input type="hidden" name="articleId" value="${article.articleId}"/>
        <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">标题：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="articleTitle" class="text" value="${article.articleTitle}"></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation">所属分类：</label> </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform" id="gcategory">
                    <select class="select" name="acId" style="height:25px;width:100px">
                        <option value="0">全部</option>
	                    <#list list as class>
		                    <#if class.acParentId ==0 >
		                    	<option value="${class.acId}" <#if article.acId == class.acId>selected="selected" </#if>> ${class.acName}</option>
		                    </#if>
		                    <#if class.articleClassList??>
		                        <#list class.articleClassList as ac>
		                            <option value="${ac.acId}" <#if article.acId == ac.acId>selected="selected" </#if>>&nbsp;&nbsp;  ${ac.acName}</option>
		                        </#list>
		                    </#if>
                		</#list>
                    </select>
                </td>
                <td class="vatop tips">选择分类</td>
            </tr>
            <tr class="noborder">
                <td colspan="2" class="required">链接：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="articleUrl" class="text" class="txt" value="${article.articleUrl}"/></td>
                <td class="vatop tips">当填写"链接"后点击文章标题将直接跳转至链接地址，不显示文章内容。链接格式请以http://开头</td>
            </tr>
            <tr>
                <td colspan="2" class="required">是否显示: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff">
                	<label for="brand_recommend1" class="cb-enable <#if article.articleShow == 1>selected</#if>" title="是"><span>是</span></label>
                    <label for="brand_recommend0" class="cb-disable <#if article.articleShow == 0>selected</#if>" title="否"><span>否</span></label>
                    <input id="brand_recommend1" name="articleShow" <#if article.articleShow == 1>checked="checked" </#if>  value="1" type="radio">
                    <input id="brand_recommend0" name="articleShow" <#if article.articleShow == 0>checked="checked" </#if> value="0" type="radio">
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">排序: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="articleSort" id="article_sort" class="txt" value="${article.articleSort}">
                </td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            <tr>
                <td colspan="2" class="required">文章内容: </td>
            </tr>
            <tr class="noborder">
                <td colspan="2">
                <textarea id="content" style="width:700px;height:300px;resizeType:1;" name="articleContent">
                ${article.articleContent}
                </textarea>
                </td>
                <td class="vatop tips"></td>
            </tr>
          	</tbody>
            <tfoot>
            <tr class="tfoot">
                <td colspan="2" ><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>提交</span></a></td>
            </tr>
            </tfoot>
        </table>
    </form>
 </div>
 <script type="text/javascript">
   //按钮先执行验证再提交表单
    $(function(){$("#submitBtn").click(function(){
       	if($("#articleTitle").val()==""){
       		alert("标题不能为空");
       		return false;
       	}
        if($("#acId").val()==0){
       		alert("请选择分类");
       		return false;
       	}

         $("#saveForm").submit();
        
        });
    });
</script>
 </@layout.body>

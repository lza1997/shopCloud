<@layout.head>
<script type="text/javascript" src="${base}/res/js/jquery-ui/jquery.ui.js"></script>
<script type="text/javascript" src="${base}/res/js/jquery-ui/i18n/zh-CN.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="${base}/res/js/jquery-ui/themes/ui-lightness/jquery.ui.css"  />
<script type="text/javascript" src="${base}/res/js/common_select.js" charset="utf-8"></script>
<link rel="stylesheet" href="${base}/res/js/kindeditor/themes/default/default.css" />
<script charset="utf-8" src="${base}/res/js/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/kindeditor-all.js"></script>
<script charset="utf-8" src="${base}/res/js/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
	$(function (){
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[id="content"]', {
                uploadJson : APP_BASE+'/kind/upload',
                afterCreate : function() {
                    var self = this;
                },
                afterBlur: function(){this.sync();}
            });
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
                <li><a href="JavaScript:void(0);" class="current"><span>新增文章</span></a></li>
            </ul>
        </div>
    </div>
    <div class="fixed-empty"></div>
    <form action="${base}/website/article/edit" method="post"  name="saveForm" id="saveForm">
        <input type="hidden" name="form_submit" value="ok" />
         <table class="table tb-type2 nobdb">
            <tbody>
            <tr class="noborder">
                <td colspan="2" class="required"><label class="validation">标题：</label></td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" id="articleTitle" name="articleTitle" class="text" value=""/></td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required"><label class="validation">所属分类：</label> </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform" id="gcategory">
                    <select class="select" name="acId" id="acId" style="height:25px;width:100px">
                        <option value="0">请选择</option>
                   <#list list as class>
                    	<#if class.acParentId ==0 >
                        	<option value="${class.acId}" > ${class.acName}</option>
                        </#if>
                        <#if class.articleClassList??>
                            <#list class.articleClassList as ac>
                                <option value="${ac.acId}">&nbsp;&nbsp;  ${ac.acName}</option>
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
                <td class="vatop rowform"><input type="text" name="articleUrl" class="text" class="txt" value=""/></td>
                <td class="vatop tips">当填写"链接"后点击文章标题将直接跳转至链接地址，不显示文章内容。链接格式请以http://开头</td>
            </tr>
            <tr>
                <td colspan="2" class="required">是否显示: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform onoff">
                	<label for="brand_recommend1" class="cb-enable"><span>是</span></label>
                    <label for="brand_recommend0" class="cb-disable selected"><span>否</span></label>
                    <input id="brand_recommend1" name="articleShow"  type="radio" value="1">
                    <input id="brand_recommend0" name="articleShow"  type="radio" value="0"></td>
                </td>
                <td class="vatop tips"></td>
            </tr>
            <tr>
                <td colspan="2" class="required">排序: </td>
            </tr>
            <tr class="noborder">
                <td class="vatop rowform"><input type="text" name="articleSort" id="article_sort" class="txt" value="255">
                </td>
                <td class="vatop tips">数字范围为0~255，数字越小越靠前</td>
            </tr>
            <tr>
                <td colspan="2" class="required">文章内容: </td>
            </tr>
            <tr class="noborder">
                <td colspan="2">
                <textarea id="content" style="width:700px;height:300px;resizeType:1;" name="articleContent"></textarea>
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